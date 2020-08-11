-->>Deklarationen
	-->>ZZA
		ZZA = {};
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
		destination = 1;
		destination2 = 1;
		setonEditor = true;
	--<<

	-->>Programmablauf
		firstrun = true;
		IsEditor = false;
		simulationTime = 0;
		TimeofDay = 0;
		Blindlastchktime = 0;
		setfans = false;
	--<<

	-->>Übertragung an andere Fahrzeuge
		messages = {};
		--
		messages.ZZAValue = 7001;
		messages.testrun = 7002;
		messages.testrunrev = 7003;
		messages.testrun2 = 7005;
		messages.testrun2rev = 7006;
		messages.test = 7004;
		messages.FML = 7007;
		--
		messages.vR = {};
		--
		messages.vR.ZZAValue = 895301;
		--
		messages.vR.TAV_SCHLIESSEN = 895103;
		messages.vR.TAV_ZU = 895104;
		messages.vR.CONSIST_CHECK = 895951;

		lastValue_Doors = 0;
	--<<

	-->>UIC
		UIC = {};
		--
		UIC.Rawnumber = 0;
		UIC.result = 0;
		UIC.ZZALetter = "";
		multiplier = 1;
		temp1 = "";
		temp2 = 0;
	--<<

	-->>Ingame Werte
		IsEngineinFront = false;
		IsEngineinRear = false;
		IsEnginewithKey = 0;
		isPlayer = 0;
		isSpeedAtZero = false;
		DrivingFwd = false;
		DrivingRwd = false;
		RVNumber = 0;
		lastRVNumber = 0;
		CurrentDir = 1;
		isDeadEngine = 0;
		speedValue = 0;
		Ammeter = 0;
	--<<

	-->>Variablen zur Anzeige der Uhrzeit
		Clock = {};
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
		TAV = {};
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
		gSnowPlowLeft = 1;
		gSnowPlowRight = 1;
		gSnowPlowLeftrev = 0;
		gSnowPlowRightrev = 0;
		gEmitter = 0;
	--<<

	-->>Rollos
		Rollos = {};
		--
		Rollos.RAnimTime = 0;
		Rollos.LAnimTime = 0;
		Rollos.propfactor = 1.375;
		--
		Rollos.lastValue_Wert = 0;
		Rollos.lastValue_Blind = "";

		Rollos.CurrentState = {
		10, -- F_L
		10, -- F_R
		10, -- R_L
		10, -- R_R
		};
	--<<

	-->>Arraylenghts
		arr = {};
		--
		arr.CONFIG_ZZANAMES = 0;
		arr.ZZADESTLIST = 0;


	-->>Panto
		Panto = {};
		--
		Panto.CurrentValue = 2;
	--<<

	-->>FML
		FML = {};
		--
		FML.isControlledbyEngine = false;
		FML.Connectionetablished = false;
		FML.lastConnectionetablished = false;
		FML.lastrefreshtime = 0;
		FML.lastConsistChecktimetime = 0;
		FML.lastParentAlive = 0;
		FML.ZDSRVNumber = 0;
		FML.ZDSMasterRVNumber = 0;
		FML.State = 0;
		FML.lastValue_State = 0;
		FML.Value = 0;
		FML.factor = 0.01;
	--<<

	-->>Kompressor
		MainReservoir = 0
		lastValue_MainReservoir = 0
		chknextframe = 0;
		compactive = false;

	--<<
--<<

-->>Verweis auf das Originalskript
	--require (MAINSCRIPTPATH); --Siehe Punkt 1
	_Update = Update;
	_Initialise = Initialise;
	_OnConsistMessage = OnConsistMessage;
	_OnCameraEnter = OnCameraEnter;
--<<

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
			gSnowPlowLeft = 1;
			gSnowPlowRight = 1;
			gSnowPlowLeftrev = 0;
			gSnowPlowRightrev = 0;
			gEmitter = 0;
		--<<

		end
	--<<

	-->>Funktion, die jeden Frame durchläuft
		function Update(time)
			_Update(time);

		-->>Werte definieren
			RVNumber = Call("GetRVNumber");
			GetIsEditor();
			TimeofDay = SysCall("ScenarioManager:GetTimeOfDay");
			IsEnginewithKey = Call("GetIsEngineWithKey");
			simulationTime = Call("GetSimulationTime");
			isDeadEngine = Call("GetIsDeadEngine");
			isPlayer = Call("GetIsPlayer");
			speedValue = Call("GetSpeed") * 3.6;
			Ammeter = Call("GetControlValue", "Ammeter", 0);
		--<<

		-->>Arraylenghts
			if (firstrun == true) then
				arr.CONFIG_ZZANAMES = GetArrayLenght(CONFIG.ZZANAMES);
			end
		--<<

		-->>Geschwindigkeitsbereich für den Stillstand definieren
			if (isSpeedAtZero == false and ((speedValue >= -0.18 and speedValue <= 0.18))) then
				isSpeedAtZero = true;
			elseif (isSpeedAtZero == true and (speedValue < -0.18 or speedValue > 0.18)) then
				isSpeedAtZero = false;
			end

			if (isSpeedAtZero == false and speedValue > 0.18) then
				DrivingFwd = true;
				DrivingRwd = false;
			elseif (isSpeedAtZero == false and speedValue < -0.18) then
				DrivingRwd = true;
				DrivingFwd = false;
			end
		--<<

		-->>Überpfüft ob sich Fahrzeuge vor oder hinter dem Führenden befinden
			if (Call("SendConsistMessage", messages.test, "0", 0) == 1) then
				IsEngineinFront = true;
			elseif (Call("SendConsistMessage", messages.test, "0", 0) == 0) then
				IsEngineinFront = false;
			end

			if (Call("SendConsistMessage", messages.test, "0", 1) == 1) then
				IsEngineinRear = true;
			elseif (Call("SendConsistMessage", messages.test, "0", 1) == 0) then
				IsEngineinRear = false;
			end
		--<<

		-->>Lüfter nach Voreinstellung einstellen
			if (simulationTime > 0.5 and setfans == false and CONFIG.AUTOMATICFANMODEBYDEFAULT == true) then
				if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("FANS SET TO AUTOMATIC", 4) end
				Call("SetControlValue", "TractionBlower_Control", 0, -1);
				setfans = true;
			end
		--<<

		-->>ZZA vorbereiten
			if (firstrun == true) then
				ResetZZA();
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
			--<<
			end
		--<<

		-->>Sucht im Zugverband nach kompatiblen Consists
			if (IsEnginewithKey == 1 and simulationTime > 0.5 and ZZA.Prueflauf.messagessent == false) then
			if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("Starting Testrun for Compatible Vehicles", 4) end
				if (IsEngineinFront == true) then
					Call("SendConsistMessage", messages.testrun2, "0", 0);
				end
				if (IsEngineinRear == true) then
					Call("SendConsistMessage", messages.testrun, "0", 1);
				end
				--
				if (IsEngineinFront == false and IsEngineinRear == false) then
					ShowMessage("ZZA Prüflauf: Keine Consists mit kompatibler\nZZA gefunden!", 4);
				else
					ShowMessage("ZZA Prüflauf: ZZA Prüflauf gestartet!", 4);
					ZZA.Prueflauf.Starttime = simulationTime;
					ZZA.Prueflauf.active = true;
				end
				ZZA.Prueflauf.messagessent = true;
			end
		--<<

		-->>Berechnet, wie viele Kompatible Züge im Zugverband sind
			if (ZZA.Prueflauf.active == true) then
					ZZA.Prueflauf.finalConsistnumber = ZZA.Prueflauf.tempconsistnumber + ZZA.Prueflauf.tempconsistnumber2;
			-->>Zeigt die Anzahl der kompatiblen ZZAs als Nachricht an
				if (ZZA.Prueflauf.Starttime + 2 < simulationTime) then
					if (ZZA.Prueflauf.finalConsistnumber ~= 0) then
						ZZA.Prueflauf.active = false;
						if (ZZA.Prueflauf.finalConsistnumber ~= 1) then
							ShowMessage("ZZA Prüflauf: " .. ZZA.Prueflauf.finalConsistnumber .. " Consists mit kompatibler\nZZA gefunden!", 4);
						else
							ShowMessage("ZZA Prüflauf: " .. ZZA.Prueflauf.finalConsistnumber .. " Consist mit kompatibler\nZZA gefunden!", 4);
						end
					else
						if (ZZA.Prueflauf.Starttime + 5 < simulationTime) then
							ZZA.Prueflauf.active = false;
							ShowMessage("ZZA Prüflauf: Keine Consists mit kompatibler\nZZA gefunden!", 4)
						end
					end
				end
			--<<
			end
		--<<

		-->>ZZA Vorwahl im Editor und Fahrzeugnummer im Führerstand

			if (lastRVNumber ~= RVNumber or firstrun == true) then
				


			-->>UIC Prüfziffer berechnen
				if (CONFIG.CORRECTRVNUMBER == true) then
					UIC.ZZALetter = string.sub(tostring(RVNumber), 5);
					UIC.Rawnumber = string.sub(tostring(RVNumber), 1, 3);
				-->>Abwechselnd mit 1 und 2 Multiplizieren
					for i=1,6 do
						temp1 = tostring(temp1 .. tonumber(string.sub("143" .. UIC.Rawnumber, i, i)) * multiplier)
						multiplier = 3 - multiplier;
					end
				--<<
				-->>Quersumme errechnen
					for i=1, string.len(temp1) do
						temp2 = tostring(tonumber(temp2) + tonumber(string.sub(temp1, i, i)))
					end
				--<<
				-->>Sonderfall, wenn Quersumme ein vielfaches von 10 ist
					if (string.sub(temp2, 2) ~= "0") then
						UIC.result = 10 - tonumber(string.sub(temp2, 2));
					else
						UIC.result = 0
					end
				--<<
					Call("SetRVNumber", UIC.Rawnumber .. UIC.result .. UIC.ZZALetter);
				if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("Set RailVehicle Consist Number", 4) end
					multiplier = 1;
					temp1 = "";
					temp2 = 0;
				end
			--<<


				-->>Fahrzeugnummer im Führerstand
				for i=1,4 do
					for a=0,9 do
						if (tostring(a) == string.sub(tostring(RVNumber), i, i)) then
							Call("FZN:ActivateNode", "FZG_" .. forcetwodigits(i) .. "_" .. forcetwodigits(a), 1);
						else
							Call("FZN:ActivateNode", "FZG_" .. forcetwodigits(i) .. "_" .. forcetwodigits(a), 0);
						end
					end
				end
				--<<
				for i=1, arr.CONFIG_ZZANAMES do --Sucht nach dem Buchstaben zur Vorwahl
					if (string.find(RVNumber, ZZA.Letters[i]) ~= nil) then
						destination = i + 1;
						setonEditor = true;
						break;
					--else
						--ResetZZA();
					end
				end

				for a=1, arr.CONFIG_ZZANAMES do
					if(a == Minusoneexceptforone(destination)) then
						Call("ZZAS:ActivateNode", CONFIG.ZZANAMES[a], 1);
						destination2 = a;
					else
						Call("ZZAS:ActivateNode", CONFIG.ZZANAMES[a], 0);
					end
				end



				destination = 1; --Damit dass Programm weiß, dass die ZZA vorgewählt wurde
				lastRVNumber = RVNumber;
			end
		--<<

		-->>ZZA Wählen
			if (simulationTime > 1 and ZZA.Prueflauf.active == false) then
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
		--<<
		
		-->>ZZA Anzeigen
			if (ZZA.lastValue ~= ZZA.Value and IsEnginewithKey == 1 and simulationTime > 1 and ZZA.Prueflauf.active == false) then
			-->>ZZAPosition als Nachricht anzeigen
				if (CONFIG.DISPLAYZZAPOS == true and firstrun == false) then
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
				if (ZZA.Value <= arr.CONFIG_ZZANAMES and firstrun == false) then
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
				--setonEditor = false;
			end
		--<<
		
		-->>Errechnet aus dem Rohwert der Zeit Stunden Sekunden und Minuten
	
			--	- Funktionsweise: Eine Stunde entspricht 3600 Sekunden. Da der TS die Zeit als Sekunden von Mitternacht aus angibt, teilen wir diese Zeit durch 3600.
			--	- Das Ergebnis müssen wir abrunden auf 0 Nachkommastellen, dann haben wir die aktuelle Stunde. Dann schauen wir, was uns noch fehlt, um von Stunden
			--	- auf die Zeit zu kommen. Mit dieser Differenz wird das ganze wiederholt, bloß entspricht 1 Minute 60 Sekunden.
	
			if (IsEnginewithKey == 1 and Clock.lastValue_clockrefreshtime ~= math.floor(TimeofDay)) then

			-->>Kommuniziert mit den Wagen, dass diese die Türsteuerung aktivieren
				if (CONFIG.ENABLEVRTAV == true) then
					Call("SendConsistMessage", messages.vR.CONSIST_CHECK, "1", 0);
					Call("SendConsistMessage", messages.vR.CONSIST_CHECK, "1", 1);
				end
			--<<
				Clock.hours = math.floor(TimeofDay / 3600);
				Clock.deltahm = TimeofDay - Clock.hours * 3600;
				--
				Clock.minutes = math.floor(Clock.deltahm / 60);
				Clock.deltams = TimeofDay - Clock.hours * 3600 - Clock.minutes * 60;
				--
				Clock.seconds = math.floor(Clock.deltams / 1);
				--
				Clock.hmsstring = forcetwodigits(Clock.hours) .. forcetwodigits(Clock.minutes) .. forcetwodigits(Clock.seconds);
				DisplayTime(Clock.hmsstring);
				--
				Clock.lastValue_clockrefreshtime = math.floor(TimeofDay);
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

		-->>Türen
			if (CONFIG.ENABLEVRTAV == true and IsEnginewithKey == 1) then

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
					if (simulationTime > TAV.Blink.lastTime + TAV.Blink.factor) then
						if (TAV.Blink.ONOFF == 0) then
							--ShowMessage("An", 1);
							TAV.Blink.ONOFF = 1;
						else
							--ShowMessage("Aus", 1);
							TAV.Blink.ONOFF = 0;
						end
						TAV.Blink.lastTime = simulationTime;
					end
				end
			--<<

			-->>Aktiviert den 'T' Leuchtmelder
				Call("SetControlValue", "DoorsCount", 0, 1 - TAV.Blink.ONOFF);
			--<<


			-->>Traktionssperre
				if (firstrun == true) then
					TAV.lastlockmsg = -1 * TAV.lockmsgcooldown;
				end
				if (Call("GetControlValue", "VirtualThrottle", 0) ~= 0 and tostring(TAV.State) ~= "0") then
					--ShowMessage(Call("GetControlValue", "VirtualThrottle", 0), 1);
					--Call("SetControlValue", "Regulator", 0, 0);
					TAV.NSZwang = true;
					if (TAV.locklock == false and TAV.lastlockmsg + TAV.lockmsgcooldown < simulationTime) then
						ShowMessage("Traktionssperre aktiv! Türen sind noch offen!", 4);
						TAV.locklock = true;
						TAV.lastlockmsg = simulationTime;
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
		--<<

		-->>Rollos
				if (firstrun == true) then
					ResetBlinds();
				end

				if (CurrentDir == 1) then
				-->>Stellt die Rollos in Fahrtrichtung ein
					Rollos.RAnimTime = 1 - Call("GetControlValue", "CabBlind_R", 0);
					Rollos.LAnimTime = 1 - Call("GetControlValue", "CabBlind_L", 0);
					DisplayBlinds(Rollos.RAnimTime, "F_R");
					DisplayBlinds(Rollos.LAnimTime, "F_L");
				--<<
	
				-->>Macht die Schotten im anderen Fst dicht
					if (CONFIG.INACTIVECABBLINDSDOWN == true) then
						DisplayBlinds(0, "R_R");
						DisplayBlinds(0, "R_L");
						Call("SetTime", "ExtBlind_BL", 1);
						Call("SetTime", "ExtBlind_BR", 1);
					else
						--DisplayBlinds(1, "F_R");
						--DisplayBlinds(1, "F_L");
						DisplayBlinds(1, "R_R");
						DisplayBlinds(1, "R_L");
					end
				--<<
				elseif (CurrentDir == 2) then
					Rollos.RAnimTime = 1 - Call("GetControlValue", "CabBlind_R", 0);
					Rollos.LAnimTime = 1 - Call("GetControlValue", "CabBlind_L", 0);
					DisplayBlinds(Rollos.RAnimTime, "R_R");
					DisplayBlinds(Rollos.LAnimTime, "R_L");
					if (CONFIG.INACTIVECABBLINDSDOWN == true) then
						DisplayBlinds(0, "F_R");
						DisplayBlinds(0, "F_L");
						Call("SetTime", "ExtBlind_FL", 1);
						Call("SetTime", "ExtBlind_FR", 1);
					else
						--DisplayBlinds(1, "R_R");
						--DisplayBlinds(1, "R_L");
						DisplayBlinds(1, "F_R");
						DisplayBlinds(1, "F_L");
					end
				end

				-->>Alle Rollos dicht machen, wenn die Lok nicht das geführte Tfz ist
				if (IsEnginewithKey == 0) then
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
				end
				--<<
	
				-->>Wenn die Lok KI gesteuert ist 
					if (isPlayer == 0) then
						if (CONFIG.INACTIVECABBLINDSDOWN == true) then
							if (IsEngineinFront == false and DrivingFwd == true) then
								DisplayBlinds(1, "F_R");
								DisplayBlinds(1, "F_L");
								Call("SetTime", "ExtBlind_FL", 0);
								Call("SetTime", "ExtBlind_FR", 0);
								DisplayBlinds(0, "R_R");
								DisplayBlinds(0, "R_L");
							elseif (IsEngineinRear == false and DrivingRwd == true) then
								DisplayBlinds(0, "F_R");
								DisplayBlinds(0, "F_L");
								Call("SetTime", "ExtBlind_BL", 0);
								Call("SetTime", "ExtBlind_BR", 0);
								DisplayBlinds(1, "R_R");
								DisplayBlinds(1, "R_L");
							else
								if (IsEngineinFront == false) then
									DisplayBlinds(1, "F_R");
									DisplayBlinds(1, "F_L");
									Call("SetTime", "ExtBlind_FL", 0);
									Call("SetTime", "ExtBlind_FR", 0);
									DisplayBlinds(0, "R_R");
									DisplayBlinds(0, "R_L");
								end
							end
							--if (firstrun == true) then
							--end
						else
							DisplayBlinds(1, "F_R");
							DisplayBlinds(1, "F_L");
							DisplayBlinds(1, "R_R");
							DisplayBlinds(1, "R_L");
						end
					end
				--<<

				if (isDeadEngine == 1) then
					if (firstrun == true or IsEditor == true) then
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
					end
				end
		--<<

		-->>KI Pantofix
			if ((isPlayer == 0 or IsEditor == true) and isDeadEngine == 0) then
				if (DrivingFwd == true) then
					Panto.CurrentValue = 2;
				elseif (DrivingRwd == true) then
					Panto.CurrentValue = 1;
				end

				Call("SetTime", "ExtPantograph_" .. tostring(Panto.CurrentValue), 1);
				Call("SetTime", "ExtPantograph_" .. tostring(3 - Panto.CurrentValue), 0);
			end
			
			if (isDeadEngine == 1) then
				Call("SetTime", "ExtPantograph_2", 0);
				Call("SetTime", "ExtPantograph_1", 0);
			end
		--<<

		-->>Fahrer auf nicht geführten Loks verstecken
			--[[if (isPlayer == 1) then
				if (isDeadEngine == 1) then]]
					--Call("Driver:ActivateNode", "all", 0);
					--ShowMessage("asd", 1);
				--[[else
					if (IsEnginewithKey == 1) then
						Call("Driver:ActivateNode", "all", 1);
					else
						Call("Driver:ActivateNode", "all", 0);
					end
				end
			else
				if (isDeadEngine == 1) then
					Call("Driver:ActivateNode", "all", 0);
				else
					if (DrivingFwd == true) then
						if (IsEngineinFront == true) then
							Call("Driver:ActivateNode", "all", 0);
						else
							Call("Driver:ActivateNode", "all", 1);
						end
					elseif (DrivingRwd == true) then
						if (IsEngineinFront == true) then
							Call("Driver:ActivateNode", "all", 0);
						else
							Call("Driver:ActivateNode", "all", 1);
						end
					end
				end
				if (isSpeedAtZero == true) then
					if (IsEngineinFront == true) then
						Call("Driver:ActivateNode", "all", 0);
					else
						Call("Driver:ActivateNode", "all", 1);
					end
				end
			end]]
			--Call("SetControlValue", "Driver", 0, 1)

		--<<

		-->>FML
			if (isPlayer == 1) then
				--Geführte Lok
				if (isDeadEngine == 0 and IsEnginewithKey == 0) then
					-->>Lüftereinstellung wurde geändert
					if (FML.State ~= FML.lastValue_State) then
						if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("FML changed State", 4) end
						-->>Anzeigen des aktuellen Lüfterstatus
						if (FML.State == -1) then
							ShowMessage(CreateConsistNumber(FML.ZDSMasterRVNumber, "143") .. " > " .. CreateConsistNumber(RVNumber, "143") .. " ZDS:\nFahrmotorlüfter - Automatik", 4);
						elseif (FML.State == 0) then
							ShowMessage(CreateConsistNumber(FML.ZDSMasterRVNumber, "143") .. " > " .. CreateConsistNumber(RVNumber, "143") .. " ZDS:\nFahrmotorlüfter - Aus", 4);
						elseif (FML.State == 1) then
							ShowMessage(CreateConsistNumber(FML.ZDSMasterRVNumber, "143") .. " > " .. CreateConsistNumber(RVNumber, "143") .. " ZDS:\nFahrmotorlüfter - An", 4);
						end
						--<<
						FML.lastValue_State = FML.State;
					end
					-->>Wenn nach 6 Sekunden kein Signal vom führenden Tfz kam, wird die Verbindung abgebrochen
					if (FML.isControlledbyEngine == true) then
						if (simulationTime - FML.lastParentAlive > 6) then
							FML.isControlledbyEngine = false;
						end
					--<<
					-->>Wenn keine Verbindung besteht wird ab 10 Kmh der Lüfter angemacht
					else
						if (speedValue > CONFIG.AIFANTHRESHOLD or speedValue < -1 * CONFIG.AIFANTHRESHOLD and Ammeter > 20) then
						--if (Ammeter > 130) then
							if (FML.Value < 1) then
								FML.Value = FML.Value + FML.factor;
							end
						else
							if (FML.Value > 0) then
								FML.Value = FML.Value - FML.factor;
							end
						end
						Call("SetControlValue", "TractionBlower_State", 0, FML.Value);
					end
					--<<
				end
				-->>Führendes Tfz
				if (IsEnginewithKey == 1) then
	
					--	 - Funktionsweise: Alle 5 Sekunden sendet die führende Lok ein Signal. Wenn dieses von einer geführten Lok empfangen wird sendet diese ihre
					--	 - Nummer mit dem Zusatz 'RV' vorne angehängt zurück, und ist bereit. Beim empfangen der Nachricht extrahiert die führende Lok die Nummer, und
					--	 - die Verbindung ist nun hergestellt. Wenn dies der Fall ist, sendet nun die führende Lok nun alle 0.5 Sekunden den Status des FML. Die 
					--	 - geführte Lok emfängt diese, und setzt sie um.
	
					if (math.floor(FML.lastConsistChecktimetime / 5) ~= math.floor(simulationTime / 5)) then
						-->>Wenn Nachricht zurückkommt ist die Verbindung hergestellt, wenn nicht bleibt die Variable auf false
						FML.Connectionetablished = false;
						if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("Master Sent FML alive request", 4) end
						Call("SendConsistMessage", messages.FML, tostring("Alive" .. RVNumber), 0);
						Call("SendConsistMessage", messages.FML, tostring("Alive" .. RVNumber), 1);
						--<<
						-->>Wenn der Verbindungsstatus geändert wurde, wird die entsprechende Meldung gezeigt
						if (FML.Connectionetablished ~= FML.lastConnectionetablished) then
							if (FML.Connectionetablished == false) then
								ShowMessage(CreateConsistNumber(RVNumber, "143") .. " > " .. CreateConsistNumber(FML.ZDSRVNumber, "143") .. " ZDS:\nVerbindung Verloren!", 4);
							else
								ShowMessage(CreateConsistNumber(RVNumber, "143") .. " > " .. CreateConsistNumber(FML.ZDSRVNumber, "143") .. " ZDS:\nVerbindung Hergestellt!", 4);
							end
							FML.lastConnectionetablished = FML.Connectionetablished;
						end
						--<<
						FML.lastConsistChecktimetime = simulationTime;
					end
					-->>Senden der FML Daten
					if (math.floor(FML.lastrefreshtime * 2) ~= math.floor(simulationTime * 2) and FML.Connectionetablished == true) then
						Call("SendConsistMessage", messages.FML, tostring("State" .. Call("GetControlValue", "TractionBlower_State", 0)), 0);
						Call("SendConsistMessage", messages.FML, tostring("State" .. Call("GetControlValue", "TractionBlower_State", 0)), 1);
						Call("SendConsistMessage", messages.FML, tostring("Control" .. Call("GetControlValue", "TractionBlower_Control", 0)), 0);
						Call("SendConsistMessage", messages.FML, tostring("Control" .. Call("GetControlValue", "TractionBlower_Control", 0)), 1);
						FML.lastrefreshtime = simulationTime;
					end
					--<<
				end
			else
				if (speedValue > CONFIG.AIFANTHRESHOLD or speedValue < -1 * CONFIG.AIFANTHRESHOLD) then
					if (FML.Value < 1) then
						FML.Value = FML.Value + FML.factor;
					end
				else
					if (FML.Value > 0) then
						FML.Value = FML.Value - FML.factor;
					end
				end
				Call("SetControlValue", "TractionBlower_State", 0, FML.Value);
			end
		--<<

		-->>Sounds bei geöffnetem Fenster
			if (CurrentDir == 1) then
				Call("SetControlValue", "WindowSoundMixture", 0, math.max(Call("GetControlValue", "ExtWindow_FR", 0), Call("GetControlValue", "ExtWindow_FL", 0)))
			elseif (CurrentDir == 2) then
				Call("SetControlValue", "WindowSoundMixture", 0, math.max(Call("GetControlValue", "ExtWindow_BR", 0), Call("GetControlValue", "ExtWindow_BL", 0)))
			end
		--<<

		-->>Kompressor Fix
			MainReservoir = Call("GetControlValue", "MainReservoirPressureBAR", 0);

			if chknextframe ~= 0 then
				if chknextframe ~= MainReservoir then
					if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("Compressor On", 4) end
					Call("SetControlValue", "Compressor2", 0, 1);
					compactive = true;
				end
				chknextframe = 0;
			end

			if Call("GetSimulationTime") > 1 then
				if MainReservoir <= 8.482 and chknextframe == 0 and not compactive then
					chknextframe = MainReservoir;
				end

				lastValue_MainReservoir = MainReservoir;

				if MainReservoir >= 9.99 and compactive then
					if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("Compressor Off", 4) end
					Call("SetControlValue", "Compressor2", 0, 0);
					compactive = false;
					chknextframe = 0;
				end
			end

			
		--<<

			ZZA.lastValue = ZZA.Value;
			firstrun = false;


	
			end
	--<<

	-->>Ermittelt die Länge eines Arrays

		--	- Funktionsweise: Geht nacheinander alle Einträge eines Arrays durch, bis das Ende erreicht ist. Die Funktion gibt dann zurück,
		--	- wie weit es gekommen ist.

		function GetArrayLenght(Array)
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

	-->>Überprüft ob sich der Spieler im Editor befindet

		--	- Funktionsweise: Im Editor verläuft keine Zeit, deswegen lässt sich leicht ermitteln ob dieser gerade aktiv ist

		function GetIsEditor()
			if (Call("GetSimulationTime") == 0) then
				IsEditor = true;
			else
				IsEditor = false;
			end
		end
	--<<

	-->>Setzt die ZZA zurück
		
		--	- Funktionsweise: Deaktiviert in einer Schleife alle Ziele
		
		function ResetZZA()

			local i = 1;
			repeat
				Call("ZZAS:ActivateNode", CONFIG.ZZANAMES[i], 0);
				i = i + 1;
			until(i == arr.CONFIG_ZZANAMES)
		end
	--<<

	-->>Stellt die Sonnenblenden ein
		function DisplayBlinds(Wert, Blind)
			if (Blind == "F_L" and math.floor(Wert * 20) ~= math.floor(Rollos.CurrentState[1] * 20)) then
				--[[if (IsEnginewithKey == 0 and isPlayer == 1) then
					ShowMessage("DEBUG: " .. Blind .. " - " .. math.floor(Wert * 20), 1);
				end]]
				Call("Rollos:ActivateNode", "Rollo_" .. Blind .. "_" .. forcetwodigits(math.floor(Wert * 20)), 1);
				Call("Rollos:ActivateNode", "Rollo_" .. Blind .. "_" .. forcetwodigits(math.floor(Rollos.CurrentState[1] * 20)), 0);
				Rollos.CurrentState[1] = Wert;

			elseif (Blind == "F_R" and math.floor(Wert * 20) ~= math.floor(Rollos.CurrentState[2] * 20)) then
				--[[if (IsEnginewithKey == 0 and isPlayer == 1) then
					ShowMessage("DEBUG: " .. Blind .. " - " .. math.floor(Wert * 20), 1);
				end]]
				Call("Rollos:ActivateNode", "Rollo_" .. Blind .. "_" .. forcetwodigits(math.floor(Wert * 20)), 1);
				Call("Rollos:ActivateNode", "Rollo_" .. Blind .. "_" .. forcetwodigits(math.floor(Rollos.CurrentState[2] * 20)), 0);
				Rollos.CurrentState[2] = Wert;

			elseif (Blind == "R_L" and math.floor(Wert * 20) ~= math.floor(Rollos.CurrentState[3] * 20)) then
				--[[if (IsEnginewithKey == 0 and isPlayer == 1) then
					ShowMessage("DEBUG: " .. Blind .. " - " .. math.floor(Wert * 20), 1);
				end]]
				Call("Rollos:ActivateNode", "Rollo_" .. Blind .. "_" .. forcetwodigits(math.floor(Wert * 20)), 1);
				Call("Rollos:ActivateNode", "Rollo_" .. Blind .. "_" .. forcetwodigits(math.floor(Rollos.CurrentState[3] * 20)), 0);
				Rollos.CurrentState[3] = Wert;

			elseif (Blind == "R_R" and math.floor(Wert * 20) ~= math.floor(Rollos.CurrentState[4] * 20)) then
				--[[if (IsEnginewithKey == 0 and isPlayer == 1) then
					ShowMessage("DEBUG: " .. Blind .. " - " .. math.floor(Wert * 20), 1);
				end]]
				Call("Rollos:ActivateNode", "Rollo_" .. Blind .. "_" .. forcetwodigits(math.floor(Wert * 20)), 1);
				Call("Rollos:ActivateNode", "Rollo_" .. Blind .. "_" .. forcetwodigits(math.floor(Rollos.CurrentState[4] * 20)), 0);
				Rollos.CurrentState[4] = Wert;
			end
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
			if (IsEnginewithKey == 1) then
				if (message == messages.vR.TAV_ZU) then
					TAV.State = argument;
				end
				if (message == messages.vR.TAV_SCHLIESSEN and tostring(argument) == "1") then
					TAV.State = argument;
				end
			end

		-->>Weitersenden von Nachrichten
			--	- Funktionsweise: Sendet die Nachricht in die entgegengesetze Richtung weiter, von der sie es bekommen hat.
			if (message ~= messages.FML) then
				Call("SendConsistMessage", message, argument, dirproject(direction));
			end
		--<<

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
			if (isDeadEngine == 0) then
				-->>Nicht geführtes Tfz
				if (IsEnginewithKey == 0) then
					if (message == messages.FML) then
						-->>Wenn Nachricht 'Alive' von der führenden Lok erhalten
						if (string.find(argument, "Alive") ~= nil) then
							FML.ZDSMasterRVNumber = string.sub(argument, 6);
						if CONFIG.ENABLEDEBUGMESSAGES then DebugMessage("Slave got FML alive Request", 4) end
							if (FML.isControlledbyEngine == false) then
								ShowMessage(CreateConsistNumber(RVNumber, "143") .. ": ZDS Verbindet... \nAnforderung erhalten von " .. CreateConsistNumber(FML.ZDSMasterRVNumber, "143") .. "!\nSende Antwort!", 4);
							end
							FML.isControlledbyEngine = true
							Call("SendConsistMessage", messages.FML, tostring("RV" .. RVNumber), 0);
							Call("SendConsistMessage", messages.FML, tostring("RV" .. RVNumber), 1);
							FML.lastParentAlive = simulationTime;
						--<<

						-->>Umsetzen der empfangenen FML Daten
						elseif (string.find(argument, "State") ~= 0) then
							Call("SetControlValue", "TractionBlower_State", 0, tonumber(string.sub(argument, 6)));
						end
						if (string.find(argument, "Control") ~= 0) then
							FML.State = tonumber(string.sub(argument, 8));
						end
						--<<
					end
				else
					-->>Extrahieren der Zugnummer des geführten Tfz
					if (message == messages.FML and string.find(argument, "RV") ~= 0) then
						FML.Connectionetablished = true;
						FML.ZDSRVNumber = string.sub(argument, 3);
					end
					--<<
				end
			end


		-->>Testlauf

		--	- Funktionsweise: Wenn die Lok geführt ist, wird bei Empfangen der Nachricht der Wert um 1 erhöht und zur nächsten Lok gesendet.
		--	- Zusätzlich sendet sie den Wert zurück zum führenden Tfz, damit dieses weiß, wie viele Loks angehängt sind, da jede Lok den Wert
		--	- um eins erhöht. Damit, falls zuerst die Nachricht der zweiten Lok und dann der ersten Lok ankommt der Wert nicht bei 1 liegt,
		--	- Werden nur Zahlen, die größer als die aktuelle sind akzeptiert.

			if (IsEnginewithKey == 0) then
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
			CurrentDir = cabEndWithCamera;
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

	-->>Zeigt die Zeit an

		--	- Funktionsweise: Jede Ziffer wird einmal pro Ausführung durchgegangen. Für diese Ziffer wird der
		--	- entsprechende Wert aus dem String extrahiert, und alle Ziffern außer der im String entsprechenden
		--	- deatkiviert 

		function DisplayTime(inputstring)
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


	-->>Wandelt eine einstellige Zahl in einen String mit 0 davor um
		function forcetwodigits(Number)
			if (Number < 10) then
				return tostring("0" .. Number);
			else
				return tostring(Number);
			end
		end
	--<<

	-->>Zieht jeder Zahl außer 1 1 ab
		function Minusoneexceptforone(number)
			if (number > 1) then
				return number - 1;
			else
				return number;
			end
		end
	--<<

	-->>Projeziert den Wert zur Richtungsangabe der Nachricht
		--Wenn die Nachricht von Seite A kommt geht sie bei Seite B wieder raus und andersrum
		function dirproject(number)
			if (number == -1) then
				return 0;
			else
				return number;
			end
		end
	--<<

	-->>Gibt je nach Nachricht des Testlaufs die jeweils zurückführende Nachricht zurück
		function gobackchk(message)
			if (message == messages.testrun) then
				return messages.testrunrev;
			else
				return messages.testrun2rev
			end
		end
	--<<

		function CreateConsistNumber(Number, Class)
			return tostring(Class .. " " .. string.sub(Number, 1, 3) .. "-" .. string.sub(Number, 4, 4));
		end

	-->>Zeigt den Schnee an
		function Snow(factor)
			local speed = Call( "GetSpeed" );
			if (speed > 0) then
				gSnowPlowLeft = 1;
				gSnowPlowRight = 1;
				gSnowPlowLeftrev = 0;
				gSnowPlowRightrev = 0;
			else
				gSnowPlowLeft = 0;
				gSnowPlowRight = 0;
				gSnowPlowLeftrev = 1;
				gSnowPlowRightrev = 1;
			end


			if ( speed > 25 ) then
				speed = 25;
			end
			
			if ( speed > 10 ) then
				gEmitter = (speed - 10) * 0.1
				if ( gEmitter < 0.08 ) then
					gEmitter = 0.08;
				elseif ( gEmitter >= 0.45 ) then
					gEmitter = 0.45;
				end
				if ( gSnowPlowLeft == 1 ) then
					Call( "SnowPlow1:SetEmitterActive", 1 );
					-- Call( "SnowPlow1:SetEmitterRate", 1 - gEmitter );
					Call( "SnowPlow1:SetEmitterColour", 1, 1, 1, factor * (gEmitter - 0.08));
				else
					Call( "SnowPlow1:SetEmitterActive", 0 );
				end
				if ( gSnowPlowRight == 1 ) then
					Call( "SnowPlow2:SetEmitterActive", 1 );
					-- Call( "SnowPlow2:SetEmitterRate", 1 - gEmitter );
					Call( "SnowPlow2:SetEmitterColour", 1, 1, 1, factor * (gEmitter - 0.08));
				else
					Call( "SnowPlow2:SetEmitterActive", 0 );
				end
			else
				Call( "SnowPlow1:SetEmitterActive", 0 );
				Call( "SnowPlow2:SetEmitterActive", 0 );
			end

			if ( speed < -10 ) then
				speed = speed * -1;
				gEmitter = (speed - 10) * 0.1
				if ( gEmitter < 0.08 ) then
					gEmitter = 0.08;
				elseif ( gEmitter >= 0.45 ) then
					gEmitter = 0.45;
				end
				if ( gSnowPlowLeftrev == 1 ) then
					Call( "SnowPlow1rev:SetEmitterActive", 1 );
					-- Call( "SnowPlow1:SetEmitterRate", 1 - gEmitter );
					Call( "SnowPlow1rev:SetEmitterColour", 1, 1, 1, factor * (gEmitter - 0.08));
				else
					Call( "SnowPlow1rev:SetEmitterActive", 0 );
				end
				if ( gSnowPlowRightrev == 1 ) then
					Call( "SnowPlow2rev:SetEmitterActive", 1 );
					-- Call( "SnowPlow2:SetEmitterRate", 1 - gEmitter );
					Call( "SnowPlow2rev:SetEmitterColour", 1, 1, 1, factor * (gEmitter - 0.08));
				else
					Call( "SnowPlow2rev:SetEmitterActive", 0 );
				end
			else
				Call( "SnowPlow1rev:SetEmitterActive", 0 );
				Call( "SnowPlow2rev:SetEmitterActive", 0 );
			end
		end

		function ShowMessage(messageText, messageHoldTime)
			if (CONFIG.DISPLAYMESSAGES == true) then
				--if (IsEnginewithKey == 0) then
					--SysCall("ScenarioManager:ShowAlertMessageExt", tostring(--[[RVNumber .. ]]"Interface Messaging System"), tostring(RVNumber .. ": " .. messageText), messageHoldTime, 1);
				--else
					SysCall("ScenarioManager:ShowAlertMessageExt", "Interface Messaging System", tostring(messageText), messageHoldTime, 1);
				--end
			end
		end

		function DebugMessage(messageText, messageHoldTime)
			SysCall("ScenarioManager:ShowAlertMessageExt", "DEBUG INFORMATION", "DEBUG: " .. tostring(messageText), messageHoldTime, 1);
		end
	--<<
--<<
