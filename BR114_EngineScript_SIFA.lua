--require "Assets/DTG/MRCEDispolokPack01/RailVehicles/Diesel/BR266/CommonScripts/PZB_Class_66_EngineScript.out"

local externalSIFA = require "Assets/engine2/externalSIFA/externalSifav1.out"

externalSIFA_MODE = 1; -- 1 = "Zeit-Weg-Sifa"; 2 = "Zeit-Zeit-Sifa", 3 = "Anforderungssifa"

--------------------------------------------------------------------------------------
-- Setting up variables
--------------------------------------------------------------------------------------

local SIFA_Wrapper_firstrun = true;

local SIFAWrapper_orig_init = Initialise
local SIFAWrapper_orig_Update = Update
local SIFAWrapper_orig_OnControlValue = OnControlValueChange
local SIFAWrapper_orig_OnCameraEnter = OnCameraEnter;
local SIFAWrapper_orig_OnCameraLeave = OnCameraLeave;

--------------------------------------------------------------------------------------
-- Utiity Functions
--------------------------------------------------------------------------------------

local function ShowMessage2(messageText, messageHoldTime)
    SysCall("ScenarioManager:ShowAlertMessageExt", "Interface Messaging System", tostring(messageText), messageHoldTime, 1);
end

externalSIFA_messagefunction = ShowMessage2;


--------------------------------------------------------------------------------------
-- ExternalSifa Functions and Parameters
--------------------------------------------------------------------------------------

-- Controller
externalSIFA_Controller_SifaOnOff = "Sifactivefo"; -- Controller for Sifa Activation
externalSIFA_Controller_SifaReset = "SifaReset"; -- Controller for Sifa Timer Reset

-- Brakes
externalSIFA_Brakes = {
    ForceBrake = function(self)     
        --Call("SetControlValue", "VirtualBrake", 0, 1)
        Call("SetControlValue", "TrainBrakeControl", 0, 1.0)
        Call("SetControlValue", "VirtualThrottle", 0, 0)
        Call("SetControlValue", "Regulator", 0, 0)
        Call("SetControlValue", "DynamicBrake", 0, 1)
        -- Lock Regulator
    	Call("SetControlValue", "TapChanger_Target", 0, 0)
		Call("SetControlValue", "TapChanger_Control", 0, 0)
		Call("SetControlValue", "TapChanger_Fault", 0, 0)
		Call("SetControlValue", "TapChanger_T", 0, -1)
		Call("SetControlValue", "TapChanger_U", 0, -1)
		-- Set Traction Needle
		Call("SetControlTargetValue", "TractionNeedle", 0, -1)
    end
}

-- Light if Sifa is Enabled
externalSIFA_Lights_Activated = {
    -- Sifa is Enabled
    On = function(self)     
    	Call("SetControlValue", "SifaLight", 0, 0);
    end,
    -- Sifa is Disabled
    Off = function(self)     
    	Call("SetControlValue", "SifaLight", 0, 1);
    end
}

-- Light if Emergencybrake is active
externalSIFA_Lights_Emergencybrake = {
    -- Emergencybrake is active
    On = function(self)     
    	Call("SetControlValue", "SifaLight", 0, 1);
    end,
 -- Emergencybrake is not active
    Off = function(self)     
    	Call("SetControlValue", "SifaLight", 0, 0);
    end
}

-- Light if Driver has to Acknowledge the Sifa
externalSIFA_Lights_Indicator = {
    -- Lamp active
    On = function(self)     
    	Call("SetControlValue", "SifaLight", 0, 1);
    end,
    -- Lamp not active
    Off = function(self)     
    	Call("SetControlValue", "SifaLight", 0, 0);
    end
}


externalSIFA_Battery_On = function(self) -- Return true if Battery is activated
    return true;
end

-- Updates the Sound
externalSIFA_UpdateSound = function(self)
    Call("SetControlValue", "SifaAlarm", 0, (externalSIFA.SifaWarnSound or externalSIFA.SifaZWBSound) and 1 or 0)
end



--------------------------------------------------------------------------------------
-- Replaced Original Functions
--------------------------------------------------------------------------------------

function Initialise()
    SIFAWrapper_orig_init();
    
end

function Update(delta)
    SIFAWrapper_orig_Update(delta);
    if SIFA_Wrapper_firstrun then externalSIFA.Initialise() end
    if Call("GetIsEngineWithKey") == 1 then externalSIFA.Update(delta) end
    SIFA_Wrapper_firstrun = false;
end

function OnControlValueChange(name, index, value)
    if name == externalSIFA_Controller_SifaOnOff then
        Call("SetControlValue", externalSIFA_Controller_SifaOnOff, index, externalSIFA.ToggleSifa(value >= 1 and value or 0))
    elseif name == externalSIFA_Controller_SifaReset then
        Call("SetControlValue", externalSIFA_Controller_SifaReset, index, value)
        if value == 1 then
            externalSIFA.Reset();
        end
    elseif name == "AWSReset" then
        Call("SetControlValue", "AWSReset", index, value)
        if value == 1 then
            externalSIFA.Reset();
        end
    else
        SIFAWrapper_orig_OnControlValue(name, index, value);
    end
end

function OnCameraEnter(cabEndWithCamera, carriageCam)
    if SIFAWrapper_orig_OnCameraEnter then SIFAWrapper_orig_OnCameraEnter(cabEndWithCamera, carriageCam) end
    externalSIFA.OnCameraEnter(cabEndWithCamera, carriageCam);
end

function OnCameraLeave()
    if SIFAWrapper_orig_OnCameraLeave then SIFAWrapper_orig_OnCameraLeave() end
    externalSIFA.OnCameraLeave();
end