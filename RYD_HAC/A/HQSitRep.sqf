
RydHQ = GrpNull;

RydHQ = group leaderHQ;

leaderHQ kbAddTopic ["orders","RYD_HAC\topics.bikb",""];
waituntil {(leaderHQ kbHasTopic "orders")};

RydHQ_Cyclecount = 0;

waituntil {not (isNull RydHQ)};

RydHQ_PersDone = false;
[] spawn A_Personality;
waituntil {RydHQ_PersDone};

RydHQ_LHQInit = false;
[] spawn A_LHQ;
waituntil {RydHQ_LHQInit};

if (isNil ("RydHQ_Boxed")) then {RydHQ_Boxed = []};
if (isNil ("RydHQ_AmmoBoxes")) then 
	{
	RydHQ_AmmoBoxes = [];

	if not (isNil "RydHQ_AmmoDepot") then 
		{
		_rds = (triggerArea RydHQ_AmmoDepot) select 0;
		RydHQ_AmmoBoxes = (getPosATL RydHQ_AmmoDepot) nearObjects ["ReammoBox",_rds]
		}
	};

[] spawn A_HQReset;
[] spawn A_Rev;
[] spawn A_SuppMed;
[] spawn A_SuppFuel;
[] spawn A_SuppAmmo;
[] spawn A_SuppRep;
[] spawn A_SFIdleOrd;
[] spawn A_Reloc;
[] spawn A_LPos;

_specFor = RHQ_SpecFor + ["RUS_Soldier_Sab","RUS_Soldier_GL","RUS_Soldier_Marksman","RUS_Commander","RUS_Soldier1","RUS_Soldier2","RUS_Soldier3","RUS_Soldier_TL"] - RHQs_SpecFor;
_recon = RHQ_Recon + ["FR_TL","FR_Sykes","FR_R","FR_Rodriguez","FR_OHara","FR_Miles","FR_Marksman","FR_AR","FR_GL","FR_AC","FR_Sapper","FR_Corpsman","FR_Cooper","FR_Commander","FR_Assault_R","FR_Assault_GL","USMC_SoldierS_Spotter","USMC_SoldierS","MQ9PredatorB","CDF_Soldier_Spotter","RU_Soldier_Spotter","RUS_Soldier3","Pchela1T","GUE_Soldier_Scout"] - RHQs_Recon;
_FO = RHQ_FO + ["USMC_SoldierS_Spotter","CDF_Soldier_Spotter","RU_Soldier_Spotter","Ins_Soldier_CO","GUE_Soldier_Scout"] - RHQs_FO;
_snipers = RHQ_Snipers + ["USMC_SoldierS_Sniper","USMC_SoldierS_SniperH","USMC_SoldierM_Marksman","FR_Marksman","CDF_Soldier_Sniper","CDF_Soldier_Marksman","RU_Soldier_Marksman","RU_Soldier_Sniper","RU_Soldier_SniperH","MVD_Soldier_Marksman","MVD_Soldier_Sniper","RUS_Soldier_Marksman","Ins_Soldier_Sniper","GUE_Soldier_Sniper"] - RHQs_Snipers;
_ATinf = RHQ_ATInf + ["USMC_Soldier_HAT","USMC_Soldier_AT","USMC_Soldier_LAT","HMMWV_TOW","CDF_Soldier_RPG","RU_Soldier_HAT","RU_Soldier_AT","RU_Soldier_LAT","MVD_Soldier_AT","Ins_Soldier_AT","GUE_Soldier_AT"] - RHQs_ATInf;
_AAinf = RHQ_AAInf + ["USMC_Soldier_AA","HMMWV_Avenger","CDF_Soldier_Strela","Ural_ZU23_CDF","RU_Soldier_AA","2S6M_Tunguska","Ins_Soldier_AA","ZSU_INS","Ural_ZU23_INS","GUE_Soldier_AA","Ural_ZU23_Gue"] - RHQs_AAInf;
_Inf = RHQ_Inf + ["GUE_Commander","GUE_Soldier_Scout","GUE_Soldier_Sab","GUE_Soldier_AA","GUE_Soldier_AT","GUE_Soldier_1","GUE_Soldier_2","GUE_Soldier_3","GUE_Soldier_Pilot","GUE_Soldier_Medic","GUE_Soldier_MG","GUE_Soldier_Sniper","GUE_Soldier_GL","GUE_Soldier_Crew","GUE_Soldier_CO","GUE_Soldier_AR","Ins_Woodlander1","Ins_Villager4","Ins_Worker2","Ins_Woodlander2","Ins_Woodlander3","Ins_Villager3","Ins_Soldier_Sniper","Ins_Soldier_Sapper","Ins_Soldier_Sab","Ins_Soldier_2","Ins_Soldier_1","Ins_Soldier_Pilot","Ins_Soldier_CO","Ins_Soldier_Medic","Ins_Soldier_MG","Ins_Bardak","Ins_Soldier_GL","Ins_Soldier_Crew","Ins_Commander","Ins_Lopotev","Ins_Soldier_AR","Ins_Soldier_AT","Ins_Soldier_AA","RUS_Soldier_TL","RUS_Soldier3","RUS_Soldier2","RUS_Soldier1","RUS_Commander","RUS_Soldier_Marksman","RUS_Soldier_GL","RUS_Soldier_Sab","MVD_Soldier_TL","MVD_Soldier_Sniper","MVD_Soldier_AT","MVD_Soldier_GL","MVD_Soldier","MVD_Soldier_Marksman","MVD_Soldier_MG","RU_Soldier_TL","RU_Soldier_SL","RU_Soldier_Spotter","RU_Soldier_SniperH","RU_Soldier_Sniper","RU_Soldier2","RU_Soldier_AT","RU_Soldier_LAT","RU_Soldier","RU_Soldier_Pilot","RU_Soldier_Officer","RU_Soldier_Medic","RU_Soldier_Marksman","RU_Soldier_MG","RU_Soldier_GL","RU_Commander","RU_Soldier_Crew","RU_Soldier_AR","RU_Soldier_HAT","RU_Soldier_AA","CDF_Soldier_TL","CDF_Soldier_Spotter","CDF_Soldier_Light","CDF_Soldier_Sniper","CDF_Soldier","CDF_Soldier_Pilot","CDF_Soldier_Officer","CDF_Soldier_Militia","CDF_Soldier_Medic","CDF_Soldier_Marksman","CDF_Soldier_MG","CDF_Soldier_GL","CDF_Commander","CDF_Soldier_Engineer","CDF_Soldier_Crew","CDF_Soldier_AR","CDF_Soldier_RPG","CDF_Soldier_Strela","FR_TL","FR_Sykes","FR_R","FR_Rodriguez","FR_OHara","FR_Miles","FR_Marksman","FR_AR","FR_GL","FR_AC","FR_Sapper","FR_Corpsman","FR_Cooper","FR_Commander","FR_Assault_R","FR_Assault_GL","USMC_Soldier_SL","USMC_SoldierS_Spotter","USMC_SoldierS_SniperH","USMC_SoldierS_Sniper","USMC_SoldierS","USMC_Soldier_LAT","USMC_Soldier2","USMC_Soldier","USMC_Soldier_Pilot","USMC_Soldier_Officer","USMC_Soldier_MG","USMC_Soldier_GL","USMC_Soldier_TL","USMC_SoldierS_Engineer","USMC_SoldierM_Marksman","USMC_Soldier_Crew","USMC_Soldier_Medic","USMC_Soldier_AR","USMC_Soldier_AT","USMC_Soldier_HAT","USMC_Soldier_AA"] - RHQs_Inf;
_Art = RHQ_Art + ["2b14_82mm_GUE","2b14_82mm_INS","GRAD_INS","2b14_82mm","D30_RU","GRAD_RU","2b14_82mm_CDF","D30_CDF","GRAD_CDF","MLRS","M252","M119"] - RHQs_Art;
_HArmor = RHQ_HArmor + ["T72_Gue","T34","T72_INS","T90","T72_RU","T72_CDF","M1A1","M1A2_TUSK_MG"] - RHQs_HArmor;
_MArmor = RHQ_MArmor + ["T34","BMP2_Gue","BMP2_INS","BMP2_CDF","BMP3"] - RHQs_MArmor;
_LArmor = RHQ_LArmor + ["BRDM2_HQ_Gue","BRDM2_Gue","BMP2_Gue","ZSU_INS","BRDM2_ATGM_INS","BRDM2_INS","BMP2_HQ_INS","BMP2_INS","GAZ_Vodnik_HMG","GAZ_Vodnik","BTR90_HQ","BTR90","BMP3","2S6M_Tunguska","ZSU_CDF","BRDM2_ATGM_CDF","BRDM2_CDF","BMP2_HQ_CDF","BMP2_CDF","LAV25_HQ","LAV25","AAV"] - RHQs_LArmor;
_LArmorAT = RHQ_LArmorAT + ["BMP2_Gue","BRDM2_ATGM_INS","BMP2_INS","BTR90","BMP3","BRDM2_ATGM_CDF","BMP2_CDF"] - RHQs_LArmorAT;
_Cars = RHQ_Cars + ["Ural_ZU23_Gue","V3S_Gue","Pickup_PK_GUE","Offroad_SPG9_Gue","Offroad_DSHKM_Gue","TT650_Gue","UralRepair_INS","UralRefuel_INS","UralReammo_INS","BMP2_Ambul_INS","Ural_ZU23_INS","UralOpen_INS","Ural_INS","UAZ_SPG9_INS","UAZ_MG_INS","UAZ_AGS30_INS","UAZ_INS","Pickup_PK_INS","Offroad_DSHKM_INS","TT650_Ins","GRAD_INS","GAZ_Vodnik_MedEvac","KamazRepair","KamazRefuel","KamazReammo","KamazOpen","Kamaz","UAZ_AGS30_RU","UAZ_RU","GRAD_RU","UralRepair_CDF","UralRefuel_CDF","UralReammo_CDF","BMP2_Ambul_CDF","Ural_ZU23_CDF","UralOpen_CDF","Ural_CDF","UAZ_MG_CDF","UAZ_AGS30_CDF","UAZ_CDF","GRAD_CDF","MtvrRepair","MtvrRefuel","MtvrReammo","HMMWV_Ambulance","TowingTractor","MTVR","MMT_USMC","M1030","HMMWV_Avenger","HMMWV_TOW","HMMWV_MK19","HMMWV_Armored","HMMWV_M2","HMMWV"] - RHQs_Cars;
_Air = RHQ_Air + ["Mi17_medevac_Ins","Su25_Ins","Mi17_Ins","Mi17_medevac_RU","Su34","Su39","Pchela1T","Mi17_rockets_RU","Mi24_V","Mi24_P","Ka52Black","Ka52","Mi17_medevac_CDF","Su25_CDF","Mi24_D","Mi17_CDF","MV22","C130J","MQ9PredatorB","AH64D","UH1Y","MH60S","F35B","AV8B","AV8B2","AH1Z","A10"] - RHQs_Air;
_BAir = RHQ_BAir + [] - RHQs_BAir;
_RAir = RHQ_RAir + ["Pchela1T","MQ9PredatorB"] - RHQs_RAir;
_NCAir = RHQ_NCAir + ["Mi17_medevac_Ins","Mi17_medevac_RU","Pchela1T","Mi17_medevac_CDF","MV22","C130J","MQ9PredatorB"] - RHQs_NCAir;
_Naval = RHQ_Naval + ["PBX","RHIB2Turret","RHIB","Zodiac"] - RHQs_Naval;
_Static = RHQ_Static + ["GUE_WarfareBMGNest_PK","ZU23_Gue","SPG9_Gue","2b14_82mm_GUE","DSHKM_Gue","Ins_WarfareBMGNest_PK","ZU23_Ins","SPG9_Ins","2b14_82mm_INS","DSHkM_Mini_TriPod","DSHKM_Ins","D30_Ins","AGS_Ins","RU_WarfareBMGNest_PK","CDF_WarfareBMGNest_PK","USMC_WarfareBMGNest_M240","2b14_82mm","Metis","KORD","KORD_high","D30_RU","AGS_RU","Igla_AA_pod_East","ZU23_CDF","SPG9_CDF","2b14_82mm_CDF","DSHkM_Mini_TriPod_CDF","DSHKM_CDF","D30_CDF","AGS_CDF","TOW_TriPod","MK19_TriPod","M2HD_mini_TriPod","M252","M2StaticMG","M119","Stinger_Pod","Fort_Nest_M240"] - RHQs_Static;
_StaticAA = RHQ_StaticAA + ["ZU23_Gue","ZU23_Ins","Igla_AA_pod_East","ZU23_CDF","Stinger_Pod"] - RHQs_StaticAA;
_StaticAT = RHQ_StaticAT + ["SPG9_Gue","SPG9_Ins","Metis","SPG9_CDF","TOW_TriPod"] - RHQs_StaticAT;
_Support = RHQ_Support + ["UralRepair_INS","UralRefuel_INS","UralReammo_INS","Mi17_medevac_Ins","BMP2_Ambul_INS","GAZ_Vodnik_MedEvac","KamazRepair","KamazRefuel","Mi17_medevac_RU","KamazReammo","UralRepair_CDF","UralRefuel_CDF","UralReammo_CDF","Mi17_medevac_CDF","BMP2_Ambul_CDF","MtvrRepair","MtvrRefuel","MtvrReammo","HMMWV_Ambulance","MH60S"] - RHQs_Support;
_Cargo = RHQ_Cargo + ["V3S_Gue","Pickup_PK_GUE","Offroad_SPG9_Gue","Offroad_DSHKM_Gue","BRDM2_HQ_Gue","BRDM2_Gue","BMP2_Gue","Mi17_medevac_Ins","BMP2_Ambul_INS","UralOpen_INS","Ural_INS","UAZ_SPG9_INS","UAZ_MG_INS","UAZ_AGS30_INS","UAZ_INS","Pickup_PK_INS","Offroad_DSHKM_INS","BRDM2_ATGM_INS","BRDM2_INS","BMP2_HQ_INS","BMP2_INS","Mi17_Ins","GAZ_Vodnik_MedEvac","Mi17_medevac_RU","PBX","KamazOpen","Kamaz","UAZ_AGS30_RU","UAZ_RU","GAZ_Vodnik_HMG","GAZ_Vodnik","BTR90_HQ","BTR90","BMP3","Mi17_rockets_RU","Mi17_medevac_CDF","BMP2_Ambul_CDF","UralOpen_CDF","Ural_CDF","UAZ_MG_CDF","UAZ_AGS30_CDF","UAZ_CDF","BRDM2_ATGM_CDF","BRDM2_CDF","BMP2_HQ_CDF","BMP2_CDF","Mi17_CDF","HMMWV_Ambulance","RHIB2Turret","RHIB","Zodiac","MTVR","HMMWV_TOW","HMMWV_MK19","HMMWV_Armored","HMMWV_M2","HMMWV","LAV25_HQ","LAV25","AAV","UH1Y","MH60S","MV22","C130J"] - RHQs_Cargo;
_NCCargo = RHQ_NCCargo + ["V3S_Gue","Mi17_medevac_Ins","BMP2_Ambul_INS","UralOpen_INS","Ural_INS","UAZ_INS","GAZ_Vodnik_MedEvac","Mi17_medevac_RU","PBX","KamazOpen","Kamaz","UAZ_RU","Mi17_medevac_CDF","BMP2_Ambul_CDF","UralOpen_CDF","Ural_CDF","UAZ_CDF","HMMWV_Ambulance","Zodiac","MTVR","HMMWV","MV22","C130J"] - RHQs_NCCargo;
_Crew = RHQ_Crew + ["GUE_Soldier_Pilot","INS_Soldier_Pilot","RU_Soldier_Pilot","CDF_Soldier_Pilot","USMC_Soldier_Pilot","GUE_Soldier_Crew","INS_Soldier_Crew","RU_Soldier_Crew","CDF_Soldier_Crew","USMC_Soldier_Crew"] - RHQs_Crew;
_Other = RHQ_Other + [];
_NCrewInf = _Inf - _Crew;
_Cargo = _Cargo - (_Support - ["MH60S"]);
RydHQ_NCVeh = _NCCargo + (_Support - ["MH60S"]);

[(_snipers + _ATinf + _AAinf)] spawn A_Garrison;

RydHQ_ReconDone = false;
RydHQ_DefDone = false;
RydHQ_ReconStage = 1;
RydHQ_KnEnPos = [];
RydHQ_AirInDef = [];
if (isNil ("RydHQ_Excluded")) then {RydHQ_Excluded = []};
if (isNil ("RydHQ_Fast")) then {RydHQ_Fast = false};
if (isNil ("RydHQ_ExInfo")) then {RydHQ_ExInfo = false};
if (isNil ("RydHQ_ObjHoldTime")) then {RydHQ_ObjHoldTime = 600};
if (isNil "RydHQ_NObj") then {RydHQ_NObj = 1};

RydHQ_Init = true;

RydHQ_Inertia = 0;
RydHQ_Morale = 0;
RydHQ_CInitial = 0;
RydHQ_CLast = 0;
RydHQ_CCurrent = 0;
RydHQ_CIMoraleC = 0;
RydHQ_CLMoraleC = 0;
RydHQ_Surrender = false;

RydHQ_FirstEMark = true;
RydHQ_LastE = 0;
RydHQ_FlankingInit = false;
RydHQ_FlankingDone = false;
RydHQ_Progress = 0;

RydHQ_AAthreat = [];
RydHQ_ATthreat = [];
RydHQ_Airthreat = [];
RydHQ_Exhausted = [];

_lastHQ = leaderHQ;
_OLmpl = 0;
_cycleCap = 0;
_firstMC = 0; 
_wp = [];

while {not ((isNull RydHQ) or (RydHQ_Surrender))} do
	{
	if not (RydHQ_Fast) then {waituntil {sleep 0.1;((RydxHQ_Done) and (RydxHQB_Done) and (RydxHQC_Done) and (RydxHQD_Done) and (RydxHQE_Done) and (RydxHQF_Done) and (RydxHQG_Done) and (RydxHQH_Done))}};
	if (isNil ("RydHQ_SupportWP")) then {RydHQ_SupportWP = false};

	if (RydHQ_Cyclecount > 1) then
		{
		if not (_lastHQ == leaderHQ) then {sleep (60 + (random 60))};
		};

	_lastHQ = leaderHQ;
	RydHQ_Cyclecount = RydHQ_Cyclecount + 1;
	RydxHQ_Done = false;

	RydHQ_SpecFor = [];
	RydHQ_recon = [];
	RydHQ_FO = [];
	RydHQ_snipers = [];
	RydHQ_ATinf = [];
	RydHQ_AAinf = [];
	RydHQ_Inf = [];
	RydHQ_Art = [];
	RydHQ_HArmor = [];
	RydHQ_MArmor = [];
	RydHQ_LArmor = [];
	RydHQ_LArmorAT = [];
	RydHQ_Cars = [];
	RydHQ_Air = [];
	RydHQ_BAir = [];
	RydHQ_RAir = [];
	RydHQ_NCAir = [];
	RydHQ_Naval = [];
	RydHQ_Static = [];
	RydHQ_StaticAA = [];
	RydHQ_StaticAT = [];
	RydHQ_Support = [];
	RydHQ_Cargo = [];
	RydHQ_NCCargo = [];
	RydHQ_Other = [];
	RydHQ_Crew = [];
	RydHQ_NCrewInf = [];

	RydHQ_SpecForG = [];
	RydHQ_reconG = [];
	RydHQ_FOG = [];
	RydHQ_snipersG = [];
	RydHQ_ATinfG = [];
	RydHQ_AAinfG = [];
	RydHQ_InfG = [];
	RydHQ_ArtG = [];
	RydHQ_HArmorG = [];
	RydHQ_MArmorG = [];
	RydHQ_LArmorG = [];
	RydHQ_LArmorATG = [];
	RydHQ_CarsG = [];
	RydHQ_AirG = [];
	RydHQ_BAirG = [];
	RydHQ_RAirG = [];
	RydHQ_NCAirG = [];
	RydHQ_NavalG = [];
	RydHQ_StaticG = [];
	RydHQ_StaticAAG = [];
	RydHQ_StaticATG = [];
	RydHQ_SupportG = [];
	RydHQ_CargoG = [];
	RydHQ_NCCargoG = [];
	RydHQ_OtherG = [];
	RydHQ_CrewG = [];
	RydHQ_NCrewInfG = [];

	RydHQ_EnSpecFor = [];
	RydHQ_Enrecon = [];
	RydHQ_EnFO = [];
	RydHQ_Ensnipers = [];
	RydHQ_EnATinf = [];
	RydHQ_EnAAinf = [];
	RydHQ_EnInf = [];
	RydHQ_EnArt = [];
	RydHQ_EnHArmor = [];
	RydHQ_EnMArmor = [];
	RydHQ_EnLArmor = [];
	RydHQ_EnLArmorAT = [];
	RydHQ_EnCars = [];
	RydHQ_EnAir = [];
	RydHQ_EnBAir = [];
	RydHQ_EnRAir = [];
	RydHQ_EnNCAir = [];
	RydHQ_EnNaval = [];
	RydHQ_EnStatic = [];
	RydHQ_EnStaticAA = [];
	RydHQ_EnStaticAT = [];
	RydHQ_EnSupport = [];
	RydHQ_EnCargo = [];
	RydHQ_EnNCCargo = [];
	RydHQ_EnOther = [];
	RydHQ_EnCrew = [];
	RydHQ_EnNCrewInf = [];

	RydHQ_EnSpecForG = [];
	RydHQ_EnreconG = [];
	RydHQ_EnFOG = [];
	RydHQ_EnsnipersG = [];
	RydHQ_EnATinfG = [];
	RydHQ_EnAAinfG = [];
	RydHQ_EnInfG = [];
	RydHQ_EnArtG = [];
	RydHQ_EnHArmorG = [];
	RydHQ_EnMArmorG = [];
	RydHQ_EnLArmorG = [];
	RydHQ_EnLArmorATG = [];
	RydHQ_EnCarsG = [];
	RydHQ_EnAirG = [];
	RydHQ_EnBAirG = [];
	RydHQ_EnRAirG = [];
	RydHQ_EnNCAirG = [];
	RydHQ_EnNavalG = [];
	RydHQ_EnStaticG = [];
	RydHQ_EnStaticAAG = [];
	RydHQ_EnStaticATG = [];
	RydHQ_EnSupportG = [];
	RydHQ_EnCargoG = [];
	RydHQ_EnNCCargoG = [];
	RydHQ_EnOtherG = [];
	RydHQ_EnCrewG = [];
	RydHQ_EnNCrewInfG = [];

	RydHQ_LastE = count RydHQ_KnEnemies;
	RydHQ_LastFriends = RydHQ_Friends;

	if (isNil ("RydHQ_NoAirCargo")) then {RydHQ_NoAirCargo = false};
	if (isNil ("RydHQ_NoLandCargo")) then {RydHQ_NoLandCargo = false};
	if (isNil ("RydHQ_LastFriends")) then {RydHQ_LastFriends = []};
	if (isNil ("RydHQ_CargoFind")) then {RydHQ_CargoFind = 0};
	if (isNil ("RydHQ_Subordinated")) then {RydHQ_Subordinated = []};
	if (isNil ("RydHQ_Included")) then {RydHQ_Included = []};
	if (isNil ("RydHQ_ExcludedG")) then {RydHQ_ExcludedG = []};
	if (isNil ("RydHQ_SubAll")) then {RydHQ_SubAll = true};
	if (isNil ("RydHQ_SubSynchro")) then {RydHQ_SubSynchro = false};
	if (isNil ("RydHQ_SubNamed")) then {RydHQ_SubNamed = false};
	if (isNil ("RydHQ_SubZero")) then {RydHQ_SubZero = false};
	if (isNil ("RydHQ_ReSynchro")) then {RydHQ_ReSynchro = true};
	if (isNil ("RydHQ_NameLimit")) then {RydHQ_NameLimit = 100};
	if (isNil ("RydHQ_Surr")) then {RydHQ_Surr = false};
	if (isNil ("RydHQ_AOnly")) then {RydHQ_AOnly = []};
	if (isNil ("RydHQ_ROnly")) then {RydHQ_ROnly = []};
	if (isNil ("RydHQ_CargoOnly")) then {RydHQ_CargoOnly = []};
	if (isNil ("RydHQ_NoCargo")) then {RydHQ_NoCargo = []};
	if (isNil ("RydHQ_NoFlank")) then {RydHQ_NoFlank = []};
	if (isNil ("RydHQ_NoDef")) then {RydHQ_NoDef = []};
	if (isNil ("RydHQ_FirstToFight")) then {RydHQ_FirstToFight = []};
	if (isNil ("RydHQ_VoiceComm")) then {RydHQ_VoiceComm = true};
	if (isNil ("RydHQ_Front")) then {RydHQ_Front = false};
	if (isNil ("RydHQ_LRelocating")) then {RydHQ_LRelocating = false};
	if (isNil ("RydHQ_Flee")) then {RydHQ_Flee = true};
	if (isNil ("RydHQ_GarrR")) then {RydHQ_GarrR = 500};
	if (isNil ("RydHQ_Rush")) then {RydHQ_Rush = false};
	if (isNil ("RydHQ_GarrVehAb")) then {RydHQ_GarrVehAb = false};
	if (isNil ("RydHQ_DefendObjectives")) then {RydHQ_DefendObjectives = 4};
	if (isNil ("RydHQ_DefSpot")) then {RydHQ_DefSpot = []};
	if (isNil ("RydHQ_RecDefSpot")) then {RydHQ_RecDefSpot = []};
	if (isNil "RydHQ_Flare") then {RydHQ_Flare = true};
	if (isNil "RydHQ_Smoke") then {RydHQ_Smoke = true};
	if (isNil "RydHQ_NoRec") then {RydHQ_NoRec = 1};
	if (isNil "RydHQ_RapidCapt") then {RydHQ_RapidCapt = 10};
	if (isNil "RydHQ_Muu") then {RydHQ_Muu = 1};
	if (isNil "RydHQ_ArtyShells") then {RydHQ_ArtyShells = 120};
	if (isNil "RydHQ_Withdraw") then {RydHQ_Withdraw = 1};
	if (isNil "RydHQ_Berserk") then {RydHQ_Berserk = false};
	if (isNil "RydHQ_IDChance") then {RydHQ_IDChance = 100};
	if (isNil "RydHQ_RDChance") then {RydHQ_RDChance = 100};
	if (isNil "RydHQ_SDChance") then {RydHQ_SDChance = 100};
	if (isNil "RydHQ_AmmoDrop") then {RydHQ_AmmoDrop = []};
	if (isNil "RydHQ_SFTargets") then {RydHQ_SFTargets = []};
	if (isNil "RydHQ_LZ") then {RydHQ_LZ = false};
	if (isNil "RydHQ_SFBodyGuard") then {RydHQ_SFBodyGuard = []};
	if (isNil "RydHQ_DynForm") then {RydHQ_DynForm = false};
	if (isNil "RydHQ_UnlimitedCapt") then {RydHQ_UnlimitedCapt = false};
	if (isNil "RydHQ_CaptLimit") then {RydHQ_CaptLimit = 10};
	if (isNil "RydHQ_GetHQInside") then {RydHQ_GetHQInside = false};

	RydHQ_Friends = [];
	RydHQ_Enemies = [];
	RydHQ_KnEnemies = [];
	RydHQ_KnEnemiesG = [];
	RydHQ_FValue = 0;
	RydHQ_EValue = 0;

	if (RydxHQ_AIChatDensity > 0) then
		{
		_varName1 = "HAC_AIChatRep";
		_varName2 = "_West";

		switch ((side RydHQ)) do
			{
			case (east) : {_varName2 = "_East"};
			case (resistance) : {_varName2 = "_Guer"};
			};

		missionNamespace setVariable [_varName1 + _varName2,0];

		_varName1 = "HAC_AIChatLT";

		missionNamespace setVariable [_varName1 + _varName2,[0,""]]
		};

	if (RydHQ_NObj == 1) then {RydHQ_Obj = RydHQ_Obj1};
	if (RydHQ_NObj == 2) then {RydHQ_Obj = RydHQ_Obj2};
	if (RydHQ_NObj == 3) then {RydHQ_Obj = RydHQ_Obj3};
	if (RydHQ_NObj >= 4) then {RydHQ_Obj = RydHQ_Obj4};

	RydHQ_LastSub = RydHQ_Subordinated;
	RydHQ_Subordinated = [];

	_civF = ["CIV","CIV_RU","BIS_TK_CIV","BIS_CIV_special"];
	if not (isNil ("RydHQ_CivF")) then {_civF = RydHQ_CivF};

		{
		_isCaptive = _x getVariable ("isCaptive" + (str _x));
		if (isNil "_isCaptive") then {_isCaptive = false};

		_isCiv = false;
		if ((faction (leader _x)) in _civF) then {_isCiv = true};
		if not ((isNull (leaderHQ)) and not (isNull _x) and (alive (leaderHQ)) and (alive (leader _x)) and not (_isCaptive)) then
			{
			if (not (RydHQ_Front) and ((side _x) getFriend (side RydHQ) < 0.6) and not (_isCiv)) then {if not (_x in RydHQ_Enemies) then {RydHQ_Enemies set [(count RydHQ_Enemies), _x]}};
			_front = true;
			if not (isNil "FrontA") then {_front = ((getPosATL (vehicle (leader _x))) in FrontA)};
			if ((RydHQ_Front) and ((side _x) getFriend (side RydHQ) < 0.6) and (_front) and not (_isCiv)) then {if not (_x in RydHQ_Enemies) then {RydHQ_Enemies set [(count RydHQ_Enemies), _x]}};
			if (RydHQ_SubAll) then 
				{
				if not ((side _x) getFriend (side RydHQ) < 0.6) then 
					{
					if (not (_x in RydHQ_Friends) and not (((leader _x) in RydHQ_Excluded) or (_isCiv))) then {RydHQ_Friends set [(count RydHQ_Friends), _x]}
					};
				};
			}
		}
	foreach allGroups;

	RydHQ_Excl = [];

		{
		if not ((group _x) in RydHQ_Excl) then {RydHQ_Excl set [(count RydHQ_Excl),group _x]} 
		}
	foreach RydHQ_Excluded;

	if (RydHQ_SubSynchro) then 
		{
			{
			if ((_x in RydHQ_LastSub) and not ((leader _x) in (synchronizedObjects leaderHQ)) and (RydHQ_ReSynchro)) then {RydHQ_Subordinated set [(count RydHQ_Subordinated),_x]};
			if (not (_x in RydHQ_Subordinated) and ((leader _x) in (synchronizedObjects leaderHQ))) then {RydHQ_Subordinated set [(count RydHQ_Subordinated),_x]};
			}
		foreach allGroups;
		};

	if (RydHQ_SubNamed) then 
		{
			{
			for [{_i = 1},{_i <= RydHQ_NameLimit},{_i = _i + 1}] do
				{
				if (not (_x in RydHQ_Subordinated) and ((str (leader _x)) == ("Ryd" + str (_i)))) then {RydHQ_Subordinated set [(count RydHQ_Subordinated),_x]};
				};
			}
		foreach allGroups;
		};

	if (RydHQ_SubZero) then 
		{
			{
			if (((random 100) >= 50) and not (_x in RydHQ_Subordinated)) then {RydHQ_Subordinated set [(count RydHQ_Subordinated),_x]} else {if (not (_x in RydHQB_Subordinated)) then {RydHQB_Subordinated set [(count RydHQB_Subordinated),_x]}};
			}
		foreach allGroups;
		};

	RydHQ_Friends = RydHQ_Friends + RydHQ_Subordinated + RydHQ_Included - (RydHQ_ExcludedG + RydHQ_Excl);
	RydHQ_Friends = RydHQ_Friends - [RydHQ];
	RydHQ_NoWayD = allGroups - RydHQ_LastFriends;

	RydHQ_Friends = [RydHQ_Friends] call RYD_RandomOrd;

		{
		[_x] call RYD_WPdel;
		}
	foreach ((RydHQ_Excl + RydHQ_ExcludedG) - RydHQ_NoWayD);

	if (RydHQ_Init) then 
		{
			{
			RydHQ_CInitial = RydHQ_CInitial + (count (units _x))
			}
		foreach RydHQ_Friends + [RydHQ]
		};

	RydHQ_CLast = RydHQ_CCurrent;
	RydHQ_CCurrent = 0;
		{
		RydHQ_CCurrent = RydHQ_CCurrent + (count (units _x))
		}
	foreach RydHQ_Friends + [RydHQ];

	RydHQ_Ex = [];

	if (RydHQ_ExInfo) then 
		{
		RydHQ_Ex = RydHQ_Excl + RydHQ_ExcludedG
		};

		{
		for [{_a = 0},{_a < count (units _x)},{_a = _a + 1}] do
			{
			_enemyU = vehicle ((units _x) select _a);
				{
				if ((_x knowsAbout _enemyU) >= 0.05) exitwith 
					{
					if not (_enemyU in RydHQ_KnEnemies) then 
						{
						RydHQ_KnEnemies set [(count RydHQ_KnEnemies),_enemyU];
						};

					if not ((group _enemyU) in RydHQ_KnEnemiesG) then 
						{
						_already = missionnameSpace getVariable ["AlreadySpotted",[]];
						RydHQ_KnEnemiesG set [(count RydHQ_KnEnemiesG),(group _enemyU)];
						if not ((group _enemyU) in _already) then
							{
							_UL = (leader _x);if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_EnemySpot,"EnemySpot"] call RYD_AIChatter}};
							}
						}
					} 
				}
			foreach (RydHQ_Friends + [RydHQ] + RydHQ_Ex)
			}
		}
	foreach RydHQ_Enemies;

	_already = missionnameSpace getVariable ["AlreadySpotted",[]];

		{
		if not (_x in _already) then
			{
			_already set [(count _already),_x]
			}
		}
	foreach RydHQ_KnEnemiesG;

	missionnameSpace setVariable ["AlreadySpotted",_already];

	_lossFinal = RydHQ_CInitial - RydHQ_CCurrent;
	if (_lossFinal < 0) then {_lossFinal = 0;RydHQ_CInitial = RydHQ_CCurrent};

	if not (RydHQ_Init) then 
		{
		_lossP = _lossFinal/RydHQ_CInitial;

		if ((_OLmpl == 0) and ((count RydHQ_KnEnemies) > 0)) then
			{
			_OLmpl = 0.01;
			_firstMC = RydHQ_Cyclecount - 1
			};

		if ((_cycleCap < (50 / (1.01 - _lossP))) and ((count RydHQ_KnEnemies) == 0) and (_OLmpl == 0.01)) then
			{
			_cycleCap = _cycleCap + 1;
			if ((random 1) < _lossP) then {_firstMC = _firstMC + 1}
			}
		else
			{
			if not ((count RydHQ_KnEnemies) == 0) then
				{
				_cycleCap = 0;
				}
			};

		
		_lossPerc = _lossP * 100;
		_cycle = RydHQ_Cyclecount - _firstMC;

		_OLF = _OLmpl * (((-(_lossPerc * _lossPerc))/(1.1^_cycle)) + ((15 + (random 5) + (random 5))/(1 + _lossP)) - (_lossP * 10) + (_cycle ^ ((10 * (1 - _lossP))/_cycle)));

		_mplLU = 1;
		_lostU = RydHQ_CLast - RydHQ_CCurrent;
		if (_lostU < 0) then {_lostU = - _lostU;_mplLU = -1};

		_lossL = _mplLU * ((100 * _lostU/RydHQ_CInitial)^(1.55 + (random 0.05) + (random 0.05)))/10;

		_balanceF = 0.5 + (random 0.5) + (random 0.5) - _lossP - (count RydHQ_KnEnemies)/RydHQ_CCurrent;

		RydHQ_Morale = RydHQ_Morale + (_OLF - _lossL + _balanceF);
		//RydHQ_Morale = RydHQ_Morale + (((RydHQ_CCurrent - RydHQ_CInitial) * (6/(1 + (RydHQ_Cyclecount/25)))) + (6 * ((random 0.5) + RydHQ_CCurrent - RydHQ_CLast)))/((1 + (10*RydHQ_CInitial))/(1 + ((count RydHQ_KnEnemies) * 0.5)));
		//diag_log format ["Init: %2, Last: %3, Current: %3,Zmiana morale: %1",(((RydHQ_CCurrent - RydHQ_CInitial) * (6/(1 + (RydHQ_Cyclecount/25)))) + (6 * ((random 0.5) + RydHQ_CCurrent - RydHQ_CLast)))/((1 + (10*RydHQ_CInitial))/(1 + ((count RydHQ_KnEnemies) * 0.5))),RydHQ_CInitial,RydHQ_CLast,RydHQ_CCurrent];
		};

	if (RydHQ_Morale < -50) then {RydHQ_Morale = -50};
	if (RydHQ_Morale > 0) then {RydHQ_Morale = 0};
	if (RydHQ_Debug) then 
		{
		_mdbg = format ["Morale A (%2): %1 - losses: %3 percent (%4)",RydHQ_Morale,RydHQ_Personality,(round (((_lossFinal/RydHQ_CInitial) * 100) * 10)/10),_lossFinal];
		diag_log _mdbg;
		leaderHQ globalChat _mdbg;

		_cl = "<t color='#007f00'>A -> M: %1 - L: %2%3</t>";

		switch (side RydHQ) do
			{
			case (west) : {_cl = "<t color='#0d81c4'>A -> M: %1 - L: %2%3</t>"};
			case (east) : {_cl = "<t color='#ff0000'>A -> M: %1 - L: %2%3</t>"};
			};

		_dbgMon = parseText format [_cl,(round (RydHQ_Morale * 10))/10,(round (((_lossFinal/RydHQ_CInitial) * 100) * 10)/10),"%"];

		RydHQ setVariable ["DbgMon",_dbgMon];
		};

	if (RydHQ_Init) then {[RydHQ] spawn Desperado};

	RydHQ_Init = false;

		{
			{
			_SpecForcheck = false;
			_reconcheck = false;
			_FOcheck = false;
			_sniperscheck = false;
			_ATinfcheck = false;
			_AAinfcheck = false;
			_Infcheck = false;
			_Artcheck = false;
			_HArmorcheck = false;
			_MArmorcheck = false;
			_LArmorcheck = false;
			_LArmorATcheck = false;
			_Carscheck = false;
			_Aircheck = false;
			_BAircheck = false;
			_RAircheck = false;
			_NCAircheck = false;
			_Navalcheck = false;
			_Staticcheck = false;
			_StaticAAcheck = false;
			_StaticATcheck = false;
			_Supportcheck = false;
			_Cargocheck = false;
			_NCCargocheck = false;
			_Othercheck = true;

			_Crewcheck = false;
			_NCrewInfcheck = false;

			_tp = typeOf _x;
			_grp = group _x;
			_vh = vehicle _x;
			_asV = assignedvehicle _x;
			_grpD = group (assignedDriver _asV);
			_grpG = group (assignedGunner _asV);
			if (isNull _grpD) then {_grpD = _grpG};
			_Tvh = typeOf _vh;
			_TasV = typeOf _asV;

				if (((_grp == _grpD) and (_TasV in _specFor)) or (_tp in _specFor)) then {_SpecForcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _recon)) or (_tp in _recon)) then {_reconcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _FO)) or (_tp in _FO)) then {_FOcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _snipers)) or (_tp in _snipers)) then {_sniperscheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _ATinf)) or (_tp in _ATinf)) then {_ATinfcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _AAinf)) or (_tp in _AAinf)) then {_AAinfcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Inf)) or (_tp in _Inf)) then {_Infcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Art)) or (_tp in _Art)) then {_Artcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _HArmor)) or (_tp in _HArmor)) then {_HArmorcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _MArmor)) or (_tp in _MArmor)) then {_MArmorcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _LArmor)) or (_tp in _LArmor)) then {_LArmorcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _LArmorAT)) or (_tp in _LArmorAT)) then {_LArmorATcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Cars)) or (_tp in _Cars)) then {_Carscheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Air)) or (_tp in _Air)) then {_Aircheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _BAir)) or (_tp in _BAir)) then {_BAircheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _RAir)) or (_tp in _RAir)) then {_RAircheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _NCAir)) or (_tp in _NCAir)) then {_NCAircheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Naval)) or (_tp in _Naval)) then {_Navalcheck = true;_Othercheck = false};
				if (((_grp == _grpG) and (_TasV in _Static)) or (_tp in _Static)) then {_Staticcheck = true;_Othercheck = false};
				if (((_grp == _grpG) and (_TasV in _StaticAA)) or (_tp in _StaticAA)) then {_StaticAAcheck = true;_Othercheck = false};
				if (((_grp == _grpG) and (_TasV in _StaticAT)) or (_tp in _StaticAT)) then {_StaticATcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Cargo)) or (_tp in _Cargo)) then {_Cargocheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _NCCargo)) or (_tp in _NCCargo)) then {_NCCargocheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Crew)) or (_tp in _Crew)) then {_Crewcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _NCrewInf)) or (_tp in _NCrewInf)) then {_NCrewInfcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Support)) or (_tp in _Support)) then {_Supportcheck = true;_NCrewInfcheck = false;_Othercheck = false};

				if ((_TasV in _NCCargo) and (_x == (assignedDriver _asV)) and ((count (units (group _x))) == 1) and not ((_ATinfcheck) or (_AAinfcheck) or (_reconcheck) or (_FOcheck) or (_sniperscheck))) then {_NCrewInfcheck = false;_Othercheck = false};

				if (_SpecForcheck) then {if not (_vh in RydHQ_SpecFor) then {RydHQ_SpecFor set [(count RydHQ_SpecFor),_vh]};if not (_grp in RydHQ_SpecForG) then {RydHQ_SpecForG set [(count RydHQ_SpecForG),_grp]}};
				if (_reconcheck) then {if not (_vh in RydHQ_recon) then {RydHQ_recon set [(count RydHQ_recon),_vh]};if not (_grp in RydHQ_reconG) then {RydHQ_reconG set [(count RydHQ_reconG),_grp]}};
				if (_FOcheck) then {if not (_vh in RydHQ_FO) then {RydHQ_FO set [(count RydHQ_FO),_vh]};if not (_grp in RydHQ_FOG) then {RydHQ_FOG set [(count RydHQ_FOG),_grp]}};
				if (_sniperscheck) then {if not (_vh in RydHQ_snipers) then {RydHQ_snipers set [(count RydHQ_snipers),_vh]};if not (_grp in RydHQ_snipersG) then {RydHQ_snipersG set [(count RydHQ_snipersG),_grp]}};
				if (_ATinfcheck) then {if not (_vh in RydHQ_ATinf) then {RydHQ_ATinf set [(count RydHQ_ATinf),_vh]};if not (_grp in RydHQ_ATinfG) then {RydHQ_ATinfG set [(count RydHQ_ATinfG),_grp]}};
				if (_AAinfcheck) then {if not (_vh in RydHQ_AAinf) then {RydHQ_AAinf set [(count RydHQ_AAinf),_vh]};if not (_grp in RydHQ_AAinfG) then {RydHQ_AAinfG set [(count RydHQ_AAinfG),_grp]}};
				if (_Infcheck) then {if not (_vh in RydHQ_Inf) then {RydHQ_FValue = RydHQ_FValue + 1;RydHQ_Inf set [(count RydHQ_Inf),_vh]};if not (_grp in RydHQ_InfG) then {RydHQ_InfG set [(count RydHQ_InfG),_grp]}};
				if (_Artcheck) then {if not (_vh in RydHQ_Art) then {RydHQ_FValue = RydHQ_FValue + 3;RydHQ_Art set [(count RydHQ_Art),_vh]};if not (_grp in RydHQ_ArtG) then {RydHQ_ArtG set [(count RydHQ_ArtG),_grp]}};
				if (_HArmorcheck) then {if not (_vh in RydHQ_HArmor) then {RydHQ_FValue = RydHQ_FValue + 10;RydHQ_HArmor set [(count RydHQ_HArmor),_vh]};if not (_grp in RydHQ_HArmorG) then {RydHQ_HArmorG set [(count RydHQ_HArmorG),_grp]}};
				if (_MArmorcheck) then {if not (_vh in RydHQ_MArmor) then {RydHQ_MArmor set [(count RydHQ_MArmor),_vh]};if not (_grp in RydHQ_MArmorG) then {RydHQ_MArmorG set [(count RydHQ_MArmorG),_grp]}};
				if (_LArmorcheck) then {if not (_vh in RydHQ_LArmor) then {RydHQ_FValue = RydHQ_FValue + 5;RydHQ_LArmor set [(count RydHQ_LArmor),_vh]};if not (_grp in RydHQ_LArmorG) then {RydHQ_LArmorG set [(count RydHQ_LArmorG),_grp]}};
				if (_LArmorATcheck) then {if not (_vh in RydHQ_LArmorAT) then {RydHQ_LArmorAT set [(count RydHQ_LArmorAT),_vh]};if not (_grp in RydHQ_LArmorATG) then {RydHQ_LArmorATG set [(count RydHQ_LArmorATG),_grp]}};
				if (_Carscheck) then {if not (_vh in RydHQ_Cars) then {RydHQ_FValue = RydHQ_FValue + 3;RydHQ_Cars set [(count RydHQ_Cars),_vh]};if not (_grp in RydHQ_CarsG) then {RydHQ_CarsG set [(count RydHQ_CarsG),_grp]}};
				if (_Aircheck) then {if not (_vh in RydHQ_Air) then {RydHQ_FValue = RydHQ_FValue + 15;RydHQ_Air set [(count RydHQ_Air),_vh]};if not (_grp in RydHQ_AirG) then {RydHQ_AirG set [(count RydHQ_AirG),_grp]}};
				if (_BAircheck) then {if not (_vh in RydHQ_BAir) then {RydHQ_BAir set [(count RydHQ_BAir),_vh]};if not (_grp in RydHQ_BAirG) then {RydHQ_BAirG set [(count RydHQ_BAirG),_grp]}};				
				if (_RAircheck) then {if not (_vh in RydHQ_RAir) then {RydHQ_RAir set [(count RydHQ_RAir),_vh]};if not (_grp in RydHQ_RAirG) then {RydHQ_RAirG set [(count RydHQ_RAirG),_grp]}};				
				if (_NCAircheck) then {if not (_vh in RydHQ_NCAir) then {RydHQ_NCAir set [(count RydHQ_NCAir),_vh]};if not (_grp in RydHQ_NCAirG) then {RydHQ_NCAirG set [(count RydHQ_NCAirG),_grp]}};
				if (_Navalcheck) then {if not (_vh in RydHQ_Naval) then {RydHQ_Naval set [(count RydHQ_Naval),_vh]};if not (_grp in RydHQ_NavalG) then {RydHQ_NavalG set [(count RydHQ_NavalG),_grp]}};
				if (_Staticcheck) then {if not (_vh in RydHQ_Static) then {RydHQ_FValue = RydHQ_FValue + 1;RydHQ_Static set [(count RydHQ_Static),_vh]};if not (_grp in RydHQ_StaticG) then {RydHQ_StaticG set [(count RydHQ_StaticG),_grp]}};
				if (_StaticAAcheck) then {if not (_vh in RydHQ_StaticAA) then {RydHQ_StaticAA set [(count RydHQ_StaticAA),_vh]};if not (_grp in RydHQ_StaticAAG) then {RydHQ_StaticAAG set [(count RydHQ_StaticAAG),_grp]}};
				if (_StaticATcheck) then {if not (_vh in RydHQ_StaticAT) then {RydHQ_StaticAT set [(count RydHQ_StaticAT),_vh]};if not (_grp in RydHQ_StaticATG) then {RydHQ_StaticATG set [(count RydHQ_StaticATG),_grp]}};
				if (_Supportcheck) then {if not (_vh in RydHQ_Support) then {RydHQ_Support set [(count RydHQ_Support),_vh]};if not (_grp in RydHQ_SupportG) then {RydHQ_SupportG set [(count RydHQ_SupportG),_grp]}};
				if (_Cargocheck) then {if not (_vh in RydHQ_Cargo) then {RydHQ_Cargo set [(count RydHQ_Cargo),_vh]};if not (_grp in RydHQ_CargoG) then {RydHQ_CargoG set [(count RydHQ_CargoG),_grp]}};
				if (_NCCargocheck) then {if not (_vh in RydHQ_NCCargo) then {RydHQ_NCCargo set [(count RydHQ_NCCargo),_vh]};if not (_grp in RydHQ_NCCargoG) then {RydHQ_NCCargoG set [(count RydHQ_NCCargoG),_grp]}};
				if (_Crewcheck) then {if not (_vh in RydHQ_Crew) then {RydHQ_Crew set [(count RydHQ_Crew),_vh]};if not (_grp in RydHQ_CrewG) then {RydHQ_CrewG set [(count RydHQ_CrewG),_grp]}};
				if (_NCrewInfcheck) then {if not (_vh in RydHQ_NCrewInf) then {RydHQ_NCrewInf set [(count RydHQ_NCrewInf),_vh]};if not (_grp in RydHQ_NCrewInfG) then {RydHQ_NCrewInfG set [(count RydHQ_NCrewInfG),_grp]}};
				
			}
		foreach (units _x)
		}
	foreach RydHQ_Friends;

	RydHQ_NCrewInfG = RydHQ_NCrewInfG - (RydHQ_RAirG + RydHQ_StaticG);
	RydHQ_NCrewInf = RydHQ_NCrewInf - (RydHQ_RAir + RydHQ_Static);
	RydHQ_InfG = RydHQ_InfG - (RydHQ_RAirG + RydHQ_StaticG);
	RydHQ_Inf = RydHQ_Inf - (RydHQ_RAir + RydHQ_Static);

	RydHQ_CargoAirEx = [];
	RydHQ_CargoLandEx = [];
	if (RydHQ_NoAirCargo) then {RydHQ_CargoAirEx = RydHQ_AirG};
	if (RydHQ_NoLandCargo) then {RydHQ_CargoLandEx = (RydHQ_CargoG - RydHQ_AirG)};
	RydHQ_CargoG = RydHQ_CargoG - (RydHQ_CargoAirEx + RydHQ_CargoLandEx + RydHQ_AmmoDrop);

		{
		if not (_x in RydHQ_SupportG) then
			{
			RydHQ_SupportG set [(count RydHQ_SupportG),_x]
			}
		}
	foreach RydHQ_AmmoDrop;
		
		{
			{
			_SpecForcheck = false;
			_reconcheck = false;
			_FOcheck = false;
			_sniperscheck = false;
			_ATinfcheck = false;
			_AAinfcheck = false;
			_Infcheck = false;
			_Artcheck = false;
			_HArmorcheck = false;
			_MArmorcheck = false;
			_LArmorcheck = false;
			_LArmorATcheck = false;
			_Carscheck = false;
			_Aircheck = false;
			_BAircheck = false;
			_RAircheck = false;
			_NCAircheck = false;
			_Navalcheck = false;
			_Staticcheck = false;
			_StaticAAcheck = false;
			_StaticATcheck = false;
			_Supportcheck = false;
			_Cargocheck = false;
			_NCCargocheck = false;
			_Cargocheck = false;
			_NCCargocheck = false;
			_Othercheck = true;

			_Crewcheck = false;
			_NCrewInfcheck = false;

			_tp = typeOf _x;
			_grp = group _x;
			_vh = vehicle _x;
			_asV = assignedvehicle _x;
			_grpD = group (assignedDriver _asV);
			_grpG = group (assignedGunner _asV);
			if (isNull _grpD) then {_grpD = _grpG};
			_Tvh = typeOf _vh;
			_TasV = typeOf _asV;

				if (((_grp == _grpD) and (_TasV in _specFor)) or (_tp in _specFor)) then {_SpecForcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _recon)) or (_tp in _recon)) then {_reconcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _FO)) or (_tp in _FO)) then {_FOcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _snipers)) or (_tp in _snipers)) then {_sniperscheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _ATinf)) or (_tp in _ATinf)) then {_ATinfcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _AAinf)) or (_tp in _AAinf)) then {_AAinfcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Inf)) or (_tp in _Inf)) then {_Infcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Art)) or (_tp in _Art)) then {_Artcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _HArmor)) or (_tp in _HArmor)) then {_HArmorcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _MArmor)) or (_tp in _MArmor)) then {_MArmorcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _LArmor)) or (_tp in _LArmor)) then {_LArmorcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _LArmorAT)) or (_tp in _LArmorAT)) then {_LArmorATcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Cars)) or (_tp in _Cars)) then {_Carscheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Air)) or (_tp in _Air)) then {_Aircheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _BAir)) or (_tp in _BAir)) then {_BAircheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _RAir)) or (_tp in _RAir)) then {_RAircheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _NCAir)) or (_tp in _NCAir)) then {_NCAircheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Naval)) or (_tp in _Naval)) then {_Navalcheck = true;_Othercheck = false};
				if (((_grp == _grpG) and (_TasV in _Static)) or (_tp in _Static)) then {_Staticcheck = true;_Othercheck = false};
				if (((_grp == _grpG) and (_TasV in _StaticAA)) or (_tp in _StaticAA)) then {_StaticAAcheck = true;_Othercheck = false};
				if (((_grp == _grpG) and (_TasV in _StaticAT)) or (_tp in _StaticAT)) then {_StaticATcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Cargo)) or (_tp in _Cargo)) then {_Cargocheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _NCCargo)) or (_tp in _NCCargo)) then {_NCCargocheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Crew)) or (_tp in _Crew)) then {_Crewcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _NCrewInf)) or (_tp in _NCrewInf)) then {_NCrewInfcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Support)) or (_tp in _Support)) then {_Supportcheck = true;_NCrewInfcheck = false;_Othercheck = false};

				if ((_TasV in _NCCargo) and (_x == (assignedDriver _asV)) and ((count (units (group _x))) == 1) and not ((_ATinfcheck) or (_AAinfcheck) or (_reconcheck) or (_FOcheck) or (_sniperscheck))) then {_NCrewInfcheck = false;_Othercheck = false};
				
				if (_SpecForcheck) then {if not (_vh in RydHQ_EnSpecFor) then {RydHQ_EnSpecFor set [(count RydHQ_EnSpecFor),_vh]};if not (_grp in RydHQ_EnSpecForG) then {RydHQ_EnSpecForG set [(count RydHQ_EnSpecForG),_grp]}};
				if (_reconcheck) then {if not (_vh in RydHQ_Enrecon) then {RydHQ_Enrecon set [(count RydHQ_Enrecon),_vh]};if not (_grp in RydHQ_EnreconG) then {RydHQ_EnreconG set [(count RydHQ_EnreconG),_grp]}};
				if (_FOcheck) then {if not (_vh in RydHQ_EnFO) then {RydHQ_EnFO set [(count RydHQ_EnFO),_vh]};if not (_grp in RydHQ_EnFOG) then {RydHQ_EnFOG set [(count RydHQ_EnFOG),_grp]}};
				if (_sniperscheck) then {if not (_vh in RydHQ_Ensnipers) then {RydHQ_Ensnipers set [(count RydHQ_Ensnipers),_vh]};if not (_grp in RydHQ_EnsnipersG) then {RydHQ_EnsnipersG set [(count RydHQ_EnsnipersG),_grp]}};
				if (_ATinfcheck) then {if not (_vh in RydHQ_EnATinf) then {RydHQ_EnATinf set [(count RydHQ_EnATinf),_vh]};if not (_grp in RydHQ_EnATinfG) then {RydHQ_EnATinfG set [(count RydHQ_EnATinfG),_grp]}};
				if (_AAinfcheck) then {if not (_vh in RydHQ_EnAAinf) then {RydHQ_EnAAinf set [(count RydHQ_EnAAinf),_vh]};if not (_grp in RydHQ_EnAAinfG) then {RydHQ_EnAAinfG set [(count RydHQ_EnAAinfG),_grp]}};
				if (_Infcheck) then {if not (_vh in RydHQ_EnInf) then {RydHQ_EValue = RydHQ_EValue + 1;RydHQ_EnInf set [(count RydHQ_EnInf),_vh]};if not (_grp in RydHQ_EnInfG) then {RydHQ_EnInfG set [(count RydHQ_EnInfG),_grp]}};
				if (_Artcheck) then {if not (_vh in RydHQ_EnArt) then {RydHQ_EValue = RydHQ_EValue + 3;RydHQ_EnArt set [(count RydHQ_EnArt),_vh]};if not (_grp in RydHQ_EnArtG) then {RydHQ_EnArtG set [(count RydHQ_EnArtG),_grp]}};
				if (_HArmorcheck) then {if not (_vh in RydHQ_EnHArmor) then {RydHQ_EValue = RydHQ_EValue + 10;RydHQ_EnHArmor set [(count RydHQ_EnHArmor),_vh]};if not (_grp in RydHQ_EnHArmorG) then {RydHQ_EnHArmorG set [(count RydHQ_EnHArmorG),_grp]}};
				if (_MArmorcheck) then {if not (_vh in RydHQ_EnMArmor) then {RydHQ_EnMArmor set [(count RydHQ_EnMArmor),_vh]};if not (_grp in RydHQ_EnMArmorG) then {RydHQ_EnMArmorG set [(count RydHQ_EnMArmorG),_grp]}};
				if (_LArmorcheck) then {if not (_vh in RydHQ_EnLArmor) then {RydHQ_EValue = RydHQ_EValue + 5;RydHQ_EnLArmor set [(count RydHQ_EnLArmor),_vh]};if not (_grp in RydHQ_EnLArmorG) then {RydHQ_EnLArmorG set [(count RydHQ_EnLArmorG),_grp]}};
				if (_LArmorATcheck) then {if not (_vh in RydHQ_EnLArmorAT) then {RydHQ_EnLArmorAT set [(count RydHQ_EnLArmorAT),_vh]};if not (_grp in RydHQ_EnLArmorATG) then {RydHQ_EnLArmorATG set [(count RydHQ_EnLArmorATG),_grp]}};
				if (_Carscheck) then {if not (_vh in RydHQ_EnCars) then {RydHQ_EValue = RydHQ_EValue + 3;RydHQ_EnCars set [(count RydHQ_EnCars),_vh]};if not (_grp in RydHQ_EnCarsG) then {RydHQ_EnCarsG set [(count RydHQ_EnCarsG),_grp]}};
				if (_Aircheck) then {if not (_vh in RydHQ_EnAir) then {RydHQ_EValue = RydHQ_EValue + 15;RydHQ_EnAir set [(count RydHQ_EnAir),_vh]};if not (_grp in RydHQ_EnAirG) then {RydHQ_EnAirG set [(count RydHQ_EnAirG),_grp]}};
				if (_BAircheck) then {if not (_vh in RydHQ_EnBAir) then {RydHQ_EnBAir set [(count RydHQ_EnBAir),_vh]};if not (_grp in RydHQ_EnBAirG) then {RydHQ_EnBAirG set [(count RydHQ_EnBAirG),_grp]}};				
				if (_RAircheck) then {if not (_vh in RydHQ_EnRAir) then {RydHQ_EnRAir set [(count RydHQ_EnRAir),_vh]};if not (_grp in RydHQ_EnRAirG) then {RydHQ_EnRAirG set [(count RydHQ_EnRAirG),_grp]}};
				if (_NCAircheck) then {if not (_vh in RydHQ_EnNCAir) then {RydHQ_EnNCAir set [(count RydHQ_EnNCAir),_vh]};if not (_grp in RydHQ_EnNCAirG) then {RydHQ_EnNCAirG set [(count RydHQ_EnNCAirG),_grp]}};
				if (_Navalcheck) then {if not (_vh in RydHQ_EnNaval) then {RydHQ_EnNaval set [(count RydHQ_EnNaval),_vh]};if not (_grp in RydHQ_EnNavalG) then {RydHQ_EnNavalG set [(count RydHQ_EnNavalG),_grp]}};
				if (_Staticcheck) then {if not (_vh in RydHQ_EnStatic) then {RydHQ_EValue = RydHQ_EValue + 1;RydHQ_EnStatic set [(count RydHQ_EnStatic),_vh]};if not (_grp in RydHQ_EnStaticG) then {RydHQ_EnStaticG set [(count RydHQ_EnStaticG),_grp]}};
				if (_StaticAAcheck) then {if not (_vh in RydHQ_EnStaticAA) then {RydHQ_EnStaticAA set [(count RydHQ_EnStaticAA),_vh]};if not (_grp in RydHQ_EnStaticAAG) then {RydHQ_EnStaticAAG set [(count RydHQ_EnStaticAAG),_grp]}};
				if (_StaticATcheck) then {if not (_vh in RydHQ_EnStaticAT) then {RydHQ_EnStaticAT set [(count RydHQ_EnStaticAT),_vh]};if not (_grp in RydHQ_EnStaticATG) then {RydHQ_EnStaticATG set [(count RydHQ_EnStaticATG),_grp]}};
				if (_Supportcheck) then {if not (_vh in RydHQ_EnSupport) then {RydHQ_EnSupport set [(count RydHQ_EnSupport),_vh]};if not (_grp in RydHQ_EnSupportG) then {RydHQ_EnSupportG set [(count RydHQ_EnSupportG),_grp]}};
				if (_Cargocheck) then {if not (_vh in RydHQ_EnCargo) then {RydHQ_EnCargo set [(count RydHQ_EnCargo),_vh]};if not (_grp in RydHQ_EnCargoG) then {RydHQ_EnCargoG set [(count RydHQ_EnCargoG),_grp]}};
				if (_NCCargocheck) then {if not (_vh in RydHQ_EnNCCargo) then {RydHQ_EnNCCargo set [(count RydHQ_EnNCCargo),_vh]};if not (_grp in RydHQ_EnNCCargoG) then {RydHQ_EnNCCargoG set [(count RydHQ_EnNCCargoG),_grp]}};
				if (_Crewcheck) then {if not (_vh in RydHQ_EnCrew) then {RydHQ_EnCrew set [(count RydHQ_EnCrew),_vh]};if not (_grp in RydHQ_EnCrewG) then {RydHQ_EnCrewG set [(count RydHQ_EnCrewG),_grp]}};
				if (_NCrewInfcheck) then {if not (_vh in RydHQ_EnNCrewInf) then {RydHQ_EnNCrewInf set [(count RydHQ_EnNCrewInf),_vh]};if not (_grp in RydHQ_EnNCrewInfG) then {RydHQ_EnNCrewInfG set [(count RydHQ_EnNCrewInfG),_grp]}};
				
			}
		foreach (units _x)
		}
	foreach RydHQ_KnEnemiesG;

	RydHQ_EnNCrewInfG = RydHQ_EnNCrewInfG - (RydHQ_EnRAirG + RydHQ_EnStaticG);
	RydHQ_EnNCrewInf = RydHQ_EnNCrewInf - (RydHQ_EnRAir + RydHQ_EnStatic);
	RydHQ_EnInfG = RydHQ_EnInfG - (RydHQ_EnRAirG + RydHQ_EnStaticG);
	RydHQ_EnInf = RydHQ_EnInf - (RydHQ_EnRAir + RydHQ_EnStatic);

	if (RydHQ_Flee) then
		{
		_AllCow = 0;
		_AllPanic = 0;

			{
			_cow = _x getVariable ("Cow" + (str _x));
			if (isNil ("_cow")) then {_cow = 0};

			_AllCow = _AllCow + _cow;

			_panic = _x getVariable ("inPanic" + (str _x));
			if (isNil ("_panic")) then {_panic = false};

			if (_panic) then {_AllPanic = _AllPanic + 1};
			}
		foreach RydHQ_Friends;

		if (_AllPanic == 0) then {_AllPanic = 1};
		_midCow = 0;
		if not ((count RydHQ_Friends) == 0) then {_midCow = _AllCow/(count RydHQ_Friends)};

			{
			_cowF = ((- RydHQ_Morale)/(50 + (random 25))) + (random (2 * _midCow)) - _midCow;
			_cowF = _cowF * RydHQ_Muu;
			if (_x in RydHQ_SpecForG) then {_cowF = _cowF - 0.8};
			if (_cowF < 0) then {_cowF = 0};
			if (_cowF > 1) then {_cowF = 1};
			_i = "";
			if (_cowF > 0.5) then
				{
				_UL = leader _x;
				if not (isPlayer _UL) then 
					{
					_inDanger = _x getVariable ["NearE",0];
					if (_inDanger > 0.05) then
						{
						if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_InFear,"InFear"] call RYD_AIChatter}
						}
					}
				};

			if (((random ((20 + (RydHQ_Morale/5))/_AllPanic)) < _cowF) and ((random 100) > (100/(_AllPanic + 1)))) then 
				{
				[_x] call RYD_WPdel;
				_x setVariable [("inPanic" + (str _x)), true];
				if (RydHQ_DebugII) then {_i = [(getPosATL (vehicle (leader _x))),_x,"markPanic","ColorYellow","ICON","DOT","A!","A!",[0.5,0.5]] call RYD_Mark};
				_x setVariable [("Busy" + (str _x)), true];

				_UL = leader _x;
				if not (isPlayer _UL) then 
					{
					if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_InPanic,"InPanic"] call RYD_AIChatter}
					};

				if (RydHQ_Surr) then
					{
					if ((random 100) > 50) then
						{
						if (RydHQ_DebugII) then {_i setMarkerColor "ColorPink";_i setMarkerText "A!!!"};
						_isCaptive = _x getVariable ("isCaptive" + (str _x));
						if (isNil "_isCaptive") then {_isCaptive = false};
						if not (_isCaptive) then
							{
							[_x] spawn
								{
								_gp = _this select 0;

								_gp setVariable [("isCaptive" + (str _gp)), true];

								(units _gp) orderGetIn false;
								(units _gp) allowGetin false;

									{
									[_x] spawn
										{
										_unit = _this select 0;

										sleep (random 1);
										if (isPlayer _unit) exitWith {};

										_unit setCaptive true;
										unassignVehicle _unit;

										for [{_a = 0},{_a < (count (weapons _unit))},{_a = _a + 1}] do
											{
											_weapon = (weapons _unit) select _a;
											_unit Action ["dropWeapon", _unit, _weapon] 
											};

										_unit PlayAction "Surrender"
										}
									}
								foreach (units _gp)
								}
							}
						}
					}
				};

			_panic = _x getVariable ("inPanic" + (str _x));
			if (isNil ("_panic")) then {_panic = false};

			if not (_panic) then 
				{
				_x allowFleeing _cowF;
				_x setVariable [("Cow" + (str _x)),_cowF,true];
				} 
			else 
				{
				_x allowFleeing 1; 
				_x setVariable [("Cow" + (str _x)),1,true];
				if ((random 1.1) > _cowF) then 
					{
					_isCaptive = _x getVariable ("isCaptive" + (str _x));
					if (isNil "_isCaptive") then {_isCaptive = false};
					_x setVariable [("inPanic" + (str _x)), false];
					if not (_isCaptive) then {_x setVariable [("Busy" + (str _x)), false]};
					}
				}
			}
		foreach RydHQ_Friends
		};

		{
		RydHQ_KnEnPos set [(count RydHQ_KnEnPos),getPosATL (vehicle (leader _x))];
		if ((count RydHQ_KnEnPos) >= 100) then {RydHQ_KnEnPos = RydHQ_KnEnPos - [RydHQ_KnEnPos select 0]};
		}
	foreach RydHQ_KnEnemiesG;

	for [{_z = 0},{_z < (count RydHQ_KnEnemies)},{_z = _z + 1}] do
		{
		_KnEnemy = RydHQ_KnEnemies select _z;
			{
			if ((_x knowsAbout _KnEnemy) > 0.01) then {RydHQ reveal [_KnEnemy,2]}
			}
		foreach RydHQ_Friends
		};

	if ((RydBB_Active) and (leaderHQ in (RydBBa_HQs + RydBBb_HQs))) then {[] call RYD_BBArrRefresh};

	if (RydHQ_Cyclecount == 1) then
		{
		[] spawn A_EnemyScan;
		if (RydHQ_ArtyShells > 0) then
			{
			[RydHQ_ArtG,RydHQ_ArtyShells] call RYD_ArtyPrep;
			};

		if ((RydBB_Active) and (leaderHQ in (RydBBa_HQs + RydBBb_HQs))) then 
			{
			RydHQ_readyForBB = true;
			RydxHQ_Done = true;
			if (leaderHQ in RydBBa_HQs) then 
				{
				waitUntil {sleep 0.1;(RydBBa_InitDone)}
				};

			if (leaderHQ in RydBBb_HQs) then 
				{
				waitUntil {sleep 0.1;(RydBBb_InitDone)}
				}
			}
		};

	if (((count RydHQ_KnEnemies) > 0) and ((count RydHQ_ArtG) > 0) and (RydHQ_ArtyShells > 0)) then {[RydHQ_ArtG,RydHQ_KnEnemies,(RydHQ_EnHArmor + RydHQ_EnMArmor + RydHQ_EnLArmor),RydHQ_Friends,RydHQ_Debug,leaderHQ] call RYD_CFF};

	if (isNil ("RydHQ_Order")) then {RydHQ_Order = "ATTACK"};
	_gauss100 = (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10);
	if ((((_gauss100 + RydHQ_Inertia + RydHQ_Morale) > ((RydHQ_EValue/(RydHQ_FValue + 0.1)) * 60)) and not (isNil ("RydHQ_Obj")) and not (RydHQ_Order == "DEFEND")) or (RydHQ_Berserk)) then 
		{
		_lastS = RydHQ getVariable ["LastStance","At"];
		if ((_lastS == "De") or (RydHQ_CycleCount == 1)) then
			{
			if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQ,RydxHQ_AIC_OffStance,"OffStance"] call RYD_AIChatter};
			};

		RydHQ setVariable ["LastStance","At"];
		RydHQ_Inertia = 30 * (0.5 + RydHQ_Consistency)*(0.5 + RydHQ_Activity);
		[] spawn A_HQOrders 
		} 
	else 
		{
		_lastS = RydHQ getVariable ["LastStance","De"];
		if ((_lastS == "At") or (RydHQ_CycleCount == 1)) then
			{
			if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQ,RydxHQ_AIC_DefStance,"DefStance"] call RYD_AIChatter};
			};

		RydHQ setVariable ["LastStance","De"];
		RydHQ_Inertia = - (30  * (0.5 + RydHQ_Consistency))/(0.5 + RydHQ_Activity);
		[] spawn A_HQOrdersDef 
		};


	if ((((RydHQ_Circumspection + RydHQ_Fineness)/2) + 0.1) > (random 1.2)) then
		{
		_SFcount = {not (_x getVariable ["Busy" + (str _x),false]) and not (_x getVariable ["Resting" + (str _x),false])} count (RydHQ_SpecForG - RydHQ_SFBodyGuard);

		if (_SFcount > 0) then
			{
			_isNight = [] call RYD_isNight;
			_SFTgts = [];
			_chance = 40 + (60 * RydHQ_Activity);

				{
				_HQ = group _x;
				if (_HQ in RydHQ_KnEnemiesG) then
					{
					_SFTgts set [(count _SFTgts),_HQ]
					}
				}
			foreach (RydxHQ_AllLeaders - [leaderHQ]);

			if ((count _SFTgts) == 0) then
				{
				_chance = _chance/2;
				_SFTgts = RydHQ_EnArtG
				};

			if ((count _SFTgts) == 0) then
				{
				_chance = _chance/3;
				_SFTgts = RydHQ_EnStaticG
				};

			if (_isNight) then
				{
				_chance = _chance + 25
				};

			if ((count _SFTgts) > 0) then
				{
				_chance = _chance + (((2 * _SFcount) - (8/(0.75 + (RydHQ_Recklessness/2)))) * 20);
				_trgG = _SFTgts select (floor (random (count _SFTgts)));
				_alreadyAttacked = {_x == _trgG} count RydHQ_SFTargets;
				_chance = _chance/(1 + _alreadyAttacked);
				if (_chance  < _SFcount) then 
					{
					_chance = _SFcount
					}
				else
					{
					if (_chance > (85 + _SFcount)) then
						{
						_chance = 85 + _SFcount
						}
					};

				if ((random 100) < _chance) then 
					{
					_SFAv = [];

						{
						_isBusy = _x getVariable ["Busy" + (str _x),false];

						if not (_isBusy) then
							{
							_isResting = _x getVariable ["Resting" + (str _x),false];

							if not (_isResting) then
								{
								if not (_x in RydHQ_SFBodyGuard) then
									{	
									_SFAv set [(count _SFAv),_x]
									}
								}
							}
						}
					foreach RydHQ_SpecForG;

					_team = _SFAv select (floor (random (count _SFAv)));
					_trg = vehicle (leader _trgG);
					if (not ((typeOf _trg) in (_HArmor + _LArmor)) or ((random 100) > (90 - (RydHQ_Recklessness * 10)))) then {[_team,_trg,_trgG] spawn A_GoSFAttack}
					}
				}
			}
		};

	if (RydHQ_LRelocating) then
		{
		if ((abs (speed (vehicle leaderHQ))) < 0.1) then {RydHQ setVariable ["onMove",false]};
		_onMove = RydHQ getVariable ["onMove",false];

		if not (_onMove) then 
			{
			if (not (isPlayer leaderHQ) and ((RydHQ_Cyclecount == 1) or not (RydHQ_Progress == 0))) then
				{
				[RydHQ] call RYD_WPdel;

				_Lpos = position leaderHQ;
				if (RydHQ_Cyclecount == 1) then {RydHQ_Fpos = _Lpos};

				_rds = 0;

				if (RydHQ_LRelocating) then 
					{
					_rds = 0;
					if (RydHQ_NObj == 1) then {_Lpos = RydHQ_Fpos;if (leaderHQ in (RydBBa_HQs + RydBBb_HQs)) then {_Lpos = position leaderHQ};_rds = 0};
					if (RydHQ_NObj == 2) then {_Lpos = position RydHQ_Obj1};
					if (RydHQ_NObj == 3) then {_Lpos = position RydHQ_Obj2};
					if (RydHQ_NObj >= 4) then {_Lpos = position RydHQ_Obj3};
					};

				_spd = "LIMITED";
				if (RydHQ_Progress == -1) then {_spd = "NORMAL"};
				RydHQ_Progress = 0;
				_enemyN = false;

					{
					_eLdr = vehicle (leader _x);
					_eDst = _eLdr distance _Lpos;

					if (_eDst < 600) exitWith {_enemyN = true}
					}
				foreach RydHQ_KnEnemiesG;

				if not (_enemyN) then 
					{
					_wp = [RydHQ,_Lpos,"HOLD","AWARE","GREEN",_spd,["true",""],true,_rds,[0,0,0],"FILE"] call RYD_WPadd;
					if (isNull (assignedVehicle leaderHQ)) then
						{
						if (RydHQ_GetHQInside) then {[_wp] call RYD_GoInside}
						};

					if ((RydHQ_LRelocating) and (RydHQ_NObj > 1) and (RydHQ_Cyclecount > 1)) then 
						{
						[_Lpos] spawn
							{
							_Lpos = _this select 0;
						
							_eDst = 1000;
							_onPlace = false;
							_getBack = false;

							waitUntil 
								{
								sleep 10;

									{
									_eLdr = vehicle (leader _x);
									_eDst = _eLdr distance _Lpos;

									if (_eDst < 600) exitWith {_getBack = true}
									}
								foreach RydHQ_KnEnemiesG;

								if (isNull RydHQ) then 
									{
									_onPlace = true
									}
								else
									{
									if not (_getBack) then
										{
										if (((vehicle leaderHQ) distance _LPos) < 30) then {_onPlace = true}
										}
									};
								

								((_getback) or (_onPlace))
								};

							if not (_onPlace) then
								{
								_rds = 30;
								if (RydHQ_NObj <= 2) then {_Lpos = getPosATL (vehicle leaderHQ);_rds = 0};
								if (RydHQ_NObj == 3) then {_Lpos = position RydHQ_Obj1};
								if (RydHQ_NObj >= 4) then {_Lpos = position RydHQ_Obj2};

								_getBack = false;

									{
									_eLdr = vehicle (leader _x);
									_eDst = _eLdr distance _Lpos;

									if (_eDst < 600) exitWith {_getBack = true}
									}
								foreach RydHQ_KnEnemiesG;

								if (_getBack) then {_Lpos = getPosATL (vehicle leaderHQ);_rds = 0};

								[RydHQ] call RYD_WPdel;	

								_spd = "NORMAL";
								if not (((vehicle leaderHQ) distance _LPos) < 50) then {_spd = "FULL"};
								_wp = [RydHQ,_Lpos,"HOLD","AWARE","GREEN",_spd,["true",""],true,_rds,[0,0,0],"FILE"] call RYD_WPadd;
								if (isNull (assignedVehicle leaderHQ)) then
									{
									if (RydHQ_GetHQInside) then {[_wp] call RYD_GoInside}
									};

								RydHQ setVariable ["onMove",true];
								}
							}
						}
					}
				}
			}
		};

	if (isNil ("RydHQ_CommDelay")) then {RydHQ_CommDelay = 1};
	_delay = (((22.5 + (count RydHQ_Friends))/(0.5 + RydHQ_Reflex)) * RydHQ_CommDelay);
	sleep _delay;

		{
		RydHQ reveal vehicle (leader _x)
		}
	foreach RydHQ_Friends;

	for [{_z = 0},{_z < (count RydHQ_KnEnemies)},{_z = _z + 1}] do
		{
		_KnEnemy = RydHQ_KnEnemies select _z;

			{
			if ((_x knowsAbout _KnEnemy) > 0.01) then {RydHQ reveal [_KnEnemy,2]} 
			}
		foreach RydHQ_Friends
		}
	};