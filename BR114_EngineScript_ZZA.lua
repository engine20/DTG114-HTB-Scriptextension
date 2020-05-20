-- Nicht Bearbeiten
CONFIG = {};

-- Stellt ein, ob im nicht besetzten Führerstand alle Rollos heruntergefahren werden sollen [true/false]
CONFIG.INACTIVECABBLINDSDOWN = true;

-- Stellt ein, ob beim Betreten eines Führerstands alle Rollos hochgefahren werden sollen [true/false]
CONFIG.RESETBLINDSONCABENTER = false;

-- Stellt ein, ob beim Verstellen der ZZA die aktuelle Einstellung als Nachricht angezeigt wird [true/false]
CONFIG.DISPLAYZZAPOS = true;

-- De- oder aktiviert global alle Nachrichten [true/false]
CONFIG.DISPLAYMESSAGES = true;

-- De- oder aktiviert den Flugschnee (dieser wird nur im Winter ausgelöst) [true/false]
CONFIG.ENABLESNOW = true;

-- De- oder aktiviert die vR kompatible Türsteuerung [true/false]
CONFIG.ENABLEVRTAV = true;

-- De- oder aktiviert das Korrigieren der UIC Prüfziffer [true/false]
CONFIG.CORRECTRVNUMBER = true;

-- Stellt ein, ob beim Start die Lüfter bereits auf Automatik gestellt sein sollen [true/false]
CONFIG.AUTOMATICFANMODEBYDEFAULT = true;

-- Stellt ein, ab welcher Geschwindiigkeit KI - Züge die Lüfter anmachen sollen [Numerischer Wert]
CONFIG.AIFANTHRESHOLD = 7;

-- De- oder aktiviert das Kommunizieren mit der ZZA von vR Wagen [true/false]
CONFIG.VRZZACOMMUNICATION = true;

-- De- oder aktiviert die Benutzung der Liste der Ziele als *.txt Datei [true/false]
CONFIG.USEDESTINATIONLIST = true;

-- Pfad zur Liste der Ziele (nur zu beachten, wenn die vorherige Option als True eingetragen wurde) [Pfadangabe]
CONFIG.DESTINATIONLISTPATH = "Assets/DTG/BR114Pack01/RailVehicles/Electric/[114] 143_HTB/Scripts/ZZAList.txt";

-- Namen der Nodes der einzelnen ZZA Ziele [Schema übernehmen]
CONFIG.ZZANAMES = {"ZZA_000", 
				   "ZZA_001", "ZZA_002", "ZZA_003", "ZZA_004", "ZZA_005", "ZZA_006", "ZZA_007", "ZZA_008", "ZZA_009", "ZZA_010",
				   "ZZA_011", "ZZA_012", "ZZA_013", "ZZA_014", "ZZA_015", "ZZA_016", "ZZA_017", "ZZA_018", "ZZA_019", "ZZA_020",
				   "ZZA_021", "ZZA_022", "ZZA_023", "ZZA_024", "ZZA_025", "ZZA_026", "ZZA_027", "ZZA_028", "ZZA_029", "ZZA_030",
				   "ZZA_031", "ZZA_032", "ZZA_033", "ZZA_034", "ZZA_035", "ZZA_036", "ZZA_037", "ZZA_038", "ZZA_039", "ZZA_040",
				   "ZZA_041", "ZZA_042", "ZZA_043", "ZZA_044", "ZZA_045", "ZZA_046", "ZZA_047", "ZZA_048", "ZZA_049", "ZZA_050",
				   "ZZA_051"};


--### Pfad zum Hauptskript eintragen ########################################################################
require 'Assets/DTG/BR114Pack01/RailVehicles/Electric/[114] 143_HTB/Scripts/BR114_EngineScript.out'
--###########################################################################################################

--### Pfad zur Skripterweiterung eintragen ##################################################################
require 'Assets/DTG/BR114Pack01/RailVehicles/Electric/[114] 143_HTB/Scripts/BR114_EngineScript_ZZA_CODE.lua'
--###########################################################################################################
