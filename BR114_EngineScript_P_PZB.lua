--require ("Assets/DTG/BR114Pack01/RailVehicles/Electric/BR114/Scripts/orig_BR114_EngineScript.out")

-- load and config extPZB
local extPZB = require ("Assets/SCBM/extPZBv1.out")
extPZB.zugart = 2
extPZB.fz_vmax = 120 -- 120kmh fuer die BR143
extPZB_debug = CONFIG.PZBDEBUGMODEON

---------------------------- script variables

--lm_speedline_state = 0, -- 0 dark, 1 - 85, 2 - 85BL, 3 - 70, 4 - 70BL, 5 - 55, 6 - 55BL, 7 - 85-70BL, 8 - 85+70+55
local lm_speedline_state_table = {{{0, 0, 0}, {0, 0, 0}}, -- dark
                            {{0, 0, 1}, {0, 0, 1}}, -- 85
                            {{0, 0, 1}, {0, 0, 0}},-- 85BL
                            {{0, 1, 0}, {0, 1, 0}}, -- 70
                            {{0, 1, 0}, {0, 0, 0}},-- 70BL
                            {{1, 0, 0}, {1, 0, 0}}, -- 55
                            {{1, 0, 0}, {0, 0, 0}}, -- 55BL
                            {{0, 0, 1}, {0, 1, 0}}, -- 55
                            {{1, 1, 1}, {1, 1, 1}} -- 85+70+55
}

--lm_magnetline_state = 0, -- 0 dark, 1 - B40, 2 - 500, 3 - B40+500, 4 - 1000, 5 - B40+1000, 6 - 1000BL, 7 - (500+1000)BL, 8 - B40+500+1000
local lm_magnetline_state_table = {{{0, 0, 0}, {0, 0, 0}}, -- dark
                             {{1, 0, 0}, {1, 0, 0}}, -- B40
                             {{0, 1, 0}, {0, 1, 0}},-- 500
                             {{1, 1, 0},  {1, 1, 0}}, -- B40+500
                             {{0, 0, 1}, {0, 0, 1}},-- 1000
                             {{1, 0, 1},  {1, 0, 1}}, -- B40+1000
                             {{0, 0, 1}, {0, 0, 0}}, -- 1000BL
                             {{0, 1, 1},  {0, 0, 0}}, -- (500+1000)BL
                             {{1, 1, 1}, {1, 1, 1}} -- B40+500+1000
}

local orig_update = Update
local orig_init = Initialise
local orig_oncsig = OnCustomSignalMessage
local orig_oncvc = OnControlValueChange
local orig_oncme = OnCameraEnter
local extpzb_in_control = false
local player_cab_idx = 1 -- 1 : front, -1 : back
local view_cab_idx = 1
local pzb_zwb_brake = false
local overspeed_brake = false
local lastcalltime = -999
local t_blinking = -999
local blink_state = 0
local blinking_frequency = 1.0 -- 0.5
local last_sl_mode, last_mg_mode, last_os_mode = 0, 0, 0
local speed_light_states = lm_speedline_state_table[1][1]
local magnet_light_states = lm_magnetline_state_table[1][1]
local gRegulator_locked = false

---------------------------- util functions

local function myMessage(txt, duration)
    SysCall("ScenarioManager:ShowAlertMessageExt", "PZB Messaging System", txt, duration, 1)
end

local function myZWBMessage(duration)
	if CONFIG.PZBZWBFEEDBACK then
   		SysCall("ScenarioManager:ShowAlertMessageExt", "ExtPZB - ZWB explanation", extPZB.zwb_msg, duration, 1)
   	end
end

local function blink_state_reset()
    t_blinking = os.clock()
    blink_state = 0
end

local function get_blink_state()
    local tmp_t = os.clock()
    if tmp_t - t_blinking >= blinking_frequency then
        blink_state = 1 - blink_state
        t_blinking = tmp_t
    end
    return blink_state
end

local function LockRegulator()
	gRegulator_locked = true
	gRegulator = 0
	Call("SetControlValue", "TapChanger_Target", 0, 0)
	Call("SetControlValue", "TapChanger_Control", 0, 0)
	Call("SetControlValue", "TapChanger_Fault", 0, 0)
	Call("SetControlValue", "TapChanger_T", 0, -1)
	Call("SetControlValue", "TapChanger_U", 0, -1)
end

local function UnlockRegulator()
	gRegulator_locked = false
	Call("SetControlValue", "TapChanger_T", 0, 0)
	Call("SetControlValue", "TapChanger_U", 0, 0)
end

---------------------------- extPZB Interface functions

local function PZB_Set_55(lit)
    Call("SetControlValue", "PZB_55", 0, lit)
end

local function PZB_Set_70(lit)
    Call("SetControlValue", "PZB_70", 0, lit)
end

local function PZB_Set_85(lit)
    Call("SetControlValue", "PZB_85", 0, lit)
end

local function PZB_Set_B40(lit)
    Call("SetControlValue", "PZB_B40", 0, lit)
end

local function PZB_Set_500(lit)
    Call("SetControlValue", "PZB_500Hz", 0, lit)
end

local function PZB_Set_1000(lit)
    Call("SetControlValue", "PZB_1000Hz", 0, lit)
end

local function PZB_Lights_Off()
    PZB_Set_55(0); PZB_Set_70(0); PZB_Set_85(0)
    PZB_Set_B40(0); PZB_Set_500(0); PZB_Set_1000(0)
end

local function PZB_Shutdown()
    -- disable DTG PZB (shell)
    PZB:Enable(0)
    Call("SetControlValue", "PZB", 0, 0)
    PZB:ResetLights()
    -- if the PZB is shut under ZWB, we leave the brakes "on"
    -- otherwise, the extPZB.emgbrake field gets reset to 0 when Reset() is called
    -- and the ZWB would be lifted
    if extPZB.emgbrake == 2 then
        Call("SetControlTargetValue", "VirtualThrottle", 0, 0)
        Call("SetControlTargetValue", "VirtualBrake", 0, 1)
        Call("SetControlTargetValue", "VirtualDynamicBrake", 0, 1)
        Call("SetControlValue", PZB.SOUND_EMERGENCY, 0, 0)
    end
    extPZB.zugart = 2
    extPZB:Reset() -- reset our PZB
    -- we don't set extpzb_in_control to false here yet,
    -- so the cleanup branch is called in Update
end

local function PZB_Lights_Sounds()
    --lm_speedline_state = 0, -- 0 dark, 1 - 85, 2 - 85BL, 3 - 70, 4 - 70BL, 5 - 55, 6 - 55BL, 7 - 85-70BL
    --lm_magnetline_state = 0, -- 0 dark, 1 - B40, 2 - 500, 3 - B40+500, 4 - 1000, 5 - B40+1000, 6 - 1000BL, 7 - ZWB/(500+1000)BL, 8 - B40+500+1000
    --lm_v_warn_state = 0, -- 0 dark, 1 - 25km/h, 2 - 35km/h, 3 - 40km/h, 4 - 45km/h, 5 - 55km/h, 6 - 70km/h, 7 - 85km/h, 8 - 100km/h
    --lm_v_over = 0, -- 0 dark, 1 blinking G
    --
    -- check if pzb state has changed and blink state needs resetting
    --
    local sl_mode, mg_mode, os_mode = extPZB.lm_speedline_state, extPZB.lm_magnetline_state, extPZB.lm_v_over
    if sl_mode ~= last_sl_mode or mg_mode ~= last_mg_mode or os_mode ~= last_os_mode then
        -- blinking reset handling
        -- we reset in case the last LM mode was non-blinking (without checking if the new one is a blinking one)
        if (last_sl_mode < 2 or last_sl_mode == 3 or last_sl_mode == 5) or mg_mode > 6 then
            blink_state_reset()
        end
        pzb_state_changed = true
        last_sl_mode, last_mg_mode, last_os_mode = sl_mode, mg_mode, os_mode
        if extPZB.selftestrunning == 0 then
            -- DEBUG PZB State
            if CONFIG.PZBDEBUGMODEON then
            	myMessage(string.format("PZB state: %d %d %d\nfunc: %d, vmon: %.1f, ebr.: %.2f", sl_mode, mg_mode, os_mode, extPZB.displayed_function, extPZB.lowest_v_mon, extPZB.emgbrake), 10)
            end
        else
            if sl_mode == 8 then
                extPZB.sound_influence = true -- this will make it beep during the all-LM-on states (vR)
            end
        end
        if extPZB.emgbrake > 1 then
            PZB_Lights_Off()
            myZWBMessage(10)
        end
    else
        pzb_state_changed = false
    end
    -- speed light line -- update if PZB.emgbrake == 0, 1
    if extPZB.emgbrake <= 1 then -- since we use the DTG ZWB light mechanics, not our own, we only proceed if there is no ZWB
        Call("SetControlValue", "CMD_S", 0, 0) -- turn off "S" light
        -- speed line
        speed_light_states = lm_speedline_state_table[sl_mode + 1][get_blink_state() + 1] -- sometimes I hate Lua with the 1-based array index -- so dumb!
        PZB_Set_55(speed_light_states[1])
        PZB_Set_70(speed_light_states[2])
        PZB_Set_85(speed_light_states[3])
        -- magnet line
        magnet_light_states = lm_magnetline_state_table[mg_mode + 1][get_blink_state() + 1] -- sometimes I hate Lua with the 1-based array index -- so dumb!
        PZB_Set_1000(magnet_light_states[3])
        PZB_Set_500(magnet_light_states[2])
        PZB_Set_B40(magnet_light_states[1])
    end
    -- ZWB light handling
    gblst = 1 - get_blink_state()
    if extPZB.emgbrake >= 1 and extPZB.emgbrake < 2 then
        Call("SetControlValue", "CMD_S", 0, 1) -- "S" light blinks
    end
    if extPZB.emgbrake == 2 then
        PZB_Set_1000(gblst)
        Call("SetControlValue", "CMD_S", 0, 1) -- turn on "S" light
    end
    -- sounds
    --Call("SetControlValue", "LZB_Buzzer", 0, extPZB.sound_schnarre and 1 or 0)
    Call("SetControlValue", PZB.SOUND_WARNING, 0, extPZB.sound_influence and 1 or 0)
    Call("SetControlValue", PZB.SOUND_EMERGENCY, 0, extPZB.sound_zwb and 1 or 0)
end

local function PZB_brakes()
    if extPZB.emgbrake == 0 then
        if (pzb_zwb_brake or overspeed_brake) and not Sifa.emergency then -- only release overspeed brake if no Sifa ZWB is active
            Call("*:SetControlValue", "TrainBrakeControl", 0, 0)
            Call("*:SetControlTargetValue", "TrainBrakeControl", 0, 0)
        end
        overspeed_brake = false
        pzb_zwb_brake = false
    elseif extPZB.emgbrake > 1 and extPZB.emgbrake < 2 then
        overspeed_brake = true
        pzb_zwb_brake = false
		LockRegulator()
        if not Sifa.emergency then
			gTrainBrake = 0.2
			gDynamicBrake = 0.2
        end
    elseif extPZB.emgbrake == 2 then
        overspeed_brake = false
        pzb_zwb_brake = true
		LockRegulator()
		gTrainBrake = 1
		gDynamicBrake = 1
    end
end

local function Orig_Update_PZB_Bypass(time)
    -- run orig Update with PZB disabled
    orig_PZB_active = PZB.active
    PZB.active = 0
    orig_update(time)
    PZB.active = orig_PZB_active
end

---------------------------- Orig script function wrappers and replacements

function UpdateTractiveEffort()
	gMaxTraction = math.abs(Call("GetTractiveEffort") or 0)
	--myMessage(string.format("gReg=%.1f, Brake=%.1f\ngMT=%.1f gReg_locked=%s\ngEm=%.1f", gRegulator, gTrainBrake + gDynamicBrake, gMaxTraction, tostring(gRegulator_locked), gEmergencyBrake), 0.1)
	--myMessage(tostring(Call("GetControlValue","Ammeter", 0)), 0.1)
	--orig code: Call("SetControlValue", "TractionNeedle", 0, Call("GetTractiveEffort") or 0)
	if gDynamicBrake > 0 then
		Call("SetControlValue", "TractionNeedle", 0, -gDynamicBrake)
	else
		Call("SetControlValue", "TractionNeedle", 0, gMaxTraction)
	end
end

function UpdateExpertControls(time)
	if extPZB.emgbrake == 0 then
		UpdateBrakeRelease(time)
		gTrainBrake = Call("GetControlValue", "VirtualBrake", 0) or 0
		gTrainBrake = gTrainBrake - gReleaseAmount
		-- SCBM Addition: Regulator-0-Notch-Requirement
		if not gRegulator_locked then
			gRegulator = (Call("GetControlValue", "TapChanger_Control", 0) or 0) / 31
		else
			AFB:EnableThrottle(false)
			AFB:EnableBrake(false)
			AFB:Reset()
			gRegulator = 0
		end
		-- SCBM End Addition
		if (AFB.DynamicBrake or gTrainBrake) > gDynamicBrake then
			gDynamicBrake = math.min(gDynamicBrake + time * 0.5, AFB.DynamicBrake or gTrainBrake)
		elseif (AFB.DynamicBrake or gTrainBrake) < gDynamicBrake then
			gDynamicBrake = math.max(gDynamicBrake - time * 0.5, AFB.DynamicBrake or gTrainBrake)
		end
	end
	-- SCBM Addition: Regulator-0-Notch-Requirement
	if gTrainBrake > 0 then
		if gRegulator > 0 then
			LockRegulator()
		end
	else
		if gRegulator_locked and Call("GetControlValue", "VirtualThrottle", 0) == 0 then
			UnlockRegulator()
		end
	end	
	-- SCBM End Addition
	Call("SetControlValue", "Regulator", 0, gRegulator)
	Call("SetControlValue", "TrainBrakeControl", 0, gTrainBrake)
	Call("SetControlValue", "DynamicBrake", 0, gDynamicBrake)
	UpdateTractiveEffort()
	UpdateEngineBrake(time)
end

function UpdatePlayerEngine(time)
	UpdateWipers(time)
	UpdateExtWipers()
	if not gRegulator_locked then -- SCBM Addition: Regulator-0-Notch-Requirement
		UpdateTapChanger(time)
	end
	UpdateTractionMotorBlower(time)
end

function Update(time)
    -- disable the PZB if the key is not with us anymore (e.g. engine change)
    -- in case of an emergency brake during cab change at stand still, we still allow to lift the ZWB before turning it off
    if not gIsEngineWithKey then
        if extpzb_in_control and math.abs(gSpeed * 3.6) < 0.1 then
            PZB_Shutdown()
        end
    end

    curr_reverser = Call("GetControlValue", "Reverser", 0)
    curr_simtime = Call("GetSimulationTime")

    -- PZB Stuff
    if PZB.active >= 1 then
        extpzb_in_control = true -- mark extPZB as being in charge
        Orig_Update_PZB_Bypass(time)
        -- and now do our PZB stuff here
        extPZB.simtime = curr_simtime -- we MUST update time
        if extPZB.simtime - lastcalltime > 0.1 then -- every reasonable interval we update positions, keystates etc.
            local speed_tmp = player_cab_idx * Call("GetSpeed") -- player_cab_idx ensures we compute the speed in the cab direction!
            extPZB.simspeed = speed_tmp * 3.6
            extPZB.simreverser = curr_reverser
            extPZB.key_down_ACK = Call("GetControlValue", "CMD_Acknowledge", 0) > 0.1
            extPZB.key_down_FREE = Call("GetControlValue", "CMD_Free", 0) > 0.1
            extPZB.key_down_B40 = Call("GetControlValue", "CMD_Override", 0) > 0.1
            extPZB.simpos = extPZB.simpos + speed_tmp * (extPZB.simtime - lastcalltime) -- calculate rough position of engine
            --myMessage(string.format("pos: %.1f, spd: %.1f\nrev: %d, cab: %d", extPZB.simpos, extPZB.simspeed, extPZB.simreverser, player_cab_idx), 0.1)
            extPZB:UpdateCore()
            lastcalltime = extPZB.simtime
        end
        PZB_Lights_Sounds() -- also sets the pzb_state_changed flag, therefore before PZB_brakes
        PZB_brakes()
    else
        if extpzb_in_control then -- cleanup after switching PZB off/hibernating it
            PZB:ResetLights()
            extpzb_in_control = false -- mark extPZB as not to be updated
        end
        Orig_Update_PZB_Bypass(time)
    end
end

function Initialise()
    curr_reverser = Call("GetControlValue", "Reverser", 0)
    curr_simtime = Call("GetSimulationTime")
    orig_init()
    blink_state_reset()
end

function OnControlValueChange(name, index, value)
    --myMessage("CVC: "..name.." "..tostring(value), 1)
    -- check if Reset (and Zugart Change is necessary)
    local curr_speed = math.abs(gSpeed * 3.6)
    if name == "PZB" then
        if value > 0.99 then
            local PZB_prev_active = PZB.active
            if curr_speed < 0.1 and curr_reverser == 0 then
                orig_oncvc(name, index, value)
            else
                Call("SetControlValue", name, index, value)
                myMessage("PZB locked while train is moving\nor reverser not in [N]!", 5)
            end
            if PZB.active >= 1 and PZB.active ~= PZB_prev_active then
                extPZB:Event("Zugart") -- this also performs a Reset
                local curr_simtime = Call("GetSimulationTime")
                extPZB:Selftest(curr_simtime)
                lastcalltime = curr_simtime
            elseif PZB.active == 0 then
                Call("SetControlValue", "PZB", 0, 0)
                PZB:ResetLights()
            end
        else
            Call("SetControlValue", name, index, value)
        end
    else
        if extpzb_in_control then
            orig_PZB_active = PZB.active
            PZB.active = 0
            orig_oncvc(name, index, value)
            PZB.active = orig_PZB_active
        else
            orig_oncvc(name, index, value)
        end
    end
end

function OnCameraEnter(cabEndWithCamera, carriageCam)
    --cabEndWithCamera: 0 = none, 1 = front, 2 = back.
    --carriageCam: 0 if cab cam, 1 if carriage cam
    orig_oncme(cabEndWithCamera, carriageCam)
    if carriageCam == 0 then
        gCamInsideCab = true
        local prev_cab_idx = player_cab_idx
        if cabEndWithCamera == 1 then
            view_cab_idx = 1
            if player_cab_idx == -1 and math.abs(gSpeed * 3.6) < 0.1 then -- are we changing cabs? If so, the PZB has to be turned off/reset
                player_cab_idx = 1
                myMessage(string.format("Front cab active (v=%.1f)", extPZB.simspeed), 5)
            end
        elseif cabEndWithCamera == 2 then
            view_cab_idx = -1
            if player_cab_idx == 1 and math.abs(gSpeed * 3.6) < 0.1 then -- are we changing cabs? If so, the PZB has to be restarted
                player_cab_idx = -1
                myMessage(string.format("Rear cab active (v=%.1f)", extPZB.simspeed), 5)
            end
        end
        --myMessage("CabInfo: "..tostring(view_cab_idx).."--"..tostring(player_cab_idx), 10)
        if prev_cab_idx ~= player_cab_idx and extpzb_in_control then
            extPZB:Reset() -- PZB_Shutdown() -- shutdown pzb
        end
        if view_cab_idx ~= player_cab_idx then            
            PZB_Lights_Off()
        end
    end
end

function OnCustomSignalMessage(arg)
    --myMessage("OCSM: "..arg, 10)
    if (arg == "500" or arg == "PZB500") then
        if extpzb_in_control then
            extPZB:Event("500")
        end
    elseif (arg == "1000" or arg == "PZB1000") then
        if extpzb_in_control then
            extPZB:Event("1000")
        end
    elseif (arg == "2000" or arg == "PZB2000") then
        if extpzb_in_control then
            extPZB:Event("2000")
        end
    else
        orig_oncsig(arg)
    end
end
