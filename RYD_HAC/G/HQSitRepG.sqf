
RydHQG = GrpNull;

RydHQG = group leaderHQG;

leaderHQG kbAddTopic ["orders","RYD_HAC\topics.bikb",""];
waituntil {(leaderHQG kbHasTopic "orders")};

RydHQG_Cyclecount = 0;

waituntil {not (isNull RydHQG)};

RydHQG_PersDone = false;
[] spawn G_Personality;
waituntil {RydHQG_PersDone};

RydHQG_LHQInit = false;
[] spawn G_LHQ;
waituntil {RydHQG_LHQInit};

if (isNil ("RydHQG_Boxed")) then {RydHQG_Boxed = []};
if (isNil ("RydHQG_AmmoBoxes")) then 
	{
	RydHQG_AmmoBoxes = [];

	if not (isNil "RydHQG_AmmoDepot") then 
		{
		_rds = (triggerArea RydHQG_AmmoDepot) select 0;
		RydHQG_AmmoBoxes = (getPosATL RydHQG_AmmoDepot) nearObjects ["ReammoBox",_rds]
		}
	};

[] spawn G_HQReset;
[] spawn G_Rev;
[] spawn G_SuppMed;
[] spawn G_SuppFuel;
[] spawn G_SuppAmmo;
[] spawn G_SuppRep;
[] spawn G_SFIdleOrd;
[] spawn G_Reloc;
[] spawn G_LPos;

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
RydHQG_NCVeh = _NCCargo + (_Support - ["MH60S"]);

[(_snipers + _ATinf + _AAinf)] spawn G_Garrison;

RydHQG_ReconDone = false;
RydHQG_DefDone = false;
RydHQG_ReconStage = 1;
RydHQG_KnEnPos = [];
RydHQG_AirInDef = [];
if (isNil ("RydHQG_Excluded")) then {RydHQG_Excluded = []};
if (isNil ("RydHQG_Fast")) then {RydHQG_Fast = false};
if (isNil ("RydHQG_ExInfo")) then {RydHQG_ExInfo = false};
if (isNil ("RydHQG_ObjHoldTime")) then {RydHQG_ObjHoldTime = 600};
if (isNil "RydHQG_NObj") then {RydHQG_NObj = 1};

RydHQG_Init = true;

RydHQG_Inertia = 0;
RydHQG_Morale = 0;
RydHQG_CInitial = 0;
RydHQG_CLast = 0;
RydHQG_CCurrent = 0;
RydHQG_CIMoraleC = 0;
RydHQG_CLMoraleC = 0;
RydHQG_Surrender = false;

RydHQG_FirstEMark = true;
RydHQG_LastE = 0;
RydHQG_FlankingInit = false;
RydHQG_FlankingDone = false;
RydHQG_Progress = 0;

RydHQG_AAthreat = [];
RydHQG_ATthreat = [];
RydHQG_Airthreat = [];
RydHQG_Exhausted = [];

_lastHQ = leaderHQG;
_OLmpl = 0;
_cycleCap = 0;
_firstMC = 0; 
_wp = [];

while {not ((isNull RydHQG) or (RydHQG_Surrender))} do
	{
	if not (RydHQG_Fast) then {waituntil {sleep 0.1;((RydxHQ_Done) and (RydxHQB_Done) and (RydxHQC_Done) and (RydxHQD_Done) and (RydxHQE_Done) and (RydxHQF_Done) and (RydxHQG_Done) and (RydxHQH_Done))}};
	if (isNil ("RydHQG_SupportWP")) then {RydHQG_SupportWP = false};

	if (RydHQG_Cyclecount > 1) then
		{
		if not (_lastHQ == leaderHQG) then {sleep (60 + (random 60))};
		};

	_lastHQ = leaderHQG;
	RydHQG_Cyclecount = RydHQG_Cyclecount + 1;
	RydxHQ_Done = false;

	RydHQG_SpecFor = [];
	RydHQG_recon = [];
	RydHQG_FO = [];
	RydHQG_snipers = [];
	RydHQG_ATinf = [];
	RydHQG_AAinf = [];
	RydHQG_Inf = [];
	RydHQG_Art = [];
	RydHQG_HArmor = [];
	RydHQG_MArmor = [];
	RydHQG_LArmor = [];
	RydHQG_LArmorAT = [];
	RydHQG_Cars = [];
	RydHQG_Air = [];
	RydHQG_BAir = [];
	RydHQG_RAir = [];
	RydHQG_NCAir = [];
	RydHQG_Naval = [];
	RydHQG_Static = [];
	RydHQG_StaticAA = [];
	RydHQG_StaticAT = [];
	RydHQG_Support = [];
	RydHQG_Cargo = [];
	RydHQG_NCCargo = [];
	RydHQG_Other = [];
	RydHQG_Crew = [];
	RydHQG_NCrewInf = [];

	RydHQG_SpecForG = [];
	RydHQG_reconG = [];
	RydHQG_FOG = [];
	RydHQG_snipersG = [];
	RydHQG_ATinfG = [];
	RydHQG_AAinfG = [];
	RydHQG_InfG = [];
	RydHQG_ArtG = [];
	RydHQG_HArmorG = [];
	RydHQG_MArmorG = [];
	RydHQG_LArmorG = [];
	RydHQG_LArmorATG = [];
	RydHQG_CarsG = [];
	RydHQG_AirG = [];
	RydHQG_BAirG = [];
	RydHQG_RAirG = [];
	RydHQG_NCAirG = [];
	RydHQG_NavalG = [];
	RydHQG_StaticG = [];
	RydHQG_StaticAAG = [];
	RydHQG_StaticATG = [];
	RydHQG_SupportG = [];
	RydHQG_CargoG = [];
	RydHQG_NCCargoG = [];
	RydHQG_OtherG = [];
	RydHQG_CrewG = [];
	RydHQG_NCrewInfG = [];

	RydHQG_EnSpecFor = [];
	RydHQG_Enrecon = [];
	RydHQG_EnFO = [];
	RydHQG_Ensnipers = [];
	RydHQG_EnATinf = [];
	RydHQG_EnAAinf = [];
	RydHQG_EnInf = [];
	RydHQG_EnArt = [];
	RydHQG_EnHArmor = [];
	RydHQG_EnMArmor = [];
	RydHQG_EnLArmor = [];
	RydHQG_EnLArmorAT = [];
	RydHQG_EnCars = [];
	RydHQG_EnAir = [];
	RydHQG_EnBAir = [];
	RydHQG_EnRAir = [];
	RydHQG_EnNCAir = [];
	RydHQG_EnNaval = [];
	RydHQG_EnStatic = [];
	RydHQG_EnStaticAA = [];
	RydHQG_EnStaticAT = [];
	RydHQG_EnSupport = [];
	RydHQG_EnCargo = [];
	RydHQG_EnNCCargo = [];
	RydHQG_EnOther = [];
	RydHQG_EnCrew = [];
	RydHQG_EnNCrewInf = [];

	RydHQG_EnSpecForG = [];
	RydHQG_EnreconG = [];
	RydHQG_EnFOG = [];
	RydHQG_EnsnipersG = [];
	RydHQG_EnATinfG = [];
	RydHQG_EnAAinfG = [];
	RydHQG_EnInfG = [];
	RydHQG_EnArtG = [];
	RydHQG_EnHArmorG = [];
	RydHQG_EnMArmorG = [];
	RydHQG_EnLArmorG = [];
	RydHQG_EnLArmorATG = [];
	RydHQG_EnCarsG = [];
	RydHQG_EnAirG = [];
	RydHQG_EnBAirG = [];
	RydHQG_EnRAirG = [];
	RydHQG_EnNCAirG = [];
	RydHQG_EnNavalG = [];
	RydHQG_EnStaticG = [];
	RydHQG_EnStaticAAG = [];
	RydHQG_EnStaticATG = [];
	RydHQG_EnSupportG = [];
	RydHQG_EnCargoG = [];
	RydHQG_EnNCCargoG = [];
	RydHQG_EnOtherG = [];
	RydHQG_EnCrewG = [];
	RydHQG_EnNCrewInfG = [];

	RydHQG_LastE = count RydHQG_KnEnemies;
	RydHQG_LastFriends = RydHQG_Friends;

	if (isNil ("RydHQG_NoAirCargo")) then {RydHQG_NoAirCargo = false};
	if (isNil ("RydHQG_NoLandCargo")) then {RydHQG_NoLandCargo = false};
	if (isNil ("RydHQG_LastFriends")) then {RydHQG_LastFriends = []};
	if (isNil ("RydHQG_CargoFind")) then {RydHQG_CargoFind = 0};
	if (isNil ("RydHQG_Subordinated")) then {RydHQG_Subordinated = []};
	if (isNil ("RydHQG_Included")) then {RydHQG_Included = []};
	if (isNil ("RydHQG_ExcludedG")) then {RydHQG_ExcludedG = []};
	if (isNil ("RydHQG_SubAll")) then {RydHQG_SubAll = true};
	if (isNil ("RydHQG_SubSynchro")) then {RydHQG_SubSynchro = false};
	if (isNil ("RydHQG_SubNamed")) then {RydHQG_SubNamed = false};
	if (isNil ("RydHQG_SubZero")) then {RydHQG_SubZero = false};
	if (isNil ("RydHQG_ReSynchro")) then {RydHQG_ReSynchro = true};
	if (isNil ("RydHQG_NameLimit")) then {RydHQG_NameLimit = 100};
	if (isNil ("RydHQG_Surr")) then {RydHQG_Surr = false};
	if (isNil ("RydHQG_AOnly")) then {RydHQG_AOnly = []};
	if (isNil ("RydHQG_ROnly")) then {RydHQG_ROnly = []};
	if (isNil ("RydHQG_CargoOnly")) then {RydHQG_CargoOnly = []};
	if (isNil ("RydHQG_NoCargo")) then {RydHQG_NoCargo = []};
	if (isNil ("RydHQG_NoFlank")) then {RydHQG_NoFlank = []};
	if (isNil ("RydHQG_NoDef")) then {RydHQG_NoDef = []};
	if (isNil ("RydHQG_FirstToFight")) then {RydHQG_FirstToFight = []};
	if (isNil ("RydHQG_VoiceComm")) then {RydHQG_VoiceComm = true};
	if (isNil ("RydHQG_Front")) then {RydHQG_Front = false};
	if (isNil ("RydHQG_LRelocating")) then {RydHQG_LRelocating = false};
	if (isNil ("RydHQG_Flee")) then {RydHQG_Flee = true};
	if (isNil ("RydHQG_GarrR")) then {RydHQG_GarrR = 500};
	if (isNil ("RydHQG_Rush")) then {RydHQG_Rush = false};
	if (isNil ("RydHQG_GarrVehAb")) then {RydHQG_GarrVehAb = false};
	if (isNil ("RydHQG_DefendObjectives")) then {RydHQG_DefendObjectives = 4};
	if (isNil ("RydHQG_DefSpot")) then {RydHQG_DefSpot = []};
	if (isNil ("RydHQG_RecDefSpot")) then {RydHQG_RecDefSpot = []};
	if (isNil "RydHQG_Flare") then {RydHQG_Flare = true};
	if (isNil "RydHQG_Smoke") then {RydHQG_Smoke = true};
	if (isNil "RydHQG_NoRec") then {RydHQG_NoRec = 1};
	if (isNil "RydHQG_RapidCapt") then {RydHQG_RapidCapt = 10};
	if (isNil "RydHQG_Muu") then {RydHQG_Muu = 1};
	if (isNil "RydHQG_ArtyShells") then {RydHQG_ArtyShells = 120};
	if (isNil "RydHQG_Withdraw") then {RydHQG_Withdraw = 1};
	if (isNil "RydHQG_Berserk") then {RydHQG_Berserk = false};
	if (isNil "RydHQG_IDChance") then {RydHQG_IDChance = 100};
	if (isNil "RydHQG_RDChance") then {RydHQG_RDChance = 100};
	if (isNil "RydHQG_SDChance") then {RydHQG_SDChance = 100};
	if (isNil "RydHQG_AmmoDrop") then {RydHQG_AmmoDrop = []};
	if (isNil "RydHQG_SFTargets") then {RydHQG_SFTargets = []};
	if (isNil "RydHQG_LZ") then {RydHQG_LZ = false};
	if (isNil "RydHQG_SFBodyGuard") then {RydHQG_SFBodyGuard = []};
	if (isNil "RydHQG_DynForm") then {RydHQG_DynForm = false};
	if (isNil "RydHQG_UnlimitedCapt") then {RydHQG_UnlimitedCapt = false};
	if (isNil "RydHQG_CaptLimit") then {RydHQG_CaptLimit = 10};
	if (isNil "RydHQG_GetHQInside") then {RydHQG_GetHQInside = false};

	RydHQG_Friends = [];
	RydHQG_Enemies = [];
	RydHQG_KnEnemies = [];
	RydHQG_KnEnemiesG = [];
	RydHQG_FValue = 0;
	RydHQG_EValue = 0;

	if (RydxHQ_AIChatDensity > 0) then
		{
		_varName1 = "HAC_AIChatRep";
		_varName2 = "_West";

		switch ((side RydHQG)) do
			{
			case (east) : {_varName2 = "_East"};
			case (resistance) : {_varName2 = "_Guer"};
			};

		missionNamespace setVariable [_varName1 + _varName2,0];

		_varName1 = "HAC_AIChatLT";

		missionNamespace setVariable [_varName1 + _varName2,[0,""]]
		};

	if (RydHQG_NObj == 1) then {RydHQG_Obj = RydHQG_Obj1};
	if (RydHQG_NObj == 2) then {RydHQG_Obj = RydHQG_Obj2};
	if (RydHQG_NObj == 3) then {RydHQG_Obj = RydHQG_Obj3};
	if (RydHQG_NObj >= 4) then {RydHQG_Obj = RydHQG_Obj4};

	RydHQG_LastSub = RydHQG_Subordinated;
	RydHQG_Subordinated = [];

	_civF = ["CIV","CIV_RU","BIS_TK_CIV","BIS_CIV_special"];
	if not (isNil ("RydHQG_CivF")) then {_civF = RydHQG_CivF};

		{
		_isCaptive = _x getVariable ("isCaptive" + (str _x));
		if (isNil "_isCaptive") then {_isCaptive = false};

		_isCiv = false;
		if ((faction (leader _x)) in _civF) then {_isCiv = true};
		if not ((isNull (leaderHQG)) and not (isNull _x) and (alive (leaderHQG)) and (alive (leader _x)) and not (_isCaptive)) then
			{
			if (not (RydHQG_Front) and ((side _x) getFriend (side RydHQG) < 0.6) and not (_isCiv)) then {if not (_x in RydHQG_Enemies) then {RydHQG_Enemies set [(count RydHQG_Enemies), _x]}};
			_front = true;
			if not (isNil "FrontG") then {_front = ((getPosATL (vehicle (leader _x))) in FrontG)};
			if ((RydHQG_Front) and ((side _x) getFriend (side RydHQG) < 0.6) and (_front) and not (_isCiv)) then {if not (_x in RydHQG_Enemies) then {RydHQG_Enemies set [(count RydHQG_Enemies), _x]}};
			if (RydHQG_SubAll) then 
				{
				if not ((side _x) getFriend (side RydHQG) < 0.6) then 
					{
					if (not (_x in RydHQG_Friends) and not (((leader _x) in RydHQG_Excluded) or (_isCiv))) then {RydHQG_Friends set [(count RydHQG_Friends), _x]}
					};
				};
			}
		}
	foreach allGroups;

	RydHQG_Excl = [];

		{
		if not ((group _x) in RydHQG_Excl) then {RydHQG_Excl set [(count RydHQG_Excl),group _x]} 
		}
	foreach RydHQG_Excluded;

	if (RydHQG_SubSynchro) then 
		{
			{
			if ((_x in RydHQG_LastSub) and not ((leader _x) in (synchronizedObjects leaderHQG)) and (RydHQG_ReSynchro)) then {RydHQG_Subordinated set [(count RydHQG_Subordinated),_x]};
			if (not (_x in RydHQG_Subordinated) and ((leader _x) in (synchronizedObjects leaderHQG))) then {RydHQG_Subordinated set [(count RydHQG_Subordinated),_x]};
			}
		foreach allGroups;
		};

	if (RydHQG_SubNamed) then 
		{
			{
			for [{_i = 1},{_i <= RydHQG_NameLimit},{_i = _i + 1}] do
				{
				if (not (_x in RydHQG_Subordinated) and ((str (leader _x)) == ("RydG" + str (_i)))) then {RydHQG_Subordinated set [(count RydHQG_Subordinated),_x]};
				};
			}
		foreach allGroups;
		};

	if (RydHQG_SubZero) then 
		{
			{
			if (((random 100) >= 50) and not (_x in RydHQG_Subordinated)) then {RydHQG_Subordinated set [(count RydHQG_Subordinated),_x]} else {if (not (_x in RydHQGB_Subordinated)) then {RydHQGB_Subordinated set [(count RydHQGB_Subordinated),_x]}};
			}
		foreach allGroups;
		};

	RydHQG_Friends = RydHQG_Friends + RydHQG_Subordinated + RydHQG_Included - (RydHQG_ExcludedG + RydHQG_Excl);
	RydHQG_Friends = RydHQG_Friends - [RydHQG];
	RydHQG_NoWayD = allGroups - RydHQG_LastFriends;

	RydHQG_Friends = [RydHQG_Friends] call RYD_RandomOrd;

		{
		[_x] call RYD_WPdel;
		}
	foreach ((RydHQG_Excl + RydHQG_ExcludedG) - RydHQG_NoWayD);

	if (RydHQG_Init) then 
		{
			{
			RydHQG_CInitial = RydHQG_CInitial + (count (units _x))
			}
		foreach RydHQG_Friends + [RydHQG]
		};

	RydHQG_CLast = RydHQG_CCurrent;
	RydHQG_CCurrent = 0;
		{
		RydHQG_CCurrent = RydHQG_CCurrent + (count (units _x))
		}
	foreach RydHQG_Friends + [RydHQG];

	RydHQG_Ex = [];

	if (RydHQG_ExInfo) then 
		{
		RydHQG_Ex = RydHQG_Excl + RydHQG_ExcludedG
		};

		{
		for [{_a = 0},{_a < count (units _x)},{_a = _a + 1}] do
			{
			_enemyU = vehicle ((units _x) select _a);
				{
				if ((_x knowsAbout _enemyU) >= 0.05) exitwith 
					{
					if not (_enemyU in RydHQG_KnEnemies) then 
						{
						RydHQG_KnEnemies set [(count RydHQG_KnEnemies),_enemyU];
						};

					if not ((group _enemyU) in RydHQG_KnEnemiesG) then 
						{
						_already = missionnameSpace getVariable ["AlreadySpotted",[]];
						RydHQG_KnEnemiesG set [(count RydHQG_KnEnemiesG),(group _enemyU)];
						if not ((group _enemyU) in _already) then
							{
							_UL = (leader _x);if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_EnemySpot,"EnemySpot"] call RYD_AIChatter}};
							}
						}
					} 
				}
			foreach (RydHQG_Friends + [RydHQG] + RydHQG_Ex)
			}
		}
	foreach RydHQG_Enemies;

	_already = missionnameSpace getVariable ["AlreadySpotted",[]];

		{
		if not (_x in _already) then
			{
			_already set [(count _already),_x]
			}
		}
	foreach RydHQG_KnEnemiesG;

	missionnameSpace setVariable ["AlreadySpotted",_already];

	_lossFinal = RydHQG_CInitial - RydHQG_CCurrent;
	if (_lossFinal < 0) then {_lossFinal = 0;RydHQG_CInitial = RydHQG_CCurrent};

	if not (RydHQG_Init) then 
		{
		_lossP = _lossFinal/RydHQG_CInitial;

		if ((_OLmpl == 0) and ((count RydHQG_KnEnemies) > 0)) then
			{
			_OLmpl = 0.01;
			_firstMC = RydHQG_Cyclecount - 1
			};

		if ((_cycleCap < (50 / (1.01 - _lossP))) and ((count RydHQG_KnEnemies) == 0) and (_OLmpl == 0.01)) then
			{
			_cycleCap = _cycleCap + 1;
			if ((random 1) < _lossP) then {_firstMC = _firstMC + 1}
			}
		else
			{
			if not ((count RydHQG_KnEnemies) == 0) then
				{
				_cycleCap = 0;
				}
			};

		
		_lossPerc = _lossP * 100;
		_cycle = RydHQG_Cyclecount - _firstMC;

		_OLF = _OLmpl * (((-(_lossPerc * _lossPerc))/(1.1^_cycle)) + ((15 + (random 5) + (random 5))/(1 + _lossP)) - (_lossP * 10) + (_cycle ^ ((10 * (1 - _lossP))/_cycle)));

		_mplLU = 1;
		_lostU = RydHQG_CLast - RydHQG_CCurrent;
		if (_lostU < 0) then {_lostU = - _lostU;_mplLU = -1};

		_lossL = _mplLU * ((100 * _lostU/RydHQG_CInitial)^(1.55 + (random 0.05) + (random 0.05)))/10;

		_balanceF = 0.5 + (random 0.5) + (random 0.5) - _lossP - (count RydHQG_KnEnemies)/RydHQG_CCurrent;

		RydHQG_Morale = RydHQG_Morale + (_OLF - _lossL + _balanceF);
		//RydHQG_Morale = RydHQG_Morale + (((RydHQG_CCurrent - RydHQG_CInitial) * (6/(1 + (RydHQG_Cyclecount/25)))) + (6 * ((random 0.5) + RydHQG_CCurrent - RydHQG_CLast)))/((1 + (10*RydHQG_CInitial))/(1 + ((count RydHQG_KnEnemies) * 0.5)));
		//diag_log format ["Init: %2, Last: %3, Current: %3,Zmiana morale: %1",(((RydHQG_CCurrent - RydHQG_CInitial) * (6/(1 + (RydHQG_Cyclecount/25)))) + (6 * ((random 0.5) + RydHQG_CCurrent - RydHQG_CLast)))/((1 + (10*RydHQG_CInitial))/(1 + ((count RydHQG_KnEnemies) * 0.5))),RydHQG_CInitial,RydHQG_CLast,RydHQG_CCurrent];
		};

	if (RydHQG_Morale < -50) then {RydHQG_Morale = -50};
	if (RydHQG_Morale > 0) then {RydHQG_Morale = 0};
	if (RydHQG_Debug) then 
		{
		_mdbg = format ["Morale G (%2): %1 - losses: %3 percent (%4)",RydHQG_Morale,RydHQG_Personality,(round (((_lossFinal/RydHQG_CInitial) * 100) * 10)/10),_lossFinal];
		diag_log _mdbg;
		leaderHQG globalChat _mdbg;

		_cl = "<t color='#007f00'>G -> M: %1 - L: %2%3</t>";

		switch (side RydHQG) do
			{
			case (west) : {_cl = "<t color='#0d81c4'>G -> M: %1 - L: %2%3</t>"};
			case (east) : {_cl = "<t color='#ff0000'>G -> M: %1 - L: %2%3</t>"};
			};

		_dbgMon = parseText format [_cl,(round (RydHQG_Morale * 10))/10,(round (((_lossFinal/RydHQG_CInitial) * 100) * 10)/10),"%"];

		RydHQG setVariable ["DbgMon",_dbgMon];
		};

	if (RydHQG_Init) then {[RydHQG] spawn Desperado};

	RydHQG_Init = false;

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

				if (_SpecForcheck) then {if not (_vh in RydHQG_SpecFor) then {RydHQG_SpecFor set [(count RydHQG_SpecFor),_vh]};if not (_grp in RydHQG_SpecForG) then {RydHQG_SpecForG set [(count RydHQG_SpecForG),_grp]}};
				if (_reconcheck) then {if not (_vh in RydHQG_recon) then {RydHQG_recon set [(count RydHQG_recon),_vh]};if not (_grp in RydHQG_reconG) then {RydHQG_reconG set [(count RydHQG_reconG),_grp]}};
				if (_FOcheck) then {if not (_vh in RydHQG_FO) then {RydHQG_FO set [(count RydHQG_FO),_vh]};if not (_grp in RydHQG_FOG) then {RydHQG_FOG set [(count RydHQG_FOG),_grp]}};
				if (_sniperscheck) then {if not (_vh in RydHQG_snipers) then {RydHQG_snipers set [(count RydHQG_snipers),_vh]};if not (_grp in RydHQG_snipersG) then {RydHQG_snipersG set [(count RydHQG_snipersG),_grp]}};
				if (_ATinfcheck) then {if not (_vh in RydHQG_ATinf) then {RydHQG_ATinf set [(count RydHQG_ATinf),_vh]};if not (_grp in RydHQG_ATinfG) then {RydHQG_ATinfG set [(count RydHQG_ATinfG),_grp]}};
				if (_AAinfcheck) then {if not (_vh in RydHQG_AAinf) then {RydHQG_AAinf set [(count RydHQG_AAinf),_vh]};if not (_grp in RydHQG_AAinfG) then {RydHQG_AAinfG set [(count RydHQG_AAinfG),_grp]}};
				if (_Infcheck) then {if not (_vh in RydHQG_Inf) then {RydHQG_FValue = RydHQG_FValue + 1;RydHQG_Inf set [(count RydHQG_Inf),_vh]};if not (_grp in RydHQG_InfG) then {RydHQG_InfG set [(count RydHQG_InfG),_grp]}};
				if (_Artcheck) then {if not (_vh in RydHQG_Art) then {RydHQG_FValue = RydHQG_FValue + 3;RydHQG_Art set [(count RydHQG_Art),_vh]};if not (_grp in RydHQG_ArtG) then {RydHQG_ArtG set [(count RydHQG_ArtG),_grp]}};
				if (_HArmorcheck) then {if not (_vh in RydHQG_HArmor) then {RydHQG_FValue = RydHQG_FValue + 10;RydHQG_HArmor set [(count RydHQG_HArmor),_vh]};if not (_grp in RydHQG_HArmorG) then {RydHQG_HArmorG set [(count RydHQG_HArmorG),_grp]}};
				if (_MArmorcheck) then {if not (_vh in RydHQG_MArmor) then {RydHQG_MArmor set [(count RydHQG_MArmor),_vh]};if not (_grp in RydHQG_MArmorG) then {RydHQG_MArmorG set [(count RydHQG_MArmorG),_grp]}};
				if (_LArmorcheck) then {if not (_vh in RydHQG_LArmor) then {RydHQG_FValue = RydHQG_FValue + 5;RydHQG_LArmor set [(count RydHQG_LArmor),_vh]};if not (_grp in RydHQG_LArmorG) then {RydHQG_LArmorG set [(count RydHQG_LArmorG),_grp]}};
				if (_LArmorATcheck) then {if not (_vh in RydHQG_LArmorAT) then {RydHQG_LArmorAT set [(count RydHQG_LArmorAT),_vh]};if not (_grp in RydHQG_LArmorATG) then {RydHQG_LArmorATG set [(count RydHQG_LArmorATG),_grp]}};
				if (_Carscheck) then {if not (_vh in RydHQG_Cars) then {RydHQG_FValue = RydHQG_FValue + 3;RydHQG_Cars set [(count RydHQG_Cars),_vh]};if not (_grp in RydHQG_CarsG) then {RydHQG_CarsG set [(count RydHQG_CarsG),_grp]}};
				if (_Aircheck) then {if not (_vh in RydHQG_Air) then {RydHQG_FValue = RydHQG_FValue + 15;RydHQG_Air set [(count RydHQG_Air),_vh]};if not (_grp in RydHQG_AirG) then {RydHQG_AirG set [(count RydHQG_AirG),_grp]}};
				if (_BAircheck) then {if not (_vh in RydHQG_BAir) then {RydHQG_BAir set [(count RydHQG_BAir),_vh]};if not (_grp in RydHQG_BAirG) then {RydHQG_BAirG set [(count RydHQG_BAirG),_grp]}};				
				if (_RAircheck) then {if not (_vh in RydHQG_RAir) then {RydHQG_RAir set [(count RydHQG_RAir),_vh]};if not (_grp in RydHQG_RAirG) then {RydHQG_RAirG set [(count RydHQG_RAirG),_grp]}};				
				if (_NCAircheck) then {if not (_vh in RydHQG_NCAir) then {RydHQG_NCAir set [(count RydHQG_NCAir),_vh]};if not (_grp in RydHQG_NCAirG) then {RydHQG_NCAirG set [(count RydHQG_NCAirG),_grp]}};
				if (_Navalcheck) then {if not (_vh in RydHQG_Naval) then {RydHQG_Naval set [(count RydHQG_Naval),_vh]};if not (_grp in RydHQG_NavalG) then {RydHQG_NavalG set [(count RydHQG_NavalG),_grp]}};
				if (_Staticcheck) then {if not (_vh in RydHQG_Static) then {RydHQG_FValue = RydHQG_FValue + 1;RydHQG_Static set [(count RydHQG_Static),_vh]};if not (_grp in RydHQG_StaticG) then {RydHQG_StaticG set [(count RydHQG_StaticG),_grp]}};
				if (_StaticAAcheck) then {if not (_vh in RydHQG_StaticAA) then {RydHQG_StaticAA set [(count RydHQG_StaticAA),_vh]};if not (_grp in RydHQG_StaticAAG) then {RydHQG_StaticAAG set [(count RydHQG_StaticAAG),_grp]}};
				if (_StaticATcheck) then {if not (_vh in RydHQG_StaticAT) then {RydHQG_StaticAT set [(count RydHQG_StaticAT),_vh]};if not (_grp in RydHQG_StaticATG) then {RydHQG_StaticATG set [(count RydHQG_StaticATG),_grp]}};
				if (_Supportcheck) then {if not (_vh in RydHQG_Support) then {RydHQG_Support set [(count RydHQG_Support),_vh]};if not (_grp in RydHQG_SupportG) then {RydHQG_SupportG set [(count RydHQG_SupportG),_grp]}};
				if (_Cargocheck) then {if not (_vh in RydHQG_Cargo) then {RydHQG_Cargo set [(count RydHQG_Cargo),_vh]};if not (_grp in RydHQG_CargoG) then {RydHQG_CargoG set [(count RydHQG_CargoG),_grp]}};
				if (_NCCargocheck) then {if not (_vh in RydHQG_NCCargo) then {RydHQG_NCCargo set [(count RydHQG_NCCargo),_vh]};if not (_grp in RydHQG_NCCargoG) then {RydHQG_NCCargoG set [(count RydHQG_NCCargoG),_grp]}};
				if (_Crewcheck) then {if not (_vh in RydHQG_Crew) then {RydHQG_Crew set [(count RydHQG_Crew),_vh]};if not (_grp in RydHQG_CrewG) then {RydHQG_CrewG set [(count RydHQG_CrewG),_grp]}};
				if (_NCrewInfcheck) then {if not (_vh in RydHQG_NCrewInf) then {RydHQG_NCrewInf set [(count RydHQG_NCrewInf),_vh]};if not (_grp in RydHQG_NCrewInfG) then {RydHQG_NCrewInfG set [(count RydHQG_NCrewInfG),_grp]}};
				
			}
		foreach (units _x)
		}
	foreach RydHQG_Friends;

	RydHQG_NCrewInfG = RydHQG_NCrewInfG - (RydHQG_RAirG + RydHQG_StaticG);
	RydHQG_NCrewInf = RydHQG_NCrewInf - (RydHQG_RAir + RydHQG_Static);
	RydHQG_InfG = RydHQG_InfG - (RydHQG_RAirG + RydHQG_StaticG);
	RydHQG_Inf = RydHQG_Inf - (RydHQG_RAir + RydHQG_Static);

	RydHQG_CargoAirEx = [];
	RydHQG_CargoLandEx = [];
	if (RydHQG_NoAirCargo) then {RydHQG_CargoAirEx = RydHQG_AirG};
	if (RydHQG_NoLandCargo) then {RydHQG_CargoLandEx = (RydHQG_CargoG - RydHQG_AirG)};
	RydHQG_CargoG = RydHQG_CargoG - (RydHQG_CargoAirEx + RydHQG_CargoLandEx + RydHQG_AmmoDrop);

		{
		if not (_x in RydHQG_SupportG) then
			{
			RydHQG_SupportG set [(count RydHQG_SupportG),_x]
			}
		}
	foreach RydHQG_AmmoDrop;
		
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
				
				if (_SpecForcheck) then {if not (_vh in RydHQG_EnSpecFor) then {RydHQG_EnSpecFor set [(count RydHQG_EnSpecFor),_vh]};if not (_grp in RydHQG_EnSpecForG) then {RydHQG_EnSpecForG set [(count RydHQG_EnSpecForG),_grp]}};
				if (_reconcheck) then {if not (_vh in RydHQG_Enrecon) then {RydHQG_Enrecon set [(count RydHQG_Enrecon),_vh]};if not (_grp in RydHQG_EnreconG) then {RydHQG_EnreconG set [(count RydHQG_EnreconG),_grp]}};
				if (_FOcheck) then {if not (_vh in RydHQG_EnFO) then {RydHQG_EnFO set [(count RydHQG_EnFO),_vh]};if not (_grp in RydHQG_EnFOG) then {RydHQG_EnFOG set [(count RydHQG_EnFOG),_grp]}};
				if (_sniperscheck) then {if not (_vh in RydHQG_Ensnipers) then {RydHQG_Ensnipers set [(count RydHQG_Ensnipers),_vh]};if not (_grp in RydHQG_EnsnipersG) then {RydHQG_EnsnipersG set [(count RydHQG_EnsnipersG),_grp]}};
				if (_ATinfcheck) then {if not (_vh in RydHQG_EnATinf) then {RydHQG_EnATinf set [(count RydHQG_EnATinf),_vh]};if not (_grp in RydHQG_EnATinfG) then {RydHQG_EnATinfG set [(count RydHQG_EnATinfG),_grp]}};
				if (_AAinfcheck) then {if not (_vh in RydHQG_EnAAinf) then {RydHQG_EnAAinf set [(count RydHQG_EnAAinf),_vh]};if not (_grp in RydHQG_EnAAinfG) then {RydHQG_EnAAinfG set [(count RydHQG_EnAAinfG),_grp]}};
				if (_Infcheck) then {if not (_vh in RydHQG_EnInf) then {RydHQG_EValue = RydHQG_EValue + 1;RydHQG_EnInf set [(count RydHQG_EnInf),_vh]};if not (_grp in RydHQG_EnInfG) then {RydHQG_EnInfG set [(count RydHQG_EnInfG),_grp]}};
				if (_Artcheck) then {if not (_vh in RydHQG_EnArt) then {RydHQG_EValue = RydHQG_EValue + 3;RydHQG_EnArt set [(count RydHQG_EnArt),_vh]};if not (_grp in RydHQG_EnArtG) then {RydHQG_EnArtG set [(count RydHQG_EnArtG),_grp]}};
				if (_HArmorcheck) then {if not (_vh in RydHQG_EnHArmor) then {RydHQG_EValue = RydHQG_EValue + 10;RydHQG_EnHArmor set [(count RydHQG_EnHArmor),_vh]};if not (_grp in RydHQG_EnHArmorG) then {RydHQG_EnHArmorG set [(count RydHQG_EnHArmorG),_grp]}};
				if (_MArmorcheck) then {if not (_vh in RydHQG_EnMArmor) then {RydHQG_EnMArmor set [(count RydHQG_EnMArmor),_vh]};if not (_grp in RydHQG_EnMArmorG) then {RydHQG_EnMArmorG set [(count RydHQG_EnMArmorG),_grp]}};
				if (_LArmorcheck) then {if not (_vh in RydHQG_EnLArmor) then {RydHQG_EValue = RydHQG_EValue + 5;RydHQG_EnLArmor set [(count RydHQG_EnLArmor),_vh]};if not (_grp in RydHQG_EnLArmorG) then {RydHQG_EnLArmorG set [(count RydHQG_EnLArmorG),_grp]}};
				if (_LArmorATcheck) then {if not (_vh in RydHQG_EnLArmorAT) then {RydHQG_EnLArmorAT set [(count RydHQG_EnLArmorAT),_vh]};if not (_grp in RydHQG_EnLArmorATG) then {RydHQG_EnLArmorATG set [(count RydHQG_EnLArmorATG),_grp]}};
				if (_Carscheck) then {if not (_vh in RydHQG_EnCars) then {RydHQG_EValue = RydHQG_EValue + 3;RydHQG_EnCars set [(count RydHQG_EnCars),_vh]};if not (_grp in RydHQG_EnCarsG) then {RydHQG_EnCarsG set [(count RydHQG_EnCarsG),_grp]}};
				if (_Aircheck) then {if not (_vh in RydHQG_EnAir) then {RydHQG_EValue = RydHQG_EValue + 15;RydHQG_EnAir set [(count RydHQG_EnAir),_vh]};if not (_grp in RydHQG_EnAirG) then {RydHQG_EnAirG set [(count RydHQG_EnAirG),_grp]}};
				if (_BAircheck) then {if not (_vh in RydHQG_EnBAir) then {RydHQG_EnBAir set [(count RydHQG_EnBAir),_vh]};if not (_grp in RydHQG_EnBAirG) then {RydHQG_EnBAirG set [(count RydHQG_EnBAirG),_grp]}};				
				if (_RAircheck) then {if not (_vh in RydHQG_EnRAir) then {RydHQG_EnRAir set [(count RydHQG_EnRAir),_vh]};if not (_grp in RydHQG_EnRAirG) then {RydHQG_EnRAirG set [(count RydHQG_EnRAirG),_grp]}};
				if (_NCAircheck) then {if not (_vh in RydHQG_EnNCAir) then {RydHQG_EnNCAir set [(count RydHQG_EnNCAir),_vh]};if not (_grp in RydHQG_EnNCAirG) then {RydHQG_EnNCAirG set [(count RydHQG_EnNCAirG),_grp]}};
				if (_Navalcheck) then {if not (_vh in RydHQG_EnNaval) then {RydHQG_EnNaval set [(count RydHQG_EnNaval),_vh]};if not (_grp in RydHQG_EnNavalG) then {RydHQG_EnNavalG set [(count RydHQG_EnNavalG),_grp]}};
				if (_Staticcheck) then {if not (_vh in RydHQG_EnStatic) then {RydHQG_EValue = RydHQG_EValue + 1;RydHQG_EnStatic set [(count RydHQG_EnStatic),_vh]};if not (_grp in RydHQG_EnStaticG) then {RydHQG_EnStaticG set [(count RydHQG_EnStaticG),_grp]}};
				if (_StaticAAcheck) then {if not (_vh in RydHQG_EnStaticAA) then {RydHQG_EnStaticAA set [(count RydHQG_EnStaticAA),_vh]};if not (_grp in RydHQG_EnStaticAAG) then {RydHQG_EnStaticAAG set [(count RydHQG_EnStaticAAG),_grp]}};
				if (_StaticATcheck) then {if not (_vh in RydHQG_EnStaticAT) then {RydHQG_EnStaticAT set [(count RydHQG_EnStaticAT),_vh]};if not (_grp in RydHQG_EnStaticATG) then {RydHQG_EnStaticATG set [(count RydHQG_EnStaticATG),_grp]}};
				if (_Supportcheck) then {if not (_vh in RydHQG_EnSupport) then {RydHQG_EnSupport set [(count RydHQG_EnSupport),_vh]};if not (_grp in RydHQG_EnSupportG) then {RydHQG_EnSupportG set [(count RydHQG_EnSupportG),_grp]}};
				if (_Cargocheck) then {if not (_vh in RydHQG_EnCargo) then {RydHQG_EnCargo set [(count RydHQG_EnCargo),_vh]};if not (_grp in RydHQG_EnCargoG) then {RydHQG_EnCargoG set [(count RydHQG_EnCargoG),_grp]}};
				if (_NCCargocheck) then {if not (_vh in RydHQG_EnNCCargo) then {RydHQG_EnNCCargo set [(count RydHQG_EnNCCargo),_vh]};if not (_grp in RydHQG_EnNCCargoG) then {RydHQG_EnNCCargoG set [(count RydHQG_EnNCCargoG),_grp]}};
				if (_Crewcheck) then {if not (_vh in RydHQG_EnCrew) then {RydHQG_EnCrew set [(count RydHQG_EnCrew),_vh]};if not (_grp in RydHQG_EnCrewG) then {RydHQG_EnCrewG set [(count RydHQG_EnCrewG),_grp]}};
				if (_NCrewInfcheck) then {if not (_vh in RydHQG_EnNCrewInf) then {RydHQG_EnNCrewInf set [(count RydHQG_EnNCrewInf),_vh]};if not (_grp in RydHQG_EnNCrewInfG) then {RydHQG_EnNCrewInfG set [(count RydHQG_EnNCrewInfG),_grp]}};
				
			}
		foreach (units _x)
		}
	foreach RydHQG_KnEnemiesG;

	RydHQG_EnNCrewInfG = RydHQG_EnNCrewInfG - (RydHQG_EnRAirG + RydHQG_EnStaticG);
	RydHQG_EnNCrewInf = RydHQG_EnNCrewInf - (RydHQG_EnRAir + RydHQG_EnStatic);
	RydHQG_EnInfG = RydHQG_EnInfG - (RydHQG_EnRAirG + RydHQG_EnStaticG);
	RydHQG_EnInf = RydHQG_EnInf - (RydHQG_EnRAir + RydHQG_EnStatic);

	if (RydHQG_Flee) then
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
		foreach RydHQG_Friends;

		if (_AllPanic == 0) then {_AllPanic = 1};
		_midCow = 0;
		if not ((count RydHQG_Friends) == 0) then {_midCow = _AllCow/(count RydHQG_Friends)};

			{
			_cowF = ((- RydHQG_Morale)/(50 + (random 25))) + (random (2 * _midCow)) - _midCow;
			_cowF = _cowF * RydHQG_Muu;
			if (_x in RydHQG_SpecForG) then {_cowF = _cowF - 0.8};
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

			if (((random ((20 + (RydHQG_Morale/5))/_AllPanic)) < _cowF) and ((random 100) > (100/(_AllPanic + 1)))) then 
				{
				[_x] call RYD_WPdel;
				_x setVariable [("inPanic" + (str _x)), true];
				if (RydHQG_DebugII) then {_i = [(getPosATL (vehicle (leader _x))),_x,"markPanic","ColorYellow","ICON","DOT","G!","G!",[0.5,0.5]] call RYD_Mark};
				_x setVariable [("Busy" + (str _x)), true];

				_UL = leader _x;
				if not (isPlayer _UL) then 
					{
					if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_InPanic,"InPanic"] call RYD_AIChatter}
					};

				if (RydHQG_Surr) then
					{
					if ((random 100) > 50) then
						{
						if (RydHQG_DebugII) then {_i setMarkerColor "ColorPink";_i setMarkerText "G!!!"};
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
		foreach RydHQG_Friends
		};

		{
		RydHQG_KnEnPos set [(count RydHQG_KnEnPos),getPosATL (vehicle (leader _x))];
		if ((count RydHQG_KnEnPos) >= 100) then {RydHQG_KnEnPos = RydHQG_KnEnPos - [RydHQG_KnEnPos select 0]};
		}
	foreach RydHQG_KnEnemiesG;

	for [{_z = 0},{_z < (count RydHQG_KnEnemies)},{_z = _z + 1}] do
		{
		_KnEnemy = RydHQG_KnEnemies select _z;
			{
			if ((_x knowsAbout _KnEnemy) > 0.01) then {RydHQG reveal [_KnEnemy,2]}
			}
		foreach RydHQG_Friends
		};

	if ((RydBB_Active) and (leaderHQG in (RydBBa_HQs + RydBBb_HQs))) then {[] call RYD_BBArrRefresh};

	if (RydHQG_Cyclecount == 1) then
		{
		[] spawn G_EnemyScan;
		if (RydHQG_ArtyShells > 0) then
			{
			[RydHQG_ArtG,RydHQG_ArtyShells] call RYD_ArtyPrep;
			};

		if ((RydBB_Active) and (leaderHQG in (RydBBa_HQs + RydBBb_HQs))) then 
			{
			RydHQG_readyForBB = true;
			RydxHQ_Done = true;
			if (leaderHQG in RydBBa_HQs) then 
				{
				waitUntil {sleep 0.1;(RydBBa_InitDone)}
				};

			if (leaderHQG in RydBBb_HQs) then 
				{
				waitUntil {sleep 0.1;(RydBBb_InitDone)}
				}
			}
		};

	if (((count RydHQG_KnEnemies) > 0) and ((count RydHQG_ArtG) > 0)) then {[RydHQG_ArtG,RydHQG_KnEnemies,(RydHQG_EnHArmor + RydHQG_EnMArmor + RydHQG_EnLArmor),RydHQG_Friends,RydHQG_Debug,leaderHQG] call RYD_CFF};

	if (isNil ("RydHQG_Order")) then {RydHQG_Order = "ATTACK"};
	_gauss100 = (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10);
	if ((((_gauss100 + RydHQG_Inertia + RydHQG_Morale) > ((RydHQG_EValue/(RydHQG_FValue + 0.1)) * 60)) and not (isNil ("RydHQG_Obj")) and not (RydHQG_Order == "DEFEND")) or (RydHQG_Berserk)) then 
		{
		_lastS = RydHQG getVariable ["LastStance","At"];
		if ((_lastS == "De") or (RydHQG_CycleCount == 1)) then
			{
			if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQG,RydxHQ_AIC_OffStance,"OffStance"] call RYD_AIChatter};
			};

		RydHQG setVariable ["LastStance","At"];
		RydHQG_Inertia = 30 * (0.5 + RydHQG_Consistency)*(0.5 + RydHQG_Activity);
		[] spawn G_HQOrders 
		} 
	else 
		{
		_lastS = RydHQG getVariable ["LastStance","De"];
		if ((_lastS == "At") or (RydHQG_CycleCount == 1)) then
			{
			if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQG,RydxHQ_AIC_DefStance,"DefStance"] call RYD_AIChatter};
			};

		RydHQG setVariable ["LastStance","De"];
		RydHQG_Inertia = - (30  * (0.5 + RydHQG_Consistency))/(0.5 + RydHQG_Activity);
		[] spawn G_HQOrdersDef 
		};


	if ((((RydHQG_Circumspection + RydHQG_Fineness)/2) + 0.1) > (random 1.2)) then
		{
		_SFcount = {not (_x getVariable ["Busy" + (str _x),false]) and not (_x getVariable ["Resting" + (str _x),false])} count (RydHQG_SpecForG - RydHQG_SFBodyGuard);

		if (_SFcount > 0) then
			{
			_isNight = [] call RYD_isNight;
			_SFTgts = [];
			_chance = 40 + (60 * RydHQG_Activity);

				{
				_HQ = group _x;
				if (_HQ in RydHQG_KnEnemiesG) then
					{
					_SFTgts set [(count _SFTgts),_HQ]
					}
				}
			foreach (RydxHQ_AllLeaders - [leaderHQG]);

			if ((count _SFTgts) == 0) then
				{
				_chance = _chance/2;
				_SFTgts = RydHQG_EnArtG
				};

			if ((count _SFTgts) == 0) then
				{
				_chance = _chance/3;
				_SFTgts = RydHQG_EnStaticG
				};

			if (_isNight) then
				{
				_chance = _chance + 25
				};

			if ((count _SFTgts) > 0) then
				{
				_chance = _chance + (((2 * _SFcount) - (8/(0.75 + (RydHQG_Recklessness/2)))) * 20);
				_trgG = _SFTgts select (floor (random (count _SFTgts)));
				_alreadyAttacked = {_x == _trgG} count RydHQG_SFTargets;
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
								if not (_x in RydHQG_SFBodyGuard) then
									{	
									_SFAv set [(count _SFAv),_x]
									}
								}
							}
						}
					foreach RydHQG_SpecForG;

					_team = _SFAv select (floor (random (count _SFAv)));
					_trg = vehicle (leader _trgG);
					if (not ((typeOf _trg) in (_HArmor + _LArmor)) or ((random 100) > (90 - (RydHQG_Recklessness * 10)))) then {[_team,_trg,_trgG] spawn G_GoSFAttack}
					}
				}
			}
		};

	if (RydHQG_LRelocating) then
		{
		if ((abs (speed (vehicle leaderHQG))) < 0.1) then {RydHQG setVariable ["onMove",false]};
		_onMove = RydHQG getVariable ["onMove",false];

		if not (_onMove) then 
			{
			if (not (isPlayer leaderHQG) and ((RydHQG_Cyclecount == 1) or not (RydHQG_Progress == 0))) then
				{
				[RydHQG] call RYD_WPdel;

				_Lpos = position leaderHQG;
				if (RydHQG_Cyclecount == 1) then {RydHQG_Fpos = _Lpos};

				_rds = 0;

				if (RydHQG_LRelocating) then 
					{
					_rds = 0;
					if (RydHQG_NObj == 1) then {_Lpos = RydHQG_Fpos;if (leaderHQG in (RydBBa_HQs + RydBBb_HQs)) then {_Lpos = position leaderHQG};_rds = 0};
					if (RydHQG_NObj == 2) then {_Lpos = position RydHQG_Obj1};
					if (RydHQG_NObj == 3) then {_Lpos = position RydHQG_Obj2};
					if (RydHQG_NObj >= 4) then {_Lpos = position RydHQG_Obj3};
					};

				_spd = "LIMITED";
				if (RydHQG_Progress == -1) then {_spd = "NORMAL"};
				RydHQG_Progress = 0;
				_enemyN = false;

					{
					_eLdr = vehicle (leader _x);
					_eDst = _eLdr distance _Lpos;

					if (_eDst < 600) exitWith {_enemyN = true}
					}
				foreach RydHQG_KnEnemiesG;

				if not (_enemyN) then 
					{
					_wp = [RydHQG,_Lpos,"HOLD","AWARE","GREEN",_spd,["true",""],true,_rds,[0,0,0],"FILE"] call RYD_WPadd;
					if (isNull (assignedVehicle leaderHQG)) then
						{
						if (RydHQG_GetHQInside) then {[_wp] call RYD_GoInside}
						};

					if ((RydHQG_LRelocating) and (RydHQG_NObj > 1) and (RydHQG_Cyclecount > 1)) then 
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
								foreach RydHQG_KnEnemiesG;

								if (isNull RydHQG) then 
									{
									_onPlace = true
									}
								else
									{
									if not (_getBack) then
										{
										if (((vehicle leaderHQG) distance _LPos) < 30) then {_onPlace = true}
										}
									};
								

								((_getback) or (_onPlace))
								};

							if not (_onPlace) then
								{
								_rds = 30;
								if (RydHQG_NObj <= 2) then {_Lpos = getPosATL (vehicle leaderHQG);_rds = 0};
								if (RydHQG_NObj == 3) then {_Lpos = position RydHQG_Obj1};
								if (RydHQG_NObj >= 4) then {_Lpos = position RydHQG_Obj2};

								_getBack = false;

									{
									_eLdr = vehicle (leader _x);
									_eDst = _eLdr distance _Lpos;

									if (_eDst < 600) exitWith {_getBack = true}
									}
								foreach RydHQG_KnEnemiesG;

								if (_getBack) then {_Lpos = getPosATL (vehicle leaderHQG);_rds = 0};

								[RydHQG] call RYD_WPdel;	

								_spd = "NORMAL";
								if not (((vehicle leaderHQG) distance _LPos) < 50) then {_spd = "FULL"};

								_wp = [RydHQG,_Lpos,"HOLD","AWARE","GREEN",_spd,["true",""],true,_rds,[0,0,0],"FILE"] call RYD_WPadd;
								if (isNull (assignedVehicle leaderHQG)) then
									{
									if (RydHQG_GetHQInside) then {[_wp] call RYD_GoInside}
									};

								RydHQG setVariable ["onMove",true];
								}
							}
						}
					}
				}
			}
		};

	if (isNil ("RydHQG_CommDelay")) then {RydHQG_CommDelay = 1};
	_delay = (((22.5 + (count RydHQG_Friends))/(0.5 + RydHQG_Reflex)) * RydHQG_CommDelay);
	sleep _delay;

		{
		RydHQG reveal vehicle (leader _x)
		}
	foreach RydHQG_Friends;

	for [{_z = 0},{_z < (count RydHQG_KnEnemies)},{_z = _z + 1}] do
		{
		_KnEnemy = RydHQG_KnEnemies select _z;

			{
			if ((_x knowsAbout _KnEnemy) > 0.01) then {RydHQG reveal [_KnEnemy,2]} 
			}
		foreach RydHQG_Friends
		}
	};