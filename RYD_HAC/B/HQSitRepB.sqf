
RydHQB = GrpNull;

RydHQB = group leaderHQB;

leaderHQB kbAddTopic ["orders","RYD_HAC\topics.bikb",""];
waituntil {(leaderHQB kbHasTopic "orders")};

RydHQB_Cyclecount = 0;

waituntil {not (isNull RydHQB)};

RydHQB_PersDone = false;
[] spawn B_Personality;
waituntil {RydHQB_PersDone};

RydHQB_LHQInit = false;
[] spawn B_LHQ;
waituntil {RydHQB_LHQInit};

if (isNil ("RydHQB_Boxed")) then {RydHQB_Boxed = []};
if (isNil ("RydHQB_AmmoBoxes")) then 
	{
	RydHQB_AmmoBoxes = [];

	if not (isNil "RydHQB_AmmoDepot") then 
		{
		_rds = (triggerArea RydHQB_AmmoDepot) select 0;
		RydHQB_AmmoBoxes = (getPosATL RydHQB_AmmoDepot) nearObjects ["ReammoBox",_rds]
		}
	};

[] spawn B_HQReset;
[] spawn B_Rev;
[] spawn B_SuppMed;
[] spawn B_SuppFuel;
[] spawn B_SuppAmmo;
[] spawn B_SuppRep;
[] spawn B_SFIdleOrd;
[] spawn B_Reloc;
[] spawn B_LPos;

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
RydHQB_NCVeh = _NCCargo + (_Support - ["MH60S"]);

[(_snipers + _ATinf + _AAinf)] spawn B_Garrison;

RydHQB_ReconDone = false;
RydHQB_DefDone = false;
RydHQB_ReconStage = 1;
RydHQB_KnEnPos = [];
RydHQB_AirInDef = [];
if (isNil ("RydHQB_Excluded")) then {RydHQB_Excluded = []};
if (isNil ("RydHQB_Fast")) then {RydHQB_Fast = false};
if (isNil ("RydHQB_ExInfo")) then {RydHQB_ExInfo = false};
if (isNil ("RydHQB_ObjHoldTime")) then {RydHQB_ObjHoldTime = 600};
if (isNil "RydHQB_NObj") then {RydHQB_NObj = 1};

RydHQB_Init = true;

RydHQB_Inertia = 0;
RydHQB_Morale = 0;
RydHQB_CInitial = 0;
RydHQB_CLast = 0;
RydHQB_CCurrent = 0;
RydHQB_CIMoraleC = 0;
RydHQB_CLMoraleC = 0;
RydHQB_Surrender = false;

RydHQB_FirstEMark = true;
RydHQB_LastE = 0;
RydHQB_FlankingInit = false;
RydHQB_FlankingDone = false;
RydHQB_Progress = 0;

RydHQB_AAthreat = [];
RydHQB_ATthreat = [];
RydHQB_Airthreat = [];
RydHQB_Exhausted = [];

_lastHQ = leaderHQB;
_OLmpl = 0;
_cycleCap = 0;
_firstMC = 0; 
_wp = [];

while {not ((isNull RydHQB) or (RydHQB_Surrender))} do
	{
	if not (RydHQB_Fast) then {waituntil {sleep 0.1;((RydxHQ_Done) and (RydxHQB_Done) and (RydxHQC_Done) and (RydxHQD_Done) and (RydxHQE_Done) and (RydxHQF_Done) and (RydxHQG_Done) and (RydxHQH_Done))}};
	if (isNil ("RydHQB_SupportWP")) then {RydHQB_SupportWP = false};

	if (RydHQB_Cyclecount > 1) then
		{
		if not (_lastHQ == leaderHQB) then {sleep (60 + (random 60))};
		};

	_lastHQ = leaderHQB;
	RydHQB_Cyclecount = RydHQB_Cyclecount + 1;
	RydxHQ_Done = false;

	RydHQB_SpecFor = [];
	RydHQB_recon = [];
	RydHQB_FO = [];
	RydHQB_snipers = [];
	RydHQB_ATinf = [];
	RydHQB_AAinf = [];
	RydHQB_Inf = [];
	RydHQB_Art = [];
	RydHQB_HArmor = [];
	RydHQB_MArmor = [];
	RydHQB_LArmor = [];
	RydHQB_LArmorAT = [];
	RydHQB_Cars = [];
	RydHQB_Air = [];
	RydHQB_BAir = [];
	RydHQB_RAir = [];
	RydHQB_NCAir = [];
	RydHQB_Naval = [];
	RydHQB_Static = [];
	RydHQB_StaticAA = [];
	RydHQB_StaticAT = [];
	RydHQB_Support = [];
	RydHQB_Cargo = [];
	RydHQB_NCCargo = [];
	RydHQB_Other = [];
	RydHQB_Crew = [];
	RydHQB_NCrewInf = [];

	RydHQB_SpecForG = [];
	RydHQB_reconG = [];
	RydHQB_FOG = [];
	RydHQB_snipersG = [];
	RydHQB_ATinfG = [];
	RydHQB_AAinfG = [];
	RydHQB_InfG = [];
	RydHQB_ArtG = [];
	RydHQB_HArmorG = [];
	RydHQB_MArmorG = [];
	RydHQB_LArmorG = [];
	RydHQB_LArmorATG = [];
	RydHQB_CarsG = [];
	RydHQB_AirG = [];
	RydHQB_BAirG = [];
	RydHQB_RAirG = [];
	RydHQB_NCAirG = [];
	RydHQB_NavalG = [];
	RydHQB_StaticG = [];
	RydHQB_StaticAAG = [];
	RydHQB_StaticATG = [];
	RydHQB_SupportG = [];
	RydHQB_CargoG = [];
	RydHQB_NCCargoG = [];
	RydHQB_OtherG = [];
	RydHQB_CrewG = [];
	RydHQB_NCrewInfG = [];

	RydHQB_EnSpecFor = [];
	RydHQB_Enrecon = [];
	RydHQB_EnFO = [];
	RydHQB_Ensnipers = [];
	RydHQB_EnATinf = [];
	RydHQB_EnAAinf = [];
	RydHQB_EnInf = [];
	RydHQB_EnArt = [];
	RydHQB_EnHArmor = [];
	RydHQB_EnMArmor = [];
	RydHQB_EnLArmor = [];
	RydHQB_EnLArmorAT = [];
	RydHQB_EnCars = [];
	RydHQB_EnAir = [];
	RydHQB_EnBAir = [];
	RydHQB_EnRAir = [];
	RydHQB_EnNCAir = [];
	RydHQB_EnNaval = [];
	RydHQB_EnStatic = [];
	RydHQB_EnStaticAA = [];
	RydHQB_EnStaticAT = [];
	RydHQB_EnSupport = [];
	RydHQB_EnCargo = [];
	RydHQB_EnNCCargo = [];
	RydHQB_EnOther = [];
	RydHQB_EnCrew = [];
	RydHQB_EnNCrewInf = [];

	RydHQB_EnSpecForG = [];
	RydHQB_EnreconG = [];
	RydHQB_EnFOG = [];
	RydHQB_EnsnipersG = [];
	RydHQB_EnATinfG = [];
	RydHQB_EnAAinfG = [];
	RydHQB_EnInfG = [];
	RydHQB_EnArtG = [];
	RydHQB_EnHArmorG = [];
	RydHQB_EnMArmorG = [];
	RydHQB_EnLArmorG = [];
	RydHQB_EnLArmorATG = [];
	RydHQB_EnCarsG = [];
	RydHQB_EnAirG = [];
	RydHQB_EnBAirG = [];
	RydHQB_EnRAirG = [];
	RydHQB_EnNCAirG = [];
	RydHQB_EnNavalG = [];
	RydHQB_EnStaticG = [];
	RydHQB_EnStaticAAG = [];
	RydHQB_EnStaticATG = [];
	RydHQB_EnSupportG = [];
	RydHQB_EnCargoG = [];
	RydHQB_EnNCCargoG = [];
	RydHQB_EnOtherG = [];
	RydHQB_EnCrewG = [];
	RydHQB_EnNCrewInfG = [];

	RydHQB_LastE = count RydHQB_KnEnemies;
	RydHQB_LastFriends = RydHQB_Friends;

	if (isNil ("RydHQB_NoAirCargo")) then {RydHQB_NoAirCargo = false};
	if (isNil ("RydHQB_NoLandCargo")) then {RydHQB_NoLandCargo = false};
	if (isNil ("RydHQB_LastFriends")) then {RydHQB_LastFriends = []};
	if (isNil ("RydHQB_CargoFind")) then {RydHQB_CargoFind = 0};
	if (isNil ("RydHQB_Subordinated")) then {RydHQB_Subordinated = []};
	if (isNil ("RydHQB_Included")) then {RydHQB_Included = []};
	if (isNil ("RydHQB_ExcludedG")) then {RydHQB_ExcludedG = []};
	if (isNil ("RydHQB_SubAll")) then {RydHQB_SubAll = true};
	if (isNil ("RydHQB_SubSynchro")) then {RydHQB_SubSynchro = false};
	if (isNil ("RydHQB_SubNamed")) then {RydHQB_SubNamed = false};
	if (isNil ("RydHQB_SubZero")) then {RydHQB_SubZero = false};
	if (isNil ("RydHQB_ReSynchro")) then {RydHQB_ReSynchro = true};
	if (isNil ("RydHQB_NameLimit")) then {RydHQB_NameLimit = 100};
	if (isNil ("RydHQB_Surr")) then {RydHQB_Surr = false};
	if (isNil ("RydHQB_AOnly")) then {RydHQB_AOnly = []};
	if (isNil ("RydHQB_ROnly")) then {RydHQB_ROnly = []};
	if (isNil ("RydHQB_CargoOnly")) then {RydHQB_CargoOnly = []};
	if (isNil ("RydHQB_NoCargo")) then {RydHQB_NoCargo = []};
	if (isNil ("RydHQB_NoFlank")) then {RydHQB_NoFlank = []};
	if (isNil ("RydHQB_NoDef")) then {RydHQB_NoDef = []};
	if (isNil ("RydHQB_FirstToFight")) then {RydHQB_FirstToFight = []};
	if (isNil ("RydHQB_VoiceComm")) then {RydHQB_VoiceComm = true};
	if (isNil ("RydHQB_Front")) then {RydHQB_Front = false};
	if (isNil ("RydHQB_LRelocating")) then {RydHQB_LRelocating = false};
	if (isNil ("RydHQB_Flee")) then {RydHQB_Flee = true};
	if (isNil ("RydHQB_GarrR")) then {RydHQB_GarrR = 500};
	if (isNil ("RydHQB_Rush")) then {RydHQB_Rush = false};
	if (isNil ("RydHQB_GarrVehAb")) then {RydHQB_GarrVehAb = false};
	if (isNil ("RydHQB_DefendObjectives")) then {RydHQB_DefendObjectives = 4};
	if (isNil ("RydHQB_DefSpot")) then {RydHQB_DefSpot = []};
	if (isNil ("RydHQB_RecDefSpot")) then {RydHQB_RecDefSpot = []};
	if (isNil "RydHQB_Flare") then {RydHQB_Flare = true};
	if (isNil "RydHQB_Smoke") then {RydHQB_Smoke = true};
	if (isNil "RydHQB_NoRec") then {RydHQB_NoRec = 1};
	if (isNil "RydHQB_RapidCapt") then {RydHQB_RapidCapt = 10};
	if (isNil "RydHQB_Muu") then {RydHQB_Muu = 1};
	if (isNil "RydHQB_ArtyShells") then {RydHQB_ArtyShells = 120};
	if (isNil "RydHQB_Withdraw") then {RydHQB_Withdraw = 1};
	if (isNil "RydHQB_Berserk") then {RydHQB_Berserk = false};
	if (isNil "RydHQB_IDChance") then {RydHQB_IDChance = 100};
	if (isNil "RydHQB_RDChance") then {RydHQB_RDChance = 100};
	if (isNil "RydHQB_SDChance") then {RydHQB_SDChance = 100};
	if (isNil "RydHQB_AmmoDrop") then {RydHQB_AmmoDrop = []};
	if (isNil "RydHQB_SFTargets") then {RydHQB_SFTargets = []};
	if (isNil "RydHQB_LZ") then {RydHQB_LZ = false};
	if (isNil "RydHQB_SFBodyGuard") then {RydHQB_SFBodyGuard = []};
	if (isNil "RydHQB_DynForm") then {RydHQB_DynForm = false};
	if (isNil "RydHQB_UnlimitedCapt") then {RydHQB_UnlimitedCapt = false};
	if (isNil "RydHQB_CaptLimit") then {RydHQB_CaptLimit = 10};
	if (isNil "RydHQB_GetHQInside") then {RydHQB_GetHQInside = false};

	RydHQB_Friends = [];
	RydHQB_Enemies = [];
	RydHQB_KnEnemies = [];
	RydHQB_KnEnemiesG = [];
	RydHQB_FValue = 0;
	RydHQB_EValue = 0;

	if (RydxHQ_AIChatDensity > 0) then
		{
		_varName1 = "HAC_AIChatRep";
		_varName2 = "_West";

		switch ((side RydHQB)) do
			{
			case (east) : {_varName2 = "_East"};
			case (resistance) : {_varName2 = "_Guer"};
			};

		missionNamespace setVariable [_varName1 + _varName2,0];

		_varName1 = "HAC_AIChatLT";

		missionNamespace setVariable [_varName1 + _varName2,[0,""]]
		};

	if (RydHQB_NObj == 1) then {RydHQB_Obj = RydHQB_Obj1};
	if (RydHQB_NObj == 2) then {RydHQB_Obj = RydHQB_Obj2};
	if (RydHQB_NObj == 3) then {RydHQB_Obj = RydHQB_Obj3};
	if (RydHQB_NObj >= 4) then {RydHQB_Obj = RydHQB_Obj4};

	RydHQB_LastSub = RydHQB_Subordinated;
	RydHQB_Subordinated = [];

	_civF = ["CIV","CIV_RU","BIS_TK_CIV","BIS_CIV_special"];
	if not (isNil ("RydHQB_CivF")) then {_civF = RydHQB_CivF};

		{
		_isCaptive = _x getVariable ("isCaptive" + (str _x));
		if (isNil "_isCaptive") then {_isCaptive = false};

		_isCiv = false;
		if ((faction (leader _x)) in _civF) then {_isCiv = true};
		if not ((isNull (leaderHQB)) and not (isNull _x) and (alive (leaderHQB)) and (alive (leader _x)) and not (_isCaptive)) then
			{
			if (not (RydHQB_Front) and ((side _x) getFriend (side RydHQB) < 0.6) and not (_isCiv)) then {if not (_x in RydHQB_Enemies) then {RydHQB_Enemies set [(count RydHQB_Enemies), _x]}};
			_front = true;
			if not (isNil "FrontB") then {_front = ((getPosATL (vehicle (leader _x))) in FrontB)};
			if ((RydHQB_Front) and ((side _x) getFriend (side RydHQB) < 0.6) and (_front) and not (_isCiv)) then {if not (_x in RydHQB_Enemies) then {RydHQB_Enemies set [(count RydHQB_Enemies), _x]}};
			if (RydHQB_SubAll) then 
				{
				if not ((side _x) getFriend (side RydHQB) < 0.6) then 
					{
					if (not (_x in RydHQB_Friends) and not (((leader _x) in RydHQB_Excluded) or (_isCiv))) then {RydHQB_Friends set [(count RydHQB_Friends), _x]}
					};
				};
			}
		}
	foreach allGroups;

	RydHQB_Excl = [];

		{
		if not ((group _x) in RydHQB_Excl) then {RydHQB_Excl set [(count RydHQB_Excl),group _x]} 
		}
	foreach RydHQB_Excluded;

	if (RydHQB_SubSynchro) then 
		{
			{
			if ((_x in RydHQB_LastSub) and not ((leader _x) in (synchronizedObjects leaderHQB)) and (RydHQB_ReSynchro)) then {RydHQB_Subordinated set [(count RydHQB_Subordinated),_x]};
			if (not (_x in RydHQB_Subordinated) and ((leader _x) in (synchronizedObjects leaderHQB))) then {RydHQB_Subordinated set [(count RydHQB_Subordinated),_x]};
			}
		foreach allGroups;
		};

	if (RydHQB_SubNamed) then 
		{
			{
			for [{_i = 1},{_i <= RydHQB_NameLimit},{_i = _i + 1}] do
				{
				if (not (_x in RydHQB_Subordinated) and ((str (leader _x)) == ("RydB" + str (_i)))) then {RydHQB_Subordinated set [(count RydHQB_Subordinated),_x]};
				};
			}
		foreach allGroups;
		};

	if (RydHQB_SubZero) then 
		{
			{
			if (((random 100) >= 50) and not (_x in RydHQB_Subordinated)) then {RydHQB_Subordinated set [(count RydHQB_Subordinated),_x]} else {if (not (_x in RydHQBB_Subordinated)) then {RydHQBB_Subordinated set [(count RydHQBB_Subordinated),_x]}};
			}
		foreach allGroups;
		};

	RydHQB_Friends = RydHQB_Friends + RydHQB_Subordinated + RydHQB_Included - (RydHQB_ExcludedG + RydHQB_Excl);
	RydHQB_Friends = RydHQB_Friends - [RydHQB];
	RydHQB_NoWayD = allGroups - RydHQB_LastFriends;

	RydHQB_Friends = [RydHQB_Friends] call RYD_RandomOrd;

		{
		[_x] call RYD_WPdel;
		}
	foreach ((RydHQB_Excl + RydHQB_ExcludedG) - RydHQB_NoWayD);

	if (RydHQB_Init) then 
		{
			{
			RydHQB_CInitial = RydHQB_CInitial + (count (units _x))
			}
		foreach RydHQB_Friends + [RydHQB]
		};

	RydHQB_CLast = RydHQB_CCurrent;
	RydHQB_CCurrent = 0;
		{
		RydHQB_CCurrent = RydHQB_CCurrent + (count (units _x))
		}
	foreach RydHQB_Friends + [RydHQB];

	RydHQB_Ex = [];

	if (RydHQB_ExInfo) then 
		{
		RydHQB_Ex = RydHQB_Excl + RydHQB_ExcludedG
		};

		{
		for [{_a = 0},{_a < count (units _x)},{_a = _a + 1}] do
			{
			_enemyU = vehicle ((units _x) select _a);
				{
				if ((_x knowsAbout _enemyU) >= 0.05) exitwith 
					{
					if not (_enemyU in RydHQB_KnEnemies) then 
						{
						RydHQB_KnEnemies set [(count RydHQB_KnEnemies),_enemyU];
						};

					if not ((group _enemyU) in RydHQB_KnEnemiesG) then 
						{
						_already = missionnameSpace getVariable ["AlreadySpotted",[]];
						RydHQB_KnEnemiesG set [(count RydHQB_KnEnemiesG),(group _enemyU)];
						if not ((group _enemyU) in _already) then
							{
							_UL = (leader _x);if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_EnemySpot,"EnemySpot"] call RYD_AIChatter}};
							}
						}
					} 
				}
			foreach (RydHQB_Friends + [RydHQB] + RydHQB_Ex)
			}
		}
	foreach RydHQB_Enemies;

	_already = missionnameSpace getVariable ["AlreadySpotted",[]];

		{
		if not (_x in _already) then
			{
			_already set [(count _already),_x]
			}
		}
	foreach RydHQB_KnEnemiesG;

	missionnameSpace setVariable ["AlreadySpotted",_already];

	_lossFinal = RydHQB_CInitial - RydHQB_CCurrent;
	if (_lossFinal < 0) then {_lossFinal = 0;RydHQB_CInitial = RydHQB_CCurrent};

	if not (RydHQB_Init) then 
		{
		_lossP = _lossFinal/RydHQB_CInitial;

		if ((_OLmpl == 0) and ((count RydHQB_KnEnemies) > 0)) then
			{
			_OLmpl = 0.01;
			_firstMC = RydHQB_Cyclecount - 1
			};

		if ((_cycleCap < (50 / (1.01 - _lossP))) and ((count RydHQB_KnEnemies) == 0) and (_OLmpl == 0.01)) then
			{
			_cycleCap = _cycleCap + 1;
			if ((random 1) < _lossP) then {_firstMC = _firstMC + 1}
			}
		else
			{
			if not ((count RydHQB_KnEnemies) == 0) then
				{
				_cycleCap = 0;
				}
			};

		
		_lossPerc = _lossP * 100;
		_cycle = RydHQB_Cyclecount - _firstMC;

		_OLF = _OLmpl * (((-(_lossPerc * _lossPerc))/(1.1^_cycle)) + ((15 + (random 5) + (random 5))/(1 + _lossP)) - (_lossP * 10) + (_cycle ^ ((10 * (1 - _lossP))/_cycle)));

		_mplLU = 1;
		_lostU = RydHQB_CLast - RydHQB_CCurrent;
		if (_lostU < 0) then {_lostU = - _lostU;_mplLU = -1};

		_lossL = _mplLU * ((100 * _lostU/RydHQB_CInitial)^(1.55 + (random 0.05) + (random 0.05)))/10;

		_balanceF = 0.5 + (random 0.5) + (random 0.5) - _lossP - (count RydHQB_KnEnemies)/RydHQB_CCurrent;

		RydHQB_Morale = RydHQB_Morale + (_OLF - _lossL + _balanceF);
		//RydHQB_Morale = RydHQB_Morale + (((RydHQB_CCurrent - RydHQB_CInitial) * (6/(1 + (RydHQB_Cyclecount/25)))) + (6 * ((random 0.5) + RydHQB_CCurrent - RydHQB_CLast)))/((1 + (10*RydHQB_CInitial))/(1 + ((count RydHQB_KnEnemies) * 0.5)));
		//diag_log format ["Init: %2, Last: %3, Current: %3,Zmiana morale: %1",(((RydHQB_CCurrent - RydHQB_CInitial) * (6/(1 + (RydHQB_Cyclecount/25)))) + (6 * ((random 0.5) + RydHQB_CCurrent - RydHQB_CLast)))/((1 + (10*RydHQB_CInitial))/(1 + ((count RydHQB_KnEnemies) * 0.5))),RydHQB_CInitial,RydHQB_CLast,RydHQB_CCurrent];
		};

	if (RydHQB_Morale < -50) then {RydHQB_Morale = -50};
	if (RydHQB_Morale > 0) then {RydHQB_Morale = 0};
	if (RydHQB_Debug) then 
		{
		_mdbg = format ["Morale B (%2): %1 - losses: %3 percent (%4)",RydHQB_Morale,RydHQB_Personality,(round (((_lossFinal/RydHQB_CInitial) * 100) * 10)/10),_lossFinal];
		diag_log _mdbg;
		leaderHQB globalChat _mdbg;

		_cl = "<t color='#007f00'>B -> M: %1 - L: %2%3</t>";

		switch (side RydHQB) do
			{
			case (west) : {_cl = "<t color='#0d81c4'>B -> M: %1 - L: %2%3</t>"};
			case (east) : {_cl = "<t color='#ff0000'>B -> M: %1 - L: %2%3</t>"};
			};

		_dbgMon = parseText format [_cl,(round (RydHQB_Morale * 10))/10,(round (((_lossFinal/RydHQB_CInitial) * 100) * 10)/10),"%"];

		RydHQB setVariable ["DbgMon",_dbgMon];
		};

	if (RydHQB_Init) then {[RydHQB] spawn Desperado};

	RydHQB_Init = false;

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

				if (_SpecForcheck) then {if not (_vh in RydHQB_SpecFor) then {RydHQB_SpecFor set [(count RydHQB_SpecFor),_vh]};if not (_grp in RydHQB_SpecForG) then {RydHQB_SpecForG set [(count RydHQB_SpecForG),_grp]}};
				if (_reconcheck) then {if not (_vh in RydHQB_recon) then {RydHQB_recon set [(count RydHQB_recon),_vh]};if not (_grp in RydHQB_reconG) then {RydHQB_reconG set [(count RydHQB_reconG),_grp]}};
				if (_FOcheck) then {if not (_vh in RydHQB_FO) then {RydHQB_FO set [(count RydHQB_FO),_vh]};if not (_grp in RydHQB_FOG) then {RydHQB_FOG set [(count RydHQB_FOG),_grp]}};
				if (_sniperscheck) then {if not (_vh in RydHQB_snipers) then {RydHQB_snipers set [(count RydHQB_snipers),_vh]};if not (_grp in RydHQB_snipersG) then {RydHQB_snipersG set [(count RydHQB_snipersG),_grp]}};
				if (_ATinfcheck) then {if not (_vh in RydHQB_ATinf) then {RydHQB_ATinf set [(count RydHQB_ATinf),_vh]};if not (_grp in RydHQB_ATinfG) then {RydHQB_ATinfG set [(count RydHQB_ATinfG),_grp]}};
				if (_AAinfcheck) then {if not (_vh in RydHQB_AAinf) then {RydHQB_AAinf set [(count RydHQB_AAinf),_vh]};if not (_grp in RydHQB_AAinfG) then {RydHQB_AAinfG set [(count RydHQB_AAinfG),_grp]}};
				if (_Infcheck) then {if not (_vh in RydHQB_Inf) then {RydHQB_FValue = RydHQB_FValue + 1;RydHQB_Inf set [(count RydHQB_Inf),_vh]};if not (_grp in RydHQB_InfG) then {RydHQB_InfG set [(count RydHQB_InfG),_grp]}};
				if (_Artcheck) then {if not (_vh in RydHQB_Art) then {RydHQB_FValue = RydHQB_FValue + 3;RydHQB_Art set [(count RydHQB_Art),_vh]};if not (_grp in RydHQB_ArtG) then {RydHQB_ArtG set [(count RydHQB_ArtG),_grp]}};
				if (_HArmorcheck) then {if not (_vh in RydHQB_HArmor) then {RydHQB_FValue = RydHQB_FValue + 10;RydHQB_HArmor set [(count RydHQB_HArmor),_vh]};if not (_grp in RydHQB_HArmorG) then {RydHQB_HArmorG set [(count RydHQB_HArmorG),_grp]}};
				if (_MArmorcheck) then {if not (_vh in RydHQB_MArmor) then {RydHQB_MArmor set [(count RydHQB_MArmor),_vh]};if not (_grp in RydHQB_MArmorG) then {RydHQB_MArmorG set [(count RydHQB_MArmorG),_grp]}};
				if (_LArmorcheck) then {if not (_vh in RydHQB_LArmor) then {RydHQB_FValue = RydHQB_FValue + 5;RydHQB_LArmor set [(count RydHQB_LArmor),_vh]};if not (_grp in RydHQB_LArmorG) then {RydHQB_LArmorG set [(count RydHQB_LArmorG),_grp]}};
				if (_LArmorATcheck) then {if not (_vh in RydHQB_LArmorAT) then {RydHQB_LArmorAT set [(count RydHQB_LArmorAT),_vh]};if not (_grp in RydHQB_LArmorATG) then {RydHQB_LArmorATG set [(count RydHQB_LArmorATG),_grp]}};
				if (_Carscheck) then {if not (_vh in RydHQB_Cars) then {RydHQB_FValue = RydHQB_FValue + 3;RydHQB_Cars set [(count RydHQB_Cars),_vh]};if not (_grp in RydHQB_CarsG) then {RydHQB_CarsG set [(count RydHQB_CarsG),_grp]}};
				if (_Aircheck) then {if not (_vh in RydHQB_Air) then {RydHQB_FValue = RydHQB_FValue + 15;RydHQB_Air set [(count RydHQB_Air),_vh]};if not (_grp in RydHQB_AirG) then {RydHQB_AirG set [(count RydHQB_AirG),_grp]}};
				if (_BAircheck) then {if not (_vh in RydHQB_BAir) then {RydHQB_BAir set [(count RydHQB_BAir),_vh]};if not (_grp in RydHQB_BAirG) then {RydHQB_BAirG set [(count RydHQB_BAirG),_grp]}};				
				if (_RAircheck) then {if not (_vh in RydHQB_RAir) then {RydHQB_RAir set [(count RydHQB_RAir),_vh]};if not (_grp in RydHQB_RAirG) then {RydHQB_RAirG set [(count RydHQB_RAirG),_grp]}};				
				if (_NCAircheck) then {if not (_vh in RydHQB_NCAir) then {RydHQB_NCAir set [(count RydHQB_NCAir),_vh]};if not (_grp in RydHQB_NCAirG) then {RydHQB_NCAirG set [(count RydHQB_NCAirG),_grp]}};
				if (_Navalcheck) then {if not (_vh in RydHQB_Naval) then {RydHQB_Naval set [(count RydHQB_Naval),_vh]};if not (_grp in RydHQB_NavalG) then {RydHQB_NavalG set [(count RydHQB_NavalG),_grp]}};
				if (_Staticcheck) then {if not (_vh in RydHQB_Static) then {RydHQB_FValue = RydHQB_FValue + 1;RydHQB_Static set [(count RydHQB_Static),_vh]};if not (_grp in RydHQB_StaticG) then {RydHQB_StaticG set [(count RydHQB_StaticG),_grp]}};
				if (_StaticAAcheck) then {if not (_vh in RydHQB_StaticAA) then {RydHQB_StaticAA set [(count RydHQB_StaticAA),_vh]};if not (_grp in RydHQB_StaticAAG) then {RydHQB_StaticAAG set [(count RydHQB_StaticAAG),_grp]}};
				if (_StaticATcheck) then {if not (_vh in RydHQB_StaticAT) then {RydHQB_StaticAT set [(count RydHQB_StaticAT),_vh]};if not (_grp in RydHQB_StaticATG) then {RydHQB_StaticATG set [(count RydHQB_StaticATG),_grp]}};
				if (_Supportcheck) then {if not (_vh in RydHQB_Support) then {RydHQB_Support set [(count RydHQB_Support),_vh]};if not (_grp in RydHQB_SupportG) then {RydHQB_SupportG set [(count RydHQB_SupportG),_grp]}};
				if (_Cargocheck) then {if not (_vh in RydHQB_Cargo) then {RydHQB_Cargo set [(count RydHQB_Cargo),_vh]};if not (_grp in RydHQB_CargoG) then {RydHQB_CargoG set [(count RydHQB_CargoG),_grp]}};
				if (_NCCargocheck) then {if not (_vh in RydHQB_NCCargo) then {RydHQB_NCCargo set [(count RydHQB_NCCargo),_vh]};if not (_grp in RydHQB_NCCargoG) then {RydHQB_NCCargoG set [(count RydHQB_NCCargoG),_grp]}};
				if (_Crewcheck) then {if not (_vh in RydHQB_Crew) then {RydHQB_Crew set [(count RydHQB_Crew),_vh]};if not (_grp in RydHQB_CrewG) then {RydHQB_CrewG set [(count RydHQB_CrewG),_grp]}};
				if (_NCrewInfcheck) then {if not (_vh in RydHQB_NCrewInf) then {RydHQB_NCrewInf set [(count RydHQB_NCrewInf),_vh]};if not (_grp in RydHQB_NCrewInfG) then {RydHQB_NCrewInfG set [(count RydHQB_NCrewInfG),_grp]}};
				
			}
		foreach (units _x)
		}
	foreach RydHQB_Friends;

	RydHQB_NCrewInfG = RydHQB_NCrewInfG - (RydHQB_RAirG + RydHQB_StaticG);
	RydHQB_NCrewInf = RydHQB_NCrewInf - (RydHQB_RAir + RydHQB_Static);
	RydHQB_InfG = RydHQB_InfG - (RydHQB_RAirG + RydHQB_StaticG);
	RydHQB_Inf = RydHQB_Inf - (RydHQB_RAir + RydHQB_Static);

	RydHQB_CargoAirEx = [];
	RydHQB_CargoLandEx = [];
	if (RydHQB_NoAirCargo) then {RydHQB_CargoAirEx = RydHQB_AirG};
	if (RydHQB_NoLandCargo) then {RydHQB_CargoLandEx = (RydHQB_CargoG - RydHQB_AirG)};
	RydHQB_CargoG = RydHQB_CargoG - (RydHQB_CargoAirEx + RydHQB_CargoLandEx + RydHQB_AmmoDrop);

		{
		if not (_x in RydHQB_SupportG) then
			{
			RydHQB_SupportG set [(count RydHQB_SupportG),_x]
			}
		}
	foreach RydHQB_AmmoDrop;
		
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
				
				if (_SpecForcheck) then {if not (_vh in RydHQB_EnSpecFor) then {RydHQB_EnSpecFor set [(count RydHQB_EnSpecFor),_vh]};if not (_grp in RydHQB_EnSpecForG) then {RydHQB_EnSpecForG set [(count RydHQB_EnSpecForG),_grp]}};
				if (_reconcheck) then {if not (_vh in RydHQB_Enrecon) then {RydHQB_Enrecon set [(count RydHQB_Enrecon),_vh]};if not (_grp in RydHQB_EnreconG) then {RydHQB_EnreconG set [(count RydHQB_EnreconG),_grp]}};
				if (_FOcheck) then {if not (_vh in RydHQB_EnFO) then {RydHQB_EnFO set [(count RydHQB_EnFO),_vh]};if not (_grp in RydHQB_EnFOG) then {RydHQB_EnFOG set [(count RydHQB_EnFOG),_grp]}};
				if (_sniperscheck) then {if not (_vh in RydHQB_Ensnipers) then {RydHQB_Ensnipers set [(count RydHQB_Ensnipers),_vh]};if not (_grp in RydHQB_EnsnipersG) then {RydHQB_EnsnipersG set [(count RydHQB_EnsnipersG),_grp]}};
				if (_ATinfcheck) then {if not (_vh in RydHQB_EnATinf) then {RydHQB_EnATinf set [(count RydHQB_EnATinf),_vh]};if not (_grp in RydHQB_EnATinfG) then {RydHQB_EnATinfG set [(count RydHQB_EnATinfG),_grp]}};
				if (_AAinfcheck) then {if not (_vh in RydHQB_EnAAinf) then {RydHQB_EnAAinf set [(count RydHQB_EnAAinf),_vh]};if not (_grp in RydHQB_EnAAinfG) then {RydHQB_EnAAinfG set [(count RydHQB_EnAAinfG),_grp]}};
				if (_Infcheck) then {if not (_vh in RydHQB_EnInf) then {RydHQB_EValue = RydHQB_EValue + 1;RydHQB_EnInf set [(count RydHQB_EnInf),_vh]};if not (_grp in RydHQB_EnInfG) then {RydHQB_EnInfG set [(count RydHQB_EnInfG),_grp]}};
				if (_Artcheck) then {if not (_vh in RydHQB_EnArt) then {RydHQB_EValue = RydHQB_EValue + 3;RydHQB_EnArt set [(count RydHQB_EnArt),_vh]};if not (_grp in RydHQB_EnArtG) then {RydHQB_EnArtG set [(count RydHQB_EnArtG),_grp]}};
				if (_HArmorcheck) then {if not (_vh in RydHQB_EnHArmor) then {RydHQB_EValue = RydHQB_EValue + 10;RydHQB_EnHArmor set [(count RydHQB_EnHArmor),_vh]};if not (_grp in RydHQB_EnHArmorG) then {RydHQB_EnHArmorG set [(count RydHQB_EnHArmorG),_grp]}};
				if (_MArmorcheck) then {if not (_vh in RydHQB_EnMArmor) then {RydHQB_EnMArmor set [(count RydHQB_EnMArmor),_vh]};if not (_grp in RydHQB_EnMArmorG) then {RydHQB_EnMArmorG set [(count RydHQB_EnMArmorG),_grp]}};
				if (_LArmorcheck) then {if not (_vh in RydHQB_EnLArmor) then {RydHQB_EValue = RydHQB_EValue + 5;RydHQB_EnLArmor set [(count RydHQB_EnLArmor),_vh]};if not (_grp in RydHQB_EnLArmorG) then {RydHQB_EnLArmorG set [(count RydHQB_EnLArmorG),_grp]}};
				if (_LArmorATcheck) then {if not (_vh in RydHQB_EnLArmorAT) then {RydHQB_EnLArmorAT set [(count RydHQB_EnLArmorAT),_vh]};if not (_grp in RydHQB_EnLArmorATG) then {RydHQB_EnLArmorATG set [(count RydHQB_EnLArmorATG),_grp]}};
				if (_Carscheck) then {if not (_vh in RydHQB_EnCars) then {RydHQB_EValue = RydHQB_EValue + 3;RydHQB_EnCars set [(count RydHQB_EnCars),_vh]};if not (_grp in RydHQB_EnCarsG) then {RydHQB_EnCarsG set [(count RydHQB_EnCarsG),_grp]}};
				if (_Aircheck) then {if not (_vh in RydHQB_EnAir) then {RydHQB_EValue = RydHQB_EValue + 15;RydHQB_EnAir set [(count RydHQB_EnAir),_vh]};if not (_grp in RydHQB_EnAirG) then {RydHQB_EnAirG set [(count RydHQB_EnAirG),_grp]}};
				if (_BAircheck) then {if not (_vh in RydHQB_EnBAir) then {RydHQB_EnBAir set [(count RydHQB_EnBAir),_vh]};if not (_grp in RydHQB_EnBAirG) then {RydHQB_EnBAirG set [(count RydHQB_EnBAirG),_grp]}};				
				if (_RAircheck) then {if not (_vh in RydHQB_EnRAir) then {RydHQB_EnRAir set [(count RydHQB_EnRAir),_vh]};if not (_grp in RydHQB_EnRAirG) then {RydHQB_EnRAirG set [(count RydHQB_EnRAirG),_grp]}};
				if (_NCAircheck) then {if not (_vh in RydHQB_EnNCAir) then {RydHQB_EnNCAir set [(count RydHQB_EnNCAir),_vh]};if not (_grp in RydHQB_EnNCAirG) then {RydHQB_EnNCAirG set [(count RydHQB_EnNCAirG),_grp]}};
				if (_Navalcheck) then {if not (_vh in RydHQB_EnNaval) then {RydHQB_EnNaval set [(count RydHQB_EnNaval),_vh]};if not (_grp in RydHQB_EnNavalG) then {RydHQB_EnNavalG set [(count RydHQB_EnNavalG),_grp]}};
				if (_Staticcheck) then {if not (_vh in RydHQB_EnStatic) then {RydHQB_EValue = RydHQB_EValue + 1;RydHQB_EnStatic set [(count RydHQB_EnStatic),_vh]};if not (_grp in RydHQB_EnStaticG) then {RydHQB_EnStaticG set [(count RydHQB_EnStaticG),_grp]}};
				if (_StaticAAcheck) then {if not (_vh in RydHQB_EnStaticAA) then {RydHQB_EnStaticAA set [(count RydHQB_EnStaticAA),_vh]};if not (_grp in RydHQB_EnStaticAAG) then {RydHQB_EnStaticAAG set [(count RydHQB_EnStaticAAG),_grp]}};
				if (_StaticATcheck) then {if not (_vh in RydHQB_EnStaticAT) then {RydHQB_EnStaticAT set [(count RydHQB_EnStaticAT),_vh]};if not (_grp in RydHQB_EnStaticATG) then {RydHQB_EnStaticATG set [(count RydHQB_EnStaticATG),_grp]}};
				if (_Supportcheck) then {if not (_vh in RydHQB_EnSupport) then {RydHQB_EnSupport set [(count RydHQB_EnSupport),_vh]};if not (_grp in RydHQB_EnSupportG) then {RydHQB_EnSupportG set [(count RydHQB_EnSupportG),_grp]}};
				if (_Cargocheck) then {if not (_vh in RydHQB_EnCargo) then {RydHQB_EnCargo set [(count RydHQB_EnCargo),_vh]};if not (_grp in RydHQB_EnCargoG) then {RydHQB_EnCargoG set [(count RydHQB_EnCargoG),_grp]}};
				if (_NCCargocheck) then {if not (_vh in RydHQB_EnNCCargo) then {RydHQB_EnNCCargo set [(count RydHQB_EnNCCargo),_vh]};if not (_grp in RydHQB_EnNCCargoG) then {RydHQB_EnNCCargoG set [(count RydHQB_EnNCCargoG),_grp]}};
				if (_Crewcheck) then {if not (_vh in RydHQB_EnCrew) then {RydHQB_EnCrew set [(count RydHQB_EnCrew),_vh]};if not (_grp in RydHQB_EnCrewG) then {RydHQB_EnCrewG set [(count RydHQB_EnCrewG),_grp]}};
				if (_NCrewInfcheck) then {if not (_vh in RydHQB_EnNCrewInf) then {RydHQB_EnNCrewInf set [(count RydHQB_EnNCrewInf),_vh]};if not (_grp in RydHQB_EnNCrewInfG) then {RydHQB_EnNCrewInfG set [(count RydHQB_EnNCrewInfG),_grp]}};
				
			}
		foreach (units _x)
		}
	foreach RydHQB_KnEnemiesG;

	RydHQB_EnNCrewInfG = RydHQB_EnNCrewInfG - (RydHQB_EnRAirG + RydHQB_EnStaticG);
	RydHQB_EnNCrewInf = RydHQB_EnNCrewInf - (RydHQB_EnRAir + RydHQB_EnStatic);
	RydHQB_EnInfG = RydHQB_EnInfG - (RydHQB_EnRAirG + RydHQB_EnStaticG);
	RydHQB_EnInf = RydHQB_EnInf - (RydHQB_EnRAir + RydHQB_EnStatic);

	if (RydHQB_Flee) then
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
		foreach RydHQB_Friends;

		if (_AllPanic == 0) then {_AllPanic = 1};
		_midCow = 0;
		if not ((count RydHQB_Friends) == 0) then {_midCow = _AllCow/(count RydHQB_Friends)};

			{
			_cowF = ((- RydHQB_Morale)/(50 + (random 25))) + (random (2 * _midCow)) - _midCow;
			_cowF = _cowF * RydHQB_Muu;
			if (_x in RydHQB_SpecForG) then {_cowF = _cowF - 0.8};
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

			if (((random ((20 + (RydHQB_Morale/5))/_AllPanic)) < _cowF) and ((random 100) > (100/(_AllPanic + 1)))) then 
				{
				[_x] call RYD_WPdel;
				_x setVariable [("inPanic" + (str _x)), true];
				if (RydHQB_DebugII) then {_i = [(getPosATL (vehicle (leader _x))),_x,"markPanic","ColorYellow","ICON","DOT","B!","B!",[0.5,0.5]] call RYD_Mark};
				_x setVariable [("Busy" + (str _x)), true];

				_UL = leader _x;
				if not (isPlayer _UL) then 
					{
					if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_InPanic,"InPanic"] call RYD_AIChatter}
					};

				if (RydHQB_Surr) then
					{
					if ((random 100) > 50) then
						{
						if (RydHQB_DebugII) then {_i setMarkerColor "ColorPink";_i setMarkerText "B!!!"};
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
		foreach RydHQB_Friends
		};

		{
		RydHQB_KnEnPos set [(count RydHQB_KnEnPos),getPosATL (vehicle (leader _x))];
		if ((count RydHQB_KnEnPos) >= 100) then {RydHQB_KnEnPos = RydHQB_KnEnPos - [RydHQB_KnEnPos select 0]};
		}
	foreach RydHQB_KnEnemiesG;

	for [{_z = 0},{_z < (count RydHQB_KnEnemies)},{_z = _z + 1}] do
		{
		_KnEnemy = RydHQB_KnEnemies select _z;
			{
			if ((_x knowsAbout _KnEnemy) > 0.01) then {RydHQB reveal [_KnEnemy,2]}
			}
		foreach RydHQB_Friends
		};

	if ((RydBB_Active) and (leaderHQB in (RydBBa_HQs + RydBBb_HQs))) then {[] call RYD_BBArrRefresh};

	if (RydHQB_Cyclecount == 1) then
		{
		[] spawn B_EnemyScan;
		if (RydHQB_ArtyShells > 0) then
			{
			[RydHQB_ArtG,RydHQB_ArtyShells] call RYD_ArtyPrep;
			};

		if ((RydBB_Active) and (leaderHQB in (RydBBa_HQs + RydBBb_HQs))) then 
			{
			RydHQB_readyForBB = true;
			RydxHQ_Done = true;
			if (leaderHQB in RydBBa_HQs) then 
				{
				waitUntil {sleep 0.1;(RydBBa_InitDone)}
				};

			if (leaderHQB in RydBBb_HQs) then 
				{
				waitUntil {sleep 0.1;(RydBBb_InitDone)}
				}
			}
		};

	if (((count RydHQB_KnEnemies) > 0) and ((count RydHQB_ArtG) > 0)) then {[RydHQB_ArtG,RydHQB_KnEnemies,(RydHQB_EnHArmor + RydHQB_EnMArmor + RydHQB_EnLArmor),RydHQB_Friends,RydHQB_Debug,leaderHQB] call RYD_CFF};

	if (isNil ("RydHQB_Order")) then {RydHQB_Order = "ATTACK"};
	_gauss100 = (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10);
	if ((((_gauss100 + RydHQB_Inertia + RydHQB_Morale) > ((RydHQB_EValue/(RydHQB_FValue + 0.1)) * 60)) and not (isNil ("RydHQB_Obj")) and not (RydHQB_Order == "DEFEND")) or (RydHQB_Berserk)) then 
		{
		_lastS = RydHQB getVariable ["LastStance","At"];
		if ((_lastS == "De") or (RydHQB_CycleCount == 1)) then
			{
			if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQB,RydxHQ_AIC_OffStance,"OffStance"] call RYD_AIChatter};
			};

		RydHQB setVariable ["LastStance","At"];
		RydHQB_Inertia = 30 * (0.5 + RydHQB_Consistency)*(0.5 + RydHQB_Activity);
		[] spawn B_HQOrders 
		} 
	else 
		{
		_lastS = RydHQB getVariable ["LastStance","De"];
		if ((_lastS == "At") or (RydHQB_CycleCount == 1)) then
			{
			if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQB,RydxHQ_AIC_DefStance,"DefStance"] call RYD_AIChatter};
			};

		RydHQB setVariable ["LastStance","De"];
		RydHQB_Inertia = - (30  * (0.5 + RydHQB_Consistency))/(0.5 + RydHQB_Activity);
		[] spawn B_HQOrdersDef 
		};


	if ((((RydHQB_Circumspection + RydHQB_Fineness)/2) + 0.1) > (random 1.2)) then
		{
		_SFcount = {not (_x getVariable ["Busy" + (str _x),false]) and not (_x getVariable ["Resting" + (str _x),false])} count (RydHQB_SpecForG - RydHQB_SFBodyGuard);

		if (_SFcount > 0) then
			{
			_isNight = [] call RYD_isNight;
			_SFTgts = [];
			_chance = 40 + (60 * RydHQB_Activity);

				{
				_HQ = group _x;
				if (_HQ in RydHQB_KnEnemiesG) then
					{
					_SFTgts set [(count _SFTgts),_HQ]
					}
				}
			foreach (RydxHQ_AllLeaders - [leaderHQB]);

			if ((count _SFTgts) == 0) then
				{
				_chance = _chance/2;
				_SFTgts = RydHQB_EnArtG
				};

			if ((count _SFTgts) == 0) then
				{
				_chance = _chance/3;
				_SFTgts = RydHQB_EnStaticG
				};

			if (_isNight) then
				{
				_chance = _chance + 25
				};

			if ((count _SFTgts) > 0) then
				{
				_chance = _chance + (((2 * _SFcount) - (8/(0.75 + (RydHQB_Recklessness/2)))) * 20);
				_trgG = _SFTgts select (floor (random (count _SFTgts)));
				_alreadyAttacked = {_x == _trgG} count RydHQB_SFTargets;
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
								if not (_x in RydHQB_SFBodyGuard) then
									{	
									_SFAv set [(count _SFAv),_x]
									}
								}
							}
						}
					foreach RydHQB_SpecForG;

					_team = _SFAv select (floor (random (count _SFAv)));
					_trg = vehicle (leader _trgG);
					if (not ((typeOf _trg) in (_HArmor + _LArmor)) or ((random 100) > (90 - (RydHQB_Recklessness * 10)))) then {[_team,_trg,_trgG] spawn B_GoSFAttack}
					}
				}
			}
		};

	if (RydHQB_LRelocating) then
		{
		if ((abs (speed (vehicle leaderHQB))) < 0.1) then {RydHQB setVariable ["onMove",false]};
		_onMove = RydHQB getVariable ["onMove",false];

		if not (_onMove) then 
			{
			if (not (isPlayer leaderHQB) and ((RydHQB_Cyclecount == 1) or not (RydHQB_Progress == 0))) then
				{
				[RydHQB] call RYD_WPdel;

				_Lpos = position leaderHQB;
				if (RydHQB_Cyclecount == 1) then {RydHQB_Fpos = _Lpos};

				_rds = 0;

				if (RydHQB_LRelocating) then 
					{
					_rds = 0;
					if (RydHQB_NObj == 1) then {_Lpos = RydHQB_Fpos;if (leaderHQB in (RydBBa_HQs + RydBBb_HQs)) then {_Lpos = position leaderHQB};_rds = 0};
					if (RydHQB_NObj == 2) then {_Lpos = position RydHQB_Obj1};
					if (RydHQB_NObj == 3) then {_Lpos = position RydHQB_Obj2};
					if (RydHQB_NObj >= 4) then {_Lpos = position RydHQB_Obj3};
					};

				_spd = "LIMITED";
				if (RydHQB_Progress == -1) then {_spd = "NORMAL"};
				RydHQB_Progress = 0;
				_enemyN = false;

					{
					_eLdr = vehicle (leader _x);
					_eDst = _eLdr distance _Lpos;

					if (_eDst < 600) exitWith {_enemyN = true}
					}
				foreach RydHQB_KnEnemiesG;

				if not (_enemyN) then 
					{
					_wp = [RydHQB,_Lpos,"HOLD","AWARE","GREEN",_spd,["true",""],true,_rds,[0,0,0],"FILE"] call RYD_WPadd;
					if (isNull (assignedVehicle leaderHQB)) then
						{
						if (RydHQB_GetHQInside) then {[_wp] call RYD_GoInside}
						};
					if ((RydHQB_LRelocating) and (RydHQB_NObj > 1) and (RydHQB_Cyclecount > 1)) then 
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
								foreach RydHQB_KnEnemiesG;

								if (isNull RydHQB) then 
									{
									_onPlace = true
									}
								else
									{
									if not (_getBack) then
										{
										if (((vehicle leaderHQB) distance _LPos) < 30) then {_onPlace = true}
										}
									};
								

								((_getback) or (_onPlace))
								};

							if not (_onPlace) then
								{
								_rds = 30;
								if (RydHQB_NObj <= 2) then {_Lpos = getPosATL (vehicle leaderHQB);_rds = 0};
								if (RydHQB_NObj == 3) then {_Lpos = position RydHQB_Obj1};
								if (RydHQB_NObj >= 4) then {_Lpos = position RydHQB_Obj2};

								_getBack = false;

									{
									_eLdr = vehicle (leader _x);
									_eDst = _eLdr distance _Lpos;

									if (_eDst < 600) exitWith {_getBack = true}
									}
								foreach RydHQB_KnEnemiesG;

								if (_getBack) then {_Lpos = getPosATL (vehicle leaderHQB);_rds = 0};

								[RydHQB] call RYD_WPdel;	

								_spd = "NORMAL";
								if not (((vehicle leaderHQB) distance _LPos) < 50) then {_spd = "FULL"};

								_wp = [RydHQB,_Lpos,"HOLD","AWARE","GREEN",_spd,["true",""],true,_rds,[0,0,0],"FILE"] call RYD_WPadd;
								if (isNull (assignedVehicle leaderHQB)) then
									{
									if (RydHQB_GetHQInside) then {[_wp] call RYD_GoInside}
									};

								RydHQB setVariable ["onMove",true];
								}
							}
						}
					}
				}
			}
		};

	if (isNil ("RydHQB_CommDelay")) then {RydHQB_CommDelay = 1};
	_delay = (((22.5 + (count RydHQB_Friends))/(0.5 + RydHQB_Reflex)) * RydHQB_CommDelay);
	sleep _delay;

		{
		RydHQB reveal vehicle (leader _x)
		}
	foreach RydHQB_Friends;

	for [{_z = 0},{_z < (count RydHQB_KnEnemies)},{_z = _z + 1}] do
		{
		_KnEnemy = RydHQB_KnEnemies select _z;

			{
			if ((_x knowsAbout _KnEnemy) > 0.01) then {RydHQB reveal [_KnEnemy,2]} 
			}
		foreach RydHQB_Friends
		}
	};