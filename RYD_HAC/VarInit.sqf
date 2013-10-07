RydHQ_Howitzer = ["M119","M119_US_EP1","D30_CDF","D30_Ins","D30_RU","D30_TK_EP1","D30_TK_GUE_EP1","D30_TK_INS_EP1"];
RydHQ_Mortar = ["M252","M252_US_EP1","2b14_82mm_CDF","2b14_82mm_GUE","2b14_82mm_INS","2b14_82mm_TK_EP1","2b14_82mm_TK_GUE_EP1","2b14_82mm_TK_INS_EP1"];
RydHQ_Rocket = ["MLRS","MLRS_DES_EP1","GRAD_CDF","GRAD_INS","GRAD_RU","GRAD_TK_EP1"];

if (isNil ("RydBB_Active")) then {RydBB_Active = false};
if (isNil ("RydBBa_HQs")) then {RydBBa_HQs = []};
if (isNil ("RydBBb_HQs")) then {RydBBb_HQs = []};
if (isNil ("RydBB_Debug")) then {RydBB_Debug = false};
if (isNil ("RydBBa_SimpleDebug")) then {RydBBa_SimpleDebug = false};
if (isNil ("RydBBb_SimpleDebug")) then {RydBBb_SimpleDebug = false};
if (isNil ("RydBB_BBOnMap")) then {RydBB_BBOnMap = false};
if (isNil ("RydBB_CustomObjOnly")) then {RydBB_CustomObjOnly = false};
if (isNil ("RydBB_LRelocating")) then {RydBB_LRelocating = true};

if (isNil ("RydHQ_PathFinding")) then {RydHQ_PathFinding = 0};
if (isNil "RydxHQ_SynchroAttack") then {RydxHQ_SynchroAttack = false};
if (isNil "RydHQ_TimeM") then {RydHQ_TimeM = false};
if (isNil "RydxHQ_GPauseActive") then {RydxHQ_GPauseActive = false};
if (isNil ("RydHQ_DbgMon")) then {RydHQ_DbgMon = true};

if (isNil ("RHQ_SpecFor")) then {RHQ_SpecFor = []};
if (isNil ("RHQ_Recon")) then {RHQ_Recon = []};
if (isNil ("RHQ_FO")) then {RHQ_FO = []};
if (isNil ("RHQ_Snipers")) then {RHQ_Snipers = []};
if (isNil ("RHQ_ATInf")) then {RHQ_ATInf = []};
if (isNil ("RHQ_AAInf")) then {RHQ_AAInf = []};
if (isNil ("RHQ_Inf")) then {RHQ_Inf = []};
if (isNil ("RHQ_Art")) then {RHQ_Art = []};
if (isNil ("RHQ_HArmor")) then {RHQ_HArmor = []};
if (isNil ("RHQ_LArmor")) then {RHQ_LArmor = []};
if (isNil ("RHQ_LArmorAT")) then {RHQ_LArmorAT = []};
if (isNil ("RHQ_Cars")) then {RHQ_Cars = []};
if (isNil ("RHQ_Air")) then {RHQ_Air = []};
if (isNil ("RHQ_NCAir")) then {RHQ_NCAir = []};
if (isNil ("RHQ_Naval")) then {RHQ_Naval = []};
if (isNil ("RHQ_Static")) then {RHQ_Static = []};
if (isNil ("RHQ_StaticAA")) then {RHQ_StaticAA = []};
if (isNil ("RHQ_StaticAT")) then {RHQ_StaticAT = []};
if (isNil ("RHQ_Support")) then {RHQ_Support = []};
if (isNil ("RHQ_Cargo")) then {RHQ_Cargo = []};
if (isNil ("RHQ_NCCargo")) then {RHQ_NCCargo = []};
if (isNil ("RHQ_Other")) then {RHQ_Other = []};
if (isNil ("RHQ_Crew")) then {RHQ_Crew = []};
if (isNil ("RHQ_MArmor")) then {RHQ_MArmor = []};
if (isNil ("RHQ_BAir")) then {RHQ_BAir = []};
if (isNil ("RHQ_RAir")) then {RHQ_RAir = []};
if (isNil ("RHQ_Ammo")) then {RHQ_Ammo = []};
if (isNil ("RHQ_Fuel")) then {RHQ_Fuel = []};
if (isNil ("RHQ_Med")) then {RHQ_Med = []};
if (isNil ("RHQ_Rep")) then {RHQ_Rep = []};

if (isNil ("RHQs_SpecFor")) then {RHQs_SpecFor = []};
if (isNil ("RHQs_Recon")) then {RHQs_Recon = []};
if (isNil ("RHQs_FO")) then {RHQs_FO = []};
if (isNil ("RHQs_Snipers")) then {RHQs_Snipers = []};
if (isNil ("RHQs_ATInf")) then {RHQs_ATInf = []};
if (isNil ("RHQs_AAInf")) then {RHQs_AAInf = []};
if (isNil ("RHQs_Inf")) then {RHQs_Inf = []};
if (isNil ("RHQs_Art")) then {RHQs_Art = []};
if (isNil ("RHQs_HArmor")) then {RHQs_HArmor = []};
if (isNil ("RHQs_LArmor")) then {RHQs_LArmor = []};
if (isNil ("RHQs_LArmorAT")) then {RHQs_LArmorAT = []};
if (isNil ("RHQs_Cars")) then {RHQs_Cars = []};
if (isNil ("RHQs_Air")) then {RHQs_Air = []};
if (isNil ("RHQs_NCAir")) then {RHQs_NCAir = []};
if (isNil ("RHQs_Naval")) then {RHQs_Naval = []};
if (isNil ("RHQs_Static")) then {RHQs_Static = []};
if (isNil ("RHQs_StaticAA")) then {RHQs_StaticAA = []};
if (isNil ("RHQs_StaticAT")) then {RHQs_StaticAT = []};
if (isNil ("RHQs_Support")) then {RHQs_Support = []};
if (isNil ("RHQs_Cargo")) then {RHQs_Cargo = []};
if (isNil ("RHQs_NCCargo")) then {RHQs_NCCargo = []};
if (isNil ("RHQs_Other")) then {RHQs_Other = []};
if (isNil ("RHQs_Crew")) then {RHQs_Crew = []};
if (isNil ("RHQs_MArmor")) then {RHQs_MArmor = []};
if (isNil ("RHQs_BAir")) then {RHQs_BAir = []};
if (isNil ("RHQs_RAir")) then {RHQs_RAir = []};
if (isNil ("RHQs_Ammo")) then {RHQs_Ammo = []};
if (isNil ("RHQs_Fuel")) then {RHQs_Fuel = []};
if (isNil ("RHQs_Med")) then {RHQs_Med = []};
if (isNil ("RHQs_Rep")) then {RHQs_Rep = []};

if (isNil ("RydHQ_Debug")) then {RydHQ_Debug = false};
if (isNil ("RydHQB_Debug")) then {RydHQB_Debug = false};
if (isNil ("RydHQC_Debug")) then {RydHQC_Debug = false};
if (isNil ("RydHQD_Debug")) then {RydHQD_Debug = false};
if (isNil ("RydHQE_Debug")) then {RydHQE_Debug = false};
if (isNil ("RydHQF_Debug")) then {RydHQF_Debug = false};
if (isNil ("RydHQG_Debug")) then {RydHQG_Debug = false};
if (isNil ("RydHQH_Debug")) then {RydHQH_Debug = false};

if (isNil ("RydHQ_DebugII")) then {RydHQ_DebugII = false};
if (isNil ("RydHQB_DebugII")) then {RydHQB_DebugII = false};
if (isNil ("RydHQC_DebugII")) then {RydHQC_DebugII = false};
if (isNil ("RydHQD_DebugII")) then {RydHQD_DebugII = false};
if (isNil ("RydHQE_DebugII")) then {RydHQE_DebugII = false};
if (isNil ("RydHQF_DebugII")) then {RydHQF_DebugII = false};
if (isNil ("RydHQG_DebugII")) then {RydHQG_DebugII = false};
if (isNil ("RydHQH_DebugII")) then {RydHQH_DebugII = false};

if (isNil ("RydHQ_OALib")) then {RydHQ_OALib = false};
if (isNil ("RydHQ_ACRLib")) then {RydHQ_ACRLib = false};
if (isNil ("RydHQ_BAFLib")) then {RydHQ_BAFLib = false};
if (isNil ("RydHQ_PMCLib")) then {RydHQ_PMCLib = false};

if (isNil "RydxHQ_AIChatDensity") then {RydxHQ_AIChatDensity = 10};
if (isNil "RydxHQ_NEAware") then {RydxHQ_NEAware = 0};
if (isNil "RydxHQ_MARatio") then {RydxHQ_MARatio = [-1,-1,-1,-1]};

RydHQ_Support = [];
RydHQB_Support = [];
RydHQC_Support = [];
RydHQD_Support = [];
RydHQE_Support = [];
RydHQF_Support = [];
RydHQG_Support = [];
RydHQH_Support = [];

RydHQ_Friends = [];
RydHQB_Friends = [];
RydHQC_Friends = [];
RydHQD_Friends = [];
RydHQE_Friends = [];
RydHQF_Friends = [];
RydHQG_Friends = [];
RydHQH_Friends = [];

RydHQ_KnEnemies = [];
RydHQB_KnEnemies = [];
RydHQC_KnEnemies = [];
RydHQD_KnEnemies = [];
RydHQE_KnEnemies = [];
RydHQF_KnEnemies = [];
RydHQG_KnEnemies = [];
RydHQH_KnEnemies = [];

RydHQ_NCrewInfG = [];
RydHQB_NCrewInfG = [];
RydHQC_NCrewInfG = [];
RydHQD_NCrewInfG = [];
RydHQE_NCrewInfG = [];
RydHQF_NCrewInfG = [];
RydHQG_NCrewInfG = [];
RydHQH_NCrewInfG = [];

RydHQ_CarsG = [];
RydHQB_CarsG = [];
RydHQC_CarsG = [];
RydHQD_CarsG = [];
RydHQE_CarsG = [];
RydHQF_CarsG = [];
RydHQG_CarsG = [];
RydHQH_CarsG = [];

RydHQ_HArmorG = [];
RydHQB_HArmorG = [];
RydHQC_HArmorG = [];
RydHQD_HArmorG = [];
RydHQE_HArmorG = [];
RydHQF_HArmorG = [];
RydHQG_HArmorG = [];
RydHQH_HArmorG = [];

RydHQ_LArmorG = [];
RydHQB_LArmorG = [];
RydHQC_LArmorG = [];
RydHQD_LArmorG = [];
RydHQE_LArmorG = [];
RydHQF_LArmorG = [];
RydHQG_LArmorG = [];
RydHQH_LArmorG = [];

RydHQ_AirG = [];
RydHQB_AirG = [];
RydHQC_AirG = [];
RydHQD_AirG = [];
RydHQE_AirG = [];
RydHQF_AirG = [];
RydHQG_AirG = [];
RydHQH_AirG = [];

RydHQ_NCAirG = [];
RydHQB_NCAirG = [];
RydHQC_NCAirG = [];
RydHQD_NCAirG = [];
RydHQE_NCAirG = [];
RydHQF_NCAirG = [];
RydHQG_NCAirG = [];
RydHQH_NCAirG = [];

RydHQ_NCCargoG = [];
RydHQB_NCCargoG = [];
RydHQC_NCCargoG = [];
RydHQD_NCCargoG = [];
RydHQE_NCCargoG = [];
RydHQF_NCCargoG = [];
RydHQG_NCCargoG = [];
RydHQH_NCCargoG = [];

RydHQ_SupportG = [];
RydHQB_SupportG = [];
RydHQC_SupportG = [];
RydHQD_SupportG = [];
RydHQE_SupportG = [];
RydHQF_SupportG = [];
RydHQG_SupportG = [];
RydHQH_SupportG = [];

RydHQ_CCurrent = 0;
RydHQB_CCurrent = 0;
RydHQC_CCurrent = 0;
RydHQD_CCurrent = 0;
RydHQE_CCurrent = 0;
RydHQF_CCurrent = 0;
RydHQG_CCurrent = 0;
RydHQH_CCurrent = 0;

RydHQ_CInitial = 0;
RydHQB_CInitial = 0;
RydHQC_CInitial = 0;
RydHQD_CInitial = 0;
RydHQE_CInitial = 0;
RydHQF_CInitial = 0;
RydHQG_CInitial = 0;
RydHQH_CInitial = 0;

RydHQ_FValue = 0;
RydHQB_FValue = 0;
RydHQC_FValue = 0;
RydHQD_FValue = 0;
RydHQE_FValue = 0;
RydHQF_FValue = 0;
RydHQG_FValue = 0;
RydHQH_FValue = 0;

RydHQ_EValue = 0;
RydHQB_EValue = 0;
RydHQC_EValue = 0;
RydHQD_EValue = 0;
RydHQE_EValue = 0;
RydHQF_EValue = 0;
RydHQG_EValue = 0;
RydHQH_EValue = 0;

RydHQ_Morale = 0;
RydHQB_Morale = 0;
RydHQC_Morale = 0;
RydHQD_Morale = 0;
RydHQE_Morale = 0;
RydHQF_Morale = 0;
RydHQG_Morale = 0;
RydHQH_Morale = 0;

RydHQ_KnEnemiesG = [];
RydHQB_KnEnemiesG = [];
RydHQC_KnEnemiesG = [];
RydHQD_KnEnemiesG = [];
RydHQE_KnEnemiesG = [];
RydHQF_KnEnemiesG = [];
RydHQG_KnEnemiesG = [];
RydHQH_KnEnemiesG = [];

RydHQ_EnInfG = [];
RydHQB_EnInfG = [];
RydHQC_EnInfG = [];
RydHQD_EnInfG = [];
RydHQE_EnInfG = [];
RydHQF_EnInfG = [];
RydHQG_EnInfG = [];
RydHQH_EnInfG = [];

RydHQ_EnCarsG = [];
RydHQB_EnCarsG = [];
RydHQC_EnCarsG = [];
RydHQD_EnCarsG = [];
RydHQE_EnCarsG = [];
RydHQF_EnCarsG = [];
RydHQG_EnCarsG = [];
RydHQH_EnCarsG = [];

RydHQ_EnHArmorG = [];
RydHQB_EnHArmorG = [];
RydHQC_EnHArmorG = [];
RydHQD_EnHArmorG = [];
RydHQE_EnHArmorG = [];
RydHQF_EnHArmorG = [];
RydHQG_EnHArmorG = [];
RydHQH_EnHArmorG = [];

RydHQ_EnLArmorG = [];
RydHQB_EnLArmorG = [];
RydHQC_EnLArmorG = [];
RydHQD_EnLArmorG = [];
RydHQE_EnLArmorG = [];
RydHQF_EnLArmorG = [];
RydHQG_EnLArmorG = [];
RydHQH_EnLArmorG = [];

RydHQ_EnAirG = [];
RydHQB_EnAirG = [];
RydHQC_EnAirG = [];
RydHQD_EnAirG = [];
RydHQE_EnAirG = [];
RydHQF_EnAirG = [];
RydHQG_EnAirG = [];
RydHQH_EnAirG = [];

RydHQ_EnNCAirG = [];
RydHQB_EnNCAirG = [];
RydHQC_EnNCAirG = [];
RydHQD_EnNCAirG = [];
RydHQE_EnNCAirG = [];
RydHQF_EnNCAirG = [];
RydHQG_EnNCAirG = [];
RydHQH_EnNCAirG = [];

RydHQ_EnNCCargoG = [];
RydHQB_EnNCCargoG = [];
RydHQC_EnNCCargoG = [];
RydHQD_EnNCCargoG = [];
RydHQE_EnNCCargoG = [];
RydHQF_EnNCCargoG = [];
RydHQG_EnNCCargoG = [];
RydHQH_EnNCCargoG = [];

RydHQ_EnSupportG = [];
RydHQB_EnSupportG = [];
RydHQC_EnSupportG = [];
RydHQD_EnSupportG = [];
RydHQE_EnSupportG = [];
RydHQF_EnSupportG = [];
RydHQG_EnSupportG = [];
RydHQH_EnSupportG = [];


RydxHQ_AIC_OrdConf = 
	[
	"HAC_OrdConf1",
	"HAC_OrdConf2",
	"HAC_OrdConf3",
	"HAC_OrdConf4",
	"HAC_OrdConf5",
	"v2HAC_OrdConf1",
	"v2HAC_OrdConf2",
	"v2HAC_OrdConf3",
	"v2HAC_OrdConf4",
	"v2HAC_OrdConf5",
	"v3HAC_OrdConf1",
	"v3HAC_OrdConf2",
	"v3HAC_OrdConf3",
	"v3HAC_OrdConf4",
	"v3HAC_OrdConf5"
	];

RydxHQ_AIC_OrdDen = 
	[
	"HAC_OrdDen1",
	"HAC_OrdDen2",
	"HAC_OrdDen3",
	"HAC_OrdDen4",
	"HAC_OrdDen5",
	"v2HAC_OrdDen1",
	"v2HAC_OrdDen2",
	"v2HAC_OrdDen3",
	"v2HAC_OrdDen4",
	"v2HAC_OrdDen5",
	"v3HAC_OrdDen1",
	"v3HAC_OrdDen2",
	"v3HAC_OrdDen3",
	"v3HAC_OrdDen4",
	"v3HAC_OrdDen5"
	];

RydxHQ_AIC_OrdFinal = 
	[
	"HAC_OrdFinal1",
	"HAC_OrdFinal2",
	"HAC_OrdFinal3",
	"HAC_OrdFinal4",
	"v2HAC_OrdFinal1",
	"v2HAC_OrdFinal2",
	"v2HAC_OrdFinal3",
	"v2HAC_OrdFinal4",
	"v3HAC_OrdFinal1",
	"v3HAC_OrdFinal2",
	"v3HAC_OrdFinal3",
	"v3HAC_OrdFinal4"
	];

RydxHQ_AIC_OrdEnd = 
	[
	"HAC_OrdEnd1",
	"HAC_OrdEnd2",
	"HAC_OrdEnd3",
	"HAC_OrdEnd4",
	"v2HAC_OrdEnd1",
	"v2HAC_OrdEnd2",
	"v2HAC_OrdEnd3",
	"v2HAC_OrdEnd4",
	"v3HAC_OrdEnd1",
	"v3HAC_OrdEnd2",
	"v3HAC_OrdEnd3",
	"v3HAC_OrdEnd4"
	];

RydxHQ_AIC_SuppReq = 
	[
	"HAC_SuppReq1",
	"HAC_SuppReq2",
	"HAC_SuppReq3",
	"HAC_SuppReq4",
	"HAC_SuppReq5",
	"v2HAC_SuppReq1",
	"v2HAC_SuppReq2",
	"v2HAC_SuppReq3",
	"v2HAC_SuppReq4",
	"v2HAC_SuppReq5",
	"v3HAC_SuppReq1",
	"v3HAC_SuppReq2",
	"v3HAC_SuppReq3",
	"v3HAC_SuppReq4",
	"v3HAC_SuppReq5"
	];

RydxHQ_AIC_MedReq = 
	[
	"HAC_MedReq1",
	"HAC_MedReq2",
	"HAC_MedReq3",
	"HAC_MedReq4",
	"HAC_MedReq5",
	"v2HAC_MedReq1",
	"v2HAC_MedReq2",
	"v2HAC_MedReq3",
	"v2HAC_MedReq4",
	"v2HAC_MedReq5",
	"v3HAC_MedReq1",
	"v3HAC_MedReq2",
	"v3HAC_MedReq3",
	"v3HAC_MedReq4",
	"v3HAC_MedReq5"
	];

RydxHQ_AIC_ArtyReq = 
	[
	"HAC_ArtyReq1",
	"HAC_ArtyReq2",
	"HAC_ArtyReq3",
	"HAC_ArtyReq4",
	"HAC_ArtyReq5",
	"v2HAC_ArtyReq1",
	"v2HAC_ArtyReq2",
	"v2HAC_ArtyReq3",
	"v2HAC_ArtyReq4",
	"v2HAC_ArtyReq5",
	"v3HAC_ArtyReq1",
	"v3HAC_ArtyReq2",
	"v3HAC_ArtyReq3",
	"v3HAC_ArtyReq4",
	"v3HAC_ArtyReq5"
	];

RydxHQ_AIC_SmokeReq = 
	[
	"HAC_SmokeReq1",
	"HAC_SmokeReq2",
	"HAC_SmokeReq3",
	"HAC_SmokeReq4",
	"v2HAC_SmokeReq1",
	"v2HAC_SmokeReq2",
	"v2HAC_SmokeReq3",
	"v2HAC_SmokeReq4",
	"v3HAC_SmokeReq1",
	"v3HAC_SmokeReq2",
	"v3HAC_SmokeReq3",
	"v3HAC_SmokeReq4"
	];

RydxHQ_AIC_IllumReq = 
	[
	"HAC_IllumReq1",
	"HAC_IllumReq2",
	"HAC_IllumReq3",
	"HAC_IllumReq4",
	"v2HAC_IllumReq1",
	"v2HAC_IllumReq2",
	"v2HAC_IllumReq3",
	"v2HAC_IllumReq4",
	"v3HAC_IllumReq1",
	"v3HAC_IllumReq2",
	"v3HAC_IllumReq3",
	"v3HAC_IllumReq4"
	];

RydxHQ_AIC_InDanger = 
	[
	"HAC_InDanger1",
	"HAC_InDanger2",
	"HAC_InDanger3",
	"HAC_InDanger4",
	"HAC_InDanger5",
	"HAC_InDanger6",
	"HAC_InDanger7",
	"HAC_InDanger8",
	"HAC_InDanger9",
	"HAC_InDanger10",
	"HAC_InDanger11",
	"HAC_InDanger12",
	"HAC_InDanger13",
	"v2HAC_InDanger1",
	"v2HAC_InDanger2",
	"v2HAC_InDanger3",
	"v2HAC_InDanger4",
	"v2HAC_InDanger5",
	"v2HAC_InDanger6",
	"v2HAC_InDanger7",
	"v2HAC_InDanger8",
	"v2HAC_InDanger9",
	"v2HAC_InDanger10",
	"v2HAC_InDanger11",
	"v2HAC_InDanger12",
	"v2HAC_InDanger13",
	"v3HAC_InDanger1",
	"v3HAC_InDanger2",
	"v3HAC_InDanger3",
	"v3HAC_InDanger4",
	"v3HAC_InDanger5",
	"v3HAC_InDanger6",
	"v3HAC_InDanger7",
	"v3HAC_InDanger8",
	"v3HAC_InDanger9",
	"v3HAC_InDanger10",
	"v3HAC_InDanger11",
	"v3HAC_InDanger12",
	"v3HAC_InDanger13"
	];

RydxHQ_AIC_EnemySpot = 
	[
	"HAC_EnemySpot1",
	"HAC_EnemySpot2",
	"HAC_EnemySpot3",
	"HAC_EnemySpot4",
	"HAC_EnemySpot5",
	"v2HAC_EnemySpot1",
	"v2HAC_EnemySpot2",
	"v2HAC_EnemySpot3",
	"v2HAC_EnemySpot4",
	"v2HAC_EnemySpot5",
	"v3HAC_EnemySpot1",
	"v3HAC_EnemySpot2",
	"v3HAC_EnemySpot3",
	"v3HAC_EnemySpot4",
	"v3HAC_EnemySpot5"
	];

RydxHQ_AIC_InFear = 
	[
	"HAC_InFear1",
	"HAC_InFear2",
	"HAC_InFear3",
	"HAC_InFear4",
	"HAC_InFear5",
	"HAC_InFear6",
	"HAC_InFear7",
	"HAC_InFear8",
	"v2HAC_InFear1",
	"v2HAC_InFear2",
	"v2HAC_InFear3",
	"v2HAC_InFear4",
	"v2HAC_InFear5",
	"v2HAC_InFear6",
	"v2HAC_InFear7",
	"v2HAC_InFear8",
	"v3HAC_InFear1",
	"v3HAC_InFear2",
	"v3HAC_InFear3",
	"v3HAC_InFear4",
	"v3HAC_InFear5",
	"v3HAC_InFear6",
	"v3HAC_InFear7",
	"v3HAC_InFear8"
	];

RydxHQ_AIC_InPanic = 
	[
	"HAC_InPanic1",
	"HAC_InPanic2",
	"HAC_InPanic3",
	"HAC_InPanic4",
	"HAC_InPanic5",
	"HAC_InPanic6",
	"HAC_InPanic7",
	"HAC_InPanic8",
	"v2HAC_InPanic1",
	"v2HAC_InPanic2",
	"v2HAC_InPanic3",
	"v2HAC_InPanic4",
	"v2HAC_InPanic5",
	"v2HAC_InPanic6",
	"v2HAC_InPanic7",
	"v2HAC_InPanic8",
	"v3HAC_InPanic1",
	"v3HAC_InPanic2",
	"v3HAC_InPanic3",
	"v3HAC_InPanic4",
	"v3HAC_InPanic5",
	"v3HAC_InPanic6",
	"v3HAC_InPanic7",
	"v3HAC_InPanic8"
	];

RydxHQ_AIC_SuppAss = 
	[
	"v2HAC_SuppAss1",
	"v2HAC_SuppAss2",
	"v2HAC_SuppAss3",
	"v2HAC_SuppAss4",
	"v2HAC_SuppAss5"
	];

RydxHQ_AIC_SuppDen = 
	[
	"v2HAC_SuppDen1",
	"v2HAC_SuppDen2",
	"v2HAC_SuppDen3",
	"v2HAC_SuppDen4",
	"v2HAC_SuppDen5"
	];

RydxHQ_AIC_ArtAss = 
	[
	"v2HAC_ArtAss1",
	"v2HAC_ArtAss2",
	"v2HAC_ArtAss3",
	"v2HAC_ArtAss4",
	"v2HAC_ArtAss5"
	];

RydxHQ_AIC_ArtDen = 
	[
	"v2HAC_ArtDen1",
	"v2HAC_ArtDen2",
	"v2HAC_ArtDen3",
	"v2HAC_ArtDen4",
	"v2HAC_ArtDen5"
	];

RydxHQ_AIC_DefStance = 
	[
	"v2HAC_DefStance1"
	];

RydxHQ_AIC_OffStance = 
	[
	"v2HAC_OffStance1"
	];

RydxHQ_AIC_ArtFire = 
	[
	"HAC_ArtFire1",
	"HAC_ArtFire2",
	"HAC_ArtFire3",
	"HAC_ArtFire4",
	"HAC_ArtFire5"
	];

if (RydHQ_OALib) then
	{
	RHQ_SpecFor = RHQ_SpecFor + RHQ_SpecFor_OA;
	RHQ_Recon = RHQ_Recon + RHQ_Recon_OA;
	RHQ_FO = RHQ_FO + RHQ_FO_OA;
	RHQ_Snipers = RHQ_Snipers + RHQ_Snipers_OA;
	RHQ_ATInf = RHQ_ATInf + RHQ_ATInf_OA;
	RHQ_AAInf = RHQ_AAInf + RHQ_AAInf_OA;
	RHQ_Inf = RHQ_Inf + RHQ_Inf_OA;
	RHQ_Art = RHQ_Art + RHQ_Art_OA;
	RHQ_HArmor = RHQ_HArmor + RHQ_HArmor_OA;
	RHQ_MArmor = RHQ_MArmor + RHQ_MArmor_OA;
	RHQ_LArmor = RHQ_LArmor + RHQ_LArmor_OA;
	RHQ_LArmorAT = RHQ_LArmorAT + RHQ_LArmorAT_OA;
	RHQ_Cars = RHQ_Cars + RHQ_Cars_OA;
	RHQ_Air = RHQ_Air + RHQ_Air_OA;
	RHQ_BAir = RHQ_BAir + RHQ_BAir_OA;
	RHQ_RAir = RHQ_RAir + RHQ_RAir_OA;
	RHQ_NCAir = RHQ_NCAir + RHQ_NCAir_OA;
	RHQ_Naval = RHQ_Naval + RHQ_Naval_OA;
	RHQ_Static = RHQ_Static + RHQ_Static_OA;
	RHQ_StaticAA = RHQ_StaticAA + RHQ_StaticAA_OA;
	RHQ_StaticAT = RHQ_StaticAT + RHQ_StaticAT_OA;
	RHQ_Support = RHQ_Support + RHQ_Support_OA;
	RHQ_Cargo = RHQ_Cargo + RHQ_Cargo_OA;
	RHQ_NCCargo = RHQ_NCCargo + RHQ_NCCargo_OA;
	RHQ_Crew = RHQ_Crew + RHQ_Crew_OA;
	};

if (RydHQ_ACRLib) then
	{
	RHQ_SpecFor = RHQ_SpecFor + RHQ_SpecFor_ACR;
	RHQ_Recon = RHQ_Recon + RHQ_Recon_ACR;
	RHQ_FO = RHQ_FO + RHQ_FO_ACR;
	RHQ_Snipers = RHQ_Snipers + RHQ_Snipers_ACR;
	RHQ_ATInf = RHQ_ATInf + RHQ_ATInf_ACR;
	RHQ_AAInf = RHQ_AAInf + RHQ_AAInf_ACR;
	RHQ_Inf = RHQ_Inf + RHQ_Inf_ACR;
	RHQ_Art = RHQ_Art + RHQ_Art_ACR;
	RHQ_HArmor = RHQ_HArmor + RHQ_HArmor_ACR;
	RHQ_MArmor = RHQ_MArmor + RHQ_MArmor_ACR;
	RHQ_LArmor = RHQ_LArmor + RHQ_LArmor_ACR;
	RHQ_LArmorAT = RHQ_LArmorAT + RHQ_LArmorAT_ACR;
	RHQ_Cars = RHQ_Cars + RHQ_Cars_ACR;
	RHQ_Air = RHQ_Air + RHQ_Air_ACR;
	RHQ_BAir = RHQ_BAir + RHQ_BAir_ACR;
	RHQ_RAir = RHQ_RAir + RHQ_RAir_ACR;
	RHQ_NCAir = RHQ_NCAir + RHQ_NCAir_ACR;
	RHQ_Naval = RHQ_Naval + RHQ_Naval_ACR;
	RHQ_Static = RHQ_Static + RHQ_Static_ACR;
	RHQ_StaticAA = RHQ_StaticAA + RHQ_StaticAA_ACR;
	RHQ_StaticAT = RHQ_StaticAT + RHQ_StaticAT_ACR;
	RHQ_Support = RHQ_Support + RHQ_Support_ACR;
	RHQ_Cargo = RHQ_Cargo + RHQ_Cargo_ACR;
	RHQ_NCCargo = RHQ_NCCargo + RHQ_NCCargo_ACR;
	RHQ_Crew = RHQ_Crew + RHQ_Crew_ACR;
	};

if (RydHQ_BAFLib) then
	{
	RHQ_SpecFor = RHQ_SpecFor + RHQ_SpecFor_BAF;
	RHQ_Recon = RHQ_Recon + RHQ_Recon_BAF;
	RHQ_FO = RHQ_FO + RHQ_FO_BAF;
	RHQ_Snipers = RHQ_Snipers + RHQ_Snipers_BAF;
	RHQ_ATInf = RHQ_ATInf + RHQ_ATInf_BAF;
	RHQ_AAInf = RHQ_AAInf + RHQ_AAInf_BAF;
	RHQ_Inf = RHQ_Inf + RHQ_Inf_BAF;
	RHQ_Art = RHQ_Art + RHQ_Art_BAF;
	RHQ_HArmor = RHQ_HArmor + RHQ_HArmor_BAF;
	RHQ_MArmor = RHQ_MArmor + RHQ_MArmor_BAF;
	RHQ_LArmor = RHQ_LArmor + RHQ_LArmor_BAF;
	RHQ_LArmorAT = RHQ_LArmorAT + RHQ_LArmorAT_BAF;
	RHQ_Cars = RHQ_Cars + RHQ_Cars_BAF;
	RHQ_Air = RHQ_Air + RHQ_Air_BAF;
	RHQ_BAir = RHQ_BAir + RHQ_BAir_BAF;
	RHQ_RAir = RHQ_RAir + RHQ_RAir_BAF;
	RHQ_NCAir = RHQ_NCAir + RHQ_NCAir_BAF;
	RHQ_Naval = RHQ_Naval + RHQ_Naval_BAF;
	RHQ_Static = RHQ_Static + RHQ_Static_BAF;
	RHQ_StaticAA = RHQ_StaticAA + RHQ_StaticAA_BAF;
	RHQ_StaticAT = RHQ_StaticAT + RHQ_StaticAT_BAF;
	RHQ_Support = RHQ_Support + RHQ_Support_BAF;
	RHQ_Cargo = RHQ_Cargo + RHQ_Cargo_BAF;
	RHQ_NCCargo = RHQ_NCCargo + RHQ_NCCargo_BAF;
	RHQ_Crew = RHQ_Crew + RHQ_Crew_BAF;
	};

if (RydHQ_PMCLib) then
	{
	RHQ_SpecFor = RHQ_SpecFor + RHQ_SpecFor_PMC;
	RHQ_Recon = RHQ_Recon + RHQ_Recon_PMC;
	RHQ_FO = RHQ_FO + RHQ_FO_PMC;
	RHQ_Snipers = RHQ_Snipers + RHQ_Snipers_PMC;
	RHQ_ATInf = RHQ_ATInf + RHQ_ATInf_PMC;
	RHQ_AAInf = RHQ_AAInf + RHQ_AAInf_PMC;
	RHQ_Inf = RHQ_Inf + RHQ_Inf_PMC;
	RHQ_Art = RHQ_Art + RHQ_Art_PMC;
	RHQ_HArmor = RHQ_HArmor + RHQ_HArmor_PMC;
	RHQ_MArmor = RHQ_MArmor + RHQ_MArmor_PMC;
	RHQ_LArmor = RHQ_LArmor + RHQ_LArmor_PMC;
	RHQ_LArmorAT = RHQ_LArmorAT + RHQ_LArmorAT_PMC;
	RHQ_Cars = RHQ_Cars + RHQ_Cars_PMC;
	RHQ_Air = RHQ_Air + RHQ_Air_PMC;
	RHQ_BAir = RHQ_BAir + RHQ_BAir_PMC;
	RHQ_RAir = RHQ_RAir + RHQ_RAir_PMC;
	RHQ_NCAir = RHQ_NCAir + RHQ_NCAir_PMC;
	RHQ_Naval = RHQ_Naval + RHQ_Naval_PMC;
	RHQ_Static = RHQ_Static + RHQ_Static_PMC;
	RHQ_StaticAA = RHQ_StaticAA + RHQ_StaticAA_PMC;
	RHQ_StaticAT = RHQ_StaticAT + RHQ_StaticAT_PMC;
	RHQ_Support = RHQ_Support + RHQ_Support_PMC;
	RHQ_Cargo = RHQ_Cargo + RHQ_Cargo_PMC;
	RHQ_NCCargo = RHQ_NCCargo + RHQ_NCCargo_PMC;
	RHQ_Crew = RHQ_Crew + RHQ_Crew_PMC;
	};

Boss = compile preprocessfile "RYD_HAC\Boss.sqf";
MapCenter = compile preprocessfile "RYD_HAC\MapCenter.sqf";
VoiceComm = compile preprocessfile "RYD_HAC\VoiceComm.sqf";
Desperado = compile preprocessfile "RYD_HAC\Desperation.sqf";

A_EnemyScan = compile preprocessfile "RYD_HAC\A\EnemyScan.sqf";
A_Flanking = compile preprocessfile "RYD_HAC\A\Flanking.sqf";
A_Garrison = compile preprocessfile "RYD_HAC\A\Garrison.sqf";
A_GoAmmoSupp = compile preprocessfile "RYD_HAC\A\GoAmmoSupp.sqf";
A_GoAttAir = compile preprocessfile "RYD_HAC\A\GoAttAir.sqf";
A_GoAttArmor = compile preprocessfile "RYD_HAC\A\GoAttArmor.sqf";
A_GoAttInf = compile preprocessfile "RYD_HAC\A\GoAttInf.sqf";
A_GoAttSniper = compile preprocessfile "RYD_HAC\A\GoAttSniper.sqf";
A_GoCapture = compile preprocessfile "RYD_HAC\A\GoCapture.sqf";
A_GoDef = compile preprocessfile "RYD_HAC\A\GoDef.sqf";
A_GoDefAir = compile preprocessfile "RYD_HAC\A\GoDefAir.sqf";
A_GoDefRecon = compile preprocessfile "RYD_HAC\A\GoDefRecon.sqf";
A_GoDefRes = compile preprocessfile "RYD_HAC\A\GoDefRes.sqf";
A_GoFlank = compile preprocessfile "RYD_HAC\A\GoFlank.sqf";
A_GoFuelSupp = compile preprocessfile "RYD_HAC\A\GoFuelSupp.sqf";
A_GoIdle = compile preprocessfile "RYD_HAC\A\GoIdle.sqf";
A_GoMedSupp = compile preprocessfile "RYD_HAC\A\GoMedSupp.sqf";
A_GoRecon = compile preprocessfile "RYD_HAC\A\GoRecon.sqf";
A_GoRepSupp = compile preprocessfile "RYD_HAC\A\GoRepSupp.sqf";
A_GoRest = compile preprocessfile "RYD_HAC\A\GoRest.sqf";
A_GoSFAttack = compile preprocessfile "RYD_HAC\A\GoSFAttack.sqf";
A_HQOrders = compile preprocessfile "RYD_HAC\A\HQOrders.sqf";
A_HQOrdersDef = compile preprocessfile "RYD_HAC\A\HQOrdersDef.sqf";
A_HQReset = compile preprocessfile "RYD_HAC\A\HQReset.sqf";
A_HQSitRep = compile preprocessfile "RYD_HAC\A\HQSitRep.sqf";
A_LHQ = compile preprocessfile "RYD_HAC\A\LHQ.sqf";
A_LPos = compile preprocessfile "RYD_HAC\A\LPos.sqf";
A_Personality = compile preprocessfile "RYD_HAC\A\Personality.sqf";
A_Reloc = compile preprocessfile "RYD_HAC\A\Reloc.sqf";
A_Rev = compile preprocessfile "RYD_HAC\A\Rev.sqf";
A_SCargo = compile preprocessfile "RYD_HAC\A\SCargo.sqf";
A_SFIdleOrd = compile preprocessfile "RYD_HAC\A\SFIdleOrd.sqf";
A_Spotscan = compile preprocessfile "RYD_HAC\A\SpotScan.sqf";
A_SuppAmmo = compile preprocessfile "RYD_HAC\A\SuppAmmo.sqf";
A_SuppFuel = compile preprocessfile "RYD_HAC\A\SuppFuel.sqf";
A_SuppMed = compile preprocessfile "RYD_HAC\A\SuppMed.sqf";
A_SuppRep = compile preprocessfile "RYD_HAC\A\SuppRep.sqf";

if (isNil ("RydHQ_Obj1")) then {RydHQ_Obj1 = vehicle leaderHQ};
if (isNil ("RydHQ_Obj2")) then {RydHQ_Obj2 = RydHQ_Obj1};
if (isNil ("RydHQ_Obj3")) then {RydHQ_Obj3 = RydHQ_Obj2};
if (isNil ("RydHQ_Obj4")) then {RydHQ_Obj4 = RydHQ_Obj3};

if not (isNil ("leaderHQB")) then 
	{
	B_EnemyScan = compile preprocessfile "RYD_HAC\B\EnemyScanB.sqf";
	B_Flanking = compile preprocessfile "RYD_HAC\B\FlankingB.sqf";
	B_Garrison = compile preprocessfile "RYD_HAC\B\GarrisonB.sqf";
	B_GoAmmoSupp = compile preprocessfile "RYD_HAC\B\GoAmmoSuppB.sqf";
	B_GoAttAir = compile preprocessfile "RYD_HAC\B\GoAttAirB.sqf";
	B_GoAttArmor = compile preprocessfile "RYD_HAC\B\GoAttArmorB.sqf";
	B_GoAttInf = compile preprocessfile "RYD_HAC\B\GoAttInfB.sqf";
	B_GoAttSniper = compile preprocessfile "RYD_HAC\B\GoAttSniperB.sqf";
	B_GoCapture = compile preprocessfile "RYD_HAC\B\GoCaptureB.sqf";
	B_GoDef = compile preprocessfile "RYD_HAC\B\GoDefB.sqf";
	B_GoDefAir = compile preprocessfile "RYD_HAC\B\GoDefAirB.sqf";
	B_GoDefRecon = compile preprocessfile "RYD_HAC\B\GoDefReconB.sqf";
	B_GoDefRes = compile preprocessfile "RYD_HAC\B\GoDefResB.sqf";
	B_GoFlank = compile preprocessfile "RYD_HAC\B\GoFlankB.sqf";
	B_GoFuelSupp = compile preprocessfile "RYD_HAC\B\GoFuelSuppB.sqf";
	B_GoIdle = compile preprocessfile "RYD_HAC\B\GoIdleB.sqf";
	B_GoMedSupp = compile preprocessfile "RYD_HAC\B\GoMedSuppB.sqf";
	B_GoRecon = compile preprocessfile "RYD_HAC\B\GoReconB.sqf";
	B_GoRepSupp = compile preprocessfile "RYD_HAC\B\GoRepSuppB.sqf";
	B_GoRest = compile preprocessfile "RYD_HAC\B\GoRestB.sqf";
	B_HQOrders = compile preprocessfile "RYD_HAC\B\HQOrdersB.sqf";
	B_HQOrdersDef = compile preprocessfile "RYD_HAC\B\HQOrdersDefB.sqf";
	B_HQReset = compile preprocessfile "RYD_HAC\B\HQResetB.sqf";
	B_HQSitRep = compile preprocessfile "RYD_HAC\B\HQSitRepB.sqf";
	B_LHQ = compile preprocessfile "RYD_HAC\B\LHQB.sqf";
	B_LPos = compile preprocessfile "RYD_HAC\B\LPosB.sqf";
	B_Personality = compile preprocessfile "RYD_HAC\B\PersonalityB.sqf";
	B_Reloc = compile preprocessfile "RYD_HAC\B\RelocB.sqf";
	B_Rev = compile preprocessfile "RYD_HAC\B\RevB.sqf";
	B_SCargo = compile preprocessfile "RYD_HAC\B\SCargoB.sqf";
	B_Spotscan = compile preprocessfile "RYD_HAC\B\SpotScanB.sqf";
	B_SuppAmmo = compile preprocessfile "RYD_HAC\B\SuppAmmoB.sqf";
	B_SuppFuel = compile preprocessfile "RYD_HAC\B\SuppFuelB.sqf";
	B_SuppMed = compile preprocessfile "RYD_HAC\B\SuppMedB.sqf";
	B_SuppRep = compile preprocessfile "RYD_HAC\B\SuppRepB.sqf";
	
	if (isNil ("RydHQB_Obj1")) then {RydHQB_Obj1 = vehicle leaderHQB};
	if (isNil ("RydHQB_Obj2")) then {RydHQB_Obj2 = RydHQB_Obj1};
	if (isNil ("RydHQB_Obj3")) then {RydHQB_Obj3 = RydHQB_Obj2};
	if (isNil ("RydHQB_Obj4")) then {RydHQB_Obj4 = RydHQB_Obj3};
	};

if not (isNil ("leaderHQC")) then 
	{
	C_EnemyScan = compile preprocessfile "RYD_HAC\C\EnemyScanC.sqf";
	C_Flanking = compile preprocessfile "RYD_HAC\C\FlankingC.sqf";
	C_Garrison = compile preprocessfile "RYD_HAC\C\GarrisonC.sqf";
	C_GoAmmoSupp = compile preprocessfile "RYD_HAC\C\GoAmmoSuppC.sqf";
	C_GoAttAir = compile preprocessfile "RYD_HAC\C\GoAttAirC.sqf";
	C_GoAttArmor = compile preprocessfile "RYD_HAC\C\GoAttArmorC.sqf";
	C_GoAttInf = compile preprocessfile "RYD_HAC\C\GoAttInfC.sqf";
	C_GoAttSniper = compile preprocessfile "RYD_HAC\C\GoAttSniperC.sqf";
	C_GoCapture = compile preprocessfile "RYD_HAC\C\GoCaptureC.sqf";
	C_GoDef = compile preprocessfile "RYD_HAC\C\GoDefC.sqf";
	C_GoDefAir = compile preprocessfile "RYD_HAC\C\GoDefAirC.sqf";
	C_GoDefRecon = compile preprocessfile "RYD_HAC\C\GoDefReconC.sqf";
	C_GoDefRes = compile preprocessfile "RYD_HAC\C\GoDefResC.sqf";
	C_GoFlank = compile preprocessfile "RYD_HAC\C\GoFlankC.sqf";
	C_GoFuelSupp = compile preprocessfile "RYD_HAC\C\GoFuelSuppC.sqf";
	C_GoIdle = compile preprocessfile "RYD_HAC\C\GoIdleC.sqf";
	C_GoMedSupp = compile preprocessfile "RYD_HAC\C\GoMedSuppC.sqf";
	C_GoRecon = compile preprocessfile "RYD_HAC\C\GoReconC.sqf";
	C_GoRepSupp = compile preprocessfile "RYD_HAC\C\GoRepSuppC.sqf";
	C_GoRest = compile preprocessfile "RYD_HAC\C\GoRestC.sqf";
	C_HQOrders = compile preprocessfile "RYD_HAC\C\HQOrdersC.sqf";
	C_HQOrdersDef = compile preprocessfile "RYD_HAC\C\HQOrdersDefC.sqf";
	C_HQReset = compile preprocessfile "RYD_HAC\C\HQResetC.sqf";
	C_HQSitRep = compile preprocessfile "RYD_HAC\C\HQSitRepC.sqf";
	C_LHQ = compile preprocessfile "RYD_HAC\C\LHQC.sqf";
	C_LPos = compile preprocessfile "RYD_HAC\C\LPosC.sqf";
	C_Personality = compile preprocessfile "RYD_HAC\C\PersonalityC.sqf";
	C_Reloc = compile preprocessfile "RYD_HAC\C\RelocC.sqf";
	C_Rev = compile preprocessfile "RYD_HAC\C\RevC.sqf";
	C_SCargo = compile preprocessfile "RYD_HAC\C\SCargoC.sqf";
	C_Spotscan = compile preprocessfile "RYD_HAC\C\SpotScanC.sqf";
	C_SuppAmmo = compile preprocessfile "RYD_HAC\C\SuppAmmoC.sqf";
	C_SuppFuel = compile preprocessfile "RYD_HAC\C\SuppFuelC.sqf";
	C_SuppMed = compile preprocessfile "RYD_HAC\C\SuppMedC.sqf";
	C_SuppRep = compile preprocessfile "RYD_HAC\C\SuppRepC.sqf";
	
	if (isNil ("RydHQC_Obj1")) then {RydHQC_Obj1 = vehicle leaderHQC};
	if (isNil ("RydHQC_Obj2")) then {RydHQC_Obj2 = RydHQC_Obj1};
	if (isNil ("RydHQC_Obj3")) then {RydHQC_Obj3 = RydHQC_Obj2};
	if (isNil ("RydHQC_Obj4")) then {RydHQC_Obj4 = RydHQC_Obj3};
	};

if not (isNil ("leaderHQD")) then 
	{
	D_EnemyScan = compile preprocessfile "RYD_HAC\D\EnemyScanD.sqf";
	D_Flanking = compile preprocessfile "RYD_HAC\D\FlankingD.sqf";
	D_Garrison = compile preprocessfile "RYD_HAC\D\GarrisonD.sqf";
	D_GoAmmoSupp = compile preprocessfile "RYD_HAC\D\GoAmmoSuppD.sqf";
	D_GoAttAir = compile preprocessfile "RYD_HAC\D\GoAttAirD.sqf";
	D_GoAttArmor = compile preprocessfile "RYD_HAC\D\GoAttArmorD.sqf";
	D_GoAttInf = compile preprocessfile "RYD_HAC\D\GoAttInfD.sqf";
	D_GoAttSniper = compile preprocessfile "RYD_HAC\D\GoAttSniperD.sqf";
	D_GoCapture = compile preprocessfile "RYD_HAC\D\GoCaptureD.sqf";
	D_GoDef = compile preprocessfile "RYD_HAC\D\GoDefD.sqf";
	D_GoDefAir = compile preprocessfile "RYD_HAC\D\GoDefAirD.sqf";
	D_GoDefRecon = compile preprocessfile "RYD_HAC\D\GoDefReconD.sqf";
	D_GoDefRes = compile preprocessfile "RYD_HAC\D\GoDefResD.sqf";
	D_GoFlank = compile preprocessfile "RYD_HAC\D\GoFlankD.sqf";
	D_GoFuelSupp = compile preprocessfile "RYD_HAC\D\GoFuelSuppD.sqf";
	D_GoIdle = compile preprocessfile "RYD_HAC\D\GoIdleD.sqf";
	D_GoMedSupp = compile preprocessfile "RYD_HAC\D\GoMedSuppD.sqf";
	D_GoRecon = compile preprocessfile "RYD_HAC\D\GoReconD.sqf";
	D_GoRepSupp = compile preprocessfile "RYD_HAC\D\GoRepSuppD.sqf";
	D_GoRest = compile preprocessfile "RYD_HAC\D\GoRestD.sqf";
	D_HQOrders = compile preprocessfile "RYD_HAC\D\HQOrdersD.sqf";
	D_HQOrdersDef = compile preprocessfile "RYD_HAC\D\HQOrdersDefD.sqf";
	D_HQReset = compile preprocessfile "RYD_HAC\D\HQResetD.sqf";
	D_HQSitRep = compile preprocessfile "RYD_HAC\D\HQSitRepD.sqf";
	D_LHQ = compile preprocessfile "RYD_HAC\D\LHQD.sqf";
	D_LPos = compile preprocessfile "RYD_HAC\D\LPosD.sqf";
	D_Personality = compile preprocessfile "RYD_HAC\D\PersonalityD.sqf";
	D_Reloc = compile preprocessfile "RYD_HAC\D\RelocD.sqf";
	D_Rev = compile preprocessfile "RYD_HAC\D\RevD.sqf";
	D_SCargo = compile preprocessfile "RYD_HAC\D\SCargoD.sqf";
	D_Spotscan = compile preprocessfile "RYD_HAC\D\SpotScanD.sqf";
	D_SuppAmmo = compile preprocessfile "RYD_HAC\D\SuppAmmoD.sqf";
	D_SuppFuel = compile preprocessfile "RYD_HAC\D\SuppFuelD.sqf";
	D_SuppMed = compile preprocessfile "RYD_HAC\D\SuppMedD.sqf";
	D_SuppRep = compile preprocessfile "RYD_HAC\D\SuppRepD.sqf";
	
	if (isNil ("RydHQD_Obj1")) then {RydHQD_Obj1 = vehicle leaderHQD};
	if (isNil ("RydHQD_Obj2")) then {RydHQD_Obj2 = RydHQD_Obj1};
	if (isNil ("RydHQD_Obj3")) then {RydHQD_Obj3 = RydHQD_Obj2};
	if (isNil ("RydHQD_Obj4")) then {RydHQD_Obj4 = RydHQD_Obj3};
	};

if not (isNil ("leaderHQE")) then 
	{
	E_EnemyScan = compile preprocessfile "RYD_HAC\E\EnemyScanE.sqf";
	E_Flanking = compile preprocessfile "RYD_HAC\E\FlankingE.sqf";
	E_Garrison = compile preprocessfile "RYD_HAC\E\GarrisonE.sqf";
	E_GoAmmoSupp = compile preprocessfile "RYD_HAC\E\GoAmmoSuppE.sqf";
	E_GoAttAir = compile preprocessfile "RYD_HAC\E\GoAttAirE.sqf";
	E_GoAttArmor = compile preprocessfile "RYD_HAC\E\GoAttArmorE.sqf";
	E_GoAttInf = compile preprocessfile "RYD_HAC\E\GoAttInfE.sqf";
	E_GoAttSniper = compile preprocessfile "RYD_HAC\E\GoAttSniperE.sqf";
	E_GoCapture = compile preprocessfile "RYD_HAC\E\GoCaptureE.sqf";
	E_GoDef = compile preprocessfile "RYD_HAC\E\GoDefE.sqf";
	E_GoDefAir = compile preprocessfile "RYD_HAC\E\GoDefAirE.sqf";
	E_GoDefRecon = compile preprocessfile "RYD_HAC\E\GoDefReconE.sqf";
	E_GoDefRes = compile preprocessfile "RYD_HAC\E\GoDefResE.sqf";
	E_GoFlank = compile preprocessfile "RYD_HAC\E\GoFlankE.sqf";
	E_GoFuelSupp = compile preprocessfile "RYD_HAC\E\GoFuelSuppE.sqf";
	E_GoIdle = compile preprocessfile "RYD_HAC\E\GoIdleE.sqf";
	E_GoMedSupp = compile preprocessfile "RYD_HAC\E\GoMedSuppE.sqf";
	E_GoRecon = compile preprocessfile "RYD_HAC\E\GoReconE.sqf";
	E_GoRepSupp = compile preprocessfile "RYD_HAC\E\GoRepSuppE.sqf";
	E_GoRest = compile preprocessfile "RYD_HAC\E\GoRestE.sqf";
	E_HQOrders = compile preprocessfile "RYD_HAC\E\HQOrdersE.sqf";
	E_HQOrdersDef = compile preprocessfile "RYD_HAC\E\HQOrdersDefE.sqf";
	E_HQReset = compile preprocessfile "RYD_HAC\E\HQResetE.sqf";
	E_HQSitRep = compile preprocessfile "RYD_HAC\E\HQSitRepE.sqf";
	E_LHQ = compile preprocessfile "RYD_HAC\E\LHQE.sqf";
	E_LPos = compile preprocessfile "RYD_HAC\E\LPosE.sqf";
	E_Personality = compile preprocessfile "RYD_HAC\E\PersonalityE.sqf";
	E_Reloc = compile preprocessfile "RYD_HAC\E\RelocE.sqf";
	E_Rev = compile preprocessfile "RYD_HAC\E\RevE.sqf";
	E_SCargo = compile preprocessfile "RYD_HAC\E\SCargoE.sqf";
	E_Spotscan = compile preprocessfile "RYD_HAC\E\SpotScanE.sqf";
	E_SuppAmmo = compile preprocessfile "RYD_HAC\E\SuppAmmoE.sqf";
	E_SuppFuel = compile preprocessfile "RYD_HAC\E\SuppFuelE.sqf";
	E_SuppMed = compile preprocessfile "RYD_HAC\E\SuppMedE.sqf";
	E_SuppRep = compile preprocessfile "RYD_HAC\E\SuppRepE.sqf";
	
	if (isNil ("RydHQE_Obj1")) then {RydHQE_Obj1 = vehicle leaderHQE};
	if (isNil ("RydHQE_Obj2")) then {RydHQE_Obj2 = RydHQE_Obj1};
	if (isNil ("RydHQE_Obj3")) then {RydHQE_Obj3 = RydHQE_Obj2};
	if (isNil ("RydHQE_Obj4")) then {RydHQE_Obj4 = RydHQE_Obj3};
	};

if not (isNil ("leaderHQF")) then 
	{
	F_EnemyScan = compile preprocessfile "RYD_HAC\F\EnemyScanF.sqf";
	F_Flanking = compile preprocessfile "RYD_HAC\F\FlankingF.sqf";
	F_Garrison = compile preprocessfile "RYD_HAC\F\GarrisonF.sqf";
	F_GoAmmoSupp = compile preprocessfile "RYD_HAC\F\GoAmmoSuppF.sqf";
	F_GoAttAir = compile preprocessfile "RYD_HAC\F\GoAttAirF.sqf";
	F_GoAttArmor = compile preprocessfile "RYD_HAC\F\GoAttArmorF.sqf";
	F_GoAttInf = compile preprocessfile "RYD_HAC\F\GoAttInfF.sqf";
	F_GoAttSniper = compile preprocessfile "RYD_HAC\F\GoAttSniperF.sqf";
	F_GoCapture = compile preprocessfile "RYD_HAC\F\GoCaptureF.sqf";
	F_GoDef = compile preprocessfile "RYD_HAC\F\GoDefF.sqf";
	F_GoDefAir = compile preprocessfile "RYD_HAC\F\GoDefAirF.sqf";
	F_GoDefRecon = compile preprocessfile "RYD_HAC\F\GoDefReconF.sqf";
	F_GoDefRes = compile preprocessfile "RYD_HAC\F\GoDefResF.sqf";
	F_GoFlank = compile preprocessfile "RYD_HAC\F\GoFlankF.sqf";
	F_GoFuelSupp = compile preprocessfile "RYD_HAC\F\GoFuelSuppF.sqf";
	F_GoIdle = compile preprocessfile "RYD_HAC\F\GoIdleF.sqf";
	F_GoMedSupp = compile preprocessfile "RYD_HAC\F\GoMedSuppF.sqf";
	F_GoRecon = compile preprocessfile "RYD_HAC\F\GoReconF.sqf";
	F_GoRepSupp = compile preprocessfile "RYD_HAC\F\GoRepSuppF.sqf";
	F_GoRest = compile preprocessfile "RYD_HAC\F\GoRestF.sqf";
	F_HQOrders = compile preprocessfile "RYD_HAC\F\HQOrdersF.sqf";
	F_HQOrdersDef = compile preprocessfile "RYD_HAC\F\HQOrdersDefF.sqf";
	F_HQReset = compile preprocessfile "RYD_HAC\F\HQResetF.sqf";
	F_HQSitRep = compile preprocessfile "RYD_HAC\F\HQSitRepF.sqf";
	F_LHQ = compile preprocessfile "RYD_HAC\F\LHQF.sqf";
	F_LPos = compile preprocessfile "RYD_HAC\F\LPosF.sqf";
	F_Personality = compile preprocessfile "RYD_HAC\F\PersonalityF.sqf";
	F_Reloc = compile preprocessfile "RYD_HAC\F\RelocF.sqf";
	F_Rev = compile preprocessfile "RYD_HAC\F\RevF.sqf";
	F_SCargo = compile preprocessfile "RYD_HAC\F\SCargoF.sqf";
	F_Spotscan = compile preprocessfile "RYD_HAC\F\SpotScanF.sqf";
	F_SuppAmmo = compile preprocessfile "RYD_HAC\F\SuppAmmoF.sqf";
	F_SuppFuel = compile preprocessfile "RYD_HAC\F\SuppFuelF.sqf";
	F_SuppMed = compile preprocessfile "RYD_HAC\F\SuppMedF.sqf";
	F_SuppRep = compile preprocessfile "RYD_HAC\F\SuppRepF.sqf";
	
	if (isNil ("RydHQF_Obj1")) then {RydHQF_Obj1 = vehicle leaderHQF};
	if (isNil ("RydHQF_Obj2")) then {RydHQF_Obj2 = RydHQF_Obj1};
	if (isNil ("RydHQF_Obj3")) then {RydHQF_Obj3 = RydHQF_Obj2};
	if (isNil ("RydHQF_Obj4")) then {RydHQF_Obj4 = RydHQF_Obj3};
	};

if not (isNil ("leaderHQG")) then 
	{
	G_EnemyScan = compile preprocessfile "RYD_HAC\G\EnemyScanG.sqf";
	G_Flanking = compile preprocessfile "RYD_HAC\G\FlankingG.sqf";
	G_Garrison = compile preprocessfile "RYD_HAC\G\GarrisonG.sqf";
	G_GoAmmoSupp = compile preprocessfile "RYD_HAC\G\GoAmmoSuppG.sqf";
	G_GoAttAir = compile preprocessfile "RYD_HAC\G\GoAttAirG.sqf";
	G_GoAttArmor = compile preprocessfile "RYD_HAC\G\GoAttArmorG.sqf";
	G_GoAttInf = compile preprocessfile "RYD_HAC\G\GoAttInfG.sqf";
	G_GoAttSniper = compile preprocessfile "RYD_HAC\G\GoAttSniperG.sqf";
	G_GoCapture = compile preprocessfile "RYD_HAC\G\GoCaptureG.sqf";
	G_GoDef = compile preprocessfile "RYD_HAC\G\GoDefG.sqf";
	G_GoDefAir = compile preprocessfile "RYD_HAC\G\GoDefAirG.sqf";
	G_GoDefRecon = compile preprocessfile "RYD_HAC\G\GoDefReconG.sqf";
	G_GoDefRes = compile preprocessfile "RYD_HAC\G\GoDefResG.sqf";
	G_GoFlank = compile preprocessfile "RYD_HAC\G\GoFlankG.sqf";
	G_GoFuelSupp = compile preprocessfile "RYD_HAC\G\GoFuelSuppG.sqf";
	G_GoIdle = compile preprocessfile "RYD_HAC\G\GoIdleG.sqf";
	G_GoMedSupp = compile preprocessfile "RYD_HAC\G\GoMedSuppG.sqf";
	G_GoRecon = compile preprocessfile "RYD_HAC\G\GoReconG.sqf";
	G_GoRepSupp = compile preprocessfile "RYD_HAC\G\GoRepSuppG.sqf";
	G_GoRest = compile preprocessfile "RYD_HAC\G\GoRestG.sqf";
	G_HQOrders = compile preprocessfile "RYD_HAC\G\HQOrdersG.sqf";
	G_HQOrdersDef = compile preprocessfile "RYD_HAC\G\HQOrdersDefG.sqf";
	G_HQReset = compile preprocessfile "RYD_HAC\G\HQResetG.sqf";
	G_HQSitRep = compile preprocessfile "RYD_HAC\G\HQSitRepG.sqf";
	G_LHQ = compile preprocessfile "RYD_HAC\G\LHQG.sqf";
	G_LPos = compile preprocessfile "RYD_HAC\G\LPosG.sqf";
	G_Personality = compile preprocessfile "RYD_HAC\G\PersonalityG.sqf";
	G_Reloc = compile preprocessfile "RYD_HAC\G\RelocG.sqf";
	G_Rev = compile preprocessfile "RYD_HAC\G\RevG.sqf";
	G_SCargo = compile preprocessfile "RYD_HAC\G\SCargoG.sqf";
	G_Spotscan = compile preprocessfile "RYD_HAC\G\SpotScanG.sqf";
	G_SuppAmmo = compile preprocessfile "RYD_HAC\G\SuppAmmoG.sqf";
	G_SuppFuel = compile preprocessfile "RYD_HAC\G\SuppFuelG.sqf";
	G_SuppMed = compile preprocessfile "RYD_HAC\G\SuppMedG.sqf";
	G_SuppRep = compile preprocessfile "RYD_HAC\G\SuppRepG.sqf";
	
	if (isNil ("RydHQG_Obj1")) then {RydHQG_Obj1 = vehicle leaderHQG};
	if (isNil ("RydHQG_Obj2")) then {RydHQG_Obj2 = RydHQG_Obj1};
	if (isNil ("RydHQG_Obj3")) then {RydHQG_Obj3 = RydHQG_Obj2};
	if (isNil ("RydHQG_Obj4")) then {RydHQG_Obj4 = RydHQG_Obj3};
	};

if not (isNil ("leaderHQH")) then 
	{
	H_EnemyScan = compile preprocessfile "RYD_HAC\H\EnemyScanH.sqf";
	H_Flanking = compile preprocessfile "RYD_HAC\H\FlankingH.sqf";
	H_Garrison = compile preprocessfile "RYD_HAC\H\GarrisonH.sqf";
	H_GoAmmoSupp = compile preprocessfile "RYD_HAC\H\GoAmmoSuppH.sqf";
	H_GoAttAir = compile preprocessfile "RYD_HAC\H\GoAttAirH.sqf";
	H_GoAttArmor = compile preprocessfile "RYD_HAC\H\GoAttArmorH.sqf";
	H_GoAttInf = compile preprocessfile "RYD_HAC\H\GoAttInfH.sqf";
	H_GoAttSniper = compile preprocessfile "RYD_HAC\H\GoAttSniperH.sqf";
	H_GoCapture = compile preprocessfile "RYD_HAC\H\GoCaptureH.sqf";
	H_GoDef = compile preprocessfile "RYD_HAC\H\GoDefH.sqf";
	H_GoDefAir = compile preprocessfile "RYD_HAC\H\GoDefAirH.sqf";
	H_GoDefRecon = compile preprocessfile "RYD_HAC\H\GoDefReconH.sqf";
	H_GoDefRes = compile preprocessfile "RYD_HAC\H\GoDefResH.sqf";
	H_GoFlank = compile preprocessfile "RYD_HAC\H\GoFlankH.sqf";
	H_GoFuelSupp = compile preprocessfile "RYD_HAC\H\GoFuelSuppH.sqf";
	H_GoIdle = compile preprocessfile "RYD_HAC\H\GoIdleH.sqf";
	H_GoMedSupp = compile preprocessfile "RYD_HAC\H\GoMedSuppH.sqf";
	H_GoRecon = compile preprocessfile "RYD_HAC\H\GoReconH.sqf";
	H_GoRepSupp = compile preprocessfile "RYD_HAC\H\GoRepSuppH.sqf";
	H_GoRest = compile preprocessfile "RYD_HAC\H\GoRestH.sqf";
	H_HQOrders = compile preprocessfile "RYD_HAC\H\HQOrdersH.sqf";
	H_HQOrdersDef = compile preprocessfile "RYD_HAC\H\HQOrdersDefH.sqf";
	H_HQReset = compile preprocessfile "RYD_HAC\H\HQResetH.sqf";
	H_HQSitRep = compile preprocessfile "RYD_HAC\H\HQSitRepH.sqf";
	H_LHQ = compile preprocessfile "RYD_HAC\H\LHQH.sqf";
	H_LPos = compile preprocessfile "RYD_HAC\H\LPosH.sqf";
	H_Personality = compile preprocessfile "RYD_HAC\H\PersonalityH.sqf";
	H_Reloc = compile preprocessfile "RYD_HAC\H\RelocH.sqf";
	H_Rev = compile preprocessfile "RYD_HAC\H\RevH.sqf";
	H_SCargo = compile preprocessfile "RYD_HAC\H\SCargoH.sqf";
	H_Spotscan = compile preprocessfile "RYD_HAC\H\SpotScanH.sqf";
	H_SuppAmmo = compile preprocessfile "RYD_HAC\H\SuppAmmoH.sqf";
	H_SuppFuel = compile preprocessfile "RYD_HAC\H\SuppFuelH.sqf";
	H_SuppMed = compile preprocessfile "RYD_HAC\H\SuppMedH.sqf";
	H_SuppRep = compile preprocessfile "RYD_HAC\H\SuppRepH.sqf";
	
	if (isNil ("RydHQH_Obj1")) then {RydHQH_Obj1 = vehicle leaderHQH};
	if (isNil ("RydHQH_Obj2")) then {RydHQH_Obj2 = RydHQH_Obj1};
	if (isNil ("RydHQH_Obj3")) then {RydHQH_Obj3 = RydHQH_Obj2};
	if (isNil ("RydHQH_Obj4")) then {RydHQH_Obj4 = RydHQH_Obj3};
	};
	
if (isNil ("leaderHQ")) then {leaderHQ = objNull};
if (isNil ("leaderHQB")) then {leaderHQB = objNull};
if (isNil ("leaderHQC")) then {leaderHQC = objNull};
if (isNil ("leaderHQD")) then {leaderHQD = objNull};
if (isNil ("leaderHQE")) then {leaderHQE = objNull};
if (isNil ("leaderHQF")) then {leaderHQF = objNull};
if (isNil ("leaderHQG")) then {leaderHQG = objNull};
if (isNil ("leaderHQH")) then {leaderHQH = objNull};

RydxHQ_Done = true;
RydxHQB_Done = true;
RydxHQC_Done = true;
RydxHQD_Done = true;
RydxHQE_Done = true;
RydxHQF_Done = true;
RydxHQG_Done = true;
RydxHQH_Done = true;
