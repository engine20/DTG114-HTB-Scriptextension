require "Assets/Railtraction/IC2/IC2/engine/scripting.out"

--------------------------------------------------------------------------------------
-- Setting up variables
--------------------------------------------------------------------------------------
local orig_init = Initialise
local orig_Update = Update
local orig_OnControlValue = OnControlValueChange
local orig_OnCameraEnter = OnCameraEnter;
local orig_OnCameraLeave = OnCameraLeave;
local orig_OnConsistMessage = OnConsistMessage;

CONFIG = {};
	--
	CONFIG.INACTIVECABBLINDSDOWN = true;
	CONFIG.DISPLAYZZAPOS = true;
	CONFIG.RESETBLINDSONCABENTER = false;
	CONFIG.ENABLESNOW = true;
	CONFIG.ENABLEVRTAV = true;
	CONFIG.CORRECTRVNUMBER = true;
	CONFIG.AUTOMATICFANMODEBYDEFAULT = true;
	CONFIG.AIFANTHRESHOLD = 7;
	CONFIG.VRZZACOMMUNICATION = true;
	CONFIG.PZBDEBUGMODEON = false;
	CONFIG.PZBZWBFEEDBACK = false;
	CONFIG.ENABLEDEBUGMESSAGES = false;
	CONFIG.DISPLAYMESSAGES = true;
	CONFIG.USEDESTINATIONLIST = true;
	CONFIG.DESTINATIONLISTPATH = "Assets/DTG/BR114Pack01/RailVehicles/Electric/[114] 143_HTB/Scripts/ZZAList.txt";
	CONFIG.ZZANAMES = {"ZZA_047",
					   "ZZA_000", "ZZA_001", "ZZA_002", "ZZA_003", "ZZA_004", "ZZA_005", "ZZA_006", "ZZA_007", "ZZA_008", "ZZA_009", "ZZA_010",
					   "ZZA_011", "ZZA_012", "ZZA_013", "ZZA_014", "ZZA_015", "ZZA_016", "ZZA_017", "ZZA_018", "ZZA_019", "ZZA_020",
					   "ZZA_021", "ZZA_022", "ZZA_023", "ZZA_024", "ZZA_025", "ZZA_026", "ZZA_027", "ZZA_028", "ZZA_029", "ZZA_030",
					   "ZZA_031", "ZZA_032", "ZZA_033", "ZZA_034", "ZZA_035", "ZZA_036", "ZZA_037", "ZZA_038", "ZZA_039", "ZZA_040",
					   "ZZA_041", "ZZA_042", "ZZA_043", "ZZA_044", "ZZA_045", "ZZA_046", "ZZA_048", "ZZA_049", "ZZA_050",
					   "ZZA_051"};

local firstrun = true;
local firstrunEditor = true;
local lasttimeloop = 0;
local global = {};
	--
	global.simulationTime = 0
	global.ActiveCab = 0
	global.RegulatorControlValue = 0;
	global.firstcameraenter = true
local run = 1;

local Pantoswitchanimrunning = false

local Mainswitchanimrunning = false

local messages = {};
	--
	messages.ZZAValue = 7001;
	messages.testrun = 7002;
	messages.testrunrev = 7003;
	messages.testrun2 = 7005;
	messages.testrun2rev = 7006;
	messages.test = 7004;
	messages.ZDS = 7007;
	messages.CloseDoorsNow = 7008;
	messages.vR = {};
		--
		messages.vR.ZZAValue = 895301;
		messages.vR.TAV_SCHLIESSEN = 895103;
		messages.vR.TAV_ZU = 895104;
		messages.vR.CONSIST_CHECK = 895951;

local ZDS = {};
	--
	ZDS.isControlledbyEngine = false;
	ZDS.Connectionetablished = false;
	ZDS.lastConnectionetablished = false;
	ZDS.lastrefreshtime = 0;
	ZDS.lastConsistChecktimetime = 0;
	ZDS.lastParentAlive = 0;
	ZDS.ZDSRVNumber = 0;
	ZDS.ZDSMasterRVNumber = 0;
	ZDS.State = 0;
	ZDS.lastValue_State = 0;
	ZDS.Value = 0;
	ZDS.Pantoswitchtempvalue = 0

local FML = {}
	--
	FML.Mode = 0 -- 1 = Enabled, 0 = Off, -1 = Automatic
	FML.State = 0
	FML.lastMode = 0
	FML.factor = 0.01;

local ZZA = {};
	--
	ZZA.destinationlist = {};
	ZZA.destinationfile = "";
	ZZA.Auflock = false;
	ZZA.Ablock = false;
	ZZA.resetlock = false;
	ZZA.Value = 1;
	ZZA.lastValue = 1;
	ZZA.Letters = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
				   "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
	ZZA.destination = 1;
	ZZA.destination2 = 1;
	ZZA.setonEditor = true;
	ZZA.Prueflauf = {};
		--
		ZZA.Prueflauf.messagessent = false;
		ZZA.Prueflauf.Starttime = 0;
		ZZA.Prueflauf.active = false;
		ZZA.Prueflauf.tempconsistnumber = 0;
		ZZA.Prueflauf.tempconsistnumber2 = 0;
		ZZA.Prueflauf.finalConsistnumber = nil;

local Sctest1 = 0;
local Sctest2 = 0;


--------------------------------------------------------------------------------------
-- Utiity Functions
--------------------------------------------------------------------------------------

local function DisplayMessage(messageText, messageHoldTime)
	SysCall("ScenarioManager:ShowAlertMessageExt", "Interface Messaging System", tostring(messageText), messageHoldTime, 1);
end

local function checkifcoupled()
	if (Call("SendConsistMessage", messages.test, "0", 0) == 1) then
		global.IsEngineinFront = true;
	elseif (Call("SendConsistMessage", messages.test, "0", 0) == 0) then
		global.IsEngineinFront = false;
	end
	if (Call("SendConsistMessage", messages.test, "0", 1) == 1) then
		global.IsEngineinRear = true;
	elseif (Call("SendConsistMessage", messages.test, "0", 1) == 0) then
		global.IsEngineinRear = false;
	end
end

local function DebugMessage(messageText, messageHoldTime)
	SysCall("ScenarioManager:ShowAlertMessageExt", "DEBUG INFORMATION", "DEBUG: " .. tostring(messageText), messageHoldTime, 1);
end

local function CreateConsistNumber(Number, Class)
	return tostring(Number);
end

-->>Gibt je nach Nachricht des Testlaufs die jeweils zurückführende Nachricht zurück
local function gobackchk(message)
	if (message == messages.testrun) then
		return messages.testrunrev;
	else
		return messages.testrun2rev
	end
end
--<<

-->>Projeziert den Wert zur Richtungsangabe der Nachricht
	--Wenn die Nachricht von Seite a kommt geht sie bei Seite B wieder raus und andersrum
	local function dirproject(number)
		if (number == -1) then
			return 0;
		else
			return number;
		end
	end
--<<
--------------------------------------------------------------------------------------
-- Replaced Original Functions
--------------------------------------------------------------------------------------

function Initialise()
	orig_init();
	math.randomseed(os.clock())
	math.random(); math.random(); math.random(); math.random();
end

function Update(delta)

	if Sctest1 == Sctest2 then
		Sctest1 = os.clock() * delta;
	else
		DisplayMessage(Call("GetRVNumber") .. ": Runtime Error", 1);
	end
	if run > 2 then
		if run == 3 then global.LastInit = global.simulationTime end
		global.RVNumber = Call("GetRVNumber");
		global.TimeofDay = SysCall("ScenarioManager:GetTimeOfDay");
		global.IsEnginewithKey = Call("GetIsEngineWithKey") == 1;
		global.simulationTime = Call("GetSimulationTime");
		global.IsEditor = global.simulationTime == 0;
		global.isDeadEngine = Call("GetIsDeadEngine") == 1;
		global.isPlayer = Call("GetIsPlayer") == 1;
		global.speedValue = math.abs(Call("GetSpeed") * 3.6);
		global.Ammeter = Call("GetControlValue", "Ammeter", 0);
		global.RegulatorControlValue = Call("GetControlValue", "Regulator", 0)
		global.timerunning = global.simulationTime - global.LastInit;

		if global.IsEditor then
			firstrunEditor = false;
		end

		-- ####################################
		-- 			Main Update Loop
		-- ####################################


		if global.simulationTime > 1 then

			----------------------
			-- firstrun only
			----------------------
			if firstrun then
				global.gLastInit = global.simulationTime
				global.timerunning = global.simulationTime - global.gLastInit;
				Call("SetControlValue", "VirtualPantographControl", 0, Call("GetControlValue", "PantographControl", 0))
				Call("SetControlValue", "VirtualStartup", 0, Call("GetControlValue", "HauptSH", 0))



				-- Reading ZZA Destinations from text file
					if CONFIG.USEDESTINATIONLIST then
						ZZA.destinationfile = io.open("../Railworks/" .. CONFIG.DESTINATIONLISTPATH,"r");
						for i=1, table.getn(CONFIG.ZZANAMES) do
							ZZA.destinationlist[i] = ZZA.destinationfile:read()
						end
						for i=1, table.getn(CONFIG.ZZANAMES) do
							if ZZA.destinationlist[i] == nil or ZZA.destinationlist[i] == "" then
								ZZA.destinationlist[i] = "leer";
							end
						end
						if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("Destinations read from Text File", 4) end
					--<<
					end
--
				-- Applying the destination decided in the Railvehicles number
--
					for i=1, table.getn(CONFIG.ZZANAMES) do --Sucht nach dem Buchstaben zur Vorwahl
						if (string.find(global.RVNumber, ZZA.Letters[i]) ~= nil) then
								destination = i + 1;
								setonEditor = true;
							break;
						end
					end
--
					for a=1, table.getn(CONFIG.ZZANAMES) do
						if(a == (destination == 1 and destination or destination - 1)) then
							Call("ZZAS:ActivateNode", CONFIG.ZZANAMES[a], 1);
							destination2 = a;
						else
							Call("ZZAS:ActivateNode", CONFIG.ZZANAMES[a], 0);
						end
					end
	--
					destination = 1; --Damit dass Programm weiß, dass die ZZA vorgewählt wurde
--
				checkifcoupled()
			end

			----------------------
			-- Once every Second
			----------------------

			if math.floor(global.TimeofDay) > math.floor(lasttimeloop) then
				lasttimeloop = global.TimeofDay;
				------------------------------- vR Consist Check
				if global.IsEnginewithKey then
					if (CONFIG.ENABLEVRTAV == true) then
						--Call("SendConsistMessage", messages.vR.CONSIST_CHECK, "1", 0);
						--Call("SendConsistMessage", messages.vR.CONSIST_CHECK, "1", 1);
					end
				end

				checkifcoupled()
			end
			----------------------
			-- If Playertrain
			----------------------
			if global.isPlayer then
				orig_Update(delta);
				----------------------
				-- If Currently driven Vehicle
				----------------------
				if global.IsEnginewithKey then

					--if Call("GetControlValue", "HauptSH", 0) > Call("GetControlValue", "PantographControl", 0) or Call("GetControlValue", "VirtualStartup", 0) > Call("GetControlValue", "PantographControl", 0) then
					--	Call("SetControlValue", "HauptSH", 0, 0)
					--	orig_OnControlValue("VirtualStartup", 0, 0)
					--end

					if Pantoswitchanimrunning and math.abs(Call("GetControlValue", "PhantSwitch", 0)) == 1 then
						Call("SetControlTargetValue", "PhantSwitch", 0, 0)
						Pantoswitchanimrunning = false;
					end
					if Mainswitchanimrunning ~= 0 then
						if math.abs(Call("GetControlValue", "Hauptswitch", 0)) == 1 then

							--Call("SetControlTargetValue", "Hauptswitch", 0, 0)
							Mainswitchanimrunning = 0;
							Call("SetControlTargetValue", "Hauptswitch", 0, 0)
						else
							Call("SetControlTargetValue", "Hauptswitch", 0, Mainswitchanimrunning)
						end
					end
					if Call("GetControlValue", "PantographControl", 0) == 0 then Call("SetControlValue", "HauptSH", 0, 0) end
					Call("LockControl", "Hauptswitch", 0, 1 - Call("GetControlValue", "PantographControl", 0))




					if FML.Mode ~= -1 then
						FML.State = (math.abs(FML.Mode) - 0.5) * 2 * FML.factor + FML.State
					else
						if global.speedValue > CONFIG.AIFANTHRESHOLD then
							FML.State = FML.State + FML.factor
						else
							FML.State = FML.State - FML.factor
						end
					end

					if FML.State > 1 then FML.State = 1 end
					if FML.State < 0 then FML.State = 0 end

					if (math.floor(ZDS.lastConsistChecktimetime / 5) ~= math.floor(global.timerunning / 5)) then
						-->>Wenn Nachricht zurückkommt ist die Verbindung hergestellt, wenn nicht bleibt die Variable auf false
						ZDS.Connectionetablished = false;
						if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("Master Sent FML alive request", 4) end
						Call("SendConsistMessage", messages.ZDS, tostring("Alive" .. global.RVNumber), 0);
						Call("SendConsistMessage", messages.ZDS, tostring("Alive" .. global.RVNumber), 1);
						--<<
						-->>Wenn der Verbindungsstatus geändert wurde, wird die entsprechende Meldung gezeigt
						if (ZDS.Connectionetablished ~= ZDS.lastConnectionetablished) then
							if (ZDS.Connectionetablished == false) then
								DisplayMessage(CreateConsistNumber(global.RVNumber, "143") .. " > " .. ZDS.ZDSRVNumber .. " ZWS:\nVerbindung Verloren!", 4);
							else
								DisplayMessage(CreateConsistNumber(global.RVNumber, "143") .. " > " .. ZDS.ZDSRVNumber .. " ZWS:\nVerbindung Hergestellt!", 4);
							end
							ZDS.lastConnectionetablished = ZDS.Connectionetablished;
						end
						--<<
						ZDS.lastConsistChecktimetime = global.timerunning;
					end


					-->>Senden der Daten
					if ZDS.Connectionetablished then
						if math.floor(ZDS.lastrefreshtime * 2) ~= math.floor(global.timerunning * 2) then
							Call("SendConsistMessage", messages.ZDS, tostring("State" .. (FML.State or 0)), 0);
							Call("SendConsistMessage", messages.ZDS, tostring("State" .. (FML.State or 0)), 1);
							Call("SendConsistMessage", messages.ZDS, tostring("Control" .. (FML.Mode or 0)), 0);
							Call("SendConsistMessage", messages.ZDS, tostring("Control" .. (FML.Mode or 0)), 1);
							Call("SendConsistMessage", messages.ZDS, tostring("Panto" .. (Call("GetControlValue", "PantographControl", 0) or 0)), 0);
							Call("SendConsistMessage", messages.ZDS, tostring("Panto" .. (Call("GetControlValue", "PantographControl", 0) or 0)), 1);
							Call("SendConsistMessage", messages.ZDS, tostring("HS" .. (Call("GetControlValue", "HauptSH", 0) or 0)), 0);
							Call("SendConsistMessage", messages.ZDS, tostring("HS" .. (Call("GetControlValue", "HauptSH", 0) or 0)), 1);
							Call("SendConsistMessage", messages.ZDS, tostring("PSelect" .. (ZDS.Pantoswitchtempvalue or 0)), 0);
							Call("SendConsistMessage", messages.ZDS, tostring("PSelect" .. (ZDS.Pantoswitchtempvalue or 0)), 1);
							ZDS.lastrefreshtime = global.timerunning;
							ZDS.Pantoswitchtempvalue = 0;
						end
						--Call("SendConsistMessage", messages.ZDS, tostring("Regulator" .. (global.RegulatorControlValue or 0)), 0);
						--Call("SendConsistMessage", messages.ZDS, tostring("Regulator" .. (global.RegulatorControlValue or 0)), 1);
					end
					if ZDS.Connectionetablished then Call("SetControlValue", "Regulator", 0, global.RegulatorControlValue / 3) end
				else
					ZDS.Connectionetablished = false
					ZDS.lastConnectionetablished = ZDS.Connectionetablished
					ZDS.lastConsistChecktimetime = global.timerunning;
				end
			end

			--
			Call("Sound:SetParameter", "AiTrainNoSound", global.IsEnginewithKey and 1 or 0)
			--DisplayMessage("hi", 1)
			firstrun = false;
		end
	end
	run = run + 1;
	Sctest2 = Sctest1;
end

function OnControlValueChange(name, index, value)
	if name == "VirtualPantographControl" and not firstrun and global.IsEnginewithKey then
		Pantoswitchanimrunning = true
		Call("SetControlTargetValue", "PhantSwitch", 0, math.floor((math.floor(value) - 0.5) * 2))
		if value == 0 then Call("SetControlValue", "HauptSH", 0, 0); Call("SetControlValue", "VirtualStartup", 0, 0) else Call("SetControlValue", name, index, value); end
	elseif name == "VirtualStartup" and not firstrun and global.IsEnginewithKey then
		if Call("GetControlValue", "PantographControl", 0) == 0 then
			Call("SetControlValue", "HauptSH", 0, 0);
			Call("SetControlValue", "VirtualStartup", 0, 0);
		else
			Mainswitchanimrunning = math.floor((math.floor(value) - 0.5) * 2)
			Call("SetControlTargetValue", "Hauptswitch", 0, math.floor((math.floor(value) - 0.5) * 2))
			Call("SetControlValue", name, index, value);
		end
	elseif name == "FMLUp" then
		if value == 1 then
			FML.Mode = FML.Mode ~= 1 and FML.Mode + 1 or 1
		end
		--DisplayMessage(FML.Mode, 3)
		Call("SetControlValue", name, index, value)
	elseif name == "FMLDown" then
		if value == 1 then
			FML.Mode = FML.Mode ~= -1 and FML.Mode - 1 or -1
		end
		--DisplayMessage(FML.Mode, 3)
		Call("SetControlValue", name, index, value)
	elseif name == "ZDSPantoSelect" and value == 1 then
		ZDS.Pantoswitchtempvalue = 1;
		--DisplayMessage(FML.Mode, 3)
		Call("SetControlValue", name, index, value)
	else
		orig_OnControlValue(name, index, value);
	end
end

function OnCameraEnter(cabEndWithCamera, carriageCam)
	if orig_OnCameraEnter then orig_OnCameraEnter(cabEndWithCamera, carriageCam) end
	--if cabEndWithCamera ~= global.ActiveCab and ZDS.Connectionetablished then DisplayMessage(ZDS.ZDSMasterRVNumber .. " > " .. global.RVNumber, "143" .. " ZWS:\nVerbindung wird wiederhergestellt!", 4) end
	global.ActiveCab = cabEndWithCamera;
	if global.firstcameraenter then
		if Call("GetControlValue", "PantographControl", 0) == 1 then Call("SetControlValue", "HauptSH", 0, 1) end
		global.firstcameraenter = false
	end
end

function OnCameraLeave()
	if orig_OnCameraLeave then orig_OnCameraLeave() end
end

function OnConsistMessage(message, argument, direction)
	-->>Testlauf weitersenden
	if global.IsEnginewithKey then
		-->>Extrahieren der Zugnummer des geführten Tfz
		if (message == messages.ZDS and string.find(argument, "RV") ~= nil) then
			ZDS.Connectionetablished = true;
			ZDS.ZDSRVNumber = string.sub(argument, 3);
		end
		--<<
	end
	if (message == messages.testrun or message == messages.testrun2) then
		Call("SendConsistMessage", gobackchk(message), tostring(tonumber(argument) + 1), 1 - dirproject(direction));
		Call("SendConsistMessage", message, tostring(tonumber(argument) + 1), dirproject(direction));
	elseif (message == messages.testrunrev or message == messages.testrun2rev) then
		Call("SendConsistMessage", message, argument, dirproject(direction));
	else
		orig_OnConsistMessage(message, argument, direction)
	end
end