-->>Deklarationen
	-->>ZZA
	local ZZA = {};
	--
	ZZA.destinationlist = {};
	--
	ZZA.destinationfile = "";
	--
	ZZA.Auflock = false;
	ZZA.Ablock = false;
	ZZA.resetlock = false;
	--
	ZZA.Prueflauf = {};
	--
	ZZA.Prueflauf.messagessent = false;
	ZZA.Prueflauf.Starttime = 0;
	ZZA.Prueflauf.active = false;
	ZZA.Prueflauf.tempconsistnumber = 0;
	ZZA.Prueflauf.tempconsistnumber2 = 0;
	ZZA.Prueflauf.finalConsistnumber = nil;
	--
	ZZA.Value = 1;
	ZZA.lastValue = 1;
	--
	ZZA.Letters = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
				   "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
	ZZA.destination = 1;
	ZZA.destination2 = 1;
	ZZA.setonEditor = true;
--<<


-->>Übertragung an andere Fahrzeuge
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
	--
	messages.vR = {};
	--
	messages.vR.ZZAValue = 895301;
	--
	messages.vR.TAV_SCHLIESSEN = 895103;
	messages.vR.TAV_ZU = 895104;
	messages.vR.CONSIST_CHECK = 895951;

	--local lastValue_Doors = 0;
	dustinkst = 0
--<<

-->>UIC
	local UIC = {};
	--
	UIC.Rawnumber = 0;
	UIC.result = 0;
	UIC.ZZALetter = "";
	UIC.multiplier = 1;
	UIC.temp1 = "";
	UIC.temp2 = 0;
--<<

-->>Ingame Werte
	local global = {}
	global.IsEngineinFront = false;
	global.IsEngineinRear = false;
	global.IsEnginewithKey = false;
	global.isPlayer = 0;
	global.isSpeedAtZero = false;
	global.DrivingFwd = false;
	global.DrivingRwd = false;
	global.RVNumber = 0;
	global.lastRVNumber = 0;
	global.CurrentDir = 1;
	global.lastdir = 0;
	global.isDeadEngine = 0;
	global.speedValue = 0;
	global.Ammeter = 0;
	global.firstrun = true;
	global.firstrunEditor = true;
	global.IsEditor = false;
	global.simulationTime = 0;
	global.TimeofDay = 0;
	global.Blindlastchktime = 0;
	global.setfans = false;
	global.gLastInit = 0;
	global.run = 0;
	global.timerunning = 0;
	global.lasttimeloop = 0;
	global.secloopEditor = false;
	global.Sctest1 = 0;
	global.Sctest2 = 0;
--<<

-->>Variablen zur Anzeige der Uhrzeit
	local Clock = {};
	--
	Clock.seconddigits =  {"ZF_Sekunde_1_00", "ZF_Sekunde_1_01", "ZF_Sekunde_1_02", "ZF_Sekunde_1_03", "ZF_Sekunde_1_04", "ZF_Sekunde_1_05", "ZF_Sekunde_1_06", "ZF_Sekunde_1_07", "ZF_Sekunde_1_08", "ZF_Sekunde_1_09"};
	Clock.seconddigits2 = {"ZF_Sekunde_2_00", "ZF_Sekunde_2_01", "ZF_Sekunde_2_02", "ZF_Sekunde_2_03", "ZF_Sekunde_2_04", "ZF_Sekunde_2_05", "ZF_Sekunde_2_06", "ZF_Sekunde_2_07", "ZF_Sekunde_2_08", "ZF_Sekunde_2_09"};
	Clock.minutedigits =  {"ZF_Minute_1_00", "ZF_Minute_1_01", "ZF_Minute_1_02", "ZF_Minute_1_03", "ZF_Minute_1_04", "ZF_Minute_1_05", "ZF_Minute_1_06", "ZF_Minute_1_07", "ZF_Minute_1_08", "ZF_Minute_1_09"};
	Clock.minutedigits2 = {"ZF_Minute_2_00", "ZF_Minute_2_01", "ZF_Minute_2_02", "ZF_Minute_2_03", "ZF_Minute_2_04", "ZF_Minute_2_05", "ZF_Minute_2_06", "ZF_Minute_2_07", "ZF_Minute_2_08", "ZF_Minute_2_09"};
	Clock.hourdigits =    {"ZF_Stunde_1_00", "ZF_Stunde_1_01", "ZF_Stunde_1_02", "ZF_Stunde_1_03", "ZF_Stunde_1_04", "ZF_Stunde_1_05", "ZF_Stunde_1_06", "ZF_Stunde_1_07", "ZF_Stunde_1_08", "ZF_Stunde_1_09"};
	Clock.hourdigits2 =   {"ZF_Stunde_2_00", "ZF_Stunde_2_01", "ZF_Stunde_2_02", "ZF_Stunde_2_03", "ZF_Stunde_2_04", "ZF_Stunde_2_05", "ZF_Stunde_2_06", "ZF_Stunde_2_07", "ZF_Stunde_2_08", "ZF_Stunde_2_09"};
	--
	Clock.hours = 0;
	Clock.minutes = 0;
	Clock.seconds = 0;
	Clock.hmsstring = "";
	--
	Clock.deltahm = 0;
	Clock.deltams = 0;
	--
	Clock.lastValue_clockrefreshtime = 0;
--<<

-->>VR TAV
	local TAV = {};
	--
	TAV.State = 0;
	TAV.closelock = false;
	TAV.closelock2 = false;
	TAV.openlock = false;
	--
	TAV.Blink = {};
	--
	TAV.Blink.active = false;
	TAV.Blink.lastTime = 0;
	TAV.Blink.factor = 0;
	TAV.Blink.ONOFF = 1;
	--
	TAV.NSZwang = false;
	TAV.locklock = false;
	TAV.lastlockmsg = 0;
	TAV.lockmsgcooldown = 5;
--<<

-->>Variablen zur Deklaration des Schneeflugs
	local Snow = {}
	Snow.gSnowPlowLeft = 1;
	Snow.gSnowPlowRight = 1;
	Snow.gSnowPlowLeftrev = 0;
	Snow.gSnowPlowRightrev = 0;
	Snow.gEmitter = 0;
--<

-->>Rollos
	local Rollos = {};
	--
	Rollos.RAnimTime = 0;
	Rollos.LAnimTime = 0;
	Rollos.propfactor = 1.375;
	--
	Rollos.lastValueCombined = -1;
	Rollos.lastValue_Blind = "";

	Rollos.CurrentState = {
	10, -- F_L
	10, -- F_R
	10, -- R_L
	10, -- R_R
	};
	Rollos.Update = true;
	Rollos.lastEnginewithKey = 1;
	Rollos.lastEnginewithKey2 = 1;
	Rollos.lastPlayerEngine = 1;
	Rollos.lastdeadEngine = 1;
	Rollos.lastEngineinRear = false;
	Rollos.lastEngineinFront = false;
	Rollos.lastDrivingRwd = false;
	--
	Rollos.Manual = {};
	--
	Rollos.Manual.State = {["FL"] = 0, ["RL"] = 0, ["FR"] = 0, ["RR"] = 0};
	Rollos.Manual.lastValueCombined = -1;
	Rollos.Manual.Update = true;
--<<

-->>Arraylenghts
	local arr = {};
	--
	arr.CONFIG_ZZANAMES = 0;
	arr.ZZADESTLIST = 0;


-->>Panto
	local Panto = {};
	--
	Panto.CurrentValue = 2;
--<<

-->>FML
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
	ZDS.FMLState = 0;
	ZDS.lastValue_State = 0;
	ZDS.Value = 0;
	ZDS.factor = 0.01;
	ZDS.RemoteRegulator = 0;
	ZDS.PantoState = 0
	ZDS.lastPantoState = 0
	ZDS.PantoCoolDown = 0
	ZDS.HSState = 0
	ZDS.lastHSState = 0
	ZDS.PantoSelectState = 0
	ZDS.lastPantoSelectState = 0
	ZDS.PantoStateNames = {"Vorne", "Beide", "Hinten"}
	ZDS.ShowRaisedMessage = false
--<<

-->>Kompressor
	local Komp = {}
	Komp.MainReservoir = 0
	Komp.lastValue_MainReservoir = 0
	Komp.chknextframe = 0;
	Komp.compactive = false;
--<<

-->>vSoll Nadel
	local vSoll = {};
	vSoll.Vorwahl = 0;
	vSoll.CurrentAnimState = 0;
	vSoll.target = 0;
--<<

-->>Verweis auf das Originalskript
--require (MAINSCRIPTPATH); --Siehe Punkt 1
local _Update = Update;
local _Initialise = Initialise;
local _OnConsistMessage = OnConsistMessage;
local _OnCameraEnter = OnCameraEnter;
--<<

--------------------------------------------------------------------------------------
-- Utiity Functions
--------------------------------------------------------------------------------------

-->>Ermittelt die Länge eines Arrays

	--	- Funktionsweise: Geht nacheinander alle Einträge eines Arrays durch, bis das Ende erreicht ist. Die Funktion gibt dann zurück,
	--	- wie weit es gekommen ist.

	local function GetArrayLenght(Array)
		local Arraylenght = 1;
		local _end = false;
		--
		repeat
			if (Array[Arraylenght] ~= nil) then
				Arraylenght = Arraylenght + 1;
			--
			elseif(Array[Arraylenght] == nil) then
				_end = true;
			end
		--
		until(_end == true)
		return Arraylenght - 1;
	end
--<<

-->>Wandelt eine einstellige Zahl in einen String mit 0 davor um
local function forcetwodigits(Number)
	if (Number < 10) then
		return tostring("0" .. Number);
	else
		return tostring(Number);
	end
end
--<<


-->>Stellt die Sonnenblenden ein
	local function DisplayBlinds(Wert, Blind)
		if (Blind == "F_L" and math.floor(Wert * 20) ~= math.floor(Rollos.CurrentState[1] * 20)) then
			--[[if (not IsEnginewithKey and isPlayer) then
				ShowMessage("DEBUG: " .. Blind .. " - " .. math.floor(Wert * 20), 1);
			end]]
			Call("Rollos:ActivateNode", "Rollo_" .. Blind .. "_" .. forcetwodigits(math.floor(Wert * 20)), 1);
			Call("Rollos:ActivateNode", "Rollo_" .. Blind .. "_" .. forcetwodigits(math.floor(Rollos.CurrentState[1] * 20)), 0);
			Rollos.CurrentState[1] = Wert;

		elseif (Blind == "F_R" and math.floor(Wert * 20) ~= math.floor(Rollos.CurrentState[2] * 20)) then
			--[[if (not IsEnginewithKey and isPlayer) then
				ShowMessage("DEBUG: " .. Blind .. " - " .. math.floor(Wert * 20), 1);
			end]]
			Call("Rollos:ActivateNode", "Rollo_" .. Blind .. "_" .. forcetwodigits(math.floor(Wert * 20)), 1);
			Call("Rollos:ActivateNode", "Rollo_" .. Blind .. "_" .. forcetwodigits(math.floor(Rollos.CurrentState[2] * 20)), 0);
			Rollos.CurrentState[2] = Wert;

		elseif (Blind == "R_L" and math.floor(Wert * 20) ~= math.floor(Rollos.CurrentState[3] * 20)) then
			--[[if (not IsEnginewithKey and isPlayer) then
				ShowMessage("DEBUG: " .. Blind .. " - " .. math.floor(Wert * 20), 1);
			end]]
			Call("Rollos:ActivateNode", "Rollo_" .. Blind .. "_" .. forcetwodigits(math.floor(Wert * 20)), 1);
			Call("Rollos:ActivateNode", "Rollo_" .. Blind .. "_" .. forcetwodigits(math.floor(Rollos.CurrentState[3] * 20)), 0);
			Rollos.CurrentState[3] = Wert;

		elseif (Blind == "R_R" and math.floor(Wert * 20) ~= math.floor(Rollos.CurrentState[4] * 20)) then
			--[[if (not IsEnginewithKey and isPlayer) then
				ShowMessage("DEBUG: " .. Blind .. " - " .. math.floor(Wert * 20), 1);
			end]]
			Call("Rollos:ActivateNode", "Rollo_" .. Blind .. "_" .. forcetwodigits(math.floor(Wert * 20)), 1);
			Call("Rollos:ActivateNode", "Rollo_" .. Blind .. "_" .. forcetwodigits(math.floor(Rollos.CurrentState[4] * 20)), 0);
			Rollos.CurrentState[4] = Wert;
		end
	end
--<<

-->>Zeigt die Zeit an

	--	- Funktionsweise: Jede Ziffer wird einmal pro Ausführung durchgegangen. Für diese Ziffer wird der
	--	- entsprechende Wert aus dem String extrahiert, und alle Ziffern außer der im String entsprechenden
	--	- deatkiviert

	local function DisplayTime(inputstring)
		for i=1,6 do
		-->>Sekunden
			if (i == 1) then
				for a=1,10 do
					if (a == string.sub(inputstring, i, i) + 1) then
						--ShowMessage(a, 1);
						Call("ZFU:ActivateNode", Clock.hourdigits[a], 1)
						Call("EAU:ActivateNode", Clock.hourdigits[a], 1)
					else
						Call("ZFU:ActivateNode", Clock.hourdigits[a], 0)
						Call("EAU:ActivateNode", Clock.hourdigits[a], 0)
					end
				end
			end
			if (i == 2) then
				for a=1,10 do
					if (a == string.sub(inputstring, i, i) + 1) then
						--ShowMessage(a, 1);
						Call("ZFU:ActivateNode", Clock.hourdigits2[a], 1)
						Call("EAU:ActivateNode", Clock.hourdigits2[a], 1)
					else
						Call("ZFU:ActivateNode", Clock.hourdigits2[a], 0)
						Call("EAU:ActivateNode", Clock.hourdigits2[a], 0)
					end
				end
			end
		--<<
		-->>Minuten
			if (i == 3) then
				for a=1,10 do
					if (a == string.sub(inputstring, i, i) + 1) then
						--ShowMessage(a, 1);
						Call("ZFU:ActivateNode", Clock.minutedigits[a], 1)
						Call("EAU:ActivateNode", Clock.minutedigits[a], 1)
					else
						Call("ZFU:ActivateNode", Clock.minutedigits[a], 0)
						Call("EAU:ActivateNode", Clock.minutedigits[a], 0)
					end
				end
			end
			if (i == 4) then
				for a=1,10 do
					if (a == string.sub(inputstring, i, i) + 1) then
						--ShowMessage(a, 1);
						Call("ZFU:ActivateNode", Clock.minutedigits2[a], 1)
						Call("EAU:ActivateNode", Clock.minutedigits2[a], 1)
					else
						Call("ZFU:ActivateNode", Clock.minutedigits2[a], 0)
						Call("EAU:ActivateNode", Clock.minutedigits2[a], 0)
					end
				end
			end
		--<<
		-->>Stunden
			if (i == 5) then
				for a=1,10 do
					if (a == string.sub(inputstring, i, i) + 1) then
						Call("ZFU:ActivateNode", Clock.seconddigits[a], 1)
						Call("EAU:ActivateNode", Clock.seconddigits[a], 1)
						--ShowMessage(a, 1);
					else
						Call("ZFU:ActivateNode", Clock.seconddigits[a], 0)
						Call("EAU:ActivateNode", Clock.seconddigits[a], 0)
					end
				end
			end
			if (i == 6) then
				for a=1,10 do
					if (a == string.sub(inputstring, i, i) + 1) then
						--ShowMessage(a, 1);
						Call("ZFU:ActivateNode", Clock.seconddigits2[a], 1)
						Call("EAU:ActivateNode", Clock.seconddigits2[a], 1)
					else
						Call("ZFU:ActivateNode", Clock.seconddigits2[a], 0)
						Call("EAU:ActivateNode", Clock.seconddigits2[a], 0)
					end
				end
			end
		--<<
		end
	end


-->>Zieht jeder Zahl außer 1 1 ab
	local function Minusoneexceptforone(number)
		if (number > 1) then
			return number - 1;
		else
			return number;
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

-->>Gibt je nach Nachricht des Testlaufs die jeweils zurückführende Nachricht zurück
	local function gobackchk(message)
		if (message == messages.testrun) then
			return messages.testrunrev;
		else
			return messages.testrun2rev
		end
	end
--<<

	local function CreateConsistNumber(Number, Class)
		return tostring(Class .. " " .. string.sub(Number, 1, 3) .. "-" .. string.sub(Number, 4, 4));
	end

-->>Zeigt den Schnee an
	local function Snow(factor)
		local speed = Call( "GetSpeed" );
		if (speed > 0) then
			Snow.gSnowPlowLeft = 1;
			Snow.gSnowPlowRight = 1;
			Snow.gSnowPlowLeftrev = 0;
			Snow.gSnowPlowRightrev = 0;
		else
			Snow.gSnowPlowLeft = 0;
			Snow.gSnowPlowRight = 0;
			Snow.gSnowPlowLeftrev = 1;
			Snow.gSnowPlowRightrev = 1;
		end


		if ( speed > 25 ) then
			speed = 25;
		end

		if ( speed > 10 ) then
			Snow.gEmitter = (speed - 10) * 0.1
			if ( Snow.gEmitter < 0.08 ) then
				Snow.gEmitter = 0.08;
			elseif ( Snow.gEmitter >= 0.45 ) then
				Snow.gEmitter = 0.45;
			end
			if ( Snow.gSnowPlowLeft == 1 ) then
				Call( "SnowPlow1:SetEmitterActive", 1 );
				-- Call( "SnowPlow1:SetEmitterRate", 1 - gEmitter );
				Call( "SnowPlow1:SetEmitterColour", 1, 1, 1, factor * (Snow.gEmitter - 0.08));
			else
				Call( "SnowPlow1:SetEmitterActive", 0 );
			end
			if ( Snow.gSnowPlowRight == 1 ) then
				Call( "SnowPlow2:SetEmitterActive", 1 );
				-- Call( "SnowPlow2:SetEmitterRate", 1 - gEmitter );
				Call( "SnowPlow2:SetEmitterColour", 1, 1, 1, factor * (Snow.gEmitter - 0.08));
			else
				Call( "SnowPlow2:SetEmitterActive", 0 );
			end
		else
			Call( "SnowPlow1:SetEmitterActive", 0 );
			Call( "SnowPlow2:SetEmitterActive", 0 );
		end

		if ( speed < -10 ) then
			speed = speed * -1;
			Snow.gEmitter = (speed - 10) * 0.1
			if ( Snow.gEmitter < 0.08 ) then
				Snow.gEmitter = 0.08;
			elseif ( Snow.gEmitter >= 0.45 ) then
				Snow.gEmitter = 0.45;
			end
			if ( Snow.gSnowPlowLeftrev == 1 ) then
				Call( "SnowPlow1rev:SetEmitterActive", 1 );
				-- Call( "SnowPlow1:SetEmitterRate", 1 - gEmitter );
				Call( "SnowPlow1rev:SetEmitterColour", 1, 1, 1, factor * (Snow.gEmitter - 0.08));
			else
				Call( "SnowPlow1rev:SetEmitterActive", 0 );
			end
			if ( Snow.gSnowPlowRightrev == 1 ) then
				Call( "SnowPlow2rev:SetEmitterActive", 1 );
				-- Call( "SnowPlow2:SetEmitterRate", 1 - gEmitter );
				Call( "SnowPlow2rev:SetEmitterColour", 1, 1, 1, factor * (Snow.gEmitter - 0.08));
			else
				Call( "SnowPlow2rev:SetEmitterActive", 0 );
			end
		else
			Call( "SnowPlow1rev:SetEmitterActive", 0 );
			Call( "SnowPlow2rev:SetEmitterActive", 0 );
		end
	end

	local function ShowMessage(messageText, messageHoldTime)
		if (CONFIG.DISPLAYMESSAGES == true) then
			--if (not IsEnginewithKey) then
				--SysCall("ScenarioManager:ShowAlertMessageExt", tostring(--[[RVNumber .. ]]"Interface Messaging System"), tostring(RVNumber .. ": " .. messageText), messageHoldTime, 1);
			--else
				SysCall("ScenarioManager:ShowAlertMessageExt", "Interface Messaging System", tostring(messageText), messageHoldTime, 1);
			--end
		end
	end

	local function DebugMessage(messageText, messageHoldTime)
		SysCall("ScenarioManager:ShowAlertMessageExt", "DEBUG INFORMATION", CreateConsistNumber(global.RVNumber, "143") .. " DEBUG: " .. tostring(messageText), messageHoldTime, 1);
	end

	local function checkifcoupled()
	-->>Überpfüft ob sich Fahrzeuge vor oder hinter dem Führenden befinden
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
	--<<
	end

	local function SetTrainNumber()
		if (CONFIG.CORRECTRVNUMBER == true) then
			UIC.ZZALetter = string.sub(tostring(global.RVNumber), 5);
			UIC.Rawnumber = string.sub(tostring(global.RVNumber), 1, 3);
		-->>Abwechselnd mit 1 und 2 Multiplizieren
			for i=1,6 do
				UIC.temp1 = tostring(UIC.temp1 .. tonumber(string.sub("143" .. UIC.Rawnumber, i, i)) * UIC.multiplier)
				UIC.multiplier = 3 - UIC.multiplier;
			end
		--<<
		-->>Quersumme errechnen
			for i=1, string.len(UIC.temp1) do
				UIC.temp2 = tostring(tonumber(UIC.temp2) + tonumber(string.sub(UIC.temp1, i, i)))
			end
		--<<
		-->>Sonderfall, wenn Quersumme ein vielfaches von 10 ist
			if (string.sub(UIC.temp2, 2) ~= "0") then
				UIC.result = 10 - tonumber(string.sub(UIC.temp2, 2));
			else
				UIC.result = 0
			end
		--<<
			Call("SetRVNumber", UIC.Rawnumber .. UIC.result .. UIC.ZZALetter);
			if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("Set RailVehicle Consist Number", 4) end
			UIC.multiplier = 1;
			UIC.temp1 = "";
			UIC.temp2 = 0;
		end
	--<<
	-->>Fahrzeugnummer im Führerstand
		for i=1,4 do
			for a=0,9 do
				if (tostring(a) == string.sub(tostring(UIC.Rawnumber .. UIC.result), i, i)) then
					Call("FZN:ActivateNode", "FZG_" .. forcetwodigits(i) .. "_" .. forcetwodigits(a), 1);
				else
					Call("FZN:ActivateNode", "FZG_" .. forcetwodigits(i) .. "_" .. forcetwodigits(a), 0);
				end
			end
		end
	end

	local function fixPanto()
		if not global.isDeadEngine then
			Panto.CurrentValue = global.DrivingRwd and 1 or 2;
			Call("SetTime", "ExtPantograph_" .. tostring(Panto.CurrentValue), 1);
			Call("SetTime", "ExtPantograph_" .. tostring(3 - Panto.CurrentValue), 0);
		else
			Call("SetTime", "ExtPantograph_2", 0);
			Call("SetTime", "ExtPantograph_1", 0);
		end
	end
--<<
--<<


--------------------------------------------------------------------------------------
-- Replaced Original Functions
--------------------------------------------------------------------------------------

-->>Code
-->>Funktion, die zum Start einmal durchläuft
	function Initialise()
		_Initialise(); --Originalfunktion aufrufen
		Call("BeginUpdate");

	-->>Initialisierung des Schneeflugs
		Call( "SnowPlow1:SetEmitterActive", 0 );
		Call( "SnowPlow2:SetEmitterActive", 0 );
		Call( "SnowPlow1rev:SetEmitterActive", 0 );
		Call( "SnowPlow2rev:SetEmitterActive", 0 );
		Snow.gSnowPlowLeft = 1;
		Snow.gSnowPlowRight = 1;
		Snow.gSnowPlowLeftrev = 0;
		Snow.gSnowPlowRightrev = 0;
		Snow.gEmitter = 0;
	--<<
	end
--<<

-->>Funktion, die jeden Frame durchläuft
	function Update(time)
		if global.Sctest2 == global.Sctest1 then
			global.Sctest1 = os.clock() * time;
		else
			ShowMessage(CreateConsistNumber(Call("GetRVNumber"), "143")..": Laufzeitfehler!", 1)
		end

		if global.run > 2 then
			if global.run == 2 then global.gLastInit = global.simulationTime end
		-->>Werte definieren
			global.RVNumber = Call("GetRVNumber");
			global.TimeofDay = SysCall("ScenarioManager:GetTimeOfDay");
			global.IsEnginewithKey = Call("GetIsEngineWithKey") == 1;
			global.simulationTime = Call("GetSimulationTime");
			global.IsEditor = global.simulationTime == 0;
			global.isDeadEngine = Call("GetIsDeadEngine") == 1;
			global.isPlayer = Call("GetIsPlayer") == 1;
			global.speedValue = Call("GetSpeed") * 3.6;
			global.Ammeter = Call("GetControlValue", "Ammeter", 0);
			global.timerunning = global.simulationTime - global.gLastInit;
			arr.CONFIG_ZZANAMES = GetArrayLenght(CONFIG.ZZANAMES);
		--<<

--		##################################################################################
--									In Editor
--		##################################################################################
			if global.IsEditor then
				if math.floor(os.clock()) > math.floor(global.lasttimeloop) or global.firstrunEditor then
					global.lasttimeloop = os.clock();
					checkifcoupled()
					Rollos.Update = true;
					global.secloopEditor = true;
				end
				if global.firstrunEditor then ResetBlinds(); Rollos.Update = true end
--
				if Rollos.lastdeadEngine ~= global.isDeadEngine then
					Rollos.Update = true
					Rollos.lastdeadEngine = global.isDeadEngine
				end

				if (CONFIG.INACTIVECABBLINDSDOWN == true) then
					if (global.isDeadEngine) then
							if Rollos.Update then DisplayBlinds(0, "F_R") end
							if Rollos.Update then DisplayBlinds(0, "F_L") end
							Call("SetTime", "ExtBlind_FL", 1);
							Call("SetTime", "ExtBlind_FR", 1);
							--
							if Rollos.Update then DisplayBlinds(0, "R_R") end
							if Rollos.Update then DisplayBlinds(0, "R_L") end
							Call("SetTime", "ExtBlind_BL", 1);
							Call("SetTime", "ExtBlind_BR", 1);
					else
						if global.IsEngineinFront ~= Rollos.lastEngineinFront then
							Rollos.Update = true;
							Rollos.lastEngineinFront = global.IsEngineinFront;
						end
						if global.IsEngineinFront then
							if Rollos.Update then DisplayBlinds(0, "F_R") end
							if Rollos.Update then DisplayBlinds(0, "F_L") end
							Call("SetTime", "ExtBlind_FL", 1);
							Call("SetTime", "ExtBlind_FR", 1);
							--
							if Rollos.Update then DisplayBlinds(0, "R_R") end
							if Rollos.Update then DisplayBlinds(0, "R_L") end
							Call("SetTime", "ExtBlind_BL", 1);
							Call("SetTime", "ExtBlind_BR", 1);
						else
							if Rollos.Update then DisplayBlinds(1, "F_R") end
							if Rollos.Update then DisplayBlinds(1, "F_L") end
							Call("SetTime", "ExtBlind_FL", 0);
							Call("SetTime", "ExtBlind_FR", 0);
							--
							if Rollos.Update then DisplayBlinds(0, "R_R") end
							if Rollos.Update then DisplayBlinds(0, "R_L") end
							Call("SetTime", "ExtBlind_BL", 1);
							Call("SetTime", "ExtBlind_BR", 1);
						end
					end
				else
					if Rollos.Update then DisplayBlinds(1, "F_R") end
					if Rollos.Update then DisplayBlinds(1, "F_L") end
					if Rollos.Update then DisplayBlinds(1, "R_R") end
					if Rollos.Update then DisplayBlinds(1, "R_L") end
					Call("SetTime", "ExtBlind_BL", 1);
					Call("SetTime", "ExtBlind_BR", 1);
					Call("SetTime", "ExtBlind_FL", 1);
					Call("SetTime", "ExtBlind_FR", 1);
				end

				Rollos.Update = false;


				if global.lastRVNumber ~= global.RVNumber then

					SetTrainNumber()

					for i=1, arr.CONFIG_ZZANAMES do --Sucht nach dem Buchstaben zur Vorwahl
					if (string.find(global.RVNumber, ZZA.Letters[i]) ~= nil) then
						ZZA.destination = i + 1;
						ZZA.setonEditor = true;
						break;
					end
					end

					for a=1, arr.CONFIG_ZZANAMES do
						if(a == Minusoneexceptforone(ZZA.destination)) then
							Call("ZZAS:ActivateNode", CONFIG.ZZANAMES[a], 1);
							ZZA.destination2 = a;
						else
							Call("ZZAS:ActivateNode", CONFIG.ZZANAMES[a], 0);
						end
					end

					global.lastRVNumber = global.RVNumber;
				end

				fixPanto();

				global.firstrunEditor = false;
				Rollos.Update = false;
				global.secloopEditor = false;
			end


			if global.simulationTime < 1 then
				Call( "SnowPlow1:SetEmitterActive", 0 );
				Call( "SnowPlow2:SetEmitterActive", 0 );
				Call( "SnowPlow1rev:SetEmitterActive", 0 );
				Call( "SnowPlow2rev:SetEmitterActive", 0 );
			else
				_Update(time);

--		##################################################################################
--									First run only
--		##################################################################################
				if global.firstrun then
					global.gLastInit = global.simulationTime
					global.timerunning = global.simulationTime - global.gLastInit;



					------------------------------------------------------------------- ZZA vorbereiten

					if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("ZZA Reset", 4) end
					-->>Schreibt die ZZA Positionen aus der Textdatei in ein Array
					if (CONFIG.USEDESTINATIONLIST == true) then
						ZZA.destinationfile = io.open("../Railworks/" .. CONFIG.DESTINATIONLISTPATH,"r");
						for i=1, arr.CONFIG_ZZANAMES do
							ZZA.destinationlist[i] = ZZA.destinationfile:read()
							--ShowMessage(ZZA.destinationlist[i], 1);
						end
					-->>Schutz, damit kein Wert im Array 'nil' ist
						for i=1, arr.CONFIG_ZZANAMES do
							if (ZZA.destinationlist[i] == nil or ZZA.destinationlist[i] == "") then
								ZZA.destinationlist[i] = "leer";
							end
						end
						arr.ZZADESTLIST = GetArrayLenght(ZZA.destinationlist);
						if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("Destinations read from Text File", 4) end
					--<<
					end
					for i=1, arr.CONFIG_ZZANAMES do --Sucht nach dem Buchstaben zur Vorwahl
						if (string.find(global.RVNumber, ZZA.Letters[i]) ~= nil) then
							ZZA.destination = i + 1;
							ZZA.setonEditor = true;
							break;
						end
					end

					for a=1, arr.CONFIG_ZZANAMES do
						if(a == Minusoneexceptforone(ZZA.destination)) then
							Call("ZZAS:ActivateNode", CONFIG.ZZANAMES[a], 1);
							ZZA.destination2 = a;
						else
							Call("ZZAS:ActivateNode", CONFIG.ZZANAMES[a], 0);
						end
					end

					ZZA.destination = 1; --Damit dass Programm weiß, dass die ZZA vorgewählt wurde


					------------------------------------------------------------------- Loknummer
					SetTrainNumber()
					-->>UIC Prüfziffer berechnen

				--<<
					checkifcoupled()
					ResetBlinds();

					if (global.isDeadEngine) then
						--if (firstrun == true or IsEditor == true) then
							if (CONFIG.INACTIVECABBLINDSDOWN == true) then
								DisplayBlinds(0, "F_R");
								DisplayBlinds(0, "F_L");
								Call("SetTime", "ExtBlind_FL", 1);
								Call("SetTime", "ExtBlind_FR", 1);
								--
								DisplayBlinds(0, "R_R");
								DisplayBlinds(0, "R_L");
								Call("SetTime", "ExtBlind_BL", 1);
								Call("SetTime", "ExtBlind_BR", 1);
							else
								DisplayBlinds(1, "F_R");
								DisplayBlinds(1, "F_L");
								DisplayBlinds(1, "R_R");
								DisplayBlinds(1, "R_L");
							end
						--end
					end

					TAV.lastlockmsg = -1 * TAV.lockmsgcooldown; -- Reset Traction Look Message Cooldown
				end
--		##################################################################################
--									Execute once Every Second
--		##################################################################################

				if math.floor(global.TimeofDay) > math.floor(global.lasttimeloop) then
					global.lasttimeloop = global.TimeofDay;
					------------------------------- vR Consist Check
					if global.IsEnginewithKey then
						if (CONFIG.ENABLEVRTAV == true) then
							Call("SendConsistMessage", messages.vR.CONSIST_CHECK, "1", 0);
							Call("SendConsistMessage", messages.vR.CONSIST_CHECK, "1", 1);
						end
					end

					if global.IsEnginewithKey then
					Clock.hours = math.floor(global.TimeofDay / 3600);
					Clock.deltahm = global.TimeofDay - Clock.hours * 3600;
					--
					Clock.minutes = math.floor(Clock.deltahm / 60);
					Clock.deltams = global.TimeofDay - Clock.hours * 3600 - Clock.minutes * 60;
					--
					Clock.seconds = math.floor(Clock.deltams / 1);
					--
					Clock.hmsstring = forcetwodigits(Clock.hours) .. forcetwodigits(Clock.minutes) .. forcetwodigits(Clock.seconds);
					DisplayTime(Clock.hmsstring);
					--
					end

					checkifcoupled()
				end

--		##################################################################################
--									If Player Train
--		##################################################################################

				if global.isPlayer then
				------------------------------------------- Set the Fans to Automatic at start
					if (global.timerunning > 0.5 and global.setfans == false and CONFIG.AUTOMATICFANMODEBYDEFAULT == true) then
						if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("FANS SET TO AUTOMATIC", 4) end
						Call("SetControlValue", "TractionBlower_Control", 0, -1);
						global.setfans = true;
					end

--				############################## Compressor ###################################

					Komp.MainReservoir = Call("GetControlValue", "MainReservoirPressureBAR", 0);

					if Komp.chknextframe ~= 0 then
						if Komp.chknextframe ~= Komp.MainReservoir then
							if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("Compressor On", 4) end
							Call("SetControlValue", "Compressor2", 0, 1);
							Komp.compactive = true;
						end
						Komp.chknextframe = 0;
					end

					if Call("GetSimulationTime") > 1 then
						if Komp.MainReservoir <= 8.482 and Komp.chknextframe == 0 and not Komp.compactive then
							Komp.chknextframe = Komp.MainReservoir;
						end

						Komp.lastValue_MainReservoir = Komp.MainReservoir;

						if Komp.MainReservoir >= 9.99 and Komp.compactive then
							if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("Compressor Off", 4) end
							Call("SetControlValue", "Compressor2", 0, 0);
							Komp.compactive = false;
							Komp.chknextframe = 0;
						end
					end
--		##################################################################################
--									If Engine with key
--		##################################################################################
					if global.IsEnginewithKey then

--							############################## Fans ###################################

						--	 - Funktionsweise: Alle 5 Sekunden sendet die führende Lok ein Signal. Wenn dieses von einer geführten Lok empfangen wird sendet diese ihre
						--	 - Nummer mit dem Zusatz 'RV' vorne angehängt zurück, und ist bereit. Beim empfangen der Nachricht extrahiert die führende Lok die Nummer, und
						--	 - die Verbindung ist nun hergestellt. Wenn dies der Fall ist, sendet nun die führende Lok nun alle 0.5 Sekunden den Status des FML. Die
						--	 - geführte Lok emfängt diese, und setzt sie um.

						if (math.floor(ZDS.lastConsistChecktimetime / 5) ~= math.floor(global.timerunning / 5)) then
							-->>Wenn Nachricht zurückkommt ist die Verbindung hergestellt, wenn nicht bleibt die Variable auf false
							ZDS.Connectionetablished = false;
							if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("Master Sent FML alive request", 4) end
							Call("SendConsistMessage", messages.ZDS, tostring("Alive" .. CreateConsistNumber(global.RVNumber, "143")), 0);
							Call("SendConsistMessage", messages.ZDS, tostring("Alive" .. CreateConsistNumber(global.RVNumber, "143")), 1);
							--<<
							-->>Wenn der Verbindungsstatus geändert wurde, wird die entsprechende Meldung gezeigt
							if (ZDS.Connectionetablished ~= ZDS.lastConnectionetablished) then
								if (ZDS.Connectionetablished == false) then
									ShowMessage(CreateConsistNumber(global.RVNumber, "143") .. " > " .. ZDS.ZDSRVNumber .. " " .. (string.len(tostring(ZDS.ZDSRVNumber)) == 5 and "ZDS" or "ZWS") .. ":\nVerbindung Verloren!", 4);
								else
									ShowMessage(CreateConsistNumber(global.RVNumber, "143") .. " > " .. ZDS.ZDSRVNumber .. " " .. (string.len(tostring(ZDS.ZDSRVNumber)) == 5 and "ZDS" or "ZWS") .. ":\nVerbindung Hergestellt!", 4);
								end
								ZDS.lastConnectionetablished = ZDS.Connectionetablished;
							end
							--<<
							ZDS.lastConsistChecktimetime = global.timerunning;
						end
						-->>Senden der FML Daten
						if (math.floor(ZDS.lastrefreshtime * 2) ~= math.floor(global.timerunning * 2) and ZDS.Connectionetablished == true) then
							Call("SendConsistMessage", messages.ZDS, tostring("State" .. Call("GetControlValue", "TractionBlower_State", 0)), 0);
							Call("SendConsistMessage", messages.ZDS, tostring("State" .. Call("GetControlValue", "TractionBlower_State", 0)), 1);
							Call("SendConsistMessage", messages.ZDS, tostring("Control" .. Call("GetControlValue", "TractionBlower_Control", 0)), 0);
							Call("SendConsistMessage", messages.ZDS, tostring("Control" .. Call("GetControlValue", "TractionBlower_Control", 0)), 1);
							ZDS.lastrefreshtime = global.timerunning;
						end
						--<<
--							############################## Consist Check ###################################

						----------------------------------------- Searches for Compatible Consists in the whole Consist
						if (global.timerunning > 0.5 and ZZA.Prueflauf.messagessent == false) then
							if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("Starting Testrun for Compatible Vehicles", 4) end
							if (global.IsEngineinFront == true) then
								Call("SendConsistMessage", messages.testrun2, "0", 0);
							end
							if (global.IsEngineinRear == true) then
								Call("SendConsistMessage", messages.testrun, "0", 1);
							end
							--
							if (global.IsEngineinFront == false and global.IsEngineinRear == false) then
								ShowMessage("ZZA Prüflauf: Keine Consists mit kompatibler\nZZA gefunden!", 4);
							else
								ShowMessage("ZZA Prüflauf: ZZA Prüflauf gestartet!", 4);
								ZZA.Prueflauf.Starttime = global.timerunning;
								ZZA.Prueflauf.active = true;
							end
							ZZA.Prueflauf.messagessent = true;
						end

					-->>Berechnet, wie viele Kompatible Züge im Zugverband sind
						if (ZZA.Prueflauf.active == true) then
								ZZA.Prueflauf.finalConsistnumber = ZZA.Prueflauf.tempconsistnumber + ZZA.Prueflauf.tempconsistnumber2;
						-->>Zeigt die Anzahl der kompatiblen ZZAs als Nachricht an
							if (ZZA.Prueflauf.Starttime + 2 < global.timerunning) then
								if (ZZA.Prueflauf.finalConsistnumber ~= 0) then
									ZZA.Prueflauf.active = false;
									if (ZZA.Prueflauf.finalConsistnumber ~= 1) then
										ShowMessage("ZZA Prüflauf: " .. ZZA.Prueflauf.finalConsistnumber .. " Consists mit kompatibler\nZZA gefunden!", 4);
									else
										ShowMessage("ZZA Prüflauf: " .. ZZA.Prueflauf.finalConsistnumber .. " Consist mit kompatibler\nZZA gefunden!", 4);
									end
								else
									if (ZZA.Prueflauf.Starttime + 5 < global.timerunning) then
										ZZA.Prueflauf.active = false;
										ShowMessage("ZZA Prüflauf: Keine Consists mit kompatibler\nZZA gefunden!", 4)
									end
								end
							end
						end

--							#################################### ZZA #######################################

						-------------------------------------- Player switching trough the ZZA
						if (global.timerunning > 1 and ZZA.Prueflauf.active == false) then
						-->>Heraufschalten
							if (Call("GetControlValue", "ZZAauf", 0) == 1 and ZZA.Auflock == false) then
								ZZA.Auflock = true;
								ZZA.Value = ZZA.Value + 1;
						--<<
						-->>Sperre, damit man die Taste loslassen muss, um wieder weiterschalten zu können
							elseif (Call("GetControlValue", "ZZAauf", 0) ~= 1 and ZZA.Auflock == true) then
								ZZA.Auflock = false;
							end
						--<<
						-->>Herbaschalten der ZZA
							if(Call("GetControlValue", "ZZAab", 0) == 1 and ZZA.Ablock == false and ZZA.Value > 1) then
								ZZA.Ablock = true;
								ZZA.Value = ZZA.Value - 1;
						--<<
						-->>Sperre, damit man die Taste loslassen muss, um wieder weiterschalten zu können
							elseif (Call("GetControlValue", "ZZAab", 0) ~= 1 and ZZA.Ablock == true) then
								ZZA.Ablock = false;
							end
						--<<
						end

					-->>ZZA Anzeigen
						if (ZZA.lastValue ~= ZZA.Value and global.timerunning > 1 and ZZA.Prueflauf.active == false) then
						-->>ZZAPosition als Nachricht anzeigen
							if (CONFIG.DISPLAYZZAPOS == true and global.firstrun == false) then
							-->>Zeigt wenn erwünscht das aktuelle, aus der Textfatei ausgelesene, Ziel an, wenn der vorgewählte Wert unter dem Maximalwert liegt
								if (CONFIG.USEDESTINATIONLIST == true and ZZA.Value <= GetArrayLenght(ZZA.destinationlist)) then
									ShowMessage("ZZA: Pos.:" .. ZZA.Value .. " von " .. arr.CONFIG_ZZANAMES .. " - " .. ZZA.destinationlist[ZZA.Value], 4);
								else
									ShowMessage("ZZA: Pos.:" .. ZZA.Value .. " von " .. arr.CONFIG_ZZANAMES, 4);
								end
							--<<
							end
						--<<


						-->>ZZA an andere Fahrzeuge senden
							if (ZZA.Value <= arr.CONFIG_ZZANAMES and global.firstrun == false) then
								if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("ZZA State sent to other Vehicles", 4) end
								if (CONFIG.VRZZACOMMUNICATION == true) then
									Call("SendConsistMessage", messages.vR.ZZAValue, tostring(ZZA.Value), 0);
									Call("SendConsistMessage", messages.vR.ZZAValue, tostring(ZZA.Value), 1);
								end
								Call("SendConsistMessage", messages.ZZAValue, tostring(ZZA.Value), 0);
								Call("SendConsistMessage", messages.ZZAValue, tostring(ZZA.Value), 1);
							end
						--<<
							if (ZZA.Value <= arr.CONFIG_ZZANAMES) then
								for i=1, arr.CONFIG_ZZANAMES do
									if (i == ZZA.Value) then
										Call("ZZAS:ActivateNode", CONFIG.ZZANAMES[i], 1);
									else
										Call("ZZAS:ActivateNode", CONFIG.ZZANAMES[i], 0);
									end
								end
							end
						end
					--<<

--							#################################### Doors #######################################

						if CONFIG.ENABLEVRTAV == true then


							if (Call("GetControlValue", "DoorsManualClose", 0) == 1 and TAV.closelock == false and tostring(TAV.State) == "2") then

							-->>An die Wagen den Befehl zum schließen senden
								Call("SendConsistMessage", messages.vR.TAV_SCHLIESSEN, "tfz-force-close", 1);
								Call("SendConsistMessage", messages.vR.TAV_SCHLIESSEN, "tfz-force-close", 0);
								if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("Sending Close Message to vR Coaches", 4) end
							--<<

								TAV.closelock = true;

							elseif(Call("GetControlValue", "DoorsManualClose", 0) ~= 1 and TAV.closelock == true) then
								TAV.closelock = false;
							end

						-->>Wenn du Wagen senden, dass sie die Türen schließen, dann wird die entsprechende Meldung angezeigt
							if (TAV.closelock2 == false and tostring(TAV.State) == "1") then
								ShowMessage("Türsteuerung: Türen schließen", 4);
								TAV.closelock2 = true;
							elseif (TAV.closelock2 ~= false and tostring(TAV.State) ~= "1") then
								TAV.closelock2 = false;
							end
						--<<

						-->>Wenn die Wagen ausgeben, ob sie die Türen offen haben oder nicht, wird das in Form einer visuellen Meldung dargestellt
							if (tostring(TAV.State) == "2" and TAV.openlock == false) then
								ShowMessage("Türsteuerung: Türen geöffnet", 4);
								TAV.openlock = true;
							elseif (tostring(TAV.State) == "0" and TAV.openlock == true) then
								TAV.openlock = false;
								ShowMessage("Türsteuerung: Türen verriegelt", 4);
							end
						--<<

						-->>Wenn die Türen offen sind, soll der 'T' Leuchtmelder nicht leuchten, und nicht blinken
							if (tostring(TAV.State) == "2") then
								TAV.Blink.active = false;
								TAV.Blink.ONOFF = 0;
							end
						--<<

						-->>Wenn Die Türen zu sind, soll das Blinken abgeschaltet werden, sobald die Lampe durch das Blinken an ist
							if (tostring(TAV.State) == "0" and TAV.Blink.ONOFF == 1) then
								TAV.Blink.active = false;
								TAV.Blink.ONOFF = 1;
							end
						--<<

						-->>Während die Türen schließen, blikt der LM
							if (tostring(TAV.State) == "1") then
								TAV.Blink.active = true;
							end
						--<<

						-->>Blinken des Leuchtmelders
							if (TAV.Blink.active == true) then
								TAV.Blink.factor = 0.5;
								if (global.timerunning > TAV.Blink.lastTime + TAV.Blink.factor) then
									if (TAV.Blink.ONOFF == 0) then
										--ShowMessage("An", 1);
										TAV.Blink.ONOFF = 1;
									else
										--ShowMessage("Aus", 1);
										TAV.Blink.ONOFF = 0;
									end
									TAV.Blink.lastTime = global.timerunning;
								end
							end
						--<<

						-->>Aktiviert den 'T' Leuchtmelder
							Call("SetControlValue", "DoorsCount", 0, 1 - TAV.Blink.ONOFF);
						--<<


						-->>Traktionssperre
							if (Call("GetControlValue", "VirtualThrottle", 0) ~= 0 and tostring(TAV.State) ~= "0") then
								--ShowMessage(Call("GetControlValue", "VirtualThrottle", 0), 1);
								--Call("SetControlValue", "Regulator", 0, 0);
								TAV.NSZwang = true;
								if (TAV.locklock == false and TAV.lastlockmsg + TAV.lockmsgcooldown < global.timerunning) then
									ShowMessage("Traktionssperre aktiv! Türen sind noch offen!", 4);
									TAV.locklock = true;
									TAV.lastlockmsg = global.timerunning;
								end
							end

							if (Call("GetControlValue", "VirtualThrottle", 0) == 0) then
								TAV.locklock = false;
								TAV.NSZwang = false;
							end

							if (Call("GetControlValue", "VirtualThrottle", 0) > 0 and TAV.NSZwang == true) then
								Call("SetControlValue", "VirtualThrottle", 0, 0);
							end
						--<<
						end

					-->>Sounds bei geöffnetem Fenster
						if (global.CurrentDir == 1) then
							Call("SetControlValue", "WindowSoundMixture", 0, math.max(Call("GetControlValue", "ExtWindow_FR", 0), Call("GetControlValue", "ExtWindow_FL", 0)))
						elseif (global.CurrentDir == 2) then
							Call("SetControlValue", "WindowSoundMixture", 0, math.max(Call("GetControlValue", "ExtWindow_BR", 0), Call("GetControlValue", "ExtWindow_BL", 0)))
						end
					--<<

--							############################## AFB Speed Indicator ###################################

						vSoll.target = Call("GetControlValue", "VirtualThrottle", 0) >= 0.5 and Call("GetControlValue", "VirtualThrottle", 0) <= 1.5 and 8.35 or (8.35*Call("GetControlValue", "VirtualThrottle", 0)*(10/12))/10;
						if vSoll.CurrentAnimState ~= vSoll.target then
							vSoll.CurrentAnimState = math.abs(vSoll.target - vSoll.CurrentAnimState) > 0.0007 and vSoll.CurrentAnimState + ((vSoll.target - vSoll.CurrentAnimState)--[[/ 10]]) * time * 4 or vSoll.target;
						end

						Call("vSoll:SetTime", "vSollNadel", vSoll.CurrentAnimState)
						Call("vSoll2:SetTime", "vSollNadel", vSoll.CurrentAnimState)
					else

--							############################## Receiving ZWS Messages ###################################

						if not global.isDeadEngine then
							-->>Wenn nach 6 Sekunden kein Signal vom führenden Tfz kam, wird die Verbindung abgebrochen
							if (ZDS.isControlledbyEngine == true) then
								UpdateExpertControls(time)

								Call("SetControlValue", "Reverser", 0, 1)
								Call("SetControlValue", "UserVirtualReverser", 0, 1)
								-->>Lüftereinstellung wurde geändert

								--############################## Fans ###################################
								if (ZDS.FMLState ~= ZDS.lastValue_State) then
									if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("FML changed State", 4) end
									-->>Anzeigen des aktuellen Lüfterstatus
									if (ZDS.FMLState == -1) then
										ShowMessage(ZDS.ZDSMasterRVNumber .. " > " .. CreateConsistNumber(global.RVNumber, "143") .. " " .. (string.len(tostring(ZDS.ZDSRVNumber)) == 5 and "ZDS" or "ZWS") .. ":\nFahrmotorlüfter - Automatik", 4);
									elseif (ZDS.FMLState == 0) then
										ShowMessage(ZDS.ZDSMasterRVNumber .. " > " .. CreateConsistNumber(global.RVNumber, "143") .. " " .. (string.len(tostring(ZDS.ZDSRVNumber)) == 5 and "ZDS" or "ZWS") .. ":\nFahrmotorlüfter - Aus", 4);
									elseif (ZDS.FMLState == 1) then
										ShowMessage(ZDS.ZDSMasterRVNumber .. " > " .. CreateConsistNumber(global.RVNumber, "143") .. " " .. (string.len(tostring(ZDS.ZDSRVNumber)) == 5 and "ZDS" or "ZWS") .. ":\nFahrmotorlüfter - An", 4);
									end
									--<<
									ZDS.lastValue_State = ZDS.FMLState;
								end

								--############################## Panto ###################################

								if global.timerunning > ZDS.PantoCoolDown + 6.5 then
									if ZDS.ShowRaisedMessage then
										ZDS.ShowRaisedMessage = false
										ShowMessage(ZDS.ZDSMasterRVNumber .. " > " .. CreateConsistNumber(global.RVNumber, "143") .. " " .. (string.len(tostring(ZDS.ZDSRVNumber)) == 5 and "ZDS" or "ZWS") .. ":\nPanto " .. (ZDS.PantoState == 1 and "gehoben" or "gesenkt"), 4);
									end
									if (ZDS.PantoState ~= ZDS.lastPantoState) then
										if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("Panto changed State", 4) end
										-->>Anzeigen des aktuellen Lüfterstatus
										if (ZDS.PantoState == 0) then
											ShowMessage(ZDS.ZDSMasterRVNumber .. " > " .. CreateConsistNumber(global.RVNumber, "143") .. " " .. (string.len(tostring(ZDS.ZDSRVNumber)) == 5 and "ZDS" or "ZWS") .. ":\nPanto - Senken", 4);
											--Call("SetControlTargetValue", "PantographSelect", 0, 0)
											Call("SetControlTargetValue", "PantographSwitch", 0, -1)
										elseif (ZDS.PantoState == 1) then
											ShowMessage(ZDS.ZDSMasterRVNumber .. " > " .. CreateConsistNumber(global.RVNumber, "143") .. " " .. (string.len(tostring(ZDS.ZDSRVNumber)) == 5 and "ZDS" or "ZWS") .. ":\nPanto - Heben", 4);
											--Call("SetControlTargetValue", "PantographSelect", 0, 1)
											Call("SetControlTargetValue", "PantographSwitch", 0, 1)
										end
										--<<
										ZDS.lastPantoState = ZDS.PantoState;
										ZDS.PantoCoolDown = global.timerunning;
										ZDS.ShowRaisedMessage = true;
									end

								--############################## MainSwitch ###################################

									if (ZDS.HSState ~= ZDS.lastHSState) then
										if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("HS changed State", 4) end
										-->>Anzeigen des aktuellen Lüfterstatus
										if (ZDS.HSState == 0) then
											ShowMessage(ZDS.ZDSMasterRVNumber .. " > " .. CreateConsistNumber(global.RVNumber, "143") .. " " .. (string.len(tostring(ZDS.ZDSRVNumber)) == 5 and "ZDS" or "ZWS") .. ":\nHauptschalter - Aus", 4);
											Call("SetControlValue", "Startup", 0, -1)

										elseif (ZDS.HSState == 1) then
											ShowMessage(ZDS.ZDSMasterRVNumber .. " > " .. CreateConsistNumber(global.RVNumber, "143") .. " " .. (string.len(tostring(ZDS.ZDSRVNumber)) == 5 and "ZDS" or "ZWS") .. ":\nHauptschalter - An", 4);
											Call("SetControlValue", "Startup", 0, 1)
										end
										--<<
										ZDS.lastHSState = ZDS.HSState;
									end
								end

								--############################## PantoSelection ###################################

								if (ZDS.PantoSelectState ~= ZDS.lastPantoSelectState) then
									if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("PantoSelecz changed State", 4) end
									-->>Anzeigen des aktuellen Lüfterstatus
									if (ZDS.PantoSelectState == 1) then
										ShowMessage(ZDS.ZDSMasterRVNumber .. " > " .. CreateConsistNumber(global.RVNumber, "143") .. " " .. (string.len(tostring(ZDS.ZDSRVNumber)) == 5 and "ZDS" or "ZWS") .. ":\nPanto geändert - " .. ZDS.PantoStateNames[math.floor(tonumber(Call("GetControlValue", "PantographID", 0))) + 1], 4);
										Call("SetControlTargetValue", "PantographSelect", 0, 1)
									end
									--<<
									ZDS.lastPantoSelectState = ZDS.PantoSelectState;
								end

								if (global.timerunning - ZDS.lastParentAlive > 6) then
									ZDS.isControlledbyEngine = false;
								end
								-->>Wenn keine Verbindung besteht wird ab 10 Kmh der Lüfter angemacht
							else
								if (global.speedValue > CONFIG.AIFANTHRESHOLD or global.speedValue < -1 * CONFIG.AIFANTHRESHOLD and global.Ammeter > 20) then
								--if (Ammeter > 130) then
									if (ZDS.Value < 1) then
										ZDS.Value = ZDS.Value + ZDS.factor;
									end
								else
									if (ZDS.Value > 0) then
										ZDS.Value = ZDS.Value - ZDS.factor;
									end
								end
								Call("SetControlValue", "TractionBlower_State", 0, ZDS.Value);
								Call("SetControlValue", "TractionBlower_State", 0, ZDS.Value);
							end
							


							--<<
						end
					end

				else
					fixPanto();

--						############################## Fans ###################################

					if (global.speedValue > CONFIG.AIFANTHRESHOLD or global.speedValue < -1 * CONFIG.AIFANTHRESHOLD) then
						if (ZDS.Value < 1) then
							ZDS.Value = ZDS.Value + ZDS.factor;
						end
					else
						if (ZDS.Value > 0) then
							ZDS.Value = ZDS.Value - ZDS.factor;
						end
					end

				end

			-->>Geschwindigkeitsbereich für den Stillstand definieren
				if (global.isSpeedAtZero == false and ((global.speedValue >= -0.18 and global.speedValue <= 0.18))) then
					global.isSpeedAtZero = true;
				elseif (global.isSpeedAtZero == true and (global.speedValue < -0.18 or global.speedValue > 0.18)) then
					global.isSpeedAtZero = false;
				end

				if (global.isSpeedAtZero == false and global.speedValue > 0.18) then
					global.DrivingFwd = true;
					global.DrivingRwd = false;
				elseif (global.isSpeedAtZero == false and global.speedValue < -0.18) then
					global.DrivingRwd = true;
					global.DrivingFwd = false;
				end
			--<<



			-->>Ruft die Funktion zum Anzeigen des Flugschnees auf
				if (CONFIG.ENABLESNOW == true and SysCall("ScenarioManager:GetSeason") == 3) then
					Snow(2);
				else
					Call( "SnowPlow1:SetEmitterActive", 0 );
					Call( "SnowPlow2:SetEmitterActive", 0 );
					Call( "SnowPlow1rev:SetEmitterActive", 0 );
					Call( "SnowPlow2rev:SetEmitterActive", 0 );
				end
			--<<


			-->>Rollos
				if CONFIG.INACTIVECABBLINDSDOWN then
					if global.CurrentDir ~= global.lastdir or Rollos.lastValueCombined ~= Call("GetControlValue", "CabBlind_R", 0) + Call("GetControlValue", "CabBlind_L", 0) or global.IsEnginewithKey ~= Rollos.lastEnginewithKey2 then
						Rollos.Update = true;
						global.lastdir = global.CurrentDir;
						Rollos.lastValueCombined = Call("GetControlValue", "CabBlind_R", 0) + Call("GetControlValue", "CabBlind_L", 0);
						Rollos.lastEnginewithKey2 = global.IsEnginewithKey
					end
					if (global.CurrentDir == 1) then
					-->>Stellt die Rollos in Fahrtrichtung ein
						Rollos.RAnimTime = 1 - Call("GetControlValue", "CabBlind_R", 0);
						Rollos.LAnimTime = 1 - Call("GetControlValue", "CabBlind_L", 0);
						if Rollos.Update then DisplayBlinds(Rollos.RAnimTime, "F_R") end
						if Rollos.Update then DisplayBlinds(Rollos.LAnimTime, "F_L") end
					--<<
					-->>Macht die Schotten im anderen Fst dicht
						if Rollos.Update then DisplayBlinds(0, "R_R") end
						if Rollos.Update then DisplayBlinds(0, "R_L") end
						Call("SetTime", "ExtBlind_BL", 1);
						Call("SetTime", "ExtBlind_BR", 1);
					--<<
					elseif (global.CurrentDir == 2) then
						Rollos.RAnimTime = 1 - Call("GetControlValue", "CabBlind_R", 0);
						Rollos.LAnimTime = 1 - Call("GetControlValue", "CabBlind_L", 0);
						if Rollos.Update then DisplayBlinds(Rollos.RAnimTime, "R_R") end
						if Rollos.Update then DisplayBlinds(Rollos.LAnimTime, "R_L") end
						if (CONFIG.INACTIVECABBLINDSDOWN == true) then
							if Rollos.Update then DisplayBlinds(0, "F_R") end
							if Rollos.Update then DisplayBlinds(0, "F_L") end
							Call("SetTime", "ExtBlind_FL", 1);
							Call("SetTime", "ExtBlind_FR", 1);
						else
							--DisplayBlinds(1, "R_R");
							--DisplayBlinds(1, "R_L");
							if Rollos.Update then DisplayBlinds(1, "F_R") end
							if Rollos.Update then DisplayBlinds(1, "F_L") end
						end
					end
					Rollos.Update = false;
					-->>Alle Rollos dicht machen, wenn die Lok nicht das geführte Tfz ist
					if global.IsEnginewithKey ~= Rollos.lastEnginewithKey then
						Rollos.Update = true;
						Rollos.lastEnginewithKey = global.IsEnginewithKey
					end

					if not global.IsEnginewithKey then
						if Rollos.Update then DisplayBlinds(0, "F_R") end
						if Rollos.Update then DisplayBlinds(0, "F_L") end
						Call("SetTime", "ExtBlind_FL", 1);
						Call("SetTime", "ExtBlind_FR", 1);
						--
						if Rollos.Update then DisplayBlinds(0, "R_R") end
						if Rollos.Update then DisplayBlinds(0, "R_L") end
						Call("SetTime", "ExtBlind_BL", 1);
						Call("SetTime", "ExtBlind_BR", 1);
					end
					--<<
					Rollos.Update = false;
					--
					if global.isPlayer ~= Rollos.lastPlayerEngine or global.IsEngineinRear ~= Rollos.lastEngineinRear or global.IsEngineinFront ~= Rollos.lastEngineinFront or global.DrivingRwd ~= Rollos.lastDrivingRwd then
						Rollos.Update = true;
						Rollos.lastPlayerEngine = global.isPlayer; Rollos.lastEngineinRear = global.IsEngineinRear; Rollos.lastEngineinFront = global.IsEngineinFront; Rollos.lastDrivingRwd = global.DrivingRwd;
					end
					-->>Wenn die Lok KI gesteuert ist
					if (not global.isPlayer) then
						if (global.IsEngineinRear == false and global.DrivingRwd == true) then
							if Rollos.Update then DisplayBlinds(0, "F_R") end
							if Rollos.Update then DisplayBlinds(0, "F_L") end
							Call("SetTime", "ExtBlind_BL", 0);
							Call("SetTime", "ExtBlind_BR", 0);
							if Rollos.Update then DisplayBlinds(1, "R_R") end
							if Rollos.Update then DisplayBlinds(1, "R_L") end
						else
							if (global.IsEngineinFront == false) then
								if Rollos.Update then DisplayBlinds(1, "F_R") end
								if Rollos.Update then DisplayBlinds(1, "F_L") end
								Call("SetTime", "ExtBlind_FL", 0);
								Call("SetTime", "ExtBlind_FR", 0);
								if Rollos.Update then DisplayBlinds(0, "R_R") end
								if Rollos.Update then DisplayBlinds(0, "R_L") end
							end
						end
					end
					Rollos.Update = false;
				else
					if Rollos.Manual.lastValueCombined ~= Call("GetControlValue", "CabBlind_R", 0) + Call("GetControlValue", "CabBlind_L", 0) then
						Rollos.Manual.Update = true;
						Rollos.Manual.lastValueCombined = Call("GetControlValue", "CabBlind_R", 0) + Call("GetControlValue", "CabBlind_L", 0);
						--
						Rollos.Manual.State[(global.CurrentDir == 1 and "F" or "R").."L"] = Call("GetControlValue", "CabBlind_L", 0);
						Rollos.Manual.State[(global.CurrentDir == 1 and "F" or "R").."R"] = Call("GetControlValue", "CabBlind_R", 0);
					end
					Call("SetTime", "ExtBlind_FL", Rollos.Manual.State["FL"]);
					Call("SetTime", "ExtBlind_FR", Rollos.Manual.State["FR"]);
					if Rollos.Manual.Update then DisplayBlinds(1 - Rollos.Manual.State["FL"], "F_L") end
					if Rollos.Manual.Update then DisplayBlinds(1 - Rollos.Manual.State["FR"], "F_R") end
					Call("SetTime", "ExtBlind_BL", Rollos.Manual.State["RL"]);
					Call("SetTime", "ExtBlind_BR", Rollos.Manual.State["RR"]);
					if Rollos.Manual.Update then DisplayBlinds(1 - Rollos.Manual.State["RL"], "R_L") end
					if Rollos.Manual.Update then DisplayBlinds(1 - Rollos.Manual.State["RR"], "R_R") end

				end
				--<<


				ZZA.lastValue = ZZA.Value;
				global.firstrun = false;
			end
		end
		global.run = global.run + 1;

		global.Sctest2 = global.Sctest1;
	end
--<<


	function ResetBlinds()
		for i=0,20 do
			Call("Rollos:ActivateNode", "Rollo_F_L_" .. forcetwodigits(i), 0);
			Call("Rollos:ActivateNode", "Rollo_R_L_" .. forcetwodigits(i), 0);
			Call("Rollos:ActivateNode", "Rollo_F_R_" .. forcetwodigits(i), 0);
			Call("Rollos:ActivateNode", "Rollo_R_R_" .. forcetwodigits(i), 0);
		end
	end

-->>Empfangen von ZZA Nachrichten von führendem Fahrzeuge
	function OnConsistMessage(message, argument, direction)
		_OnConsistMessage(message, argument, direction); --Ruft die Originale Funktion auf
		if (global.IsEnginewithKey) then
			if (message == messages.vR.TAV_SCHLIESSEN and tostring(argument) == "1") then
				TAV.State = argument;
			end
			if (message == messages.vR.TAV_ZU) then
				TAV.State = argument;
			end
		end

	-->>Weitersenden von Nachrichten
		--	- Funktionsweise: Sendet die Nachricht in die entgegengesetze Richtung weiter, von der sie es bekommen hat.
		if (message ~= messages.ZDS) then
			Call("SendConsistMessage", message, argument, dirproject(direction));
		end
	--<<
		if message == messages.CloseDoorsNow and global.IsEnginewithKey then ShowMessage("Standzeit abgelaufen! Türen können nun geschlossen werden.", 4) end
		if (message == messages.ZZAValue) then
		if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("ZZA State Received", 4) end

			-->>Aktiviert die entsprechende ZZA

			--	- Funktionsweise: Es werden in einer Schleife alle ZZA Ziele deaktiviert, außer das von der führenden Lok. --

				for i=1, arr.CONFIG_ZZANAMES do
					if (i == tonumber(argument)) then
						Call("ZZAS:ActivateNode", CONFIG.ZZANAMES[i], 1);
					else
						Call("ZZAS:ActivateNode", CONFIG.ZZANAMES[i], 0);
					end
				end
			--<<
		 elseif (message == messages.vR.ZZAValue) then
			if (CONFIG.VRZZACOMMUNICATION == true) then
				if (tonumber(argument) < arr.CONFIG_ZZANAMES) then

				-->>Aktiviert die entsprechende ZZA

				--	- Funktionsweise: Es werden in einer Schleife alle ZZA Ziele deaktiviert, außer das von der führenden Lok. --

					for i=1, arr.CONFIG_ZZANAMES do
						if (i == tonumber(argument) + 1) then
							Call("ZZAS:ActivateNode", CONFIG.ZZANAMES[i], 1);
						else
							Call("ZZAS:ActivateNode", CONFIG.ZZANAMES[i], 0);
						end
					end
				--<<
				end
			end
		end

	-->>FML
		if (not global.isDeadEngine) then
			-->>Nicht geführtes Tfz
			if (not global.IsEnginewithKey) then
				if (message == messages.ZDS) then
					-->>Wenn Nachricht 'Alive' von der führenden Lok erhalten
					if (string.find(argument, "Alive") ~= nil) then
						ZDS.ZDSMasterRVNumber = string.sub(argument, 6);
					if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("Slave got FML alive Request", 4) end
						if (ZDS.isControlledbyEngine == false) then
							ShowMessage(CreateConsistNumber(global.RVNumber, "143") .. ": " .. (string.len(tostring(ZDS.ZDSMasterRVNumber)) == 5 and "ZDS" or "ZWS") .. " Verbindet... \nAnforderung erhalten von " .. ZDS.ZDSMasterRVNumber .. "!\nSende Antwort!", 4);
						end
						ZDS.isControlledbyEngine = true
						Call("SendConsistMessage", messages.ZDS, tostring("RV" .. CreateConsistNumber(global.RVNumber, "143")), 0);
						Call("SendConsistMessage", messages.ZDS, tostring("RV" .. CreateConsistNumber(global.RVNumber, "143")), 1);
						ZDS.lastParentAlive = global.timerunning;
					--<<

					-->>Umsetzen der empfangenen FML Daten
					elseif (string.find(argument, "State") ~= nil) then
						Call("SetControlValue", "TractionBlower_State", 0, tonumber(string.sub(argument, 6)));
					end
					if (string.find(argument, "Control") ~= nil) then
						ZDS.FMLState = tonumber(string.sub(argument, 8));
					end
					if (string.find(argument, "Regulator") ~= nil) then
						ZDS.RemoteRegulator = tonumber(string.sub(argument, 10));
					end
					if (string.find(argument, "Panto") ~= nil) then
						ZDS.PantoState = tonumber(string.sub(argument, 6));
					end
					if (string.find(argument, "HS") ~= nil) then
						ZDS.HSState = tonumber(string.sub(argument, 3));
					end
					if (string.find(argument, "PSelect") ~= nil) then
						ZDS.PantoSelectState = tonumber(string.sub(argument, 8));
					end
					--<<
				end
			else
				-->>Extrahieren der Zugnummer des geführten Tfz
				if (message == messages.ZDS and string.find(argument, "RV") ~= 0) then
					ZDS.Connectionetablished = true;
					ZDS.ZDSRVNumber = string.sub(argument, 3);
				end
				--<<
			end
		end


	-->>Testlauf

	--	- Funktionsweise: Wenn die Lok geführt ist, wird bei Empfangen der Nachricht der Wert um 1 erhöht und zur nächsten Lok gesendet.
	--	- Zusätzlich sendet sie den Wert zurück zum führenden Tfz, damit dieses weiß, wie viele Loks angehängt sind, da jede Lok den Wert
	--	- um eins erhöht. Damit, falls zuerst die Nachricht der zweiten Lok und dann der ersten Lok ankommt der Wert nicht bei 1 liegt,
	--	- Werden nur Zahlen, die größer als die aktuelle sind akzeptiert.

		if (not global.IsEnginewithKey) then
			if (message == messages.testrun or message == messages.testrun2) then
					if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("Received Testrun", 4) end
					Call("SendConsistMessage", gobackchk(message), tostring(tonumber(argument) + 1), 1 - dirproject(direction));
					Call("SendConsistMessage", message, tostring(tonumber(argument) + 1), dirproject(direction));
			elseif (message == messages.testrunrev or message == messages.testrun2rev) then
				Call("SendConsistMessage", message, argument, dirproject(direction));
			end
		else
			if (message == messages.testrun2rev) then
				if (ZZA.Prueflauf.tempconsistnumber2 < tonumber(argument)) then
					ZZA.Prueflauf.tempconsistnumber2 = tonumber(argument);
				end
			end
			if (message == messages.testrunrev) then
				if (ZZA.Prueflauf.tempconsistnumber < tonumber(argument)) then
					ZZA.Prueflauf.tempconsistnumber = tonumber(argument);
				end
			end
		end
	--<<
	end
--<<

-->>Ermittelt, in welchem Fst der Fahrer sich befindet
	function OnCameraEnter(cabEndWithCamera, carriageCam)
		_OnCameraEnter(cabEndWithCamera, carriageCam);
		global.CurrentDir = cabEndWithCamera;
		if (CONFIG.RESETBLINDSONCABENTER == true) then
			Call("SetControlValue", "CabBlind_L", 0, 0);
			Call("SetControlValue", "CabBlind_R", 0, 0);
		end
		if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("Camera " .. cabEndWithCamera .. " active", 4) end

		--local Zahl1 = 34;
		--local Zahl2 = 10;
		--ShowMessage(Zahl1 .. " durch " .. Zahl2 .. " ist gleich " .. Zahl1 / Zahl2, 4);

	end
--<<