
RydHQC = GrpNull;

RydHQC = group leaderHQC;

leaderHQC kbAddTopic ["orders","RYD_HAC\topics.bikb",""];
waituntil {(leaderHQC kbHasTopic "orders")};

RydHQC_Cyclecount = 0;

waituntil {not (isNull RydHQC)};

RydHQC_PersDone = false;
[] spawn C_Personality;
waituntil {RydHQC_PersDone};

RydHQC_LHQInit = false;
[] spawn C_LHQ;
waituntil {RydHQC_LHQInit};

if (isNil ("RydHQC_Boxed")) then {RydHQC_Boxed = []};
if (isNil ("RydHQC_AmmoBoxes")) then 
	{
	RydHQC_AmmoBoxes = [];

	if not (isNil "RydHQC_AmmoDepot") then 
		{
		_rds = (triggerArea RydHQC_AmmoDepot) select 0;
		RydHQC_AmmoBoxes = (getPosATL RydHQC_AmmoDepot) nearObjects ["ReammoBox",_rds]
		}
	};

[] spawn C_HQReset;
[] spawn C_Rev;
[] spawn C_SuppMed;
[] spawn C_SuppFuel;
[] spawn C_SuppAmmo;
[] spawn C_SuppRep;
[] spawn C_SFIdleOrd;
[] spawn C_Reloc;
[] spawn C_LPos;

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
RydHQC_NCVeh = _NCCargo + (_Support - ["MH60S"]);

[(_snipers + _ATinf + _AAinf)] spawn C_Garrison;

RydHQC_ReconDone = false;
RydHQC_DefDone = false;
RydHQC_ReconStage = 1;
RydHQC_KnEnPos = [];
RydHQC_AirInDef = [];
if (isNil ("RydHQC_Excluded")) then {RydHQC_Excluded = []};
if (isNil ("RydHQC_Fast")) then {RydHQC_Fast = false};
if (isNil ("RydHQC_ExInfo")) then {RydHQC_ExInfo = false};
if (isNil ("RydHQC_ObjHoldTime")) then {RydHQC_ObjHoldTime = 600};
if (isNil "RydHQC_NObj") then {RydHQC_NObj = 1};

RydHQC_Init = true;

RydHQC_Inertia = 0;
RydHQC_Morale = 0;
RydHQC_CInitial = 0;
RydHQC_CLast = 0;
RydHQC_CCurrent = 0;
RydHQC_CIMoraleC = 0;
RydHQC_CLMoraleC = 0;
RydHQC_Surrender = false;

RydHQC_FirstEMark = true;
RydHQC_LastE = 0;
RydHQC_FlankingInit = false;
RydHQC_FlankingDone = false;
RydHQC_Progress = 0;

RydHQC_AAthreat = [];
RydHQC_ATthreat = [];
RydHQC_Airthreat = [];
RydHQC_Exhausted = [];

_lastHQ = leaderHQC;
_OLmpl = 0;
_cycleCap = 0;
_firstMC = 0; 
_wp = [];

while {not ((isNull RydHQC) or (RydHQC_Surrender))} do
	{
	if not (RydHQC_Fast) then {waituntil {sleep 0.1;((RydxHQ_Done) and (RydxHQB_Done) and (RydxHQC_Done) and (RydxHQD_Done) and (RydxHQE_Done) and (RydxHQF_Done) and (RydxHQG_Done) and (RydxHQH_Done))}};
	if (isNil ("RydHQC_SupportWP")) then {RydHQC_SupportWP = false};

	if (RydHQC_Cyclecount > 1) then
		{
		if not (_lastHQ == leaderHQC) then {sleep (60 + (random 60))};
		};

	_lastHQ = leaderHQC;
	RydHQC_Cyclecount = RydHQC_Cyclecount + 1;
	RydxHQ_Done = false;

	RydHQC_SpecFor = [];
	RydHQC_recon = [];
	RydHQC_FO = [];
	RydHQC_snipers = [];
	RydHQC_ATinf = [];
	RydHQC_AAinf = [];
	RydHQC_Inf = [];
	RydHQC_Art = [];
	RydHQC_HArmor = [];
	RydHQC_MArmor = [];
	RydHQC_LArmor = [];
	RydHQC_LArmorAT = [];
	RydHQC_Cars = [];
	RydHQC_Air = [];
	RydHQC_BAir = [];
	RydHQC_RAir = [];
	RydHQC_NCAir = [];
	RydHQC_Naval = [];
	RydHQC_Static = [];
	RydHQC_StaticAA = [];
	RydHQC_StaticAT = [];
	RydHQC_Support = [];
	RydHQC_Cargo = [];
	RydHQC_NCCargo = [];
	RydHQC_Other = [];
	RydHQC_Crew = [];
	RydHQC_NCrewInf = [];

	RydHQC_SpecForG = [];
	RydHQC_reconG = [];
	RydHQC_FOG = [];
	RydHQC_snipersG = [];
	RydHQC_ATinfG = [];
	RydHQC_AAinfG = [];
	RydHQC_InfG = [];
	RydHQC_ArtG = [];
	RydHQC_HArmorG = [];
	RydHQC_MArmorG = [];
	RydHQC_LArmorG = [];
	RydHQC_LArmorATG = [];
	RydHQC_CarsG = [];
	RydHQC_AirG = [];
	RydHQC_BAirG = [];
	RydHQC_RAirG = [];
	RydHQC_NCAirG = [];
	RydHQC_NavalG = [];
	RydHQC_StaticG = [];
	RydHQC_StaticAAG = [];
	RydHQC_StaticATG = [];
	RydHQC_SupportG = [];
	RydHQC_CargoG = [];
	RydHQC_NCCargoG = [];
	RydHQC_OtherG = [];
	RydHQC_CrewG = [];
	RydHQC_NCrewInfG = [];

	RydHQC_EnSpecFor = [];
	RydHQC_Enrecon = [];
	RydHQC_EnFO = [];
	RydHQC_Ensnipers = [];
	RydHQC_EnATinf = [];
	RydHQC_EnAAinf = [];
	RydHQC_EnInf = [];
	RydHQC_EnArt = [];
	RydHQC_EnHArmor = [];
	RydHQC_EnMArmor = [];
	RydHQC_EnLArmor = [];
	RydHQC_EnLArmorAT = [];
	RydHQC_EnCars = [];
	RydHQC_EnAir = [];
	RydHQC_EnBAir = [];
	RydHQC_EnRAir = [];
	RydHQC_EnNCAir = [];
	RydHQC_EnNaval = [];
	RydHQC_EnStatic = [];
	RydHQC_EnStaticAA = [];
	RydHQC_EnStaticAT = [];
	RydHQC_EnSupport = [];
	RydHQC_EnCargo = [];
	RydHQC_EnNCCargo = [];
	RydHQC_EnOther = [];
	RydHQC_EnCrew = [];
	RydHQC_EnNCrewInf = [];

	RydHQC_EnSpecForG = [];
	RydHQC_EnreconG = [];
	RydHQC_EnFOG = [];
	RydHQC_EnsnipersG = [];
	RydHQC_EnATinfG = [];
	RydHQC_EnAAinfG = [];
	RydHQC_EnInfG = [];
	RydHQC_EnArtG = [];
	RydHQC_EnHArmorG = [];
	RydHQC_EnMArmorG = [];
	RydHQC_EnLArmorG = [];
	RydHQC_EnLArmorATG = [];
	RydHQC_EnCarsG = [];
	RydHQC_EnAirG = [];
	RydHQC_EnBAirG = [];
	RydHQC_EnRAirG = [];
	RydHQC_EnNCAirG = [];
	RydHQC_EnNavalG = [];
	RydHQC_EnStaticG = [];
	RydHQC_EnStaticAAG = [];
	RydHQC_EnStaticATG = [];
	RydHQC_EnSupportG = [];
	RydHQC_EnCargoG = [];
	RydHQC_EnNCCargoG = [];
	RydHQC_EnOtherG = [];
	RydHQC_EnCrewG = [];
	RydHQC_EnNCrewInfG = [];

	RydHQC_LastE = count RydHQC_KnEnemies;
	RydHQC_LastFriends = RydHQC_Friends;

	if (isNil ("RydHQC_NoAirCargo")) then {RydHQC_NoAirCargo = false};
	if (isNil ("RydHQC_NoLandCargo")) then {RydHQC_NoLandCargo = false};
	if (isNil ("RydHQC_LastFriends")) then {RydHQC_LastFriends = []};
	if (isNil ("RydHQC_CargoFind")) then {RydHQC_CargoFind = 0};
	if (isNil ("RydHQC_Subordinated")) then {RydHQC_Subordinated = []};
	if (isNil ("RydHQC_Included")) then {RydHQC_Included = []};
	if (isNil ("RydHQC_ExcludedG")) then {RydHQC_ExcludedG = []};
	if (isNil ("RydHQC_SubAll")) then {RydHQC_SubAll = true};
	if (isNil ("RydHQC_SubSynchro")) then {RydHQC_SubSynchro = false};
	if (isNil ("RydHQC_SubNamed")) then {RydHQC_SubNamed = false};
	if (isNil ("RydHQC_SubZero")) then {RydHQC_SubZero = false};
	if (isNil ("RydHQC_ReSynchro")) then {RydHQC_ReSynchro = true};
	if (isNil ("RydHQC_NameLimit")) then {RydHQC_NameLimit = 100};
	if (isNil ("RydHQC_Surr")) then {RydHQC_Surr = false};
	if (isNil ("RydHQC_AOnly")) then {RydHQC_AOnly = []};
	if (isNil ("RydHQC_ROnly")) then {RydHQC_ROnly = []};
	if (isNil ("RydHQC_CargoOnly")) then {RydHQC_CargoOnly = []};
	if (isNil ("RydHQC_NoCargo")) then {RydHQC_NoCargo = []};
	if (isNil ("RydHQC_NoFlank")) then {RydHQC_NoFlank = []};
	if (isNil ("RydHQC_NoDef")) then {RydHQC_NoDef = []};
	if (isNil ("RydHQC_FirstToFight")) then {RydHQC_FirstToFight = []};
	if (isNil ("RydHQC_VoiceComm")) then {RydHQC_VoiceComm = true};
	if (isNil ("RydHQC_Front")) then {RydHQC_Front = false};
	if (isNil ("RydHQC_LRelocating")) then {RydHQC_LRelocating = false};
	if (isNil ("RydHQC_Flee")) then {RydHQC_Flee = true};
	if (isNil ("RydHQC_GarrR")) then {RydHQC_GarrR = 500};
	if (isNil ("RydHQC_Rush")) then {RydHQC_Rush = false};
	if (isNil ("RydHQC_GarrVehAb")) then {RydHQC_GarrVehAb = false};
	if (isNil ("RydHQC_DefendObjectives")) then {RydHQC_DefendObjectives = 4};
	if (isNil ("RydHQC_DefSpot")) then {RydHQC_DefSpot = []};
	if (isNil ("RydHQC_RecDefSpot")) then {RydHQC_RecDefSpot = []};
	if (isNil "RydHQC_Flare") then {RydHQC_Flare = true};
	if (isNil "RydHQC_Smoke") then {RydHQC_Smoke = true};
	if (isNil "RydHQC_NoRec") then {RydHQC_NoRec = 1};
	if (isNil "RydHQC_RapidCapt") then {RydHQC_RapidCapt = 10};
	if (isNil "RydHQC_Muu") then {RydHQC_Muu = 1};
	if (isNil "RydHQC_ArtyShells") then {RydHQC_ArtyShells = 120};
	if (isNil "RydHQC_Withdraw") then {RydHQC_Withdraw = 1};
	if (isNil "RydHQC_Berserk") then {RydHQC_Berserk = false};
	if (isNil "RydHQC_IDChance") then {RydHQC_IDChance = 100};
	if (isNil "RydHQC_RDChance") then {RydHQC_RDChance = 100};
	if (isNil "RydHQC_SDChance") then {RydHQC_SDChance = 100};
	if (isNil "RydHQC_AmmoDrop") then {RydHQC_AmmoDrop = []};
	if (isNil "RydHQC_SFTargets") then {RydHQC_SFTargets = []};
	if (isNil "RydHQC_LZ") then {RydHQC_LZ = false};
	if (isNil "RydHQC_SFBodyGuard") then {RydHQC_SFBodyGuard = []};
	if (isNil "RydHQC_DynForm") then {RydHQC_DynForm = false};
	if (isNil "RydHQC_UnlimitedCapt") then {RydHQC_UnlimitedCapt = false};
	if (isNil "RydHQC_CaptLimit") then {RydHQC_CaptLimit = 10};
	if (isNil "RydHQC_GetHQInside") then {RydHQC_GetHQInside = false};

	RydHQC_Friends = [];
	RydHQC_Enemies = [];
	RydHQC_KnEnemies = [];
	RydHQC_KnEnemiesG = [];
	RydHQC_FValue = 0;
	RydHQC_EValue = 0;

	if (RydxHQ_AIChatDensity > 0) then
		{
		_varName1 = "HAC_AIChatRep";
		_varName2 = "_West";

		switch ((side RydHQC)) do
			{
			case (east) : {_varName2 = "_East"};
			case (resistance) : {_varName2 = "_Guer"};
			};

		missionNamespace setVariable [_varName1 + _varName2,0];

		_varName1 = "HAC_AIChatLT";

		missionNamespace setVariable [_varName1 + _varName2,[0,""]]
		};

	if (RydHQC_NObj == 1) then {RydHQC_Obj = RydHQC_Obj1};
	if (RydHQC_NObj == 2) then {RydHQC_Obj = RydHQC_Obj2};
	if (RydHQC_NObj == 3) then {RydHQC_Obj = RydHQC_Obj3};
	if (RydHQC_NObj >= 4) then {RydHQC_Obj = RydHQC_Obj4};

	RydHQC_LastSub = RydHQC_Subordinated;
	RydHQC_Subordinated = [];

	_civF = ["CIV","CIV_RU","BIS_TK_CIV","BIS_CIV_special"];
	if not (isNil ("RydHQC_CivF")) then {_civF = RydHQC_CivF};

		{
		_isCaptive = _x getVariable ("isCaptive" + (str _x));
		if (isNil "_isCaptive") then {_isCaptive = false};

		_isCiv = false;
		if ((faction (leader _x)) in _civF) then {_isCiv = true};
		if not ((isNull (leaderHQC)) and not (isNull _x) and (alive (leaderHQC)) and (alive (leader _x)) and not (_isCaptive)) then
			{
			if (not (RydHQC_Front) and ((side _x) getFriend (side RydHQC) < 0.6) and not (_isCiv)) then {if not (_x in RydHQC_Enemies) then {RydHQC_Enemies set [(count RydHQC_Enemies), _x]}};
			_front = true;
			if not (isNil "FrontC") then {_front = ((getPosATL (vehicle (leader _x))) in FrontC)};
			if ((RydHQC_Front) and ((side _x) getFriend (side RydHQC) < 0.6) and (_front) and not (_isCiv)) then {if not (_x in RydHQC_Enemies) then {RydHQC_Enemies set [(count RydHQC_Enemies), _x]}};
			if (RydHQC_SubAll) then 
				{
				if not ((side _x) getFriend (side RydHQC) < 0.6) then 
					{
					if (not (_x in RydHQC_Friends) and not (((leader _x) in RydHQC_Excluded) or (_isCiv))) then {RydHQC_Friends set [(count RydHQC_Friends), _x]}
					};
				};
			}
		}
	foreach allGroups;

	RydHQC_Excl = [];

		{
		if not ((group _x) in RydHQC_Excl) then {RydHQC_Excl set [(count RydHQC_Excl),group _x]} 
		}
	foreach RydHQC_Excluded;

	if (RydHQC_SubSynchro) then 
		{
			{
			if ((_x in RydHQC_LastSub) and not ((leader _x) in (synchronizedObjects leaderHQC)) and (RydHQC_ReSynchro)) then {RydHQC_Subordinated set [(count RydHQC_Subordinated),_x]};
			if (not (_x in RydHQC_Subordinated) and ((leader _x) in (synchronizedObjects leaderHQC))) then {RydHQC_Subordinated set [(count RydHQC_Subordinated),_x]};
			}
		foreach allGroups;
		};

	if (RydHQC_SubNamed) then 
		{
			{
			for [{_i = 1},{_i <= RydHQC_NameLimit},{_i = _i + 1}] do
				{
				if (not (_x in RydHQC_Subordinated) and ((str (leader _x)) == ("RydC" + str (_i)))) then {RydHQC_Subordinated set [(count RydHQC_Subordinated),_x]};
				};
			}
		foreach allGroups;
		};

	if (RydHQC_SubZero) then 
		{
			{
			if (((random 100) >= 50) and not (_x in RydHQC_Subordinated)) then {RydHQC_Subordinated set [(count RydHQC_Subordinated),_x]} else {if (not (_x in RydHQCB_Subordinated)) then {RydHQCB_Subordinated set [(count RydHQCB_Subordinated),_x]}};
			}
		foreach allGroups;
		};

	RydHQC_Friends = RydHQC_Friends + RydHQC_Subordinated + RydHQC_Included - (RydHQC_ExcludedG + RydHQC_Excl);
	RydHQC_Friends = RydHQC_Friends - [RydHQC];
	RydHQC_NoWayD = allGroups - RydHQC_LastFriends;

	RydHQC_Friends = [RydHQC_Friends] call RYD_RandomOrd;

		{
		[_x] call RYD_WPdel;
		}
	foreach ((RydHQC_Excl + RydHQC_ExcludedG) - RydHQC_NoWayD);

	if (RydHQC_Init) then 
		{
			{
			RydHQC_CInitial = RydHQC_CInitial + (count (units _x))
			}
		foreach RydHQC_Friends + [RydHQC]
		};

	RydHQC_CLast = RydHQC_CCurrent;
	RydHQC_CCurrent = 0;
		{
		RydHQC_CCurrent = RydHQC_CCurrent + (count (units _x))
		}
	foreach RydHQC_Friends + [RydHQC];

	RydHQC_Ex = [];

	if (RydHQC_ExInfo) then 
		{
		RydHQC_Ex = RydHQC_Excl + RydHQC_ExcludedG
		};

		{
		for [{_a = 0},{_a < count (units _x)},{_a = _a + 1}] do
			{
			_enemyU = vehicle ((units _x) select _a);
				{
				if ((_x knowsAbout _enemyU) >= 0.05) exitwith 
					{
					if not (_enemyU in RydHQC_KnEnemies) then 
						{
						RydHQC_KnEnemies set [(count RydHQC_KnEnemies),_enemyU];
						};

					if not ((group _enemyU) in RydHQC_KnEnemiesG) then 
						{
						_already = missionnameSpace getVariable ["AlreadySpotted",[]];
						RydHQC_KnEnemiesG set [(count RydHQC_KnEnemiesG),(group _enemyU)];
						if not ((group _enemyU) in _already) then
							{
							_UL = (leader _x);if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_EnemySpot,"EnemySpot"] call RYD_AIChatter}};
							}
						}
					} 
				}
			foreach (RydHQC_Friends + [RydHQC] + RydHQC_Ex)
			}
		}
	foreach RydHQC_Enemies;

	_already = missionnameSpace getVariable ["AlreadySpotted",[]];

		{
		if not (_x in _already) then
			{
			_already set [(count _already),_x]
			}
		}
	foreach RydHQC_KnEnemiesG;

	missionnameSpace setVariable ["AlreadySpotted",_already];

	_lossFinal = RydHQC_CInitial - RydHQC_CCurrent;
	if (_lossFinal < 0) then {_lossFinal = 0;RydHQC_CInitial = RydHQC_CCurrent};

	if not (RydHQC_Init) then 
		{
		_lossP = _lossFinal/RydHQC_CInitial;

		if ((_OLmpl == 0) and ((count RydHQC_KnEnemies) > 0)) then
			{
			_OLmpl = 0.01;
			_firstMC = RydHQC_Cyclecount - 1
			};

		if ((_cycleCap < (50 / (1.01 - _lossP))) and ((count RydHQC_KnEnemies) == 0) and (_OLmpl == 0.01)) then
			{
			_cycleCap = _cycleCap + 1;
			if ((random 1) < _lossP) then {_firstMC = _firstMC + 1}
			}
		else
			{
			if not ((count RydHQC_KnEnemies) == 0) then
				{
				_cycleCap = 0;
				}
			};

		
		_lossPerc = _lossP * 100;
		_cycle = RydHQC_Cyclecount - _firstMC;

		_OLF = _OLmpl * (((-(_lossPerc * _lossPerc))/(1.1^_cycle)) + ((15 + (random 5) + (random 5))/(1 + _lossP)) - (_lossP * 10) + (_cycle ^ ((10 * (1 - _lossP))/_cycle)));

		_mplLU = 1;
		_lostU = RydHQC_CLast - RydHQC_CCurrent;
		if (_lostU < 0) then {_lostU = - _lostU;_mplLU = -1};

		_lossL = _mplLU * ((100 * _lostU/RydHQC_CInitial)^(1.55 + (random 0.05) + (random 0.05)))/10;

		_balanceF = 0.5 + (random 0.5) + (random 0.5) - _lossP - (count RydHQC_KnEnemies)/RydHQC_CCurrent;

		RydHQC_Morale = RydHQC_Morale + (_OLF - _lossL + _balanceF);
		//RydHQC_Morale = RydHQC_Morale + (((RydHQC_CCurrent - RydHQC_CInitial) * (6/(1 + (RydHQC_Cyclecount/25)))) + (6 * ((random 0.5) + RydHQC_CCurrent - RydHQC_CLast)))/((1 + (10*RydHQC_CInitial))/(1 + ((count RydHQC_KnEnemies) * 0.5)));
		//diag_log format ["Init: %2, Last: %3, Current: %3,Zmiana morale: %1",(((RydHQC_CCurrent - RydHQC_CInitial) * (6/(1 + (RydHQC_Cyclecount/25)))) + (6 * ((random 0.5) + RydHQC_CCurrent - RydHQC_CLast)))/((1 + (10*RydHQC_CInitial))/(1 + ((count RydHQC_KnEnemies) * 0.5))),RydHQC_CInitial,RydHQC_CLast,RydHQC_CCurrent];
		};

	if (RydHQC_Morale < -50) then {RydHQC_Morale = -50};
	if (RydHQC_Morale > 0) then {RydHQC_Morale = 0};
	if (RydHQC_Debug) then 
		{
		_mdbg = format ["Morale C (%2): %1 - losses: %3 percent (%4)",RydHQC_Morale,RydHQC_Personality,(round (((_lossFinal/RydHQC_CInitial) * 100) * 10)/10),_lossFinal];
		diag_log _mdbg;
		leaderHQC globalChat _mdbg;

		_cl = "<t color='#007f00'>C -> M: %1 - L: %2%3</t>";

		switch (side RydHQC) do
			{
			case (west) : {_cl = "<t color='#0d81c4'>C -> M: %1 - L: %2%3</t>"};
			case (east) : {_cl = "<t color='#ff0000'>C -> M: %1 - L: %2%3</t>"};
			};

		_dbgMon = parseText format [_cl,(round (RydHQC_Morale * 10))/10,(round (((_lossFinal/RydHQC_CInitial) * 100) * 10)/10),"%"];

		RydHQC setVariable ["DbgMon",_dbgMon];
		};

	if (RydHQC_Init) then {[RydHQC] spawn Desperado};

	RydHQC_Init = false;

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

				if (_SpecForcheck) then {if not (_vh in RydHQC_SpecFor) then {RydHQC_SpecFor set [(count RydHQC_SpecFor),_vh]};if not (_grp in RydHQC_SpecForG) then {RydHQC_SpecForG set [(count RydHQC_SpecForG),_grp]}};
				if (_reconcheck) then {if not (_vh in RydHQC_recon) then {RydHQC_recon set [(count RydHQC_recon),_vh]};if not (_grp in RydHQC_reconG) then {RydHQC_reconG set [(count RydHQC_reconG),_grp]}};
				if (_FOcheck) then {if not (_vh in RydHQC_FO) then {RydHQC_FO set [(count RydHQC_FO),_vh]};if not (_grp in RydHQC_FOG) then {RydHQC_FOG set [(count RydHQC_FOG),_grp]}};
				if (_sniperscheck) then {if not (_vh in RydHQC_snipers) then {RydHQC_snipers set [(count RydHQC_snipers),_vh]};if not (_grp in RydHQC_snipersG) then {RydHQC_snipersG set [(count RydHQC_snipersG),_grp]}};
				if (_ATinfcheck) then {if not (_vh in RydHQC_ATinf) then {RydHQC_ATinf set [(count RydHQC_ATinf),_vh]};if not (_grp in RydHQC_ATinfG) then {RydHQC_ATinfG set [(count RydHQC_ATinfG),_grp]}};
				if (_AAinfcheck) then {if not (_vh in RydHQC_AAinf) then {RydHQC_AAinf set [(count RydHQC_AAinf),_vh]};if not (_grp in RydHQC_AAinfG) then {RydHQC_AAinfG set [(count RydHQC_AAinfG),_grp]}};
				if (_Infcheck) then {if not (_vh in RydHQC_Inf) then {RydHQC_FValue = RydHQC_FValue + 1;RydHQC_Inf set [(count RydHQC_Inf),_vh]};if not (_grp in RydHQC_InfG) then {RydHQC_InfG set [(count RydHQC_InfG),_grp]}};
				if (_Artcheck) then {if not (_vh in RydHQC_Art) then {RydHQC_FValue = RydHQC_FValue + 3;RydHQC_Art set [(count RydHQC_Art),_vh]};if not (_grp in RydHQC_ArtG) then {RydHQC_ArtG set [(count RydHQC_ArtG),_grp]}};
				if (_HArmorcheck) then {if not (_vh in RydHQC_HArmor) then {RydHQC_FValue = RydHQC_FValue + 10;RydHQC_HArmor set [(count RydHQC_HArmor),_vh]};if not (_grp in RydHQC_HArmorG) then {RydHQC_HArmorG set [(count RydHQC_HArmorG),_grp]}};
				if (_MArmorcheck) then {if not (_vh in RydHQC_MArmor) then {RydHQC_MArmor set [(count RydHQC_MArmor),_vh]};if not (_grp in RydHQC_MArmorG) then {RydHQC_MArmorG set [(count RydHQC_MArmorG),_grp]}};
				if (_LArmorcheck) then {if not (_vh in RydHQC_LArmor) then {RydHQC_FValue = RydHQC_FValue + 5;RydHQC_LArmor set [(count RydHQC_LArmor),_vh]};if not (_grp in RydHQC_LArmorG) then {RydHQC_LArmorG set [(count RydHQC_LArmorG),_grp]}};
				if (_LArmorATcheck) then {if not (_vh in RydHQC_LArmorAT) then {RydHQC_LArmorAT set [(count RydHQC_LArmorAT),_vh]};if not (_grp in RydHQC_LArmorATG) then {RydHQC_LArmorATG set [(count RydHQC_LArmorATG),_grp]}};
				if (_Carscheck) then {if not (_vh in RydHQC_Cars) then {RydHQC_FValue = RydHQC_FValue + 3;RydHQC_Cars set [(count RydHQC_Cars),_vh]};if not (_grp in RydHQC_CarsG) then {RydHQC_CarsG set [(count RydHQC_CarsG),_grp]}};
				if (_Aircheck) then {if not (_vh in RydHQC_Air) then {RydHQC_FValue = RydHQC_FValue + 15;RydHQC_Air set [(count RydHQC_Air),_vh]};if not (_grp in RydHQC_AirG) then {RydHQC_AirG set [(count RydHQC_AirG),_grp]}};
				if (_BAircheck) then {if not (_vh in RydHQC_BAir) then {RydHQC_BAir set [(count RydHQC_BAir),_vh]};if not (_grp in RydHQC_BAirG) then {RydHQC_BAirG set [(count RydHQC_BAirG),_grp]}};				
				if (_RAircheck) then {if not (_vh in RydHQC_RAir) then {RydHQC_RAir set [(count RydHQC_RAir),_vh]};if not (_grp in RydHQC_RAirG) then {RydHQC_RAirG set [(count RydHQC_RAirG),_grp]}};				
				if (_NCAircheck) then {if not (_vh in RydHQC_NCAir) then {RydHQC_NCAir set [(count RydHQC_NCAir),_vh]};if not (_grp in RydHQC_NCAirG) then {RydHQC_NCAirG set [(count RydHQC_NCAirG),_grp]}};
				if (_Navalcheck) then {if not (_vh in RydHQC_Naval) then {RydHQC_Naval set [(count RydHQC_Naval),_vh]};if not (_grp in RydHQC_NavalG) then {RydHQC_NavalG set [(count RydHQC_NavalG),_grp]}};
				if (_Staticcheck) then {if not (_vh in RydHQC_Static) then {RydHQC_FValue = RydHQC_FValue + 1;RydHQC_Static set [(count RydHQC_Static),_vh]};if not (_grp in RydHQC_StaticG) then {RydHQC_StaticG set [(count RydHQC_StaticG),_grp]}};
				if (_StaticAAcheck) then {if not (_vh in RydHQC_StaticAA) then {RydHQC_StaticAA set [(count RydHQC_StaticAA),_vh]};if not (_grp in RydHQC_StaticAAG) then {RydHQC_StaticAAG set [(count RydHQC_StaticAAG),_grp]}};
				if (_StaticATcheck) then {if not (_vh in RydHQC_StaticAT) then {RydHQC_StaticAT set [(count RydHQC_StaticAT),_vh]};if not (_grp in RydHQC_StaticATG) then {RydHQC_StaticATG set [(count RydHQC_StaticATG),_grp]}};
				if (_Supportcheck) then {if not (_vh in RydHQC_Support) then {RydHQC_Support set [(count RydHQC_Support),_vh]};if not (_grp in RydHQC_SupportG) then {RydHQC_SupportG set [(count RydHQC_SupportG),_grp]}};
				if (_Cargocheck) then {if not (_vh in RydHQC_Cargo) then {RydHQC_Cargo set [(count RydHQC_Cargo),_vh]};if not (_grp in RydHQC_CargoG) then {RydHQC_CargoG set [(count RydHQC_CargoG),_grp]}};
				if (_NCCargocheck) then {if not (_vh in RydHQC_NCCargo) then {RydHQC_NCCargo set [(count RydHQC_NCCargo),_vh]};if not (_grp in RydHQC_NCCargoG) then {RydHQC_NCCargoG set [(count RydHQC_NCCargoG),_grp]}};
				if (_Crewcheck) then {if not (_vh in RydHQC_Crew) then {RydHQC_Crew set [(count RydHQC_Crew),_vh]};if not (_grp in RydHQC_CrewG) then {RydHQC_CrewG set [(count RydHQC_CrewG),_grp]}};
				if (_NCrewInfcheck) then {if not (_vh in RydHQC_NCrewInf) then {RydHQC_NCrewInf set [(count RydHQC_NCrewInf),_vh]};if not (_grp in RydHQC_NCrewInfG) then {RydHQC_NCrewInfG set [(count RydHQC_NCrewInfG),_grp]}};
				
			}
		foreach (units _x)
		}
	foreach RydHQC_Friends;

	RydHQC_NCrewInfG = RydHQC_NCrewInfG - (RydHQC_RAirG + RydHQC_StaticG);
	RydHQC_NCrewInf = RydHQC_NCrewInf - (RydHQC_RAir + RydHQC_Static);
	RydHQC_InfG = RydHQC_InfG - (RydHQC_RAirG + RydHQC_StaticG);
	RydHQC_Inf = RydHQC_Inf - (RydHQC_RAir + RydHQC_Static);

	RydHQC_CargoAirEx = [];
	RydHQC_CargoLandEx = [];
	if (RydHQC_NoAirCargo) then {RydHQC_CargoAirEx = RydHQC_AirG};
	if (RydHQC_NoLandCargo) then {RydHQC_CargoLandEx = (RydHQC_CargoG - RydHQC_AirG)};
	RydHQC_CargoG = RydHQC_CargoG - (RydHQC_CargoAirEx + RydHQC_CargoLandEx + RydHQC_AmmoDrop);

		{
		if not (_x in RydHQC_SupportG) then
			{
			RydHQC_SupportG set [(count RydHQC_SupportG),_x]
			}
		}
	foreach RydHQC_AmmoDrop;
		
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
				
				if (_SpecForcheck) then {if not (_vh in RydHQC_EnSpecFor) then {RydHQC_EnSpecFor set [(count RydHQC_EnSpecFor),_vh]};if not (_grp in RydHQC_EnSpecForG) then {RydHQC_EnSpecForG set [(count RydHQC_EnSpecForG),_grp]}};
				if (_reconcheck) then {if not (_vh in RydHQC_Enrecon) then {RydHQC_Enrecon set [(count RydHQC_Enrecon),_vh]};if not (_grp in RydHQC_EnreconG) then {RydHQC_EnreconG set [(count RydHQC_EnreconG),_grp]}};
				if (_FOcheck) then {if not (_vh in RydHQC_EnFO) then {RydHQC_EnFO set [(count RydHQC_EnFO),_vh]};if not (_grp in RydHQC_EnFOG) then {RydHQC_EnFOG set [(count RydHQC_EnFOG),_grp]}};
				if (_sniperscheck) then {if not (_vh in RydHQC_Ensnipers) then {RydHQC_Ensnipers set [(count RydHQC_Ensnipers),_vh]};if not (_grp in RydHQC_EnsnipersG) then {RydHQC_EnsnipersG set [(count RydHQC_EnsnipersG),_grp]}};
				if (_ATinfcheck) then {if not (_vh in RydHQC_EnATinf) then {RydHQC_EnATinf set [(count RydHQC_EnATinf),_vh]};if not (_grp in RydHQC_EnATinfG) then {RydHQC_EnATinfG set [(count RydHQC_EnATinfG),_grp]}};
				if (_AAinfcheck) then {if not (_vh in RydHQC_EnAAinf) then {RydHQC_EnAAinf set [(count RydHQC_EnAAinf),_vh]};if not (_grp in RydHQC_EnAAinfG) then {RydHQC_EnAAinfG set [(count RydHQC_EnAAinfG),_grp]}};
				if (_Infcheck) then {if not (_vh in RydHQC_EnInf) then {RydHQC_EValue = RydHQC_EValue + 1;RydHQC_EnInf set [(count RydHQC_EnInf),_vh]};if not (_grp in RydHQC_EnInfG) then {RydHQC_EnInfG set [(count RydHQC_EnInfG),_grp]}};
				if (_Artcheck) then {if not (_vh in RydHQC_EnArt) then {RydHQC_EValue = RydHQC_EValue + 3;RydHQC_EnArt set [(count RydHQC_EnArt),_vh]};if not (_grp in RydHQC_EnArtG) then {RydHQC_EnArtG set [(count RydHQC_EnArtG),_grp]}};
				if (_HArmorcheck) then {if not (_vh in RydHQC_EnHArmor) then {RydHQC_EValue = RydHQC_EValue + 10;RydHQC_EnHArmor set [(count RydHQC_EnHArmor),_vh]};if not (_grp in RydHQC_EnHArmorG) then {RydHQC_EnHArmorG set [(count RydHQC_EnHArmorG),_grp]}};
				if (_MArmorcheck) then {if not (_vh in RydHQC_EnMArmor) then {RydHQC_EnMArmor set [(count RydHQC_EnMArmor),_vh]};if not (_grp in RydHQC_EnMArmorG) then {RydHQC_EnMArmorG set [(count RydHQC_EnMArmorG),_grp]}};
				if (_LArmorcheck) then {if not (_vh in RydHQC_EnLArmor) then {RydHQC_EValue = RydHQC_EValue + 5;RydHQC_EnLArmor set [(count RydHQC_EnLArmor),_vh]};if not (_grp in RydHQC_EnLArmorG) then {RydHQC_EnLArmorG set [(count RydHQC_EnLArmorG),_grp]}};
				if (_LArmorATcheck) then {if not (_vh in RydHQC_EnLArmorAT) then {RydHQC_EnLArmorAT set [(count RydHQC_EnLArmorAT),_vh]};if not (_grp in RydHQC_EnLArmorATG) then {RydHQC_EnLArmorATG set [(count RydHQC_EnLArmorATG),_grp]}};
				if (_Carscheck) then {if not (_vh in RydHQC_EnCars) then {RydHQC_EValue = RydHQC_EValue + 3;RydHQC_EnCars set [(count RydHQC_EnCars),_vh]};if not (_grp in RydHQC_EnCarsG) then {RydHQC_EnCarsG set [(count RydHQC_EnCarsG),_grp]}};
				if (_Aircheck) then {if not (_vh in RydHQC_EnAir) then {RydHQC_EValue = RydHQC_EValue + 15;RydHQC_EnAir set [(count RydHQC_EnAir),_vh]};if not (_grp in RydHQC_EnAirG) then {RydHQC_EnAirG set [(count RydHQC_EnAirG),_grp]}};
				if (_BAircheck) then {if not (_vh in RydHQC_EnBAir) then {RydHQC_EnBAir set [(count RydHQC_EnBAir),_vh]};if not (_grp in RydHQC_EnBAirG) then {RydHQC_EnBAirG set [(count RydHQC_EnBAirG),_grp]}};				
				if (_RAircheck) then {if not (_vh in RydHQC_EnRAir) then {RydHQC_EnRAir set [(count RydHQC_EnRAir),_vh]};if not (_grp in RydHQC_EnRAirG) then {RydHQC_EnRAirG set [(count RydHQC_EnRAirG),_grp]}};
				if (_NCAircheck) then {if not (_vh in RydHQC_EnNCAir) then {RydHQC_EnNCAir set [(count RydHQC_EnNCAir),_vh]};if not (_grp in RydHQC_EnNCAirG) then {RydHQC_EnNCAirG set [(count RydHQC_EnNCAirG),_grp]}};
				if (_Navalcheck) then {if not (_vh in RydHQC_EnNaval) then {RydHQC_EnNaval set [(count RydHQC_EnNaval),_vh]};if not (_grp in RydHQC_EnNavalG) then {RydHQC_EnNavalG set [(count RydHQC_EnNavalG),_grp]}};
				if (_Staticcheck) then {if not (_vh in RydHQC_EnStatic) then {RydHQC_EValue = RydHQC_EValue + 1;RydHQC_EnStatic set [(count RydHQC_EnStatic),_vh]};if not (_grp in RydHQC_EnStaticG) then {RydHQC_EnStaticG set [(count RydHQC_EnStaticG),_grp]}};
				if (_StaticAAcheck) then {if not (_vh in RydHQC_EnStaticAA) then {RydHQC_EnStaticAA set [(count RydHQC_EnStaticAA),_vh]};if not (_grp in RydHQC_EnStaticAAG) then {RydHQC_EnStaticAAG set [(count RydHQC_EnStaticAAG),_grp]}};
				if (_StaticATcheck) then {if not (_vh in RydHQC_EnStaticAT) then {RydHQC_EnStaticAT set [(count RydHQC_EnStaticAT),_vh]};if not (_grp in RydHQC_EnStaticATG) then {RydHQC_EnStaticATG set [(count RydHQC_EnStaticATG),_grp]}};
				if (_Supportcheck) then {if not (_vh in RydHQC_EnSupport) then {RydHQC_EnSupport set [(count RydHQC_EnSupport),_vh]};if not (_grp in RydHQC_EnSupportG) then {RydHQC_EnSupportG set [(count RydHQC_EnSupportG),_grp]}};
				if (_Cargocheck) then {if not (_vh in RydHQC_EnCargo) then {RydHQC_EnCargo set [(count RydHQC_EnCargo),_vh]};if not (_grp in RydHQC_EnCargoG) then {RydHQC_EnCargoG set [(count RydHQC_EnCargoG),_grp]}};
				if (_NCCargocheck) then {if not (_vh in RydHQC_EnNCCargo) then {RydHQC_EnNCCargo set [(count RydHQC_EnNCCargo),_vh]};if not (_grp in RydHQC_EnNCCargoG) then {RydHQC_EnNCCargoG set [(count RydHQC_EnNCCargoG),_grp]}};
				if (_Crewcheck) then {if not (_vh in RydHQC_EnCrew) then {RydHQC_EnCrew set [(count RydHQC_EnCrew),_vh]};if not (_grp in RydHQC_EnCrewG) then {RydHQC_EnCrewG set [(count RydHQC_EnCrewG),_grp]}};
				if (_NCrewInfcheck) then {if not (_vh in RydHQC_EnNCrewInf) then {RydHQC_EnNCrewInf set [(count RydHQC_EnNCrewInf),_vh]};if not (_grp in RydHQC_EnNCrewInfG) then {RydHQC_EnNCrewInfG set [(count RydHQC_EnNCrewInfG),_grp]}};
				
			}
		foreach (units _x)
		}
	foreach RydHQC_KnEnemiesG;

	RydHQC_EnNCrewInfG = RydHQC_EnNCrewInfG - (RydHQC_EnRAirG + RydHQC_EnStaticG);
	RydHQC_EnNCrewInf = RydHQC_EnNCrewInf - (RydHQC_EnRAir + RydHQC_EnStatic);
	RydHQC_EnInfG = RydHQC_EnInfG - (RydHQC_EnRAirG + RydHQC_EnStaticG);
	RydHQC_EnInf = RydHQC_EnInf - (RydHQC_EnRAir + RydHQC_EnStatic);

	if (RydHQC_Flee) then
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
		foreach RydHQC_Friends;

		if (_AllPanic == 0) then {_AllPanic = 1};
		_midCow = 0;
		if not ((count RydHQC_Friends) == 0) then {_midCow = _AllCow/(count RydHQC_Friends)};

			{
			_cowF = ((- RydHQC_Morale)/(50 + (random 25))) + (random (2 * _midCow)) - _midCow;
			_cowF = _cowF * RydHQC_Muu;
			if (_x in RydHQC_SpecForG) then {_cowF = _cowF - 0.8};
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

			if (((random ((20 + (RydHQC_Morale/5))/_AllPanic)) < _cowF) and ((random 100) > (100/(_AllPanic + 1)))) then 
				{
				[_x] call RYD_WPdel;
				_x setVariable [("inPanic" + (str _x)), true];
				if (RydHQC_DebugII) then {_i = [(getPosATL (vehicle (leader _x))),_x,"markPanic","ColorYellow","ICON","DOT","C!","C!",[0.5,0.5]] call RYD_Mark};
				_x setVariable [("Busy" + (str _x)), true];

				_UL = leader _x;
				if not (isPlayer _UL) then 
					{
					if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_InPanic,"InPanic"] call RYD_AIChatter}
					};

				if (RydHQC_Surr) then
					{
					if ((random 100) > 50) then
						{
						if (RydHQC_DebugII) then {_i setMarkerColor "ColorPink";_i setMarkerText "C!!!"};
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
		foreach RydHQC_Friends
		};

		{
		RydHQC_KnEnPos set [(count RydHQC_KnEnPos),getPosATL (vehicle (leader _x))];
		if ((count RydHQC_KnEnPos) >= 100) then {RydHQC_KnEnPos = RydHQC_KnEnPos - [RydHQC_KnEnPos select 0]};
		}
	foreach RydHQC_KnEnemiesG;

	for [{_z = 0},{_z < (count RydHQC_KnEnemies)},{_z = _z + 1}] do
		{
		_KnEnemy = RydHQC_KnEnemies select _z;
			{
			if ((_x knowsAbout _KnEnemy) > 0.01) then {RydHQC reveal [_KnEnemy,2]}
			}
		foreach RydHQC_Friends
		};

	if ((RydBB_Active) and (leaderHQC in (RydBBa_HQs + RydBBb_HQs))) then {[] call RYD_BBArrRefresh};

	if (RydHQC_Cyclecount == 1) then
		{
		[] spawn C_EnemyScan;
		if (RydHQC_ArtyShells > 0) then
			{
			[RydHQC_ArtG,RydHQC_ArtyShells] call RYD_ArtyPrep;
			};

		if ((RydBB_Active) and (leaderHQC in (RydBBa_HQs + RydBBb_HQs))) then 
			{
			RydHQC_readyForBB = true;
			RydxHQ_Done = true;
			if (leaderHQC in RydBBa_HQs) then 
				{
				waitUntil {sleep 0.1;(RydBBa_InitDone)}
				};

			if (leaderHQC in RydBBb_HQs) then 
				{
				waitUntil {sleep 0.1;(RydBBb_InitDone)}
				}
			}
		};

	if (((count RydHQC_KnEnemies) > 0) and ((count RydHQC_ArtG) > 0) and (RydHQC_ArtyShells > 0)) then {[RydHQC_ArtG,RydHQC_KnEnemies,(RydHQC_EnHArmor + RydHQC_EnMArmor + RydHQC_EnLArmor),RydHQC_Friends,RydHQC_Debug,leaderHQC] call RYD_CFF};

	if (isNil ("RydHQC_Order")) then {RydHQC_Order = "ATTACK"};
	_gauss100 = (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10);
	if ((((_gauss100 + RydHQC_Inertia + RydHQC_Morale) > ((RydHQC_EValue/(RydHQC_FValue + 0.1)) * 60)) and not (isNil ("RydHQC_Obj")) and not (RydHQC_Order == "DEFEND")) or (RydHQC_Berserk)) then 
		{
		_lastS = RydHQC getVariable ["LastStance","At"];
		if ((_lastS == "De") or (RydHQC_CycleCount == 1)) then
			{
			if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQC,RydxHQ_AIC_OffStance,"OffStance"] call RYD_AIChatter};
			};

		RydHQC setVariable ["LastStance","At"];
		RydHQC_Inertia = 30 * (0.5 + RydHQC_Consistency)*(0.5 + RydHQC_Activity);
		[] spawn C_HQOrders 
		} 
	else 
		{
		_lastS = RydHQC getVariable ["LastStance","De"];
		if ((_lastS == "At") or (RydHQC_CycleCount == 1)) then
			{
			if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQC,RydxHQ_AIC_DefStance,"DefStance"] call RYD_AIChatter};
			};

		RydHQC setVariable ["LastStance","De"];
		RydHQC_Inertia = - (30  * (0.5 + RydHQC_Consistency))/(0.5 + RydHQC_Activity);
		[] spawn C_HQOrdersDef 
		};


	if ((((RydHQC_Circumspection + RydHQC_Fineness)/2) + 0.1) > (random 1.2)) then
		{
		_SFcount = {not (_x getVariable ["Busy" + (str _x),false]) and not (_x getVariable ["Resting" + (str _x),false])} count (RydHQC_SpecForG - RydHQC_SFBodyGuard);

		if (_SFcount > 0) then
			{
			_isNight = [] call RYD_isNight;
			_SFTgts = [];
			_chance = 40 + (60 * RydHQC_Activity);

				{
				_HQ = group _x;
				if (_HQ in RydHQC_KnEnemiesG) then
					{
					_SFTgts set [(count _SFTgts),_HQ]
					}
				}
			foreach (RydxHQ_AllLeaders - [leaderHQC]);

			if ((count _SFTgts) == 0) then
				{
				_chance = _chance/2;
				_SFTgts = RydHQC_EnArtG
				};

			if ((count _SFTgts) == 0) then
				{
				_chance = _chance/3;
				_SFTgts = RydHQC_EnStaticG
				};

			if (_isNight) then
				{
				_chance = _chance + 25
				};

			if ((count _SFTgts) > 0) then
				{
				_chance = _chance + (((2 * _SFcount) - (8/(0.75 + (RydHQC_Recklessness/2)))) * 20);
				_trgG = _SFTgts select (floor (random (count _SFTgts)));
				_alreadyAttacked = {_x == _trgG} count RydHQC_SFTargets;
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
								if not (_x in RydHQC_SFBodyGuard) then
									{	
									_SFAv set [(count _SFAv),_x]
									}
								}
							}
						}
					foreach RydHQC_SpecForG;

					_team = _SFAv select (floor (random (count _SFAv)));
					_trg = vehicle (leader _trgG);
					if (not ((typeOf _trg) in (_HArmor + _LArmor)) or ((random 100) > (90 - (RydHQC_Recklessness * 10)))) then {[_team,_trg,_trgG] spawn C_GoSFAttack}
					}
				}
			}
		};

	if (RydHQC_LRelocating) then
		{
		if ((abs (speed (vehicle leaderHQC))) < 0.1) then {RydHQC setVariable ["onMove",false]};
		_onMove = RydHQC getVariable ["onMove",false];

		if not (_onMove) then 
			{
			if (not (isPlayer leaderHQC) and ((RydHQC_Cyclecount == 1) or not (RydHQC_Progress == 0))) then
				{
				[RydHQC] call RYD_WPdel;

				_Lpos = position leaderHQC;
				if (RydHQC_Cyclecount == 1) then {RydHQC_Fpos = _Lpos};

				_rds = 0;

				if (RydHQC_LRelocating) then 
					{
					_rds = 0;
					if (RydHQC_NObj == 1) then {_Lpos = RydHQC_Fpos;if (leaderHQC in (RydBBa_HQs + RydBBb_HQs)) then {_Lpos = position leaderHQC};_rds = 0};
					if (RydHQC_NObj == 2) then {_Lpos = position RydHQC_Obj1};
					if (RydHQC_NObj == 3) then {_Lpos = position RydHQC_Obj2};
					if (RydHQC_NObj >= 4) then {_Lpos = position RydHQC_Obj3};
					};

				_spd = "LIMITED";
				if (RydHQC_Progress == -1) then {_spd = "NORMAL"};
				RydHQC_Progress = 0;
				_enemyN = false;

					{
					_eLdr = vehicle (leader _x);
					_eDst = _eLdr distance _Lpos;

					if (_eDst < 600) exitWith {_enemyN = true}
					}
				foreach RydHQC_KnEnemiesG;

				if not (_enemyN) then 
					{
					_wp = [RydHQC,_Lpos,"HOLD","AWARE","GREEN",_spd,["true",""],true,_rds,[0,0,0],"FILE"] call RYD_WPadd;
					if (isNull (assignedVehicle leaderHQC)) then
						{
						if (RydHQC_GetHQInside) then {[_wp] call RYD_GoInside}
						};

					if ((RydHQC_LRelocating) and (RydHQC_NObj > 1) and (RydHQC_Cyclecount > 1)) then 
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
								foreach RydHQC_KnEnemiesG;

								if (isNull RydHQC) then 
									{
									_onPlace = true
									}
								else
									{
									if not (_getBack) then
										{
										if (((vehicle leaderHQC) distance _LPos) < 30) then {_onPlace = true}
										}
									};
								

								((_getback) or (_onPlace))
								};

							if not (_onPlace) then
								{
								_rds = 30;
								if (RydHQC_NObj <= 2) then {_Lpos = getPosATL (vehicle leaderHQC);_rds = 0};
								if (RydHQC_NObj == 3) then {_Lpos = position RydHQC_Obj1};
								if (RydHQC_NObj >= 4) then {_Lpos = position RydHQC_Obj2};

								_getBack = false;

									{
									_eLdr = vehicle (leader _x);
									_eDst = _eLdr distance _Lpos;

									if (_eDst < 600) exitWith {_getBack = true}
									}
								foreach RydHQC_KnEnemiesG;

								if (_getBack) then {_Lpos = getPosATL (vehicle leaderHQC);_rds = 0};

								[RydHQC] call RYD_WPdel;	

								_spd = "NORMAL";
								if not (((vehicle leaderHQC) distance _LPos) < 50) then {_spd = "FULL"};
								_wp = [RydHQC,_Lpos,"HOLD","AWARE","GREEN",_spd,["true",""],true,_rds,[0,0,0],"FILE"] call RYD_WPadd;
								if (isNull (assignedVehicle leaderHQC)) then
									{
									if (RydHQC_GetHQInside) then {[_wp] call RYD_GoInside}
									};

								RydHQC setVariable ["onMove",true];
								}
							}
						}
					}
				}
			}
		};

	if (isNil ("RydHQC_CommDelay")) then {RydHQC_CommDelay = 1};
	_delay = (((22.5 + (count RydHQC_Friends))/(0.5 + RydHQC_Reflex)) * RydHQC_CommDelay);
	sleep _delay;

		{
		RydHQC reveal vehicle (leader _x)
		}
	foreach RydHQC_Friends;

	for [{_z = 0},{_z < (count RydHQC_KnEnemies)},{_z = _z + 1}] do
		{
		_KnEnemy = RydHQC_KnEnemies select _z;

			{
			if ((_x knowsAbout _KnEnemy) > 0.01) then {RydHQC reveal [_KnEnemy,2]} 
			}
		foreach RydHQC_Friends
		}
	};