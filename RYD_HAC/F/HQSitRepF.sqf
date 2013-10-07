
RydHQF = GrpNull;

RydHQF = group leaderHQF;

leaderHQF kbAddTopic ["orders","RYD_HAC\topics.bikb",""];
waituntil {(leaderHQF kbHasTopic "orders")};

RydHQF_Cyclecount = 0;

waituntil {not (isNull RydHQF)};

RydHQF_PersDone = false;
[] spawn F_Personality;
waituntil {RydHQF_PersDone};

RydHQF_LHQInit = false;
[] spawn F_LHQ;
waituntil {RydHQF_LHQInit};

if (isNil ("RydHQF_Boxed")) then {RydHQF_Boxed = []};
if (isNil ("RydHQF_AmmoBoxes")) then 
	{
	RydHQF_AmmoBoxes = [];

	if not (isNil "RydHQF_AmmoDepot") then 
		{
		_rds = (triggerArea RydHQF_AmmoDepot) select 0;
		RydHQF_AmmoBoxes = (getPosATL RydHQF_AmmoDepot) nearObjects ["ReammoBox",_rds]
		}
	};

[] spawn F_HQReset;
[] spawn F_Rev;
[] spawn F_SuppMed;
[] spawn F_SuppFuel;
[] spawn F_SuppAmmo;
[] spawn F_SuppRep;
[] spawn F_SFIdleOrd;
[] spawn F_Reloc;
[] spawn F_LPos;

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
RydHQF_NCVeh = _NCCargo + (_Support - ["MH60S"]);

[(_snipers + _ATinf + _AAinf)] spawn F_Garrison;

RydHQF_ReconDone = false;
RydHQF_DefDone = false;
RydHQF_ReconStage = 1;
RydHQF_KnEnPos = [];
RydHQF_AirInDef = [];
if (isNil ("RydHQF_Excluded")) then {RydHQF_Excluded = []};
if (isNil ("RydHQF_Fast")) then {RydHQF_Fast = false};
if (isNil ("RydHQF_ExInfo")) then {RydHQF_ExInfo = false};
if (isNil ("RydHQF_ObjHoldTime")) then {RydHQF_ObjHoldTime = 600};
if (isNil "RydHQF_NObj") then {RydHQF_NObj = 1};

RydHQF_Init = true;

RydHQF_Inertia = 0;
RydHQF_Morale = 0;
RydHQF_CInitial = 0;
RydHQF_CLast = 0;
RydHQF_CCurrent = 0;
RydHQF_CIMoraleC = 0;
RydHQF_CLMoraleC = 0;
RydHQF_Surrender = false;

RydHQF_FirstEMark = true;
RydHQF_LastE = 0;
RydHQF_FlankingInit = false;
RydHQF_FlankingDone = false;
RydHQF_Progress = 0;

RydHQF_AAthreat = [];
RydHQF_ATthreat = [];
RydHQF_Airthreat = [];
RydHQF_Exhausted = [];

_lastHQ = leaderHQF;
_OLmpl = 0;
_cycleCap = 0;
_firstMC = 0; 
_wp = [];

while {not ((isNull RydHQF) or (RydHQF_Surrender))} do
	{
	if not (RydHQF_Fast) then {waituntil {sleep 0.1;((RydxHQ_Done) and (RydxHQB_Done) and (RydxHQC_Done) and (RydxHQD_Done) and (RydxHQE_Done) and (RydxHQF_Done) and (RydxHQG_Done) and (RydxHQH_Done))}};
	if (isNil ("RydHQF_SupportWP")) then {RydHQF_SupportWP = false};

	if (RydHQF_Cyclecount > 1) then
		{
		if not (_lastHQ == leaderHQF) then {sleep (60 + (random 60))};
		};

	_lastHQ = leaderHQF;
	RydHQF_Cyclecount = RydHQF_Cyclecount + 1;
	RydxHQ_Done = false;

	RydHQF_SpecFor = [];
	RydHQF_recon = [];
	RydHQF_FO = [];
	RydHQF_snipers = [];
	RydHQF_ATinf = [];
	RydHQF_AAinf = [];
	RydHQF_Inf = [];
	RydHQF_Art = [];
	RydHQF_HArmor = [];
	RydHQF_MArmor = [];
	RydHQF_LArmor = [];
	RydHQF_LArmorAT = [];
	RydHQF_Cars = [];
	RydHQF_Air = [];
	RydHQF_BAir = [];
	RydHQF_RAir = [];
	RydHQF_NCAir = [];
	RydHQF_Naval = [];
	RydHQF_Static = [];
	RydHQF_StaticAA = [];
	RydHQF_StaticAT = [];
	RydHQF_Support = [];
	RydHQF_Cargo = [];
	RydHQF_NCCargo = [];
	RydHQF_Other = [];
	RydHQF_Crew = [];
	RydHQF_NCrewInf = [];

	RydHQF_SpecForG = [];
	RydHQF_reconG = [];
	RydHQF_FOG = [];
	RydHQF_snipersG = [];
	RydHQF_ATinfG = [];
	RydHQF_AAinfG = [];
	RydHQF_InfG = [];
	RydHQF_ArtG = [];
	RydHQF_HArmorG = [];
	RydHQF_MArmorG = [];
	RydHQF_LArmorG = [];
	RydHQF_LArmorATG = [];
	RydHQF_CarsG = [];
	RydHQF_AirG = [];
	RydHQF_BAirG = [];
	RydHQF_RAirG = [];
	RydHQF_NCAirG = [];
	RydHQF_NavalG = [];
	RydHQF_StaticG = [];
	RydHQF_StaticAAG = [];
	RydHQF_StaticATG = [];
	RydHQF_SupportG = [];
	RydHQF_CargoG = [];
	RydHQF_NCCargoG = [];
	RydHQF_OtherG = [];
	RydHQF_CrewG = [];
	RydHQF_NCrewInfG = [];

	RydHQF_EnSpecFor = [];
	RydHQF_Enrecon = [];
	RydHQF_EnFO = [];
	RydHQF_Ensnipers = [];
	RydHQF_EnATinf = [];
	RydHQF_EnAAinf = [];
	RydHQF_EnInf = [];
	RydHQF_EnArt = [];
	RydHQF_EnHArmor = [];
	RydHQF_EnMArmor = [];
	RydHQF_EnLArmor = [];
	RydHQF_EnLArmorAT = [];
	RydHQF_EnCars = [];
	RydHQF_EnAir = [];
	RydHQF_EnBAir = [];
	RydHQF_EnRAir = [];
	RydHQF_EnNCAir = [];
	RydHQF_EnNaval = [];
	RydHQF_EnStatic = [];
	RydHQF_EnStaticAA = [];
	RydHQF_EnStaticAT = [];
	RydHQF_EnSupport = [];
	RydHQF_EnCargo = [];
	RydHQF_EnNCCargo = [];
	RydHQF_EnOther = [];
	RydHQF_EnCrew = [];
	RydHQF_EnNCrewInf = [];

	RydHQF_EnSpecForG = [];
	RydHQF_EnreconG = [];
	RydHQF_EnFOG = [];
	RydHQF_EnsnipersG = [];
	RydHQF_EnATinfG = [];
	RydHQF_EnAAinfG = [];
	RydHQF_EnInfG = [];
	RydHQF_EnArtG = [];
	RydHQF_EnHArmorG = [];
	RydHQF_EnMArmorG = [];
	RydHQF_EnLArmorG = [];
	RydHQF_EnLArmorATG = [];
	RydHQF_EnCarsG = [];
	RydHQF_EnAirG = [];
	RydHQF_EnBAirG = [];
	RydHQF_EnRAirG = [];
	RydHQF_EnNCAirG = [];
	RydHQF_EnNavalG = [];
	RydHQF_EnStaticG = [];
	RydHQF_EnStaticAAG = [];
	RydHQF_EnStaticATG = [];
	RydHQF_EnSupportG = [];
	RydHQF_EnCargoG = [];
	RydHQF_EnNCCargoG = [];
	RydHQF_EnOtherG = [];
	RydHQF_EnCrewG = [];
	RydHQF_EnNCrewInfG = [];

	RydHQF_LastE = count RydHQF_KnEnemies;
	RydHQF_LastFriends = RydHQF_Friends;

	if (isNil ("RydHQF_NoAirCargo")) then {RydHQF_NoAirCargo = false};
	if (isNil ("RydHQF_NoLandCargo")) then {RydHQF_NoLandCargo = false};
	if (isNil ("RydHQF_LastFriends")) then {RydHQF_LastFriends = []};
	if (isNil ("RydHQF_CargoFind")) then {RydHQF_CargoFind = 0};
	if (isNil ("RydHQF_Subordinated")) then {RydHQF_Subordinated = []};
	if (isNil ("RydHQF_Included")) then {RydHQF_Included = []};
	if (isNil ("RydHQF_ExcludedG")) then {RydHQF_ExcludedG = []};
	if (isNil ("RydHQF_SubAll")) then {RydHQF_SubAll = true};
	if (isNil ("RydHQF_SubSynchro")) then {RydHQF_SubSynchro = false};
	if (isNil ("RydHQF_SubNamed")) then {RydHQF_SubNamed = false};
	if (isNil ("RydHQF_SubZero")) then {RydHQF_SubZero = false};
	if (isNil ("RydHQF_ReSynchro")) then {RydHQF_ReSynchro = true};
	if (isNil ("RydHQF_NameLimit")) then {RydHQF_NameLimit = 100};
	if (isNil ("RydHQF_Surr")) then {RydHQF_Surr = false};
	if (isNil ("RydHQF_AOnly")) then {RydHQF_AOnly = []};
	if (isNil ("RydHQF_ROnly")) then {RydHQF_ROnly = []};
	if (isNil ("RydHQF_CargoOnly")) then {RydHQF_CargoOnly = []};
	if (isNil ("RydHQF_NoCargo")) then {RydHQF_NoCargo = []};
	if (isNil ("RydHQF_NoFlank")) then {RydHQF_NoFlank = []};
	if (isNil ("RydHQF_NoDef")) then {RydHQF_NoDef = []};
	if (isNil ("RydHQF_FirstToFight")) then {RydHQF_FirstToFight = []};
	if (isNil ("RydHQF_VoiceComm")) then {RydHQF_VoiceComm = true};
	if (isNil ("RydHQF_Front")) then {RydHQF_Front = false};
	if (isNil ("RydHQF_LRelocating")) then {RydHQF_LRelocating = false};
	if (isNil ("RydHQF_Flee")) then {RydHQF_Flee = true};
	if (isNil ("RydHQF_GarrR")) then {RydHQF_GarrR = 500};
	if (isNil ("RydHQF_Rush")) then {RydHQF_Rush = false};
	if (isNil ("RydHQF_GarrVehAb")) then {RydHQF_GarrVehAb = false};
	if (isNil ("RydHQF_DefendObjectives")) then {RydHQF_DefendObjectives = 4};
	if (isNil ("RydHQF_DefSpot")) then {RydHQF_DefSpot = []};
	if (isNil ("RydHQF_RecDefSpot")) then {RydHQF_RecDefSpot = []};
	if (isNil "RydHQF_Flare") then {RydHQF_Flare = true};
	if (isNil "RydHQF_Smoke") then {RydHQF_Smoke = true};
	if (isNil "RydHQF_NoRec") then {RydHQF_NoRec = 1};
	if (isNil "RydHQF_RapidCapt") then {RydHQF_RapidCapt = 10};
	if (isNil "RydHQF_Muu") then {RydHQF_Muu = 1};
	if (isNil "RydHQF_ArtyShells") then {RydHQF_ArtyShells = 120};
	if (isNil "RydHQF_Withdraw") then {RydHQF_Withdraw = 1};
	if (isNil "RydHQF_Berserk") then {RydHQF_Berserk = false};
	if (isNil "RydHQF_IDChance") then {RydHQF_IDChance = 100};
	if (isNil "RydHQF_RDChance") then {RydHQF_RDChance = 100};
	if (isNil "RydHQF_SDChance") then {RydHQF_SDChance = 100};
	if (isNil "RydHQF_AmmoDrop") then {RydHQF_AmmoDrop = []};
	if (isNil "RydHQF_SFTargets") then {RydHQF_SFTargets = []};
	if (isNil "RydHQF_LZ") then {RydHQF_LZ = false};
	if (isNil "RydHQF_SFBodyGuard") then {RydHQF_SFBodyGuard = []};
	if (isNil "RydHQF_DynForm") then {RydHQF_DynForm = false};
	if (isNil "RydHQF_UnlimitedCapt") then {RydHQF_UnlimitedCapt = false};
	if (isNil "RydHQF_CaptLimit") then {RydHQF_CaptLimit = 10};
	if (isNil "RydHQF_GetHQInside") then {RydHQF_GetHQInside = false};

	RydHQF_Friends = [];
	RydHQF_Enemies = [];
	RydHQF_KnEnemies = [];
	RydHQF_KnEnemiesG = [];
	RydHQF_FValue = 0;
	RydHQF_EValue = 0;

	if (RydxHQ_AIChatDensity > 0) then
		{
		_varName1 = "HAC_AIChatRep";
		_varName2 = "_West";

		switch ((side RydHQF)) do
			{
			case (east) : {_varName2 = "_East"};
			case (resistance) : {_varName2 = "_Guer"};
			};

		missionNamespace setVariable [_varName1 + _varName2,0];

		_varName1 = "HAC_AIChatLT";

		missionNamespace setVariable [_varName1 + _varName2,[0,""]]
		};

	if (RydHQF_NObj == 1) then {RydHQF_Obj = RydHQF_Obj1};
	if (RydHQF_NObj == 2) then {RydHQF_Obj = RydHQF_Obj2};
	if (RydHQF_NObj == 3) then {RydHQF_Obj = RydHQF_Obj3};
	if (RydHQF_NObj >= 4) then {RydHQF_Obj = RydHQF_Obj4};

	RydHQF_LastSub = RydHQF_Subordinated;
	RydHQF_Subordinated = [];

	_civF = ["CIV","CIV_RU","BIS_TK_CIV","BIS_CIV_special"];
	if not (isNil ("RydHQF_CivF")) then {_civF = RydHQF_CivF};

		{
		_isCaptive = _x getVariable ("isCaptive" + (str _x));
		if (isNil "_isCaptive") then {_isCaptive = false};

		_isCiv = false;
		if ((faction (leader _x)) in _civF) then {_isCiv = true};
		if not ((isNull (leaderHQF)) and not (isNull _x) and (alive (leaderHQF)) and (alive (leader _x)) and not (_isCaptive)) then
			{
			if (not (RydHQF_Front) and ((side _x) getFriend (side RydHQF) < 0.6) and not (_isCiv)) then {if not (_x in RydHQF_Enemies) then {RydHQF_Enemies set [(count RydHQF_Enemies), _x]}};
			_front = true;
			if not (isNil "FrontF") then {_front = ((getPosATL (vehicle (leader _x))) in FrontF)};
			if ((RydHQF_Front) and ((side _x) getFriend (side RydHQF) < 0.6) and (_front) and not (_isCiv)) then {if not (_x in RydHQF_Enemies) then {RydHQF_Enemies set [(count RydHQF_Enemies), _x]}};
			if (RydHQF_SubAll) then 
				{
				if not ((side _x) getFriend (side RydHQF) < 0.6) then 
					{
					if (not (_x in RydHQF_Friends) and not (((leader _x) in RydHQF_Excluded) or (_isCiv))) then {RydHQF_Friends set [(count RydHQF_Friends), _x]}
					};
				};
			}
		}
	foreach allGroups;

	RydHQF_Excl = [];

		{
		if not ((group _x) in RydHQF_Excl) then {RydHQF_Excl set [(count RydHQF_Excl),group _x]} 
		}
	foreach RydHQF_Excluded;

	if (RydHQF_SubSynchro) then 
		{
			{
			if ((_x in RydHQF_LastSub) and not ((leader _x) in (synchronizedObjects leaderHQF)) and (RydHQF_ReSynchro)) then {RydHQF_Subordinated set [(count RydHQF_Subordinated),_x]};
			if (not (_x in RydHQF_Subordinated) and ((leader _x) in (synchronizedObjects leaderHQF))) then {RydHQF_Subordinated set [(count RydHQF_Subordinated),_x]};
			}
		foreach allGroups;
		};

	if (RydHQF_SubNamed) then 
		{
			{
			for [{_i = 1},{_i <= RydHQF_NameLimit},{_i = _i + 1}] do
				{
				if (not (_x in RydHQF_Subordinated) and ((str (leader _x)) == ("RydF" + str (_i)))) then {RydHQF_Subordinated set [(count RydHQF_Subordinated),_x]};
				};
			}
		foreach allGroups;
		};

	if (RydHQF_SubZero) then 
		{
			{
			if (((random 100) >= 50) and not (_x in RydHQF_Subordinated)) then {RydHQF_Subordinated set [(count RydHQF_Subordinated),_x]} else {if (not (_x in RydHQFB_Subordinated)) then {RydHQFB_Subordinated set [(count RydHQFB_Subordinated),_x]}};
			}
		foreach allGroups;
		};

	RydHQF_Friends = RydHQF_Friends + RydHQF_Subordinated + RydHQF_Included - (RydHQF_ExcludedG + RydHQF_Excl);
	RydHQF_Friends = RydHQF_Friends - [RydHQF];
	RydHQF_NoWayD = allGroups - RydHQF_LastFriends;

	RydHQF_Friends = [RydHQF_Friends] call RYD_RandomOrd;

		{
		[_x] call RYD_WPdel;
		}
	foreach ((RydHQF_Excl + RydHQF_ExcludedG) - RydHQF_NoWayD);

	if (RydHQF_Init) then 
		{
			{
			RydHQF_CInitial = RydHQF_CInitial + (count (units _x))
			}
		foreach RydHQF_Friends + [RydHQF]
		};

	RydHQF_CLast = RydHQF_CCurrent;
	RydHQF_CCurrent = 0;
		{
		RydHQF_CCurrent = RydHQF_CCurrent + (count (units _x))
		}
	foreach RydHQF_Friends + [RydHQF];

	RydHQF_Ex = [];

	if (RydHQF_ExInfo) then 
		{
		RydHQF_Ex = RydHQF_Excl + RydHQF_ExcludedG
		};

		{
		for [{_a = 0},{_a < count (units _x)},{_a = _a + 1}] do
			{
			_enemyU = vehicle ((units _x) select _a);
				{
				if ((_x knowsAbout _enemyU) >= 0.05) exitwith 
					{
					if not (_enemyU in RydHQF_KnEnemies) then 
						{
						RydHQF_KnEnemies set [(count RydHQF_KnEnemies),_enemyU];
						};

					if not ((group _enemyU) in RydHQF_KnEnemiesG) then 
						{
						_already = missionnameSpace getVariable ["AlreadySpotted",[]];
						RydHQF_KnEnemiesG set [(count RydHQF_KnEnemiesG),(group _enemyU)];
						if not ((group _enemyU) in _already) then
							{
							_UL = (leader _x);if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_EnemySpot,"EnemySpot"] call RYD_AIChatter}};
							}
						}
					} 
				}
			foreach (RydHQF_Friends + [RydHQF] + RydHQF_Ex)
			}
		}
	foreach RydHQF_Enemies;

	_already = missionnameSpace getVariable ["AlreadySpotted",[]];

		{
		if not (_x in _already) then
			{
			_already set [(count _already),_x]
			}
		}
	foreach RydHQF_KnEnemiesG;

	missionnameSpace setVariable ["AlreadySpotted",_already];

	_lossFinal = RydHQF_CInitial - RydHQF_CCurrent;
	if (_lossFinal < 0) then {_lossFinal = 0;RydHQF_CInitial = RydHQF_CCurrent};

	if not (RydHQF_Init) then 
		{
		_lossP = _lossFinal/RydHQF_CInitial;

		if ((_OLmpl == 0) and ((count RydHQF_KnEnemies) > 0)) then
			{
			_OLmpl = 0.01;
			_firstMC = RydHQF_Cyclecount - 1
			};

		if ((_cycleCap < (50 / (1.01 - _lossP))) and ((count RydHQF_KnEnemies) == 0) and (_OLmpl == 0.01)) then
			{
			_cycleCap = _cycleCap + 1;
			if ((random 1) < _lossP) then {_firstMC = _firstMC + 1}
			}
		else
			{
			if not ((count RydHQF_KnEnemies) == 0) then
				{
				_cycleCap = 0;
				}
			};

		
		_lossPerc = _lossP * 100;
		_cycle = RydHQF_Cyclecount - _firstMC;

		_OLF = _OLmpl * (((-(_lossPerc * _lossPerc))/(1.1^_cycle)) + ((15 + (random 5) + (random 5))/(1 + _lossP)) - (_lossP * 10) + (_cycle ^ ((10 * (1 - _lossP))/_cycle)));

		_mplLU = 1;
		_lostU = RydHQF_CLast - RydHQF_CCurrent;
		if (_lostU < 0) then {_lostU = - _lostU;_mplLU = -1};

		_lossL = _mplLU * ((100 * _lostU/RydHQF_CInitial)^(1.55 + (random 0.05) + (random 0.05)))/10;

		_balanceF = 0.5 + (random 0.5) + (random 0.5) - _lossP - (count RydHQF_KnEnemies)/RydHQF_CCurrent;

		RydHQF_Morale = RydHQF_Morale + (_OLF - _lossL + _balanceF);
		//RydHQF_Morale = RydHQF_Morale + (((RydHQF_CCurrent - RydHQF_CInitial) * (6/(1 + (RydHQF_Cyclecount/25)))) + (6 * ((random 0.5) + RydHQF_CCurrent - RydHQF_CLast)))/((1 + (10*RydHQF_CInitial))/(1 + ((count RydHQF_KnEnemies) * 0.5)));
		//diag_log format ["Init: %2, Last: %3, Current: %3,Zmiana morale: %1",(((RydHQF_CCurrent - RydHQF_CInitial) * (6/(1 + (RydHQF_Cyclecount/25)))) + (6 * ((random 0.5) + RydHQF_CCurrent - RydHQF_CLast)))/((1 + (10*RydHQF_CInitial))/(1 + ((count RydHQF_KnEnemies) * 0.5))),RydHQF_CInitial,RydHQF_CLast,RydHQF_CCurrent];
		};

	if (RydHQF_Morale < -50) then {RydHQF_Morale = -50};
	if (RydHQF_Morale > 0) then {RydHQF_Morale = 0};
	if (RydHQF_Debug) then 
		{
		_mdbg = format ["Morale F (%2): %1 - losses: %3 percent (%4)",RydHQF_Morale,RydHQF_Personality,(round (((_lossFinal/RydHQF_CInitial) * 100) * 10)/10),_lossFinal];
		diag_log _mdbg;
		leaderHQF globalChat _mdbg;

		_cl = "<t color='#007f00'>F -> M: %1 - L: %2%3</t>";

		switch (side RydHQF) do
			{
			case (west) : {_cl = "<t color='#0d81c4'>F -> M: %1 - L: %2%3</t>"};
			case (east) : {_cl = "<t color='#ff0000'>F -> M: %1 - L: %2%3</t>"};
			};

		_dbgMon = parseText format [_cl,(round (RydHQF_Morale * 10))/10,(round (((_lossFinal/RydHQF_CInitial) * 100) * 10)/10),"%"];

		RydHQF setVariable ["DbgMon",_dbgMon];
		};

	if (RydHQF_Init) then {[RydHQF] spawn Desperado};

	RydHQF_Init = false;

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

				if (_SpecForcheck) then {if not (_vh in RydHQF_SpecFor) then {RydHQF_SpecFor set [(count RydHQF_SpecFor),_vh]};if not (_grp in RydHQF_SpecForG) then {RydHQF_SpecForG set [(count RydHQF_SpecForG),_grp]}};
				if (_reconcheck) then {if not (_vh in RydHQF_recon) then {RydHQF_recon set [(count RydHQF_recon),_vh]};if not (_grp in RydHQF_reconG) then {RydHQF_reconG set [(count RydHQF_reconG),_grp]}};
				if (_FOcheck) then {if not (_vh in RydHQF_FO) then {RydHQF_FO set [(count RydHQF_FO),_vh]};if not (_grp in RydHQF_FOG) then {RydHQF_FOG set [(count RydHQF_FOG),_grp]}};
				if (_sniperscheck) then {if not (_vh in RydHQF_snipers) then {RydHQF_snipers set [(count RydHQF_snipers),_vh]};if not (_grp in RydHQF_snipersG) then {RydHQF_snipersG set [(count RydHQF_snipersG),_grp]}};
				if (_ATinfcheck) then {if not (_vh in RydHQF_ATinf) then {RydHQF_ATinf set [(count RydHQF_ATinf),_vh]};if not (_grp in RydHQF_ATinfG) then {RydHQF_ATinfG set [(count RydHQF_ATinfG),_grp]}};
				if (_AAinfcheck) then {if not (_vh in RydHQF_AAinf) then {RydHQF_AAinf set [(count RydHQF_AAinf),_vh]};if not (_grp in RydHQF_AAinfG) then {RydHQF_AAinfG set [(count RydHQF_AAinfG),_grp]}};
				if (_Infcheck) then {if not (_vh in RydHQF_Inf) then {RydHQF_FValue = RydHQF_FValue + 1;RydHQF_Inf set [(count RydHQF_Inf),_vh]};if not (_grp in RydHQF_InfG) then {RydHQF_InfG set [(count RydHQF_InfG),_grp]}};
				if (_Artcheck) then {if not (_vh in RydHQF_Art) then {RydHQF_FValue = RydHQF_FValue + 3;RydHQF_Art set [(count RydHQF_Art),_vh]};if not (_grp in RydHQF_ArtG) then {RydHQF_ArtG set [(count RydHQF_ArtG),_grp]}};
				if (_HArmorcheck) then {if not (_vh in RydHQF_HArmor) then {RydHQF_FValue = RydHQF_FValue + 10;RydHQF_HArmor set [(count RydHQF_HArmor),_vh]};if not (_grp in RydHQF_HArmorG) then {RydHQF_HArmorG set [(count RydHQF_HArmorG),_grp]}};
				if (_MArmorcheck) then {if not (_vh in RydHQF_MArmor) then {RydHQF_MArmor set [(count RydHQF_MArmor),_vh]};if not (_grp in RydHQF_MArmorG) then {RydHQF_MArmorG set [(count RydHQF_MArmorG),_grp]}};
				if (_LArmorcheck) then {if not (_vh in RydHQF_LArmor) then {RydHQF_FValue = RydHQF_FValue + 5;RydHQF_LArmor set [(count RydHQF_LArmor),_vh]};if not (_grp in RydHQF_LArmorG) then {RydHQF_LArmorG set [(count RydHQF_LArmorG),_grp]}};
				if (_LArmorATcheck) then {if not (_vh in RydHQF_LArmorAT) then {RydHQF_LArmorAT set [(count RydHQF_LArmorAT),_vh]};if not (_grp in RydHQF_LArmorATG) then {RydHQF_LArmorATG set [(count RydHQF_LArmorATG),_grp]}};
				if (_Carscheck) then {if not (_vh in RydHQF_Cars) then {RydHQF_FValue = RydHQF_FValue + 3;RydHQF_Cars set [(count RydHQF_Cars),_vh]};if not (_grp in RydHQF_CarsG) then {RydHQF_CarsG set [(count RydHQF_CarsG),_grp]}};
				if (_Aircheck) then {if not (_vh in RydHQF_Air) then {RydHQF_FValue = RydHQF_FValue + 15;RydHQF_Air set [(count RydHQF_Air),_vh]};if not (_grp in RydHQF_AirG) then {RydHQF_AirG set [(count RydHQF_AirG),_grp]}};
				if (_BAircheck) then {if not (_vh in RydHQF_BAir) then {RydHQF_BAir set [(count RydHQF_BAir),_vh]};if not (_grp in RydHQF_BAirG) then {RydHQF_BAirG set [(count RydHQF_BAirG),_grp]}};				
				if (_RAircheck) then {if not (_vh in RydHQF_RAir) then {RydHQF_RAir set [(count RydHQF_RAir),_vh]};if not (_grp in RydHQF_RAirG) then {RydHQF_RAirG set [(count RydHQF_RAirG),_grp]}};				
				if (_NCAircheck) then {if not (_vh in RydHQF_NCAir) then {RydHQF_NCAir set [(count RydHQF_NCAir),_vh]};if not (_grp in RydHQF_NCAirG) then {RydHQF_NCAirG set [(count RydHQF_NCAirG),_grp]}};
				if (_Navalcheck) then {if not (_vh in RydHQF_Naval) then {RydHQF_Naval set [(count RydHQF_Naval),_vh]};if not (_grp in RydHQF_NavalG) then {RydHQF_NavalG set [(count RydHQF_NavalG),_grp]}};
				if (_Staticcheck) then {if not (_vh in RydHQF_Static) then {RydHQF_FValue = RydHQF_FValue + 1;RydHQF_Static set [(count RydHQF_Static),_vh]};if not (_grp in RydHQF_StaticG) then {RydHQF_StaticG set [(count RydHQF_StaticG),_grp]}};
				if (_StaticAAcheck) then {if not (_vh in RydHQF_StaticAA) then {RydHQF_StaticAA set [(count RydHQF_StaticAA),_vh]};if not (_grp in RydHQF_StaticAAG) then {RydHQF_StaticAAG set [(count RydHQF_StaticAAG),_grp]}};
				if (_StaticATcheck) then {if not (_vh in RydHQF_StaticAT) then {RydHQF_StaticAT set [(count RydHQF_StaticAT),_vh]};if not (_grp in RydHQF_StaticATG) then {RydHQF_StaticATG set [(count RydHQF_StaticATG),_grp]}};
				if (_Supportcheck) then {if not (_vh in RydHQF_Support) then {RydHQF_Support set [(count RydHQF_Support),_vh]};if not (_grp in RydHQF_SupportG) then {RydHQF_SupportG set [(count RydHQF_SupportG),_grp]}};
				if (_Cargocheck) then {if not (_vh in RydHQF_Cargo) then {RydHQF_Cargo set [(count RydHQF_Cargo),_vh]};if not (_grp in RydHQF_CargoG) then {RydHQF_CargoG set [(count RydHQF_CargoG),_grp]}};
				if (_NCCargocheck) then {if not (_vh in RydHQF_NCCargo) then {RydHQF_NCCargo set [(count RydHQF_NCCargo),_vh]};if not (_grp in RydHQF_NCCargoG) then {RydHQF_NCCargoG set [(count RydHQF_NCCargoG),_grp]}};
				if (_Crewcheck) then {if not (_vh in RydHQF_Crew) then {RydHQF_Crew set [(count RydHQF_Crew),_vh]};if not (_grp in RydHQF_CrewG) then {RydHQF_CrewG set [(count RydHQF_CrewG),_grp]}};
				if (_NCrewInfcheck) then {if not (_vh in RydHQF_NCrewInf) then {RydHQF_NCrewInf set [(count RydHQF_NCrewInf),_vh]};if not (_grp in RydHQF_NCrewInfG) then {RydHQF_NCrewInfG set [(count RydHQF_NCrewInfG),_grp]}};
				
			}
		foreach (units _x)
		}
	foreach RydHQF_Friends;

	RydHQF_NCrewInfG = RydHQF_NCrewInfG - (RydHQF_RAirG + RydHQF_StaticG);
	RydHQF_NCrewInf = RydHQF_NCrewInf - (RydHQF_RAir + RydHQF_Static);
	RydHQF_InfG = RydHQF_InfG - (RydHQF_RAirG + RydHQF_StaticG);
	RydHQF_Inf = RydHQF_Inf - (RydHQF_RAir + RydHQF_Static);

	RydHQF_CargoAirEx = [];
	RydHQF_CargoLandEx = [];
	if (RydHQF_NoAirCargo) then {RydHQF_CargoAirEx = RydHQF_AirG};
	if (RydHQF_NoLandCargo) then {RydHQF_CargoLandEx = (RydHQF_CargoG - RydHQF_AirG)};
	RydHQF_CargoG = RydHQF_CargoG - (RydHQF_CargoAirEx + RydHQF_CargoLandEx + RydHQF_AmmoDrop);

		{
		if not (_x in RydHQF_SupportG) then
			{
			RydHQF_SupportG set [(count RydHQF_SupportG),_x]
			}
		}
	foreach RydHQF_AmmoDrop;
		
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
				
				if (_SpecForcheck) then {if not (_vh in RydHQF_EnSpecFor) then {RydHQF_EnSpecFor set [(count RydHQF_EnSpecFor),_vh]};if not (_grp in RydHQF_EnSpecForG) then {RydHQF_EnSpecForG set [(count RydHQF_EnSpecForG),_grp]}};
				if (_reconcheck) then {if not (_vh in RydHQF_Enrecon) then {RydHQF_Enrecon set [(count RydHQF_Enrecon),_vh]};if not (_grp in RydHQF_EnreconG) then {RydHQF_EnreconG set [(count RydHQF_EnreconG),_grp]}};
				if (_FOcheck) then {if not (_vh in RydHQF_EnFO) then {RydHQF_EnFO set [(count RydHQF_EnFO),_vh]};if not (_grp in RydHQF_EnFOG) then {RydHQF_EnFOG set [(count RydHQF_EnFOG),_grp]}};
				if (_sniperscheck) then {if not (_vh in RydHQF_Ensnipers) then {RydHQF_Ensnipers set [(count RydHQF_Ensnipers),_vh]};if not (_grp in RydHQF_EnsnipersG) then {RydHQF_EnsnipersG set [(count RydHQF_EnsnipersG),_grp]}};
				if (_ATinfcheck) then {if not (_vh in RydHQF_EnATinf) then {RydHQF_EnATinf set [(count RydHQF_EnATinf),_vh]};if not (_grp in RydHQF_EnATinfG) then {RydHQF_EnATinfG set [(count RydHQF_EnATinfG),_grp]}};
				if (_AAinfcheck) then {if not (_vh in RydHQF_EnAAinf) then {RydHQF_EnAAinf set [(count RydHQF_EnAAinf),_vh]};if not (_grp in RydHQF_EnAAinfG) then {RydHQF_EnAAinfG set [(count RydHQF_EnAAinfG),_grp]}};
				if (_Infcheck) then {if not (_vh in RydHQF_EnInf) then {RydHQF_EValue = RydHQF_EValue + 1;RydHQF_EnInf set [(count RydHQF_EnInf),_vh]};if not (_grp in RydHQF_EnInfG) then {RydHQF_EnInfG set [(count RydHQF_EnInfG),_grp]}};
				if (_Artcheck) then {if not (_vh in RydHQF_EnArt) then {RydHQF_EValue = RydHQF_EValue + 3;RydHQF_EnArt set [(count RydHQF_EnArt),_vh]};if not (_grp in RydHQF_EnArtG) then {RydHQF_EnArtG set [(count RydHQF_EnArtG),_grp]}};
				if (_HArmorcheck) then {if not (_vh in RydHQF_EnHArmor) then {RydHQF_EValue = RydHQF_EValue + 10;RydHQF_EnHArmor set [(count RydHQF_EnHArmor),_vh]};if not (_grp in RydHQF_EnHArmorG) then {RydHQF_EnHArmorG set [(count RydHQF_EnHArmorG),_grp]}};
				if (_MArmorcheck) then {if not (_vh in RydHQF_EnMArmor) then {RydHQF_EnMArmor set [(count RydHQF_EnMArmor),_vh]};if not (_grp in RydHQF_EnMArmorG) then {RydHQF_EnMArmorG set [(count RydHQF_EnMArmorG),_grp]}};
				if (_LArmorcheck) then {if not (_vh in RydHQF_EnLArmor) then {RydHQF_EValue = RydHQF_EValue + 5;RydHQF_EnLArmor set [(count RydHQF_EnLArmor),_vh]};if not (_grp in RydHQF_EnLArmorG) then {RydHQF_EnLArmorG set [(count RydHQF_EnLArmorG),_grp]}};
				if (_LArmorATcheck) then {if not (_vh in RydHQF_EnLArmorAT) then {RydHQF_EnLArmorAT set [(count RydHQF_EnLArmorAT),_vh]};if not (_grp in RydHQF_EnLArmorATG) then {RydHQF_EnLArmorATG set [(count RydHQF_EnLArmorATG),_grp]}};
				if (_Carscheck) then {if not (_vh in RydHQF_EnCars) then {RydHQF_EValue = RydHQF_EValue + 3;RydHQF_EnCars set [(count RydHQF_EnCars),_vh]};if not (_grp in RydHQF_EnCarsG) then {RydHQF_EnCarsG set [(count RydHQF_EnCarsG),_grp]}};
				if (_Aircheck) then {if not (_vh in RydHQF_EnAir) then {RydHQF_EValue = RydHQF_EValue + 15;RydHQF_EnAir set [(count RydHQF_EnAir),_vh]};if not (_grp in RydHQF_EnAirG) then {RydHQF_EnAirG set [(count RydHQF_EnAirG),_grp]}};
				if (_BAircheck) then {if not (_vh in RydHQF_EnBAir) then {RydHQF_EnBAir set [(count RydHQF_EnBAir),_vh]};if not (_grp in RydHQF_EnBAirG) then {RydHQF_EnBAirG set [(count RydHQF_EnBAirG),_grp]}};				
				if (_RAircheck) then {if not (_vh in RydHQF_EnRAir) then {RydHQF_EnRAir set [(count RydHQF_EnRAir),_vh]};if not (_grp in RydHQF_EnRAirG) then {RydHQF_EnRAirG set [(count RydHQF_EnRAirG),_grp]}};
				if (_NCAircheck) then {if not (_vh in RydHQF_EnNCAir) then {RydHQF_EnNCAir set [(count RydHQF_EnNCAir),_vh]};if not (_grp in RydHQF_EnNCAirG) then {RydHQF_EnNCAirG set [(count RydHQF_EnNCAirG),_grp]}};
				if (_Navalcheck) then {if not (_vh in RydHQF_EnNaval) then {RydHQF_EnNaval set [(count RydHQF_EnNaval),_vh]};if not (_grp in RydHQF_EnNavalG) then {RydHQF_EnNavalG set [(count RydHQF_EnNavalG),_grp]}};
				if (_Staticcheck) then {if not (_vh in RydHQF_EnStatic) then {RydHQF_EValue = RydHQF_EValue + 1;RydHQF_EnStatic set [(count RydHQF_EnStatic),_vh]};if not (_grp in RydHQF_EnStaticG) then {RydHQF_EnStaticG set [(count RydHQF_EnStaticG),_grp]}};
				if (_StaticAAcheck) then {if not (_vh in RydHQF_EnStaticAA) then {RydHQF_EnStaticAA set [(count RydHQF_EnStaticAA),_vh]};if not (_grp in RydHQF_EnStaticAAG) then {RydHQF_EnStaticAAG set [(count RydHQF_EnStaticAAG),_grp]}};
				if (_StaticATcheck) then {if not (_vh in RydHQF_EnStaticAT) then {RydHQF_EnStaticAT set [(count RydHQF_EnStaticAT),_vh]};if not (_grp in RydHQF_EnStaticATG) then {RydHQF_EnStaticATG set [(count RydHQF_EnStaticATG),_grp]}};
				if (_Supportcheck) then {if not (_vh in RydHQF_EnSupport) then {RydHQF_EnSupport set [(count RydHQF_EnSupport),_vh]};if not (_grp in RydHQF_EnSupportG) then {RydHQF_EnSupportG set [(count RydHQF_EnSupportG),_grp]}};
				if (_Cargocheck) then {if not (_vh in RydHQF_EnCargo) then {RydHQF_EnCargo set [(count RydHQF_EnCargo),_vh]};if not (_grp in RydHQF_EnCargoG) then {RydHQF_EnCargoG set [(count RydHQF_EnCargoG),_grp]}};
				if (_NCCargocheck) then {if not (_vh in RydHQF_EnNCCargo) then {RydHQF_EnNCCargo set [(count RydHQF_EnNCCargo),_vh]};if not (_grp in RydHQF_EnNCCargoG) then {RydHQF_EnNCCargoG set [(count RydHQF_EnNCCargoG),_grp]}};
				if (_Crewcheck) then {if not (_vh in RydHQF_EnCrew) then {RydHQF_EnCrew set [(count RydHQF_EnCrew),_vh]};if not (_grp in RydHQF_EnCrewG) then {RydHQF_EnCrewG set [(count RydHQF_EnCrewG),_grp]}};
				if (_NCrewInfcheck) then {if not (_vh in RydHQF_EnNCrewInf) then {RydHQF_EnNCrewInf set [(count RydHQF_EnNCrewInf),_vh]};if not (_grp in RydHQF_EnNCrewInfG) then {RydHQF_EnNCrewInfG set [(count RydHQF_EnNCrewInfG),_grp]}};
				
			}
		foreach (units _x)
		}
	foreach RydHQF_KnEnemiesG;

	RydHQF_EnNCrewInfG = RydHQF_EnNCrewInfG - (RydHQF_EnRAirG + RydHQF_EnStaticG);
	RydHQF_EnNCrewInf = RydHQF_EnNCrewInf - (RydHQF_EnRAir + RydHQF_EnStatic);
	RydHQF_EnInfG = RydHQF_EnInfG - (RydHQF_EnRAirG + RydHQF_EnStaticG);
	RydHQF_EnInf = RydHQF_EnInf - (RydHQF_EnRAir + RydHQF_EnStatic);

	if (RydHQF_Flee) then
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
		foreach RydHQF_Friends;

		if (_AllPanic == 0) then {_AllPanic = 1};
		_midCow = 0;
		if not ((count RydHQF_Friends) == 0) then {_midCow = _AllCow/(count RydHQF_Friends)};

			{
			_cowF = ((- RydHQF_Morale)/(50 + (random 25))) + (random (2 * _midCow)) - _midCow;
			_cowF = _cowF * RydHQF_Muu;
			if (_x in RydHQF_SpecForG) then {_cowF = _cowF - 0.8};
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

			if (((random ((20 + (RydHQF_Morale/5))/_AllPanic)) < _cowF) and ((random 100) > (100/(_AllPanic + 1)))) then 
				{
				[_x] call RYD_WPdel;
				_x setVariable [("inPanic" + (str _x)), true];
				if (RydHQF_DebugII) then {_i = [(getPosATL (vehicle (leader _x))),_x,"markPanic","ColorYellow","ICON","DOT","F!","F!",[0.5,0.5]] call RYD_Mark};
				_x setVariable [("Busy" + (str _x)), true];

				_UL = leader _x;
				if not (isPlayer _UL) then 
					{
					if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_InPanic,"InPanic"] call RYD_AIChatter}
					};

				if (RydHQF_Surr) then
					{
					if ((random 100) > 50) then
						{
						if (RydHQF_DebugII) then {_i setMarkerColor "ColorPink";_i setMarkerText "F!!!"};
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
		foreach RydHQF_Friends
		};

		{
		RydHQF_KnEnPos set [(count RydHQF_KnEnPos),getPosATL (vehicle (leader _x))];
		if ((count RydHQF_KnEnPos) >= 100) then {RydHQF_KnEnPos = RydHQF_KnEnPos - [RydHQF_KnEnPos select 0]};
		}
	foreach RydHQF_KnEnemiesG;

	for [{_z = 0},{_z < (count RydHQF_KnEnemies)},{_z = _z + 1}] do
		{
		_KnEnemy = RydHQF_KnEnemies select _z;
			{
			if ((_x knowsAbout _KnEnemy) > 0.01) then {RydHQF reveal [_KnEnemy,2]}
			}
		foreach RydHQF_Friends
		};

	if ((RydBB_Active) and (leaderHQF in (RydBBa_HQs + RydBBb_HQs))) then {[] call RYD_BBArrRefresh};

	if (RydHQF_Cyclecount == 1) then
		{
		[] spawn F_EnemyScan;
		if (RydHQF_ArtyShells > 0) then
			{
			[RydHQF_ArtG,RydHQF_ArtyShells] call RYD_ArtyPrep;
			};

		if ((RydBB_Active) and (leaderHQF in (RydBBa_HQs + RydBBb_HQs))) then 
			{
			RydHQF_readyForBB = true;
			RydxHQ_Done = true;
			if (leaderHQF in RydBBa_HQs) then 
				{
				waitUntil {sleep 0.1;(RydBBa_InitDone)}
				};

			if (leaderHQF in RydBBb_HQs) then 
				{
				waitUntil {sleep 0.1;(RydBBb_InitDone)}
				}
			}
		};

	if (((count RydHQF_KnEnemies) > 0) and ((count RydHQF_ArtG) > 0)) then {[RydHQF_ArtG,RydHQF_KnEnemies,(RydHQF_EnHArmor + RydHQF_EnMArmor + RydHQF_EnLArmor),RydHQF_Friends,RydHQF_Debug,leaderHQF] call RYD_CFF};

	if (isNil ("RydHQF_Order")) then {RydHQF_Order = "ATTACK"};
	_gauss100 = (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10);
	if ((((_gauss100 + RydHQF_Inertia + RydHQF_Morale) > ((RydHQF_EValue/(RydHQF_FValue + 0.1)) * 60)) and not (isNil ("RydHQF_Obj")) and not (RydHQF_Order == "DEFEND")) or (RydHQF_Berserk)) then 
		{
		_lastS = RydHQF getVariable ["LastStance","At"];
		if ((_lastS == "De") or (RydHQF_CycleCount == 1)) then
			{
			if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQF,RydxHQ_AIC_OffStance,"OffStance"] call RYD_AIChatter};
			};

		RydHQF setVariable ["LastStance","At"];
		RydHQF_Inertia = 30 * (0.5 + RydHQF_Consistency)*(0.5 + RydHQF_Activity);
		[] spawn F_HQOrders 
		} 
	else 
		{
		_lastS = RydHQF getVariable ["LastStance","De"];
		if ((_lastS == "At") or (RydHQF_CycleCount == 1)) then
			{
			if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQF,RydxHQ_AIC_DefStance,"DefStance"] call RYD_AIChatter};
			};

		RydHQF setVariable ["LastStance","De"];
		RydHQF_Inertia = - (30  * (0.5 + RydHQF_Consistency))/(0.5 + RydHQF_Activity);
		[] spawn F_HQOrdersDef 
		};


	if ((((RydHQF_Circumspection + RydHQF_Fineness)/2) + 0.1) > (random 1.2)) then
		{
		_SFcount = {not (_x getVariable ["Busy" + (str _x),false]) and not (_x getVariable ["Resting" + (str _x),false])} count (RydHQF_SpecForG - RydHQF_SFBodyGuard);

		if (_SFcount > 0) then
			{
			_isNight = [] call RYD_isNight;
			_SFTgts = [];
			_chance = 40 + (60 * RydHQF_Activity);

				{
				_HQ = group _x;
				if (_HQ in RydHQF_KnEnemiesG) then
					{
					_SFTgts set [(count _SFTgts),_HQ]
					}
				}
			foreach (RydxHQ_AllLeaders - [leaderHQF]);

			if ((count _SFTgts) == 0) then
				{
				_chance = _chance/2;
				_SFTgts = RydHQF_EnArtG
				};

			if ((count _SFTgts) == 0) then
				{
				_chance = _chance/3;
				_SFTgts = RydHQF_EnStaticG
				};

			if (_isNight) then
				{
				_chance = _chance + 25
				};

			if ((count _SFTgts) > 0) then
				{
				_chance = _chance + (((2 * _SFcount) - (8/(0.75 + (RydHQF_Recklessness/2)))) * 20);
				_trgG = _SFTgts select (floor (random (count _SFTgts)));
				_alreadyAttacked = {_x == _trgG} count RydHQF_SFTargets;
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
								if not (_x in RydHQF_SFBodyGuard) then
									{	
									_SFAv set [(count _SFAv),_x]
									}
								}
							}
						}
					foreach RydHQF_SpecForG;

					_team = _SFAv select (floor (random (count _SFAv)));
					_trg = vehicle (leader _trgG);
					if (not ((typeOf _trg) in (_HArmor + _LArmor)) or ((random 100) > (90 - (RydHQF_Recklessness * 10)))) then {[_team,_trg,_trgG] spawn F_GoSFAttack}
					}
				}
			}
		};

	if (RydHQF_LRelocating) then
		{
		if ((abs (speed (vehicle leaderHQF))) < 0.1) then {RydHQF setVariable ["onMove",false]};
		_onMove = RydHQF getVariable ["onMove",false];

		if not (_onMove) then 
			{
			if (not (isPlayer leaderHQF) and ((RydHQF_Cyclecount == 1) or not (RydHQF_Progress == 0))) then
				{
				[RydHQF] call RYD_WPdel;

				_Lpos = position leaderHQF;
				if (RydHQF_Cyclecount == 1) then {RydHQF_Fpos = _Lpos};

				_rds = 0;

				if (RydHQF_LRelocating) then 
					{
					_rds = 0;
					if (RydHQF_NObj == 1) then {_Lpos = RydHQF_Fpos;if (leaderHQF in (RydBBa_HQs + RydBBb_HQs)) then {_Lpos = position leaderHQF};_rds = 0};
					if (RydHQF_NObj == 2) then {_Lpos = position RydHQF_Obj1};
					if (RydHQF_NObj == 3) then {_Lpos = position RydHQF_Obj2};
					if (RydHQF_NObj >= 4) then {_Lpos = position RydHQF_Obj3};
					};

				_spd = "LIMITED";
				if (RydHQF_Progress == -1) then {_spd = "NORMAL"};
				RydHQF_Progress = 0;
				_enemyN = false;

					{
					_eLdr = vehicle (leader _x);
					_eDst = _eLdr distance _Lpos;

					if (_eDst < 600) exitWith {_enemyN = true}
					}
				foreach RydHQF_KnEnemiesG;

				if not (_enemyN) then 
					{
					_wp = [RydHQF,_Lpos,"HOLD","AWARE","GREEN",_spd,["true",""],true,_rds,[0,0,0],"FILE"] call RYD_WPadd;
					if (isNull (assignedVehicle leaderHQF)) then
						{
						if (RydHQF_GetHQInside) then {[_wp] call RYD_GoInside}
						};

					if ((RydHQF_LRelocating) and (RydHQF_NObj > 1) and (RydHQF_Cyclecount > 1)) then 
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
								foreach RydHQF_KnEnemiesG;

								if (isNull RydHQF) then 
									{
									_onPlace = true
									}
								else
									{
									if not (_getBack) then
										{
										if (((vehicle leaderHQF) distance _LPos) < 30) then {_onPlace = true}
										}
									};
								

								((_getback) or (_onPlace))
								};

							if not (_onPlace) then
								{
								_rds = 30;
								if (RydHQF_NObj <= 2) then {_Lpos = getPosATL (vehicle leaderHQF);_rds = 0};
								if (RydHQF_NObj == 3) then {_Lpos = position RydHQF_Obj1};
								if (RydHQF_NObj >= 4) then {_Lpos = position RydHQF_Obj2};

								_getBack = false;

									{
									_eLdr = vehicle (leader _x);
									_eDst = _eLdr distance _Lpos;

									if (_eDst < 600) exitWith {_getBack = true}
									}
								foreach RydHQF_KnEnemiesG;

								if (_getBack) then {_Lpos = getPosATL (vehicle leaderHQF);_rds = 0};

								[RydHQF] call RYD_WPdel;	

								_spd = "NORMAL";
								if not (((vehicle leaderHQF) distance _LPos) < 50) then {_spd = "FULL"};

								_wp = [RydHQF,_Lpos,"HOLD","AWARE","GREEN",_spd,["true",""],true,_rds,[0,0,0],"FILE"] call RYD_WPadd;
								if (isNull (assignedVehicle leaderHQF)) then
									{
									if (RydHQF_GetHQInside) then {[_wp] call RYD_GoInside}
									};

								RydHQF setVariable ["onMove",true];
								}
							}
						}
					}
				}
			}
		};

	if (isNil ("RydHQF_CommDelay")) then {RydHQF_CommDelay = 1};
	_delay = (((22.5 + (count RydHQF_Friends))/(0.5 + RydHQF_Reflex)) * RydHQF_CommDelay);
	sleep _delay;

		{
		RydHQF reveal vehicle (leader _x)
		}
	foreach RydHQF_Friends;

	for [{_z = 0},{_z < (count RydHQF_KnEnemies)},{_z = _z + 1}] do
		{
		_KnEnemy = RydHQF_KnEnemies select _z;

			{
			if ((_x knowsAbout _KnEnemy) > 0.01) then {RydHQF reveal [_KnEnemy,2]} 
			}
		foreach RydHQF_Friends
		}
	};