
RydHQH = GrpNull;

RydHQH = group leaderHQH;

leaderHQH kbAddTopic ["orders","RYD_HAC\topics.bikb",""];
waituntil {(leaderHQH kbHasTopic "orders")};

RydHQH_Cyclecount = 0;

waituntil {not (isNull RydHQH)};

RydHQH_PersDone = false;
[] spawn H_Personality;
waituntil {RydHQH_PersDone};

RydHQH_LHQInit = false;
[] spawn H_LHQ;
waituntil {RydHQH_LHQInit};

if (isNil ("RydHQH_Boxed")) then {RydHQH_Boxed = []};
if (isNil ("RydHQH_AmmoBoxes")) then 
	{
	RydHQH_AmmoBoxes = [];

	if not (isNil "RydHQH_AmmoDepot") then 
		{
		_rds = (triggerArea RydHQH_AmmoDepot) select 0;
		RydHQH_AmmoBoxes = (getPosATL RydHQH_AmmoDepot) nearObjects ["ReammoBox",_rds]
		}
	};

[] spawn H_HQReset;
[] spawn H_Rev;
[] spawn H_SuppMed;
[] spawn H_SuppFuel;
[] spawn H_SuppAmmo;
[] spawn H_SuppRep;
[] spawn H_SFIdleOrd;
[] spawn H_Reloc;
[] spawn H_LPos;

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
RydHQH_NCVeh = _NCCargo + (_Support - ["MH60S"]);

[(_snipers + _ATinf + _AAinf)] spawn H_Garrison;

RydHQH_ReconDone = false;
RydHQH_DefDone = false;
RydHQH_ReconStage = 1;
RydHQH_KnEnPos = [];
RydHQH_AirInDef = [];
if (isNil ("RydHQH_Excluded")) then {RydHQH_Excluded = []};
if (isNil ("RydHQH_Fast")) then {RydHQH_Fast = false};
if (isNil ("RydHQH_ExInfo")) then {RydHQH_ExInfo = false};
if (isNil ("RydHQH_ObjHoldTime")) then {RydHQH_ObjHoldTime = 600};
if (isNil "RydHQH_NObj") then {RydHQH_NObj = 1};

RydHQH_Init = true;

RydHQH_Inertia = 0;
RydHQH_Morale = 0;
RydHQH_CInitial = 0;
RydHQH_CLast = 0;
RydHQH_CCurrent = 0;
RydHQH_CIMoraleC = 0;
RydHQH_CLMoraleC = 0;
RydHQH_Surrender = false;

RydHQH_FirstEMark = true;
RydHQH_LastE = 0;
RydHQH_FlankingInit = false;
RydHQH_FlankingDone = false;
RydHQH_Progress = 0;

RydHQH_AAthreat = [];
RydHQH_ATthreat = [];
RydHQH_Airthreat = [];
RydHQH_Exhausted = [];

_lastHQ = leaderHQH;
_OLmpl = 0;
_cycleCap = 0;
_firstMC = 0; 
_wp = [];

while {not ((isNull RydHQH) or (RydHQH_Surrender))} do
	{
	if not (RydHQH_Fast) then {waituntil {sleep 0.1;((RydxHQ_Done) and (RydxHQB_Done) and (RydxHQC_Done) and (RydxHQD_Done) and (RydxHQE_Done) and (RydxHQF_Done) and (RydxHQG_Done) and (RydxHQH_Done))}};
	if (isNil ("RydHQH_SupportWP")) then {RydHQH_SupportWP = false};

	if (RydHQH_Cyclecount > 1) then
		{
		if not (_lastHQ == leaderHQH) then {sleep (60 + (random 60))};
		};

	_lastHQ = leaderHQH;
	RydHQH_Cyclecount = RydHQH_Cyclecount + 1;
	RydxHQ_Done = false;

	RydHQH_SpecFor = [];
	RydHQH_recon = [];
	RydHQH_FO = [];
	RydHQH_snipers = [];
	RydHQH_ATinf = [];
	RydHQH_AAinf = [];
	RydHQH_Inf = [];
	RydHQH_Art = [];
	RydHQH_HArmor = [];
	RydHQH_MArmor = [];
	RydHQH_LArmor = [];
	RydHQH_LArmorAT = [];
	RydHQH_Cars = [];
	RydHQH_Air = [];
	RydHQH_BAir = [];
	RydHQH_RAir = [];
	RydHQH_NCAir = [];
	RydHQH_Naval = [];
	RydHQH_Static = [];
	RydHQH_StaticAA = [];
	RydHQH_StaticAT = [];
	RydHQH_Support = [];
	RydHQH_Cargo = [];
	RydHQH_NCCargo = [];
	RydHQH_Other = [];
	RydHQH_Crew = [];
	RydHQH_NCrewInf = [];

	RydHQH_SpecForG = [];
	RydHQH_reconG = [];
	RydHQH_FOG = [];
	RydHQH_snipersG = [];
	RydHQH_ATinfG = [];
	RydHQH_AAinfG = [];
	RydHQH_InfG = [];
	RydHQH_ArtG = [];
	RydHQH_HArmorG = [];
	RydHQH_MArmorG = [];
	RydHQH_LArmorG = [];
	RydHQH_LArmorATG = [];
	RydHQH_CarsG = [];
	RydHQH_AirG = [];
	RydHQH_BAirG = [];
	RydHQH_RAirG = [];
	RydHQH_NCAirG = [];
	RydHQH_NavalG = [];
	RydHQH_StaticG = [];
	RydHQH_StaticAAG = [];
	RydHQH_StaticATG = [];
	RydHQH_SupportG = [];
	RydHQH_CargoG = [];
	RydHQH_NCCargoG = [];
	RydHQH_OtherG = [];
	RydHQH_CrewG = [];
	RydHQH_NCrewInfG = [];

	RydHQH_EnSpecFor = [];
	RydHQH_Enrecon = [];
	RydHQH_EnFO = [];
	RydHQH_Ensnipers = [];
	RydHQH_EnATinf = [];
	RydHQH_EnAAinf = [];
	RydHQH_EnInf = [];
	RydHQH_EnArt = [];
	RydHQH_EnHArmor = [];
	RydHQH_EnMArmor = [];
	RydHQH_EnLArmor = [];
	RydHQH_EnLArmorAT = [];
	RydHQH_EnCars = [];
	RydHQH_EnAir = [];
	RydHQH_EnBAir = [];
	RydHQH_EnRAir = [];
	RydHQH_EnNCAir = [];
	RydHQH_EnNaval = [];
	RydHQH_EnStatic = [];
	RydHQH_EnStaticAA = [];
	RydHQH_EnStaticAT = [];
	RydHQH_EnSupport = [];
	RydHQH_EnCargo = [];
	RydHQH_EnNCCargo = [];
	RydHQH_EnOther = [];
	RydHQH_EnCrew = [];
	RydHQH_EnNCrewInf = [];

	RydHQH_EnSpecForG = [];
	RydHQH_EnreconG = [];
	RydHQH_EnFOG = [];
	RydHQH_EnsnipersG = [];
	RydHQH_EnATinfG = [];
	RydHQH_EnAAinfG = [];
	RydHQH_EnInfG = [];
	RydHQH_EnArtG = [];
	RydHQH_EnHArmorG = [];
	RydHQH_EnMArmorG = [];
	RydHQH_EnLArmorG = [];
	RydHQH_EnLArmorATG = [];
	RydHQH_EnCarsG = [];
	RydHQH_EnAirG = [];
	RydHQH_EnBAirG = [];
	RydHQH_EnRAirG = [];
	RydHQH_EnNCAirG = [];
	RydHQH_EnNavalG = [];
	RydHQH_EnStaticG = [];
	RydHQH_EnStaticAAG = [];
	RydHQH_EnStaticATG = [];
	RydHQH_EnSupportG = [];
	RydHQH_EnCargoG = [];
	RydHQH_EnNCCargoG = [];
	RydHQH_EnOtherG = [];
	RydHQH_EnCrewG = [];
	RydHQH_EnNCrewInfG = [];

	RydHQH_LastE = count RydHQH_KnEnemies;
	RydHQH_LastFriends = RydHQH_Friends;

	if (isNil ("RydHQH_NoAirCargo")) then {RydHQH_NoAirCargo = false};
	if (isNil ("RydHQH_NoLandCargo")) then {RydHQH_NoLandCargo = false};
	if (isNil ("RydHQH_LastFriends")) then {RydHQH_LastFriends = []};
	if (isNil ("RydHQH_CargoFind")) then {RydHQH_CargoFind = 0};
	if (isNil ("RydHQH_Subordinated")) then {RydHQH_Subordinated = []};
	if (isNil ("RydHQH_Included")) then {RydHQH_Included = []};
	if (isNil ("RydHQH_ExcludedG")) then {RydHQH_ExcludedG = []};
	if (isNil ("RydHQH_SubAll")) then {RydHQH_SubAll = true};
	if (isNil ("RydHQH_SubSynchro")) then {RydHQH_SubSynchro = false};
	if (isNil ("RydHQH_SubNamed")) then {RydHQH_SubNamed = false};
	if (isNil ("RydHQH_SubZero")) then {RydHQH_SubZero = false};
	if (isNil ("RydHQH_ReSynchro")) then {RydHQH_ReSynchro = true};
	if (isNil ("RydHQH_NameLimit")) then {RydHQH_NameLimit = 100};
	if (isNil ("RydHQH_Surr")) then {RydHQH_Surr = false};
	if (isNil ("RydHQH_AOnly")) then {RydHQH_AOnly = []};
	if (isNil ("RydHQH_ROnly")) then {RydHQH_ROnly = []};
	if (isNil ("RydHQH_CargoOnly")) then {RydHQH_CargoOnly = []};
	if (isNil ("RydHQH_NoCargo")) then {RydHQH_NoCargo = []};
	if (isNil ("RydHQH_NoFlank")) then {RydHQH_NoFlank = []};
	if (isNil ("RydHQH_NoDef")) then {RydHQH_NoDef = []};
	if (isNil ("RydHQH_FirstToFight")) then {RydHQH_FirstToFight = []};
	if (isNil ("RydHQH_VoiceComm")) then {RydHQH_VoiceComm = true};
	if (isNil ("RydHQH_Front")) then {RydHQH_Front = false};
	if (isNil ("RydHQH_LRelocating")) then {RydHQH_LRelocating = false};
	if (isNil ("RydHQH_Flee")) then {RydHQH_Flee = true};
	if (isNil ("RydHQH_GarrR")) then {RydHQH_GarrR = 500};
	if (isNil ("RydHQH_Rush")) then {RydHQH_Rush = false};
	if (isNil ("RydHQH_GarrVehAb")) then {RydHQH_GarrVehAb = false};
	if (isNil ("RydHQH_DefendObjectives")) then {RydHQH_DefendObjectives = 4};
	if (isNil ("RydHQH_DefSpot")) then {RydHQH_DefSpot = []};
	if (isNil ("RydHQH_RecDefSpot")) then {RydHQH_RecDefSpot = []};
	if (isNil "RydHQH_Flare") then {RydHQH_Flare = true};
	if (isNil "RydHQH_Smoke") then {RydHQH_Smoke = true};
	if (isNil "RydHQH_NoRec") then {RydHQH_NoRec = 1};
	if (isNil "RydHQH_RapidCapt") then {RydHQH_RapidCapt = 10};
	if (isNil "RydHQH_Muu") then {RydHQH_Muu = 1};
	if (isNil "RydHQH_ArtyShells") then {RydHQH_ArtyShells = 120};
	if (isNil "RydHQH_Withdraw") then {RydHQH_Withdraw = 1};
	if (isNil "RydHQH_Berserk") then {RydHQH_Berserk = false};
	if (isNil "RydHQH_IDChance") then {RydHQH_IDChance = 100};
	if (isNil "RydHQH_RDChance") then {RydHQH_RDChance = 100};
	if (isNil "RydHQH_SDChance") then {RydHQH_SDChance = 100};
	if (isNil "RydHQH_AmmoDrop") then {RydHQH_AmmoDrop = []};
	if (isNil "RydHQH_SFTargets") then {RydHQH_SFTargets = []};
	if (isNil "RydHQH_LZ") then {RydHQH_LZ = false};
	if (isNil "RydHQH_SFBodyGuard") then {RydHQH_SFBodyGuard = []};
	if (isNil "RydHQH_DynForm") then {RydHQH_DynForm = false};
	if (isNil "RydHQH_UnlimitedCapt") then {RydHQH_UnlimitedCapt = false};
	if (isNil "RydHQH_CaptLimit") then {RydHQH_CaptLimit = 10};
	if (isNil "RydHQH_GetHQInside") then {RydHQH_GetHQInside = false};

	RydHQH_Friends = [];
	RydHQH_Enemies = [];
	RydHQH_KnEnemies = [];
	RydHQH_KnEnemiesG = [];
	RydHQH_FValue = 0;
	RydHQH_EValue = 0;

	if (RydxHQ_AIChatDensity > 0) then
		{
		_varName1 = "HAC_AIChatRep";
		_varName2 = "_West";

		switch ((side RydHQH)) do
			{
			case (east) : {_varName2 = "_East"};
			case (resistance) : {_varName2 = "_Guer"};
			};

		missionNamespace setVariable [_varName1 + _varName2,0];

		_varName1 = "HAC_AIChatLT";

		missionNamespace setVariable [_varName1 + _varName2,[0,""]]
		};

	if (RydHQH_NObj == 1) then {RydHQH_Obj = RydHQH_Obj1};
	if (RydHQH_NObj == 2) then {RydHQH_Obj = RydHQH_Obj2};
	if (RydHQH_NObj == 3) then {RydHQH_Obj = RydHQH_Obj3};
	if (RydHQH_NObj >= 4) then {RydHQH_Obj = RydHQH_Obj4};

	RydHQH_LastSub = RydHQH_Subordinated;
	RydHQH_Subordinated = [];

	_civF = ["CIV","CIV_RU","BIS_TK_CIV","BIS_CIV_special"];
	if not (isNil ("RydHQH_CivF")) then {_civF = RydHQH_CivF};

		{
		_isCaptive = _x getVariable ("isCaptive" + (str _x));
		if (isNil "_isCaptive") then {_isCaptive = false};

		_isCiv = false;
		if ((faction (leader _x)) in _civF) then {_isCiv = true};
		if not ((isNull (leaderHQH)) and not (isNull _x) and (alive (leaderHQH)) and (alive (leader _x)) and not (_isCaptive)) then
			{
			if (not (RydHQH_Front) and ((side _x) getFriend (side RydHQH) < 0.6) and not (_isCiv)) then {if not (_x in RydHQH_Enemies) then {RydHQH_Enemies set [(count RydHQH_Enemies), _x]}};
			_front = true;
			if not (isNil "FrontH") then {_front = ((getPosATL (vehicle (leader _x))) in FrontH)};
			if ((RydHQH_Front) and ((side _x) getFriend (side RydHQH) < 0.6) and (_front) and not (_isCiv)) then {if not (_x in RydHQH_Enemies) then {RydHQH_Enemies set [(count RydHQH_Enemies), _x]}};
			if (RydHQH_SubAll) then 
				{
				if not ((side _x) getFriend (side RydHQH) < 0.6) then 
					{
					if (not (_x in RydHQH_Friends) and not (((leader _x) in RydHQH_Excluded) or (_isCiv))) then {RydHQH_Friends set [(count RydHQH_Friends), _x]}
					};
				};
			}
		}
	foreach allGroups;

	RydHQH_Excl = [];

		{
		if not ((group _x) in RydHQH_Excl) then {RydHQH_Excl set [(count RydHQH_Excl),group _x]} 
		}
	foreach RydHQH_Excluded;

	if (RydHQH_SubSynchro) then 
		{
			{
			if ((_x in RydHQH_LastSub) and not ((leader _x) in (synchronizedObjects leaderHQH)) and (RydHQH_ReSynchro)) then {RydHQH_Subordinated set [(count RydHQH_Subordinated),_x]};
			if (not (_x in RydHQH_Subordinated) and ((leader _x) in (synchronizedObjects leaderHQH))) then {RydHQH_Subordinated set [(count RydHQH_Subordinated),_x]};
			}
		foreach allGroups;
		};

	if (RydHQH_SubNamed) then 
		{
			{
			for [{_i = 1},{_i <= RydHQH_NameLimit},{_i = _i + 1}] do
				{
				if (not (_x in RydHQH_Subordinated) and ((str (leader _x)) == ("RydH" + str (_i)))) then {RydHQH_Subordinated set [(count RydHQH_Subordinated),_x]};
				};
			}
		foreach allGroups;
		};

	if (RydHQH_SubZero) then 
		{
			{
			if (((random 100) >= 50) and not (_x in RydHQH_Subordinated)) then {RydHQH_Subordinated set [(count RydHQH_Subordinated),_x]} else {if (not (_x in RydHQHB_Subordinated)) then {RydHQHB_Subordinated set [(count RydHQHB_Subordinated),_x]}};
			}
		foreach allGroups;
		};

	RydHQH_Friends = RydHQH_Friends + RydHQH_Subordinated + RydHQH_Included - (RydHQH_ExcludedG + RydHQH_Excl);
	RydHQH_Friends = RydHQH_Friends - [RydHQH];
	RydHQH_NoWayD = allGroups - RydHQH_LastFriends;

	RydHQH_Friends = [RydHQH_Friends] call RYD_RandomOrd;

		{
		[_x] call RYD_WPdel;
		}
	foreach ((RydHQH_Excl + RydHQH_ExcludedG) - RydHQH_NoWayD);

	if (RydHQH_Init) then 
		{
			{
			RydHQH_CInitial = RydHQH_CInitial + (count (units _x))
			}
		foreach RydHQH_Friends + [RydHQH]
		};

	RydHQH_CLast = RydHQH_CCurrent;
	RydHQH_CCurrent = 0;
		{
		RydHQH_CCurrent = RydHQH_CCurrent + (count (units _x))
		}
	foreach RydHQH_Friends + [RydHQH];

	RydHQH_Ex = [];

	if (RydHQH_ExInfo) then 
		{
		RydHQH_Ex = RydHQH_Excl + RydHQH_ExcludedG
		};

		{
		for [{_a = 0},{_a < count (units _x)},{_a = _a + 1}] do
			{
			_enemyU = vehicle ((units _x) select _a);
				{
				if ((_x knowsAbout _enemyU) >= 0.05) exitwith 
					{
					if not (_enemyU in RydHQH_KnEnemies) then 
						{
						RydHQH_KnEnemies set [(count RydHQH_KnEnemies),_enemyU];
						};

					if not ((group _enemyU) in RydHQH_KnEnemiesG) then 
						{
						_already = missionnameSpace getVariable ["AlreadySpotted",[]];
						RydHQH_KnEnemiesG set [(count RydHQH_KnEnemiesG),(group _enemyU)];
						if not ((group _enemyU) in _already) then
							{
							_UL = (leader _x);if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_EnemySpot,"EnemySpot"] call RYD_AIChatter}};
							}
						}
					} 
				}
			foreach (RydHQH_Friends + [RydHQH] + RydHQH_Ex)
			}
		}
	foreach RydHQH_Enemies;

	_already = missionnameSpace getVariable ["AlreadySpotted",[]];

		{
		if not (_x in _already) then
			{
			_already set [(count _already),_x]
			}
		}
	foreach RydHQH_KnEnemiesG;

	missionnameSpace setVariable ["AlreadySpotted",_already];

	_lossFinal = RydHQH_CInitial - RydHQH_CCurrent;
	if (_lossFinal < 0) then {_lossFinal = 0;RydHQH_CInitial = RydHQH_CCurrent};

	if not (RydHQH_Init) then 
		{
		_lossP = _lossFinal/RydHQH_CInitial;

		if ((_OLmpl == 0) and ((count RydHQH_KnEnemies) > 0)) then
			{
			_OLmpl = 0.01;
			_firstMC = RydHQH_Cyclecount - 1
			};

		if ((_cycleCap < (50 / (1.01 - _lossP))) and ((count RydHQH_KnEnemies) == 0) and (_OLmpl == 0.01)) then
			{
			_cycleCap = _cycleCap + 1;
			if ((random 1) < _lossP) then {_firstMC = _firstMC + 1}
			}
		else
			{
			if not ((count RydHQH_KnEnemies) == 0) then
				{
				_cycleCap = 0;
				}
			};

		
		_lossPerc = _lossP * 100;
		_cycle = RydHQH_Cyclecount - _firstMC;

		_OLF = _OLmpl * (((-(_lossPerc * _lossPerc))/(1.1^_cycle)) + ((15 + (random 5) + (random 5))/(1 + _lossP)) - (_lossP * 10) + (_cycle ^ ((10 * (1 - _lossP))/_cycle)));

		_mplLU = 1;
		_lostU = RydHQH_CLast - RydHQH_CCurrent;
		if (_lostU < 0) then {_lostU = - _lostU;_mplLU = -1};

		_lossL = _mplLU * ((100 * _lostU/RydHQH_CInitial)^(1.55 + (random 0.05) + (random 0.05)))/10;

		_balanceF = 0.5 + (random 0.5) + (random 0.5) - _lossP - (count RydHQH_KnEnemies)/RydHQH_CCurrent;

		RydHQH_Morale = RydHQH_Morale + (_OLF - _lossL + _balanceF);
		//RydHQH_Morale = RydHQH_Morale + (((RydHQH_CCurrent - RydHQH_CInitial) * (6/(1 + (RydHQH_Cyclecount/25)))) + (6 * ((random 0.5) + RydHQH_CCurrent - RydHQH_CLast)))/((1 + (10*RydHQH_CInitial))/(1 + ((count RydHQH_KnEnemies) * 0.5)));
		//diag_log format ["Init: %2, Last: %3, Current: %3,Zmiana morale: %1",(((RydHQH_CCurrent - RydHQH_CInitial) * (6/(1 + (RydHQH_Cyclecount/25)))) + (6 * ((random 0.5) + RydHQH_CCurrent - RydHQH_CLast)))/((1 + (10*RydHQH_CInitial))/(1 + ((count RydHQH_KnEnemies) * 0.5))),RydHQH_CInitial,RydHQH_CLast,RydHQH_CCurrent];
		};

	if (RydHQH_Morale < -50) then {RydHQH_Morale = -50};
	if (RydHQH_Morale > 0) then {RydHQH_Morale = 0};
	if (RydHQH_Debug) then 
		{
		_mdbg = format ["Morale H (%2): %1 - losses: %3 percent (%4)",RydHQH_Morale,RydHQH_Personality,(round (((_lossFinal/RydHQH_CInitial) * 100) * 10)/10),_lossFinal];
		diag_log _mdbg;
		leaderHQH globalChat _mdbg;

		_cl = "<t color='#007f00'>H -> M: %1 - L: %2%3</t>";

		switch (side RydHQH) do
			{
			case (west) : {_cl = "<t color='#0d81c4'>H -> M: %1 - L: %2%3</t>"};
			case (east) : {_cl = "<t color='#ff0000'>H -> M: %1 - L: %2%3</t>"};
			};

		_dbgMon = parseText format [_cl,(round (RydHQH_Morale * 10))/10,(round (((_lossFinal/RydHQH_CInitial) * 100) * 10)/10),"%"];

		RydHQH setVariable ["DbgMon",_dbgMon];
		};

	if (RydHQH_Init) then {[RydHQH] spawn Desperado};

	RydHQH_Init = false;

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

				if (_SpecForcheck) then {if not (_vh in RydHQH_SpecFor) then {RydHQH_SpecFor set [(count RydHQH_SpecFor),_vh]};if not (_grp in RydHQH_SpecForG) then {RydHQH_SpecForG set [(count RydHQH_SpecForG),_grp]}};
				if (_reconcheck) then {if not (_vh in RydHQH_recon) then {RydHQH_recon set [(count RydHQH_recon),_vh]};if not (_grp in RydHQH_reconG) then {RydHQH_reconG set [(count RydHQH_reconG),_grp]}};
				if (_FOcheck) then {if not (_vh in RydHQH_FO) then {RydHQH_FO set [(count RydHQH_FO),_vh]};if not (_grp in RydHQH_FOG) then {RydHQH_FOG set [(count RydHQH_FOG),_grp]}};
				if (_sniperscheck) then {if not (_vh in RydHQH_snipers) then {RydHQH_snipers set [(count RydHQH_snipers),_vh]};if not (_grp in RydHQH_snipersG) then {RydHQH_snipersG set [(count RydHQH_snipersG),_grp]}};
				if (_ATinfcheck) then {if not (_vh in RydHQH_ATinf) then {RydHQH_ATinf set [(count RydHQH_ATinf),_vh]};if not (_grp in RydHQH_ATinfG) then {RydHQH_ATinfG set [(count RydHQH_ATinfG),_grp]}};
				if (_AAinfcheck) then {if not (_vh in RydHQH_AAinf) then {RydHQH_AAinf set [(count RydHQH_AAinf),_vh]};if not (_grp in RydHQH_AAinfG) then {RydHQH_AAinfG set [(count RydHQH_AAinfG),_grp]}};
				if (_Infcheck) then {if not (_vh in RydHQH_Inf) then {RydHQH_FValue = RydHQH_FValue + 1;RydHQH_Inf set [(count RydHQH_Inf),_vh]};if not (_grp in RydHQH_InfG) then {RydHQH_InfG set [(count RydHQH_InfG),_grp]}};
				if (_Artcheck) then {if not (_vh in RydHQH_Art) then {RydHQH_FValue = RydHQH_FValue + 3;RydHQH_Art set [(count RydHQH_Art),_vh]};if not (_grp in RydHQH_ArtG) then {RydHQH_ArtG set [(count RydHQH_ArtG),_grp]}};
				if (_HArmorcheck) then {if not (_vh in RydHQH_HArmor) then {RydHQH_FValue = RydHQH_FValue + 10;RydHQH_HArmor set [(count RydHQH_HArmor),_vh]};if not (_grp in RydHQH_HArmorG) then {RydHQH_HArmorG set [(count RydHQH_HArmorG),_grp]}};
				if (_MArmorcheck) then {if not (_vh in RydHQH_MArmor) then {RydHQH_MArmor set [(count RydHQH_MArmor),_vh]};if not (_grp in RydHQH_MArmorG) then {RydHQH_MArmorG set [(count RydHQH_MArmorG),_grp]}};
				if (_LArmorcheck) then {if not (_vh in RydHQH_LArmor) then {RydHQH_FValue = RydHQH_FValue + 5;RydHQH_LArmor set [(count RydHQH_LArmor),_vh]};if not (_grp in RydHQH_LArmorG) then {RydHQH_LArmorG set [(count RydHQH_LArmorG),_grp]}};
				if (_LArmorATcheck) then {if not (_vh in RydHQH_LArmorAT) then {RydHQH_LArmorAT set [(count RydHQH_LArmorAT),_vh]};if not (_grp in RydHQH_LArmorATG) then {RydHQH_LArmorATG set [(count RydHQH_LArmorATG),_grp]}};
				if (_Carscheck) then {if not (_vh in RydHQH_Cars) then {RydHQH_FValue = RydHQH_FValue + 3;RydHQH_Cars set [(count RydHQH_Cars),_vh]};if not (_grp in RydHQH_CarsG) then {RydHQH_CarsG set [(count RydHQH_CarsG),_grp]}};
				if (_Aircheck) then {if not (_vh in RydHQH_Air) then {RydHQH_FValue = RydHQH_FValue + 15;RydHQH_Air set [(count RydHQH_Air),_vh]};if not (_grp in RydHQH_AirG) then {RydHQH_AirG set [(count RydHQH_AirG),_grp]}};
				if (_BAircheck) then {if not (_vh in RydHQH_BAir) then {RydHQH_BAir set [(count RydHQH_BAir),_vh]};if not (_grp in RydHQH_BAirG) then {RydHQH_BAirG set [(count RydHQH_BAirG),_grp]}};				
				if (_RAircheck) then {if not (_vh in RydHQH_RAir) then {RydHQH_RAir set [(count RydHQH_RAir),_vh]};if not (_grp in RydHQH_RAirG) then {RydHQH_RAirG set [(count RydHQH_RAirG),_grp]}};				
				if (_NCAircheck) then {if not (_vh in RydHQH_NCAir) then {RydHQH_NCAir set [(count RydHQH_NCAir),_vh]};if not (_grp in RydHQH_NCAirG) then {RydHQH_NCAirG set [(count RydHQH_NCAirG),_grp]}};
				if (_Navalcheck) then {if not (_vh in RydHQH_Naval) then {RydHQH_Naval set [(count RydHQH_Naval),_vh]};if not (_grp in RydHQH_NavalG) then {RydHQH_NavalG set [(count RydHQH_NavalG),_grp]}};
				if (_Staticcheck) then {if not (_vh in RydHQH_Static) then {RydHQH_FValue = RydHQH_FValue + 1;RydHQH_Static set [(count RydHQH_Static),_vh]};if not (_grp in RydHQH_StaticG) then {RydHQH_StaticG set [(count RydHQH_StaticG),_grp]}};
				if (_StaticAAcheck) then {if not (_vh in RydHQH_StaticAA) then {RydHQH_StaticAA set [(count RydHQH_StaticAA),_vh]};if not (_grp in RydHQH_StaticAAG) then {RydHQH_StaticAAG set [(count RydHQH_StaticAAG),_grp]}};
				if (_StaticATcheck) then {if not (_vh in RydHQH_StaticAT) then {RydHQH_StaticAT set [(count RydHQH_StaticAT),_vh]};if not (_grp in RydHQH_StaticATG) then {RydHQH_StaticATG set [(count RydHQH_StaticATG),_grp]}};
				if (_Supportcheck) then {if not (_vh in RydHQH_Support) then {RydHQH_Support set [(count RydHQH_Support),_vh]};if not (_grp in RydHQH_SupportG) then {RydHQH_SupportG set [(count RydHQH_SupportG),_grp]}};
				if (_Cargocheck) then {if not (_vh in RydHQH_Cargo) then {RydHQH_Cargo set [(count RydHQH_Cargo),_vh]};if not (_grp in RydHQH_CargoG) then {RydHQH_CargoG set [(count RydHQH_CargoG),_grp]}};
				if (_NCCargocheck) then {if not (_vh in RydHQH_NCCargo) then {RydHQH_NCCargo set [(count RydHQH_NCCargo),_vh]};if not (_grp in RydHQH_NCCargoG) then {RydHQH_NCCargoG set [(count RydHQH_NCCargoG),_grp]}};
				if (_Crewcheck) then {if not (_vh in RydHQH_Crew) then {RydHQH_Crew set [(count RydHQH_Crew),_vh]};if not (_grp in RydHQH_CrewG) then {RydHQH_CrewG set [(count RydHQH_CrewG),_grp]}};
				if (_NCrewInfcheck) then {if not (_vh in RydHQH_NCrewInf) then {RydHQH_NCrewInf set [(count RydHQH_NCrewInf),_vh]};if not (_grp in RydHQH_NCrewInfG) then {RydHQH_NCrewInfG set [(count RydHQH_NCrewInfG),_grp]}};
				
			}
		foreach (units _x)
		}
	foreach RydHQH_Friends;

	RydHQH_NCrewInfG = RydHQH_NCrewInfG - (RydHQH_RAirG + RydHQH_StaticG);
	RydHQH_NCrewInf = RydHQH_NCrewInf - (RydHQH_RAir + RydHQH_Static);
	RydHQH_InfG = RydHQH_InfG - (RydHQH_RAirG + RydHQH_StaticG);
	RydHQH_Inf = RydHQH_Inf - (RydHQH_RAir + RydHQH_Static);

	RydHQH_CargoAirEx = [];
	RydHQH_CargoLandEx = [];
	if (RydHQH_NoAirCargo) then {RydHQH_CargoAirEx = RydHQH_AirG};
	if (RydHQH_NoLandCargo) then {RydHQH_CargoLandEx = (RydHQH_CargoG - RydHQH_AirG)};
	RydHQH_CargoG = RydHQH_CargoG - (RydHQH_CargoAirEx + RydHQH_CargoLandEx + RydHQH_AmmoDrop);

		{
		if not (_x in RydHQH_SupportG) then
			{
			RydHQH_SupportG set [(count RydHQH_SupportG),_x]
			}
		}
	foreach RydHQH_AmmoDrop;
		
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
				
				if (_SpecForcheck) then {if not (_vh in RydHQH_EnSpecFor) then {RydHQH_EnSpecFor set [(count RydHQH_EnSpecFor),_vh]};if not (_grp in RydHQH_EnSpecForG) then {RydHQH_EnSpecForG set [(count RydHQH_EnSpecForG),_grp]}};
				if (_reconcheck) then {if not (_vh in RydHQH_Enrecon) then {RydHQH_Enrecon set [(count RydHQH_Enrecon),_vh]};if not (_grp in RydHQH_EnreconG) then {RydHQH_EnreconG set [(count RydHQH_EnreconG),_grp]}};
				if (_FOcheck) then {if not (_vh in RydHQH_EnFO) then {RydHQH_EnFO set [(count RydHQH_EnFO),_vh]};if not (_grp in RydHQH_EnFOG) then {RydHQH_EnFOG set [(count RydHQH_EnFOG),_grp]}};
				if (_sniperscheck) then {if not (_vh in RydHQH_Ensnipers) then {RydHQH_Ensnipers set [(count RydHQH_Ensnipers),_vh]};if not (_grp in RydHQH_EnsnipersG) then {RydHQH_EnsnipersG set [(count RydHQH_EnsnipersG),_grp]}};
				if (_ATinfcheck) then {if not (_vh in RydHQH_EnATinf) then {RydHQH_EnATinf set [(count RydHQH_EnATinf),_vh]};if not (_grp in RydHQH_EnATinfG) then {RydHQH_EnATinfG set [(count RydHQH_EnATinfG),_grp]}};
				if (_AAinfcheck) then {if not (_vh in RydHQH_EnAAinf) then {RydHQH_EnAAinf set [(count RydHQH_EnAAinf),_vh]};if not (_grp in RydHQH_EnAAinfG) then {RydHQH_EnAAinfG set [(count RydHQH_EnAAinfG),_grp]}};
				if (_Infcheck) then {if not (_vh in RydHQH_EnInf) then {RydHQH_EValue = RydHQH_EValue + 1;RydHQH_EnInf set [(count RydHQH_EnInf),_vh]};if not (_grp in RydHQH_EnInfG) then {RydHQH_EnInfG set [(count RydHQH_EnInfG),_grp]}};
				if (_Artcheck) then {if not (_vh in RydHQH_EnArt) then {RydHQH_EValue = RydHQH_EValue + 3;RydHQH_EnArt set [(count RydHQH_EnArt),_vh]};if not (_grp in RydHQH_EnArtG) then {RydHQH_EnArtG set [(count RydHQH_EnArtG),_grp]}};
				if (_HArmorcheck) then {if not (_vh in RydHQH_EnHArmor) then {RydHQH_EValue = RydHQH_EValue + 10;RydHQH_EnHArmor set [(count RydHQH_EnHArmor),_vh]};if not (_grp in RydHQH_EnHArmorG) then {RydHQH_EnHArmorG set [(count RydHQH_EnHArmorG),_grp]}};
				if (_MArmorcheck) then {if not (_vh in RydHQH_EnMArmor) then {RydHQH_EnMArmor set [(count RydHQH_EnMArmor),_vh]};if not (_grp in RydHQH_EnMArmorG) then {RydHQH_EnMArmorG set [(count RydHQH_EnMArmorG),_grp]}};
				if (_LArmorcheck) then {if not (_vh in RydHQH_EnLArmor) then {RydHQH_EValue = RydHQH_EValue + 5;RydHQH_EnLArmor set [(count RydHQH_EnLArmor),_vh]};if not (_grp in RydHQH_EnLArmorG) then {RydHQH_EnLArmorG set [(count RydHQH_EnLArmorG),_grp]}};
				if (_LArmorATcheck) then {if not (_vh in RydHQH_EnLArmorAT) then {RydHQH_EnLArmorAT set [(count RydHQH_EnLArmorAT),_vh]};if not (_grp in RydHQH_EnLArmorATG) then {RydHQH_EnLArmorATG set [(count RydHQH_EnLArmorATG),_grp]}};
				if (_Carscheck) then {if not (_vh in RydHQH_EnCars) then {RydHQH_EValue = RydHQH_EValue + 3;RydHQH_EnCars set [(count RydHQH_EnCars),_vh]};if not (_grp in RydHQH_EnCarsG) then {RydHQH_EnCarsG set [(count RydHQH_EnCarsG),_grp]}};
				if (_Aircheck) then {if not (_vh in RydHQH_EnAir) then {RydHQH_EValue = RydHQH_EValue + 15;RydHQH_EnAir set [(count RydHQH_EnAir),_vh]};if not (_grp in RydHQH_EnAirG) then {RydHQH_EnAirG set [(count RydHQH_EnAirG),_grp]}};
				if (_BAircheck) then {if not (_vh in RydHQH_EnBAir) then {RydHQH_EnBAir set [(count RydHQH_EnBAir),_vh]};if not (_grp in RydHQH_EnBAirG) then {RydHQH_EnBAirG set [(count RydHQH_EnBAirG),_grp]}};				
				if (_RAircheck) then {if not (_vh in RydHQH_EnRAir) then {RydHQH_EnRAir set [(count RydHQH_EnRAir),_vh]};if not (_grp in RydHQH_EnRAirG) then {RydHQH_EnRAirG set [(count RydHQH_EnRAirG),_grp]}};
				if (_NCAircheck) then {if not (_vh in RydHQH_EnNCAir) then {RydHQH_EnNCAir set [(count RydHQH_EnNCAir),_vh]};if not (_grp in RydHQH_EnNCAirG) then {RydHQH_EnNCAirG set [(count RydHQH_EnNCAirG),_grp]}};
				if (_Navalcheck) then {if not (_vh in RydHQH_EnNaval) then {RydHQH_EnNaval set [(count RydHQH_EnNaval),_vh]};if not (_grp in RydHQH_EnNavalG) then {RydHQH_EnNavalG set [(count RydHQH_EnNavalG),_grp]}};
				if (_Staticcheck) then {if not (_vh in RydHQH_EnStatic) then {RydHQH_EValue = RydHQH_EValue + 1;RydHQH_EnStatic set [(count RydHQH_EnStatic),_vh]};if not (_grp in RydHQH_EnStaticG) then {RydHQH_EnStaticG set [(count RydHQH_EnStaticG),_grp]}};
				if (_StaticAAcheck) then {if not (_vh in RydHQH_EnStaticAA) then {RydHQH_EnStaticAA set [(count RydHQH_EnStaticAA),_vh]};if not (_grp in RydHQH_EnStaticAAG) then {RydHQH_EnStaticAAG set [(count RydHQH_EnStaticAAG),_grp]}};
				if (_StaticATcheck) then {if not (_vh in RydHQH_EnStaticAT) then {RydHQH_EnStaticAT set [(count RydHQH_EnStaticAT),_vh]};if not (_grp in RydHQH_EnStaticATG) then {RydHQH_EnStaticATG set [(count RydHQH_EnStaticATG),_grp]}};
				if (_Supportcheck) then {if not (_vh in RydHQH_EnSupport) then {RydHQH_EnSupport set [(count RydHQH_EnSupport),_vh]};if not (_grp in RydHQH_EnSupportG) then {RydHQH_EnSupportG set [(count RydHQH_EnSupportG),_grp]}};
				if (_Cargocheck) then {if not (_vh in RydHQH_EnCargo) then {RydHQH_EnCargo set [(count RydHQH_EnCargo),_vh]};if not (_grp in RydHQH_EnCargoG) then {RydHQH_EnCargoG set [(count RydHQH_EnCargoG),_grp]}};
				if (_NCCargocheck) then {if not (_vh in RydHQH_EnNCCargo) then {RydHQH_EnNCCargo set [(count RydHQH_EnNCCargo),_vh]};if not (_grp in RydHQH_EnNCCargoG) then {RydHQH_EnNCCargoG set [(count RydHQH_EnNCCargoG),_grp]}};
				if (_Crewcheck) then {if not (_vh in RydHQH_EnCrew) then {RydHQH_EnCrew set [(count RydHQH_EnCrew),_vh]};if not (_grp in RydHQH_EnCrewG) then {RydHQH_EnCrewG set [(count RydHQH_EnCrewG),_grp]}};
				if (_NCrewInfcheck) then {if not (_vh in RydHQH_EnNCrewInf) then {RydHQH_EnNCrewInf set [(count RydHQH_EnNCrewInf),_vh]};if not (_grp in RydHQH_EnNCrewInfG) then {RydHQH_EnNCrewInfG set [(count RydHQH_EnNCrewInfG),_grp]}};
				
			}
		foreach (units _x)
		}
	foreach RydHQH_KnEnemiesG;

	RydHQH_EnNCrewInfG = RydHQH_EnNCrewInfG - (RydHQH_EnRAirG + RydHQH_EnStaticG);
	RydHQH_EnNCrewInf = RydHQH_EnNCrewInf - (RydHQH_EnRAir + RydHQH_EnStatic);
	RydHQH_EnInfG = RydHQH_EnInfG - (RydHQH_EnRAirG + RydHQH_EnStaticG);
	RydHQH_EnInf = RydHQH_EnInf - (RydHQH_EnRAir + RydHQH_EnStatic);

	if (RydHQH_Flee) then
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
		foreach RydHQH_Friends;

		if (_AllPanic == 0) then {_AllPanic = 1};
		_midCow = 0;
		if not ((count RydHQH_Friends) == 0) then {_midCow = _AllCow/(count RydHQH_Friends)};

			{
			_cowF = ((- RydHQH_Morale)/(50 + (random 25))) + (random (2 * _midCow)) - _midCow;
			_cowF = _cowF * RydHQH_Muu;
			if (_x in RydHQH_SpecForG) then {_cowF = _cowF - 0.8};
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

			if (((random ((20 + (RydHQH_Morale/5))/_AllPanic)) < _cowF) and ((random 100) > (100/(_AllPanic + 1)))) then 
				{
				[_x] call RYD_WPdel;
				_x setVariable [("inPanic" + (str _x)), true];
				if (RydHQH_DebugII) then {_i = [(getPosATL (vehicle (leader _x))),_x,"markPanic","ColorYellow","ICON","DOT","H!","H!",[0.5,0.5]] call RYD_Mark};
				_x setVariable [("Busy" + (str _x)), true];

				_UL = leader _x;
				if not (isPlayer _UL) then 
					{
					if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_InPanic,"InPanic"] call RYD_AIChatter}
					};

				if (RydHQH_Surr) then
					{
					if ((random 100) > 50) then
						{
						if (RydHQH_DebugII) then {_i setMarkerColor "ColorPink";_i setMarkerText "H!!!"};
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
		foreach RydHQH_Friends
		};

		{
		RydHQH_KnEnPos set [(count RydHQH_KnEnPos),getPosATL (vehicle (leader _x))];
		if ((count RydHQH_KnEnPos) >= 100) then {RydHQH_KnEnPos = RydHQH_KnEnPos - [RydHQH_KnEnPos select 0]};
		}
	foreach RydHQH_KnEnemiesG;

	for [{_z = 0},{_z < (count RydHQH_KnEnemies)},{_z = _z + 1}] do
		{
		_KnEnemy = RydHQH_KnEnemies select _z;
			{
			if ((_x knowsAbout _KnEnemy) > 0.01) then {RydHQH reveal [_KnEnemy,2]}
			}
		foreach RydHQH_Friends
		};

	if ((RydBB_Active) and (leaderHQH in (RydBBa_HQs + RydBBb_HQs))) then {[] call RYD_BBArrRefresh};

	if (RydHQH_Cyclecount == 1) then
		{
		[] spawn H_EnemyScan;
		if (RydHQH_ArtyShells > 0) then
			{
			[RydHQH_ArtG,RydHQH_ArtyShells] call RYD_ArtyPrep;
			};

		if ((RydBB_Active) and (leaderHQH in (RydBBa_HQs + RydBBb_HQs))) then 
			{
			RydHQH_readyForBB = true;
			RydxHQ_Done = true;
			if (leaderHQH in RydBBa_HQs) then 
				{
				waitUntil {sleep 0.1;(RydBBa_InitDone)}
				};

			if (leaderHQH in RydBBb_HQs) then 
				{
				waitUntil {sleep 0.1;(RydBBb_InitDone)}
				}
			}
		};

	if (((count RydHQH_KnEnemies) > 0) and ((count RydHQH_ArtG) > 0) and (RydHQH_ArtyShells > 0)) then {[RydHQH_ArtG,RydHQH_KnEnemies,(RydHQH_EnHArmor + RydHQH_EnMArmor + RydHQH_EnLArmor),RydHQH_Friends,RydHQH_Debug,leaderHQH] call RYD_CFF};

	if (isNil ("RydHQH_Order")) then {RydHQH_Order = "ATTACK"};
	_gauss100 = (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10);
	if ((((_gauss100 + RydHQH_Inertia + RydHQH_Morale) > ((RydHQH_EValue/(RydHQH_FValue + 0.1)) * 60)) and not (isNil ("RydHQH_Obj")) and not (RydHQH_Order == "DEFEND")) or (RydHQH_Berserk)) then 
		{
		_lastS = RydHQH getVariable ["LastStance","At"];
		if ((_lastS == "De") or (RydHQH_CycleCount == 1)) then
			{
			if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQH,RydxHQ_AIC_OffStance,"OffStance"] call RYD_AIChatter};
			};

		RydHQH setVariable ["LastStance","At"];
		RydHQH_Inertia = 30 * (0.5 + RydHQH_Consistency)*(0.5 + RydHQH_Activity);
		[] spawn H_HQOrders 
		} 
	else 
		{
		_lastS = RydHQH getVariable ["LastStance","De"];
		if ((_lastS == "At") or (RydHQH_CycleCount == 1)) then
			{
			if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQH,RydxHQ_AIC_DefStance,"DefStance"] call RYD_AIChatter};
			};

		RydHQH setVariable ["LastStance","De"];
		RydHQH_Inertia = - (30  * (0.5 + RydHQH_Consistency))/(0.5 + RydHQH_Activity);
		[] spawn H_HQOrdersDef 
		};


	if ((((RydHQH_Circumspection + RydHQH_Fineness)/2) + 0.1) > (random 1.2)) then
		{
		_SFcount = {not (_x getVariable ["Busy" + (str _x),false]) and not (_x getVariable ["Resting" + (str _x),false])} count (RydHQH_SpecForG - RydHQH_SFBodyGuard);

		if (_SFcount > 0) then
			{
			_isNight = [] call RYD_isNight;
			_SFTgts = [];
			_chance = 40 + (60 * RydHQH_Activity);

				{
				_HQ = group _x;
				if (_HQ in RydHQH_KnEnemiesG) then
					{
					_SFTgts set [(count _SFTgts),_HQ]
					}
				}
			foreach (RydxHQ_AllLeaders - [leaderHQH]);

			if ((count _SFTgts) == 0) then
				{
				_chance = _chance/2;
				_SFTgts = RydHQH_EnArtG
				};

			if ((count _SFTgts) == 0) then
				{
				_chance = _chance/3;
				_SFTgts = RydHQH_EnStaticG
				};

			if (_isNight) then
				{
				_chance = _chance + 25
				};

			if ((count _SFTgts) > 0) then
				{
				_chance = _chance + (((2 * _SFcount) - (8/(0.75 + (RydHQH_Recklessness/2)))) * 20);
				_trgG = _SFTgts select (floor (random (count _SFTgts)));
				_alreadyAttacked = {_x == _trgG} count RydHQH_SFTargets;
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
								if not (_x in RydHQH_SFBodyGuard) then
									{	
									_SFAv set [(count _SFAv),_x]
									}
								}
							}
						}
					foreach RydHQH_SpecForG;

					_team = _SFAv select (floor (random (count _SFAv)));
					_trg = vehicle (leader _trgG);
					if (not ((typeOf _trg) in (_HArmor + _LArmor)) or ((random 100) > (90 - (RydHQH_Recklessness * 10)))) then {[_team,_trg,_trgG] spawn H_GoSFAttack}
					}
				}
			}
		};

	if (RydHQH_LRelocating) then
		{
		if ((abs (speed (vehicle leaderHQH))) < 0.1) then {RydHQH setVariable ["onMove",false]};
		_onMove = RydHQH getVariable ["onMove",false];

		if not (_onMove) then 
			{
			if (not (isPlayer leaderHQH) and ((RydHQH_Cyclecount == 1) or not (RydHQH_Progress == 0))) then
				{
				[RydHQH] call RYD_WPdel;

				_Lpos = position leaderHQH;
				if (RydHQH_Cyclecount == 1) then {RydHQH_Fpos = _Lpos};

				_rds = 0;

				if (RydHQH_LRelocating) then 
					{
					_rds = 0;
					if (RydHQH_NObj == 1) then {_Lpos = RydHQH_Fpos;if (leaderHQH in (RydBBa_HQs + RydBBb_HQs)) then {_Lpos = position leaderHQH};_rds = 0};
					if (RydHQH_NObj == 2) then {_Lpos = position RydHQH_Obj1};
					if (RydHQH_NObj == 3) then {_Lpos = position RydHQH_Obj2};
					if (RydHQH_NObj >= 4) then {_Lpos = position RydHQH_Obj3};
					};

				_spd = "LIMITED";
				if (RydHQH_Progress == -1) then {_spd = "NORMAL"};
				RydHQH_Progress = 0;
				_enemyN = false;

					{
					_eLdr = vehicle (leader _x);
					_eDst = _eLdr distance _Lpos;

					if (_eDst < 600) exitWith {_enemyN = true}
					}
				foreach RydHQH_KnEnemiesG;

				if not (_enemyN) then 
					{
					_wp = [RydHQH,_Lpos,"HOLD","AWARE","GREEN",_spd,["true",""],true,_rds,[0,0,0],"FILE"] call RYD_WPadd;
					if (isNull (assignedVehicle leaderHQH)) then
						{
						if (RydHQH_GetHQInside) then {[_wp] call RYD_GoInside}
						};

					if ((RydHQH_LRelocating) and (RydHQH_NObj > 1) and (RydHQH_Cyclecount > 1)) then 
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
								foreach RydHQH_KnEnemiesG;

								if (isNull RydHQH) then 
									{
									_onPlace = true
									}
								else
									{
									if not (_getBack) then
										{
										if (((vehicle leaderHQH) distance _LPos) < 30) then {_onPlace = true}
										}
									};
								

								((_getback) or (_onPlace))
								};

							if not (_onPlace) then
								{
								_rds = 30;
								if (RydHQH_NObj <= 2) then {_Lpos = getPosATL (vehicle leaderHQH);_rds = 0};
								if (RydHQH_NObj == 3) then {_Lpos = position RydHQH_Obj1};
								if (RydHQH_NObj >= 4) then {_Lpos = position RydHQH_Obj2};

								_getBack = false;

									{
									_eLdr = vehicle (leader _x);
									_eDst = _eLdr distance _Lpos;

									if (_eDst < 600) exitWith {_getBack = true}
									}
								foreach RydHQH_KnEnemiesG;

								if (_getBack) then {_Lpos = getPosATL (vehicle leaderHQH);_rds = 0};

								[RydHQH] call RYD_WPdel;	

								_spd = "NORMAL";
								if not (((vehicle leaderHQH) distance _LPos) < 50) then {_spd = "FULL"};

								_wp = [RydHQH,_Lpos,"HOLD","AWARE","GREEN",_spd,["true",""],true,_rds,[0,0,0],"FILE"] call RYD_WPadd;
								if (isNull (assignedVehicle leaderHQH)) then
									{
									if (RydHQH_GetHQInside) then {[_wp] call RYD_GoInside}
									};

								RydHQH setVariable ["onMove",true];
								}
							}
						}
					}
				}
			}
		};

	if (isNil ("RydHQH_CommDelay")) then {RydHQH_CommDelay = 1};
	_delay = (((22.5 + (count RydHQH_Friends))/(0.5 + RydHQH_Reflex)) * RydHQH_CommDelay);
	sleep _delay;

		{
		RydHQH reveal vehicle (leader _x)
		}
	foreach RydHQH_Friends;

	for [{_z = 0},{_z < (count RydHQH_KnEnemies)},{_z = _z + 1}] do
		{
		_KnEnemy = RydHQH_KnEnemies select _z;

			{
			if ((_x knowsAbout _KnEnemy) > 0.01) then {RydHQH reveal [_KnEnemy,2]} 
			}
		foreach RydHQH_Friends
		}
	};