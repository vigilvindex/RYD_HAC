
RydHQD = GrpNull;

RydHQD = group leaderHQD;

//leaderHQD kbAddTopic ["orders","RYD_HAC\topics.bikb",""];
//waituntil {(leaderHQD kbHasTopic "orders")};

RydHQD_Cyclecount = 0;

waituntil {not (isNull RydHQD)};

RydHQD_PersDone = false;
[] spawn D_Personality;
waituntil {RydHQD_PersDone};

RydHQD_LHQInit = false;
[] spawn D_LHQ;
waituntil {RydHQD_LHQInit};

if (isNil ("RydHQD_Boxed")) then {RydHQD_Boxed = []};
if (isNil ("RydHQD_AmmoBoxes")) then 
	{
	RydHQD_AmmoBoxes = [];

	if not (isNil "RydHQD_AmmoDepot") then 
		{
		_rds = (triggerArea RydHQD_AmmoDepot) select 0;
		RydHQD_AmmoBoxes = (getPosATL RydHQD_AmmoDepot) nearObjects ["ReammoBox_F",_rds]
		}
	};

[] spawn D_HQReset;
[] spawn D_Rev;
[] spawn D_SuppMed;
[] spawn D_SuppFuel;
[] spawn D_SuppAmmo;
[] spawn D_SuppRep;
[] spawn D_SFIdleOrd;
[] spawn D_Reloc;
[] spawn D_LPos;

_specFor = RHQ_SpecFor + 
	[
	] - RHQs_SpecFor;

_recon = RHQ_Recon + 
	[
	"O_recon_exp_F",
	"O_recon_F",
	"O_recon_JTAC_F",
	"O_recon_LAT_F",
	"O_recon_M_F",
	"O_recon_medic_F",
	"O_recon_TL_F",
	"B_recon_exp_F",
	"B_recon_F",
	"B_recon_JTAC_F",
	"B_recon_LAT_F",
	"B_recon_M_F",
	"B_recon_medic_F",
	"B_recon_TL_F",
	"I_UAV_AI",
	"O_UAV_AI",
	"B_UAV_AI",
	"I_UAV_01_F",
	"I_UAV_02_CAS_F",
	"I_UAV_02_F",
	"I_UGV_01_F",
	"I_UGV_01_rcws_F",
	"O_UAV_01_F",
	"O_UAV_02_CAS_F",
	"O_UAV_02_F",
	"O_UGV_01_F",
	"O_UGV_01_rcws_F",
	"B_UAV_01_F",
	"B_UAV_02_CAS_F",
	"B_UAV_02_F",
	"B_UGV_01_F",
	"B_UGV_01_rcws_F"
	] - RHQs_Recon;
	
_FO = RHQ_FO + 
	[
	"I_Spotter_F",
	"O_spotter_F",
	"B_spotter_F",
	"O_recon_JTAC_F",
	"B_recon_JTAC_F"
	] - RHQs_FO;
	
_snipers = RHQ_Snipers + 
	[
	"I_Sniper_F",
	"O_sniper_F",
	"B_sniper_F",
	"I_Soldier_M_F",
	"O_soldier_M_F",
	"B_G_Soldier_M_F",
	"B_soldier_M_F",
	"O_recon_M_F",
	"B_recon_M_F",
	"O_soldierU_M_F"
	] - RHQs_Snipers;
	
_ATinf = RHQ_ATInf + 
	[
	"I_Soldier_AT_F",
	"I_Soldier_LAT_F",
	"O_Soldier_AT_F",
	"O_Soldier_LAT_F",
	"B_soldier_AT_F",
	"B_soldier_LAT_F",
	"B_G_Soldier_LAT_F",
	"O_soldierU_AT_F",
	"O_soldierU_LAT_F",
	"O_recon_LAT_F",
	"B_CTRG_soldier_GL_LAT_F",
	"B_recon_LAT_F"
	] - RHQs_ATInf;
	
_AAinf = RHQ_AAInf + 
	[
	"I_Soldier_AA_F",
	"B_soldier_AA_F",
	"O_Soldier_AA_F",
	"O_APC_Tracked_02_AA_F",
	"B_APC_Tracked_01_AA_F",
	"O_soldierU_AA_F"
	] - RHQs_AAInf;

_Inf = RHQ_Inf + 
	[
	"I_crew_F",
	"I_engineer_F",
	"I_helicrew_F",
	"I_helipilot_F",
	"I_medic_F",
	"I_officer_F",
	"I_pilot_F",
	"I_Soldier_A_F",
	"I_Soldier_AA_F",
	"I_Soldier_AR_F",
	"I_Soldier_AT_F",
	"I_Soldier_exp_F",
	"I_soldier_F",
	"I_Soldier_GL_F",
	"I_Soldier_LAT_F",
	"I_Soldier_lite_F",
	"I_Soldier_M_F",
	"I_Soldier_repair_F",
	"I_Soldier_SL_F",
	"I_Soldier_TL_F",
	"I_soldier_UAV_F",
	"O_crew_F",
	"O_engineer_F",
	"O_helicrew_F",
	"O_helipilot_F",
	"O_medic_F",
	"O_officer_F",
	"O_Pilot_F",
	"O_Soldier_A_F",
	"O_Soldier_AA_F",
	"O_Soldier_AR_F",
	"O_Soldier_AT_F",
	"O_soldier_exp_F",
	"O_Soldier_F",
	"O_Soldier_GL_F",
	"O_Soldier_LAT_F",
	"O_Soldier_lite_F",
	"O_soldier_M_F",
	"O_soldier_PG_F",
	"O_soldier_repair_F",
	"O_Soldier_SL_F",
	"O_Soldier_TL_F",
	"O_soldier_UAV_F",
	"B_G_engineer_F",
	"B_G_medic_F",
	"B_G_officer_F",
	"B_G_Soldier_A_F",
	"B_G_Soldier_AR_F",
	"B_G_Soldier_exp_F",
	"B_G_Soldier_F",
	"B_G_Soldier_GL_F",
	"B_G_Soldier_LAT_F",
	"B_G_Soldier_lite_F",
	"B_G_Soldier_M_F",
	"B_G_Soldier_SL_F",
	"B_G_Soldier_TL_F",
	"B_crew_F",
	"B_engineer_F",
	"B_helicrew_F",
	"B_Helipilot_F",
	"B_medic_F",
	"B_officer_F",
	"B_Pilot_F",
	"B_Soldier_A_F",
	"B_soldier_AA_F",
	"B_soldier_AR_F",
	"B_soldier_AT_F",
	"B_soldier_exp_F",
	"B_Soldier_F",
	"B_Soldier_GL_F",
	"B_soldier_LAT_F",
	"B_Soldier_lite_F",
	"B_soldier_M_F",
	"B_soldier_PG_F",
	"B_soldier_repair_F",
	"B_Soldier_SL_F",
	"B_Soldier_TL_F",
	"B_soldier_UAV_F",
	"O_recon_exp_F",
	"O_recon_F",
	"O_recon_JTAC_F",
	"O_recon_LAT_F",
	"O_recon_M_F",
	"O_recon_medic_F",
	"O_recon_TL_F",
	"B_recon_exp_F",
	"B_recon_F",
	"B_recon_JTAC_F",
	"B_recon_LAT_F",
	"B_recon_M_F",
	"B_recon_medic_F",
	"B_recon_TL_F",
	"I_Sniper_F",
	"I_Spotter_F",
	"O_sniper_F",
	"O_spotter_F",
	"B_sniper_F",
	"B_spotter_F",
	"O_engineer_U_F",
	"O_soldierU_A_F",
	"O_soldierU_AA_F",
	"O_soldierU_AAA_F",
	"O_soldierU_AAR_F",
	"O_soldierU_AAT_F",
	"O_soldierU_AR_F",
	"O_soldierU_AT_F",
	"O_soldierU_exp_F",
	"O_soldierU_F",
	"O_SoldierU_GL_F",
	"O_soldierU_LAT_F",
	"O_soldierU_M_F",
	"O_soldierU_medic_F",
	"O_soldierU_repair_F",
	"O_SoldierU_SL_F",
	"O_soldierU_TL_F",
	"I_Soldier_AAA_F",
	"I_Soldier_AAR_F",
	"I_Soldier_AAT_F",
	"I_support_AMG_F",
	"I_support_AMort_F",
	"I_support_GMG_F",
	"I_support_MG_F",
	"I_support_Mort_F",
	"O_Soldier_AAA_F",
	"O_Soldier_AAR_F",
	"O_Soldier_AAT_F",
	"O_support_AMG_F",
	"O_support_AMort_F",
	"O_support_GMG_F",
	"O_support_MG_F",
	"O_support_Mort_F",
	"B_soldier_AAA_F",
	"B_soldier_AAR_F",
	"B_soldier_AAT_F",
	"B_support_AMG_F",
	"B_support_AMort_F",
	"B_support_GMG_F",
	"B_support_MG_F",
	"B_support_Mort_F",
	"I_diver_exp_F",
	"I_diver_F",
	"I_diver_TL_F",
	"O_diver_exp_F",
	"O_diver_F",
	"O_diver_TL_F",
	"B_diver_exp_F",
	"B_diver_F",
	"B_diver_TL_F",
	"I_Story_Colonel_F",
	"O_Story_CEO_F",
	"O_Story_Colonel_F",
	"I_G_Story_Protagonist_F",
	"B_Competitor_F",
	"B_RangeMaster_F",
	"B_Story_Colonel_F",
	"B_Story_Engineer_F",
	"B_Story_Pilot_F",
	"B_Story_Protagonist_F",
	"B_Story_SF_Captain_F",
	"B_Story_Tank_Commander_F",
	"B_CTRG_soldier_engineer_exp_F",
	"B_CTRG_soldier_M_medic_F",
	"B_CTRG_soldier_AR_A_F",
	"B_CTRG_soldier_GL_LAT_F",
	"I_G_Story_SF_Captain_F",
	"I_G_resistanceCommander_F",
	"I_G_resistanceLeader_F"
	] - RHQs_Inf;
	
_Art = RHQ_Art + 
	[
	"B_MBT_01_arty_F",
	"O_MBT_02_arty_F",
	"B_MBT_01_mlrs_F",
	"I_Mortar_01_F",
	"O_Mortar_01_F",
	"B_G_Mortar_01_F",
	"B_Mortar_01_F"
	] - RHQs_Art;
	
_HArmor = RHQ_HArmor + 
	[
	"B_MBT_01_cannon_F",
	"O_MBT_02_cannon_F"
	] - RHQs_HArmor;
	
_MArmor = RHQ_MArmor + 
	[
	] - RHQs_MArmor;

_LArmor = RHQ_LArmor + 
	[
	"I_APC_Wheeled_03_cannon_F",
	"O_APC_Tracked_02_AA_F",
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_F",
	"B_APC_Tracked_01_AA_F",
	"B_APC_Tracked_01_rcws_F",
	"B_APC_Wheeled_01_cannon_F"
	] - RHQs_LArmor;
	
_LArmorAT = RHQ_LArmorAT + 
	[
	"I_APC_Wheeled_03_cannon_F",
	"O_APC_Tracked_02_cannon_F"
	] - RHQs_LArmorAT;

_Cars = RHQ_Cars + 
	[
	"I_MRAP_03_F",
	"I_MRAP_03_gmg_F",
	"I_MRAP_03_hmg_F",
	"I_Quadbike_01_F",
	"I_Truck_02_covered_F",
	"I_Truck_02_transport_F",
	"O_MRAP_02_F",
	"O_MRAP_02_gmg_F",
	"O_MRAP_02_hmg_F",
	"O_Quadbike_01_F",
	"O_Truck_02_covered_F",
	"O_Truck_02_transport_F",
	"B_G_Offroad_01_armed_F",
	"B_G_Offroad_01_F",
	"B_G_Quadbike_01_F",
	"B_G_Van_01_transport_F",
	"B_MRAP_01_F",
	"B_MRAP_01_gmg_F",
	"B_MRAP_01_hmg_F",
	"B_Quadbike_01_F",
	"B_Truck_01_box_F",
	"B_Truck_01_covered_F",
	"B_Truck_01_mover_F",
	"B_Truck_01_transport_F",
	"I_Truck_02_ammo_F",
	"I_Truck_02_box_F",
	"I_Truck_02_fuel_F",
	"I_Truck_02_medical_F",
	"O_Truck_02_Ammo_F",
	"O_Truck_02_box_F",
	"O_Truck_02_fuel_F",
	"O_Truck_02_medical_F",
	"B_G_Van_01_fuel_F",
	"B_Truck_01_ammo_F",
	"B_Truck_01_Repair_F",
	"B_Truck_01_fuel_F",
	"B_Truck_01_medical_F",
	"I_UGV_01_F",
	"I_UGV_01_rcws_F",
	"O_UGV_01_F",
	"O_UGV_01_rcws_F",
	"B_UGV_01_F",
	"B_UGV_01_rcws_F"
	] - RHQs_Cars;
	
_Air = RHQ_Air + 
	[
	"I_Heli_Transport_02_F",
	"I_Plane_Fighter_03_AA_F",
	"I_Plane_Fighter_03_CAS_F",
	"O_Heli_Attack_02_black_F",
	"O_Heli_Attack_02_F",
	"O_Heli_Light_02_F",
	"O_Heli_Light_02_unarmed_F",
	"B_Heli_Attack_01_F",
	"B_Heli_Light_01_armed_F",
	"B_Heli_Light_01_F",
	"B_Heli_Transport_01_camo_F",
	"B_Heli_Transport_01_F",
	"I_UAV_AI",
	"O_UAV_AI",
	"B_UAV_AI",
	"I_UAV_01_F",
	"I_UAV_02_CAS_F",
	"I_UAV_02_F",
	"O_UAV_01_F",
	"O_UAV_02_CAS_F",
	"O_UAV_02_F",
	"B_UAV_01_F",
	"B_UAV_02_CAS_F",
	"B_UAV_02_F"
	] - RHQs_Air;
	
_BAir = RHQ_BAir + 
	[
	"I_Plane_Fighter_03_CAS_F"
	] - RHQs_BAir;
	
_RAir = RHQ_RAir + 
	[
	"I_UAV_01_F",
	"I_UAV_02_CAS_F",
	"I_UAV_02_F",
	"O_UAV_01_F",
	"O_UAV_02_CAS_F",
	"O_UAV_02_F",
	"B_UAV_01_F",
	"B_UAV_02_CAS_F",
	"B_UAV_02_F"
	] - RHQs_RAir;
	
_NCAir = RHQ_NCAir + 
	[
	"I_Heli_Transport_02_F",
	"O_Heli_Light_02_unarmed_F",
	"B_Heli_Light_01_F",
	"B_Heli_Transport_01_camo_F",
	"B_Heli_Transport_01_F",
	"I_UAV_01_F",
	"I_UAV_02_F",
	"O_UAV_01_F",
	"O_UAV_02_F",
	"B_UAV_01_F",
	"B_UAV_02_F"	
	] - RHQs_NCAir;

_Naval = RHQ_Naval + 
	[
	"I_Boat_Armed_01_minigun_F",
	"I_Boat_Transport_01_F",
	"O_Boat_Armed_01_hmg_F",
	"O_Boat_Transport_01_F",
	"O_Lifeboat",
	"B_G_Boat_Transport_01_F",
	"B_Boat_Armed_01_minigun_F",
	"B_Boat_Transport_01_F",
	"B_Lifeboat",
	"I_SDV_01_F",
	"O_SDV_01_F",
	"B_SDV_01_F"	
	] - RHQs_Naval;

_Static = RHQ_Static + 
	[
	"I_GMG_01_A_F",
	"I_GMG_01_F",
	"I_GMG_01_high_F",
	"I_HMG_01_A_F",
	"I_HMG_01_F",
	"I_HMG_01_high_F",
	"I_Mortar_01_F",
	"I_static_AA_F",
	"I_static_AT_F",
	"O_GMG_01_A_F",
	"O_GMG_01_F",
	"O_GMG_01_high_F",
	"O_HMG_01_A_F",
	"O_HMG_01_F",
	"O_HMG_01_high_F",
	"O_Mortar_01_F",
	"O_static_AA_F",
	"O_static_AT_F",
	"B_G_Mortar_01_F",
	"B_GMG_01_A_F",
	"B_GMG_01_F",
	"B_GMG_01_high_F",
	"B_HMG_01_A_F",
	"B_HMG_01_F",
	"B_HMG_01_high_F",
	"B_Mortar_01_F",
	"B_static_AA_F",
	"B_static_AT_F"
	] - RHQs_Static;
	
_StaticAA = RHQ_StaticAA + 
	[
	"I_static_AA_F",
	"O_static_AA_F",
	"B_static_AA_F"
	] - RHQs_StaticAA;
	
_StaticAT = RHQ_StaticAT + 
	[
	"I_static_AT_F",
	"O_static_AT_F",
	"B_static_AT_F"
	] - RHQs_StaticAT;
	
_Support = RHQ_Support + 
	[
	"I_Truck_02_ammo_F",
	"I_Truck_02_box_F",
	"I_Truck_02_fuel_F",
	"I_Truck_02_medical_F",
	"O_Truck_02_Ammo_F",
	"O_Truck_02_box_F",
	"O_Truck_02_fuel_F",
	"O_Truck_02_medical_F",
	"B_G_Van_01_fuel_F",
	"B_APC_Tracked_01_CRV_F",
	"B_Truck_01_ammo_F",
	"B_Truck_01_Repair_F",
	"B_Truck_01_fuel_F",
	"B_Truck_01_medical_F"
	] - RHQs_Support;
	
_Cargo = RHQ_Cargo + 
	[
	"I_Heli_Transport_02_F",
	"O_Heli_Attack_02_black_F",
	"O_Heli_Attack_02_F",
	"O_Heli_Light_02_F",
	"O_Heli_Light_02_unarmed_F",
	"B_Heli_Light_01_F",
	"B_Heli_Transport_01_camo_F",
	"B_Heli_Transport_01_F",
	"I_Truck_02_medical_F",
	"O_Truck_02_medical_F",
	"B_Truck_01_medical_F",
	"I_Boat_Armed_01_minigun_F",
	"I_Boat_Transport_01_F",
	"O_Boat_Armed_01_hmg_F",
	"O_Boat_Transport_01_F",
	"O_Lifeboat",
	"B_G_Boat_Transport_01_F",
	"B_Boat_Armed_01_minigun_F",
	"B_Boat_Transport_01_F",
	"B_Lifeboat",
	"I_SDV_01_F",
	"O_SDV_01_F",
	"B_SDV_01_F",
	"B_MBT_01_cannon_F",
	"I_APC_Wheeled_03_cannon_F",
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_F",
	"B_APC_Tracked_01_rcws_F",
	"B_APC_Wheeled_01_cannon_F",
	"I_MRAP_03_F",
	"I_MRAP_03_gmg_F",
	"I_MRAP_03_hmg_F",
	"I_Quadbike_01_F",
	"I_Truck_02_covered_F",
	"I_Truck_02_transport_F",
	"O_MRAP_02_F",
	"O_MRAP_02_gmg_F",
	"O_MRAP_02_hmg_F",
	"O_Quadbike_01_F",
	"O_Truck_02_covered_F",
	"O_Truck_02_transport_F",
	"B_G_Offroad_01_armed_F",
	"B_G_Offroad_01_F",
	"B_G_Quadbike_01_F",
	"B_G_Van_01_transport_F",
	"B_MRAP_01_F",
	"B_MRAP_01_gmg_F",
	"B_MRAP_01_hmg_F",
	"B_Quadbike_01_F",
	"B_Truck_01_box_F",
	"B_Truck_01_covered_F",
	"B_Truck_01_mover_F",
	"B_Truck_01_transport_F"	
	] - RHQs_Cargo;
	
_NCCargo = RHQ_NCCargo + 
	[
	"I_Heli_Transport_02_F",
	"O_Heli_Light_02_unarmed_F",
	"B_Heli_Light_01_F",
	"B_Heli_Transport_01_camo_F",
	"B_Heli_Transport_01_F",
	"I_Truck_02_medical_F",
	"O_Truck_02_medical_F",
	"B_Truck_01_medical_F",
	"I_Boat_Transport_01_F",
	"O_Boat_Transport_01_F",
	"O_Lifeboat",
	"B_G_Boat_Transport_01_F",
	"B_Boat_Transport_01_F",
	"B_Lifeboat",
	"I_MRAP_03_F",
	"I_Quadbike_01_F",
	"I_Truck_02_covered_F",
	"I_Truck_02_transport_F",
	"O_MRAP_02_F",
	"O_Quadbike_01_F",
	"O_Truck_02_covered_F",
	"O_Truck_02_transport_F",
	"B_G_Offroad_01_F",
	"B_G_Quadbike_01_F",
	"B_G_Van_01_transport_F",
	"B_MRAP_01_F",
	"B_Quadbike_01_F",
	"B_Truck_01_box_F",
	"B_Truck_01_covered_F",
	"B_Truck_01_mover_F",
	"B_Truck_01_transport_F"	
	] - RHQs_NCCargo;
	
_Crew = RHQ_Crew + 
	[
	"I_crew_F",
	"I_helicrew_F",
	"I_helipilot_F",
	"I_pilot_F",
	"O_crew_F",
	"O_helicrew_F",
	"O_helipilot_F",
	"O_Pilot_F",
	"B_crew_F",
	"B_helicrew_F",
	"B_Helipilot_F",
	"B_Pilot_F",
	"B_Story_Pilot_F"
	] - RHQs_Crew;
	
_Other = RHQ_Other + 
	[
	"I_UAV_AI",
	"O_UAV_AI",
	"B_UAV_AI"	
	];
	
_NCrewInf = _Inf - _Crew;
_Cargo = _Cargo - (_Support - ["MH60S"]);
RydHQD_NCVeh = _NCCargo + (_Support - ["MH60S"]);

[(_snipers + _ATinf + _AAinf)] spawn D_Garrison;

RydHQD_ReconDone = false;
RydHQD_DefDone = false;
RydHQD_ReconStage = 1;
RydHQD_KnEnPos = [];
RydHQD_AirInDef = [];
if (isNil ("RydHQD_Excluded")) then {RydHQD_Excluded = []};
if (isNil ("RydHQD_Fast")) then {RydHQD_Fast = false};
if (isNil ("RydHQD_ExInfo")) then {RydHQD_ExInfo = false};
if (isNil ("RydHQD_ObjHoldTime")) then {RydHQD_ObjHoldTime = 600};
if (isNil "RydHQD_NObj") then {RydHQD_NObj = 1};

RydHQD_Init = true;

RydHQD_Inertia = 0;
RydHQD_Morale = 0;
RydHQD_CInitial = 0;
RydHQD_CLast = 0;
RydHQD_CCurrent = 0;
RydHQD_CIMoraleC = 0;
RydHQD_CLMoraleC = 0;
RydHQD_Surrender = false;

RydHQD_FirstEMark = true;
RydHQD_LastE = 0;
RydHQD_FlankingInit = false;
RydHQD_FlankingDone = false;
RydHQD_Progress = 0;

RydHQD_AAthreat = [];
RydHQD_ATthreat = [];
RydHQD_Airthreat = [];
RydHQD_Exhausted = [];

_lastHQ = leaderHQD;
_OLmpl = 0;
_cycleCap = 0;
_firstMC = 0; 
_wp = [];

while {not ((isNull RydHQD) or (RydHQD_Surrender))} do
	{
	if not (RydHQD_Fast) then {waituntil {sleep 0.1;((RydxHQ_Done) and (RydxHQB_Done) and (RydxHQC_Done) and (RydxHQD_Done) and (RydxHQE_Done) and (RydxHQF_Done) and (RydxHQG_Done) and (RydxHQH_Done))}};
	if (isNil ("RydHQD_SupportWP")) then {RydHQD_SupportWP = false};

	if (RydHQD_Cyclecount > 1) then
		{
		if not (_lastHQ == leaderHQD) then {sleep (60 + (random 60))};
		};

	_lastHQ = leaderHQD;
	RydHQD_Cyclecount = RydHQD_Cyclecount + 1;
	RydxHQ_Done = false;

	RydHQD_SpecFor = [];
	RydHQD_recon = [];
	RydHQD_FO = [];
	RydHQD_snipers = [];
	RydHQD_ATinf = [];
	RydHQD_AAinf = [];
	RydHQD_Inf = [];
	RydHQD_Art = [];
	RydHQD_HArmor = [];
	RydHQD_MArmor = [];
	RydHQD_LArmor = [];
	RydHQD_LArmorAT = [];
	RydHQD_Cars = [];
	RydHQD_Air = [];
	RydHQD_BAir = [];
	RydHQD_RAir = [];
	RydHQD_NCAir = [];
	RydHQD_Naval = [];
	RydHQD_Static = [];
	RydHQD_StaticAA = [];
	RydHQD_StaticAT = [];
	RydHQD_Support = [];
	RydHQD_Cargo = [];
	RydHQD_NCCargo = [];
	RydHQD_Other = [];
	RydHQD_Crew = [];
	RydHQD_NCrewInf = [];

	RydHQD_SpecForG = [];
	RydHQD_reconG = [];
	RydHQD_FOG = [];
	RydHQD_snipersG = [];
	RydHQD_ATinfG = [];
	RydHQD_AAinfG = [];
	RydHQD_InfG = [];
	RydHQD_ArtG = [];
	RydHQD_HArmorG = [];
	RydHQD_MArmorG = [];
	RydHQD_LArmorG = [];
	RydHQD_LArmorATG = [];
	RydHQD_CarsG = [];
	RydHQD_AirG = [];
	RydHQD_BAirG = [];
	RydHQD_RAirG = [];
	RydHQD_NCAirG = [];
	RydHQD_NavalG = [];
	RydHQD_StaticG = [];
	RydHQD_StaticAAG = [];
	RydHQD_StaticATG = [];
	RydHQD_SupportG = [];
	RydHQD_CargoG = [];
	RydHQD_NCCargoG = [];
	RydHQD_OtherG = [];
	RydHQD_CrewG = [];
	RydHQD_NCrewInfG = [];

	RydHQD_EnSpecFor = [];
	RydHQD_Enrecon = [];
	RydHQD_EnFO = [];
	RydHQD_Ensnipers = [];
	RydHQD_EnATinf = [];
	RydHQD_EnAAinf = [];
	RydHQD_EnInf = [];
	RydHQD_EnArt = [];
	RydHQD_EnHArmor = [];
	RydHQD_EnMArmor = [];
	RydHQD_EnLArmor = [];
	RydHQD_EnLArmorAT = [];
	RydHQD_EnCars = [];
	RydHQD_EnAir = [];
	RydHQD_EnBAir = [];
	RydHQD_EnRAir = [];
	RydHQD_EnNCAir = [];
	RydHQD_EnNaval = [];
	RydHQD_EnStatic = [];
	RydHQD_EnStaticAA = [];
	RydHQD_EnStaticAT = [];
	RydHQD_EnSupport = [];
	RydHQD_EnCargo = [];
	RydHQD_EnNCCargo = [];
	RydHQD_EnOther = [];
	RydHQD_EnCrew = [];
	RydHQD_EnNCrewInf = [];

	RydHQD_EnSpecForG = [];
	RydHQD_EnreconG = [];
	RydHQD_EnFOG = [];
	RydHQD_EnsnipersG = [];
	RydHQD_EnATinfG = [];
	RydHQD_EnAAinfG = [];
	RydHQD_EnInfG = [];
	RydHQD_EnArtG = [];
	RydHQD_EnHArmorG = [];
	RydHQD_EnMArmorG = [];
	RydHQD_EnLArmorG = [];
	RydHQD_EnLArmorATG = [];
	RydHQD_EnCarsG = [];
	RydHQD_EnAirG = [];
	RydHQD_EnBAirG = [];
	RydHQD_EnRAirG = [];
	RydHQD_EnNCAirG = [];
	RydHQD_EnNavalG = [];
	RydHQD_EnStaticG = [];
	RydHQD_EnStaticAAG = [];
	RydHQD_EnStaticATG = [];
	RydHQD_EnSupportG = [];
	RydHQD_EnCargoG = [];
	RydHQD_EnNCCargoG = [];
	RydHQD_EnOtherG = [];
	RydHQD_EnCrewG = [];
	RydHQD_EnNCrewInfG = [];

	RydHQD_LastE = count RydHQD_KnEnemies;
	RydHQD_LastFriends = RydHQD_Friends;

	if (isNil ("RydHQD_NoAirCargo")) then {RydHQD_NoAirCargo = false};
	if (isNil ("RydHQD_NoLandCargo")) then {RydHQD_NoLandCargo = false};
	if (isNil ("RydHQD_LastFriends")) then {RydHQD_LastFriends = []};
	if (isNil ("RydHQD_CargoFind")) then {RydHQD_CargoFind = 0};
	if (isNil ("RydHQD_Subordinated")) then {RydHQD_Subordinated = []};
	if (isNil ("RydHQD_Included")) then {RydHQD_Included = []};
	if (isNil ("RydHQD_ExcludedG")) then {RydHQD_ExcludedG = []};
	if (isNil ("RydHQD_SubAll")) then {RydHQD_SubAll = true};
	if (isNil ("RydHQD_SubSynchro")) then {RydHQD_SubSynchro = false};
	if (isNil ("RydHQD_SubNamed")) then {RydHQD_SubNamed = false};
	if (isNil ("RydHQD_SubZero")) then {RydHQD_SubZero = false};
	if (isNil ("RydHQD_ReSynchro")) then {RydHQD_ReSynchro = true};
	if (isNil ("RydHQD_NameLimit")) then {RydHQD_NameLimit = 100};
	if (isNil ("RydHQD_Surr")) then {RydHQD_Surr = false};
	if (isNil ("RydHQD_AOnly")) then {RydHQD_AOnly = []};
	if (isNil ("RydHQD_ROnly")) then {RydHQD_ROnly = []};
	if (isNil ("RydHQD_CargoOnly")) then {RydHQD_CargoOnly = []};
	if (isNil ("RydHQD_NoCargo")) then {RydHQD_NoCargo = []};
	if (isNil ("RydHQD_NoFlank")) then {RydHQD_NoFlank = []};
	if (isNil ("RydHQD_NoDef")) then {RydHQD_NoDef = []};
	if (isNil ("RydHQD_FirstToFight")) then {RydHQD_FirstToFight = []};
	if (isNil ("RydHQD_VoiceComm")) then {RydHQD_VoiceComm = true};
	if (isNil ("RydHQD_Front")) then {RydHQD_Front = false};
	if (isNil ("RydHQD_LRelocating")) then {RydHQD_LRelocating = false};
	if (isNil ("RydHQD_Flee")) then {RydHQD_Flee = true};
	if (isNil ("RydHQD_GarrR")) then {RydHQD_GarrR = 500};
	if (isNil ("RydHQD_Rush")) then {RydHQD_Rush = false};
	if (isNil ("RydHQD_GarrVehAb")) then {RydHQD_GarrVehAb = false};
	if (isNil ("RydHQD_DefendObjectives")) then {RydHQD_DefendObjectives = 4};
	if (isNil ("RydHQD_DefSpot")) then {RydHQD_DefSpot = []};
	if (isNil ("RydHQD_RecDefSpot")) then {RydHQD_RecDefSpot = []};
	if (isNil "RydHQD_Flare") then {RydHQD_Flare = true};
	if (isNil "RydHQD_Smoke") then {RydHQD_Smoke = true};
	if (isNil "RydHQD_NoRec") then {RydHQD_NoRec = 1};
	if (isNil "RydHQD_RapidCapt") then {RydHQD_RapidCapt = 10};
	if (isNil "RydHQD_Muu") then {RydHQD_Muu = 1};
	if (isNil "RydHQD_ArtyShells") then {RydHQD_ArtyShells = 1};
	if (isNil "RydHQD_Withdraw") then {RydHQD_Withdraw = 1};
	if (isNil "RydHQD_Berserk") then {RydHQD_Berserk = false};
	if (isNil "RydHQD_IDChance") then {RydHQD_IDChance = 100};
	if (isNil "RydHQD_RDChance") then {RydHQD_RDChance = 100};
	if (isNil "RydHQD_SDChance") then {RydHQD_SDChance = 100};
	if (isNil "RydHQD_AmmoDrop") then {RydHQD_AmmoDrop = []};
	if (isNil "RydHQD_SFTargets") then {RydHQD_SFTargets = []};
	if (isNil "RydHQD_LZ") then {RydHQD_LZ = false};
	if (isNil "RydHQD_SFBodyGuard") then {RydHQD_SFBodyGuard = []};
	if (isNil "RydHQD_DynForm") then {RydHQD_DynForm = false};
	if (isNil "RydHQD_UnlimitedCapt") then {RydHQD_UnlimitedCapt = false};
	if (isNil "RydHQD_CaptLimit") then {RydHQD_CaptLimit = 10};
	if (isNil "RydHQD_GetHQInside") then {RydHQD_GetHQInside = false};

	RydHQD_Friends = [];
	RydHQD_Enemies = [];
	RydHQD_KnEnemies = [];
	RydHQD_KnEnemiesG = [];
	RydHQD_FValue = 0;
	RydHQD_EValue = 0;

	if (RydxHQ_AIChatDensity > 0) then
		{
		_varName1 = "HAC_AIChatRep";
		_varName2 = "_West";

		switch ((side RydHQD)) do
			{
			case (east) : {_varName2 = "_East"};
			case (resistance) : {_varName2 = "_Guer"};
			};

		missionNamespace setVariable [_varName1 + _varName2,0];

		_varName1 = "HAC_AIChatLT";

		missionNamespace setVariable [_varName1 + _varName2,[0,""]]
		};

	if (RydHQD_NObj == 1) then {RydHQD_Obj = RydHQD_Obj1};
	if (RydHQD_NObj == 2) then {RydHQD_Obj = RydHQD_Obj2};
	if (RydHQD_NObj == 3) then {RydHQD_Obj = RydHQD_Obj3};
	if (RydHQD_NObj >= 4) then {RydHQD_Obj = RydHQD_Obj4};

	RydHQD_LastSub = RydHQD_Subordinated;
	RydHQD_Subordinated = [];

	_civF = ["CIV_F","CIV","CIV_RU","BIS_TK_CIV","BIS_CIV_special"];
	if not (isNil ("RydHQD_CivF")) then {_civF = RydHQD_CivF};

		{
		_isCaptive = _x getVariable ("isCaptive" + (str _x));
		if (isNil "_isCaptive") then {_isCaptive = false};

		_isCiv = false;
		if ((faction (leader _x)) in _civF) then {_isCiv = true};
		if not ((isNull (leaderHQD)) and not (isNull _x) and (alive (leaderHQD)) and (alive (leader _x)) and not (_isCaptive)) then
			{
			if (not (RydHQD_Front) and ((side _x) getFriend (side RydHQD) < 0.6) and not (_isCiv)) then {if not (_x in RydHQD_Enemies) then {RydHQD_Enemies set [(count RydHQD_Enemies), _x]}};
			_front = true;
			if not (isNil "FrontD") then {_front = ((getPosATL (vehicle (leader _x))) in FrontD)};
			if ((RydHQD_Front) and ((side _x) getFriend (side RydHQD) < 0.6) and (_front) and not (_isCiv)) then {if not (_x in RydHQD_Enemies) then {RydHQD_Enemies set [(count RydHQD_Enemies), _x]}};
			if (RydHQD_SubAll) then 
				{
				if not ((side _x) getFriend (side RydHQD) < 0.6) then 
					{
					if (not (_x in RydHQD_Friends) and not (((leader _x) in RydHQD_Excluded) or (_isCiv))) then {RydHQD_Friends set [(count RydHQD_Friends), _x]}
					};
				};
			}
		}
	foreach allGroups;

	RydHQD_Excl = [];

		{
		if not ((group _x) in RydHQD_Excl) then {RydHQD_Excl set [(count RydHQD_Excl),group _x]} 
		}
	foreach RydHQD_Excluded;

	if (RydHQD_SubSynchro) then 
		{
			{
			if ((_x in RydHQD_LastSub) and not ((leader _x) in (synchronizedObjects leaderHQD)) and (RydHQD_ReSynchro)) then {RydHQD_Subordinated set [(count RydHQD_Subordinated),_x]};
			if (not (_x in RydHQD_Subordinated) and ((leader _x) in (synchronizedObjects leaderHQD))) then {RydHQD_Subordinated set [(count RydHQD_Subordinated),_x]};
			}
		foreach allGroups;
		};

	if (RydHQD_SubNamed) then 
		{
			{
			for [{_i = 1},{_i <= RydHQD_NameLimit},{_i = _i + 1}] do
				{
				if (not (_x in RydHQD_Subordinated) and ((str (leader _x)) == ("RydD" + str (_i)))) then {RydHQD_Subordinated set [(count RydHQD_Subordinated),_x]};
				};
			}
		foreach allGroups;
		};

	if (RydHQD_SubZero) then 
		{
			{
			if (((random 100) >= 50) and not (_x in RydHQD_Subordinated)) then {RydHQD_Subordinated set [(count RydHQD_Subordinated),_x]} else {if (not (_x in RydHQDB_Subordinated)) then {RydHQDB_Subordinated set [(count RydHQDB_Subordinated),_x]}};
			}
		foreach allGroups;
		};

	RydHQD_Friends = RydHQD_Friends + RydHQD_Subordinated + RydHQD_Included - (RydHQD_ExcludedG + RydHQD_Excl);
	RydHQD_Friends = RydHQD_Friends - [RydHQD];
	RydHQD_NoWayD = allGroups - RydHQD_LastFriends;

	RydHQD_Friends = [RydHQD_Friends] call RYD_RandomOrd;

		{
		[_x] call RYD_WPdel;
		}
	foreach ((RydHQD_Excl + RydHQD_ExcludedG) - RydHQD_NoWayD);

	if (RydHQD_Init) then 
		{
			{
			RydHQD_CInitial = RydHQD_CInitial + (count (units _x))
			}
		foreach RydHQD_Friends + [RydHQD]
		};

	RydHQD_CLast = RydHQD_CCurrent;
	RydHQD_CCurrent = 0;
		{
		RydHQD_CCurrent = RydHQD_CCurrent + (count (units _x))
		}
	foreach RydHQD_Friends + [RydHQD];

	RydHQD_Ex = [];

	if (RydHQD_ExInfo) then 
		{
		RydHQD_Ex = RydHQD_Excl + RydHQD_ExcludedG
		};

		{
		for [{_a = 0},{_a < count (units _x)},{_a = _a + 1}] do
			{
			_enemyU = vehicle ((units _x) select _a);
				{
				if ((_x knowsAbout _enemyU) >= 0.05) exitwith 
					{
					if not (_enemyU in RydHQD_KnEnemies) then 
						{
						RydHQD_KnEnemies set [(count RydHQD_KnEnemies),_enemyU];
						};

					if not ((group _enemyU) in RydHQD_KnEnemiesG) then 
						{
						_already = missionnameSpace getVariable ["AlreadySpotted",[]];
						RydHQD_KnEnemiesG set [(count RydHQD_KnEnemiesG),(group _enemyU)];
						if not ((group _enemyU) in _already) then
							{
							_UL = (leader _x);if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_EnemySpot,"EnemySpot"] call RYD_AIChatter}};
							}
						}
					} 
				}
			foreach (RydHQD_Friends + [RydHQD] + RydHQD_Ex)
			}
		}
	foreach RydHQD_Enemies;

	_already = missionnameSpace getVariable ["AlreadySpotted",[]];

		{
		if not (_x in _already) then
			{
			_already set [(count _already),_x]
			}
		}
	foreach RydHQD_KnEnemiesG;

	missionnameSpace setVariable ["AlreadySpotted",_already];

	_lossFinal = RydHQD_CInitial - RydHQD_CCurrent;
	if (_lossFinal < 0) then {_lossFinal = 0;RydHQD_CInitial = RydHQD_CCurrent};

	if not (RydHQD_Init) then 
		{
		_lossP = _lossFinal/RydHQD_CInitial;

		if ((_OLmpl == 0) and ((count RydHQD_KnEnemies) > 0)) then
			{
			_OLmpl = 0.01;
			_firstMC = RydHQD_Cyclecount - 1
			};

		if ((_cycleCap < (50 / (1.01 - _lossP))) and ((count RydHQD_KnEnemies) == 0) and (_OLmpl == 0.01)) then
			{
			_cycleCap = _cycleCap + 1;
			if ((random 1) < _lossP) then {_firstMC = _firstMC + 1}
			}
		else
			{
			if not ((count RydHQD_KnEnemies) == 0) then
				{
				_cycleCap = 0;
				}
			};

		
		_lossPerc = _lossP * 100;
		_cycle = RydHQD_Cyclecount - _firstMC;

		_OLF = _OLmpl * (((-(_lossPerc * _lossPerc))/(1.1^_cycle)) + ((15 + (random 5) + (random 5))/(1 + _lossP)) - (_lossP * 10) + (_cycle ^ ((10 * (1 - _lossP))/_cycle)));

		_mplLU = 1;
		_lostU = RydHQD_CLast - RydHQD_CCurrent;
		if (_lostU < 0) then {_lostU = - _lostU;_mplLU = -1};

		_lossL = _mplLU * ((100 * _lostU/RydHQD_CInitial)^(1.55 + (random 0.05) + (random 0.05)))/10;

		_balanceF = 0.5 + (random 0.5) + (random 0.5) - _lossP - (count RydHQD_KnEnemies)/RydHQD_CCurrent;

		RydHQD_Morale = RydHQD_Morale + (_OLF - _lossL + _balanceF);
		//RydHQD_Morale = RydHQD_Morale + (((RydHQD_CCurrent - RydHQD_CInitial) * (6/(1 + (RydHQD_Cyclecount/25)))) + (6 * ((random 0.5) + RydHQD_CCurrent - RydHQD_CLast)))/((1 + (10*RydHQD_CInitial))/(1 + ((count RydHQD_KnEnemies) * 0.5)));
		//diag_log format ["Init: %2, Last: %3, Current: %3,Zmiana morale: %1",(((RydHQD_CCurrent - RydHQD_CInitial) * (6/(1 + (RydHQD_Cyclecount/25)))) + (6 * ((random 0.5) + RydHQD_CCurrent - RydHQD_CLast)))/((1 + (10*RydHQD_CInitial))/(1 + ((count RydHQD_KnEnemies) * 0.5))),RydHQD_CInitial,RydHQD_CLast,RydHQD_CCurrent];
		};

	if (RydHQD_Morale < -50) then {RydHQD_Morale = -50};
	if (RydHQD_Morale > 0) then {RydHQD_Morale = 0};
	if (RydHQD_Debug) then 
		{
		_mdbg = format ["Morale D (%2): %1 - losses: %3 percent (%4)",RydHQD_Morale,RydHQD_Personality,(round (((_lossFinal/RydHQD_CInitial) * 100) * 10)/10),_lossFinal];
		diag_log _mdbg;
		leaderHQD globalChat _mdbg;

		_cl = "<t color='#007f00'>D -> M: %1 - L: %2%3</t>";

		switch (side RydHQD) do
			{
			case (west) : {_cl = "<t color='#0d81c4'>D -> M: %1 - L: %2%3</t>"};
			case (east) : {_cl = "<t color='#ff0000'>D -> M: %1 - L: %2%3</t>"};
			};

		_dbgMon = parseText format [_cl,(round (RydHQD_Morale * 10))/10,(round (((_lossFinal/RydHQD_CInitial) * 100) * 10)/10),"%"];

		RydHQD setVariable ["DbgMon",_dbgMon];
		};

	if (RydHQD_Init) then {[RydHQD] spawn Desperado};

	RydHQD_Init = false;

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

				if (_SpecForcheck) then {if not (_vh in RydHQD_SpecFor) then {RydHQD_SpecFor set [(count RydHQD_SpecFor),_vh]};if not (_grp in RydHQD_SpecForG) then {RydHQD_SpecForG set [(count RydHQD_SpecForG),_grp]}};
				if (_reconcheck) then {if not (_vh in RydHQD_recon) then {RydHQD_recon set [(count RydHQD_recon),_vh]};if not (_grp in RydHQD_reconG) then {RydHQD_reconG set [(count RydHQD_reconG),_grp]}};
				if (_FOcheck) then {if not (_vh in RydHQD_FO) then {RydHQD_FO set [(count RydHQD_FO),_vh]};if not (_grp in RydHQD_FOG) then {RydHQD_FOG set [(count RydHQD_FOG),_grp]}};
				if (_sniperscheck) then {if not (_vh in RydHQD_snipers) then {RydHQD_snipers set [(count RydHQD_snipers),_vh]};if not (_grp in RydHQD_snipersG) then {RydHQD_snipersG set [(count RydHQD_snipersG),_grp]}};
				if (_ATinfcheck) then {if not (_vh in RydHQD_ATinf) then {RydHQD_ATinf set [(count RydHQD_ATinf),_vh]};if not (_grp in RydHQD_ATinfG) then {RydHQD_ATinfG set [(count RydHQD_ATinfG),_grp]}};
				if (_AAinfcheck) then {if not (_vh in RydHQD_AAinf) then {RydHQD_AAinf set [(count RydHQD_AAinf),_vh]};if not (_grp in RydHQD_AAinfG) then {RydHQD_AAinfG set [(count RydHQD_AAinfG),_grp]}};
				if (_Infcheck) then {if not (_vh in RydHQD_Inf) then {RydHQD_FValue = RydHQD_FValue + 1;RydHQD_Inf set [(count RydHQD_Inf),_vh]};if not (_grp in RydHQD_InfG) then {RydHQD_InfG set [(count RydHQD_InfG),_grp]}};
				if (_Artcheck) then {if not (_vh in RydHQD_Art) then {RydHQD_FValue = RydHQD_FValue + 3;RydHQD_Art set [(count RydHQD_Art),_vh]};if not (_grp in RydHQD_ArtG) then {RydHQD_ArtG set [(count RydHQD_ArtG),_grp]}};
				if (_HArmorcheck) then {if not (_vh in RydHQD_HArmor) then {RydHQD_FValue = RydHQD_FValue + 10;RydHQD_HArmor set [(count RydHQD_HArmor),_vh]};if not (_grp in RydHQD_HArmorG) then {RydHQD_HArmorG set [(count RydHQD_HArmorG),_grp]}};
				if (_MArmorcheck) then {if not (_vh in RydHQD_MArmor) then {RydHQD_MArmor set [(count RydHQD_MArmor),_vh]};if not (_grp in RydHQD_MArmorG) then {RydHQD_MArmorG set [(count RydHQD_MArmorG),_grp]}};
				if (_LArmorcheck) then {if not (_vh in RydHQD_LArmor) then {RydHQD_FValue = RydHQD_FValue + 5;RydHQD_LArmor set [(count RydHQD_LArmor),_vh]};if not (_grp in RydHQD_LArmorG) then {RydHQD_LArmorG set [(count RydHQD_LArmorG),_grp]}};
				if (_LArmorATcheck) then {if not (_vh in RydHQD_LArmorAT) then {RydHQD_LArmorAT set [(count RydHQD_LArmorAT),_vh]};if not (_grp in RydHQD_LArmorATG) then {RydHQD_LArmorATG set [(count RydHQD_LArmorATG),_grp]}};
				if (_Carscheck) then {if not (_vh in RydHQD_Cars) then {RydHQD_FValue = RydHQD_FValue + 3;RydHQD_Cars set [(count RydHQD_Cars),_vh]};if not (_grp in RydHQD_CarsG) then {RydHQD_CarsG set [(count RydHQD_CarsG),_grp]}};
				if (_Aircheck) then {if not (_vh in RydHQD_Air) then {RydHQD_FValue = RydHQD_FValue + 15;RydHQD_Air set [(count RydHQD_Air),_vh]};if not (_grp in RydHQD_AirG) then {RydHQD_AirG set [(count RydHQD_AirG),_grp]}};
				if (_BAircheck) then {if not (_vh in RydHQD_BAir) then {RydHQD_BAir set [(count RydHQD_BAir),_vh]};if not (_grp in RydHQD_BAirG) then {RydHQD_BAirG set [(count RydHQD_BAirG),_grp]}};				
				if (_RAircheck) then {if not (_vh in RydHQD_RAir) then {RydHQD_RAir set [(count RydHQD_RAir),_vh]};if not (_grp in RydHQD_RAirG) then {RydHQD_RAirG set [(count RydHQD_RAirG),_grp]}};				
				if (_NCAircheck) then {if not (_vh in RydHQD_NCAir) then {RydHQD_NCAir set [(count RydHQD_NCAir),_vh]};if not (_grp in RydHQD_NCAirG) then {RydHQD_NCAirG set [(count RydHQD_NCAirG),_grp]}};
				if (_Navalcheck) then {if not (_vh in RydHQD_Naval) then {RydHQD_Naval set [(count RydHQD_Naval),_vh]};if not (_grp in RydHQD_NavalG) then {RydHQD_NavalG set [(count RydHQD_NavalG),_grp]}};
				if (_Staticcheck) then {if not (_vh in RydHQD_Static) then {RydHQD_FValue = RydHQD_FValue + 1;RydHQD_Static set [(count RydHQD_Static),_vh]};if not (_grp in RydHQD_StaticG) then {RydHQD_StaticG set [(count RydHQD_StaticG),_grp]}};
				if (_StaticAAcheck) then {if not (_vh in RydHQD_StaticAA) then {RydHQD_StaticAA set [(count RydHQD_StaticAA),_vh]};if not (_grp in RydHQD_StaticAAG) then {RydHQD_StaticAAG set [(count RydHQD_StaticAAG),_grp]}};
				if (_StaticATcheck) then {if not (_vh in RydHQD_StaticAT) then {RydHQD_StaticAT set [(count RydHQD_StaticAT),_vh]};if not (_grp in RydHQD_StaticATG) then {RydHQD_StaticATG set [(count RydHQD_StaticATG),_grp]}};
				if (_Supportcheck) then {if not (_vh in RydHQD_Support) then {RydHQD_Support set [(count RydHQD_Support),_vh]};if not (_grp in RydHQD_SupportG) then {RydHQD_SupportG set [(count RydHQD_SupportG),_grp]}};
				if (_Cargocheck) then {if not (_vh in RydHQD_Cargo) then {RydHQD_Cargo set [(count RydHQD_Cargo),_vh]};if not (_grp in RydHQD_CargoG) then {RydHQD_CargoG set [(count RydHQD_CargoG),_grp]}};
				if (_NCCargocheck) then {if not (_vh in RydHQD_NCCargo) then {RydHQD_NCCargo set [(count RydHQD_NCCargo),_vh]};if not (_grp in RydHQD_NCCargoG) then {RydHQD_NCCargoG set [(count RydHQD_NCCargoG),_grp]}};
				if (_Crewcheck) then {if not (_vh in RydHQD_Crew) then {RydHQD_Crew set [(count RydHQD_Crew),_vh]};if not (_grp in RydHQD_CrewG) then {RydHQD_CrewG set [(count RydHQD_CrewG),_grp]}};
				if (_NCrewInfcheck) then {if not (_vh in RydHQD_NCrewInf) then {RydHQD_NCrewInf set [(count RydHQD_NCrewInf),_vh]};if not (_grp in RydHQD_NCrewInfG) then {RydHQD_NCrewInfG set [(count RydHQD_NCrewInfG),_grp]}};
				
			}
		foreach (units _x)
		}
	foreach RydHQD_Friends;

	RydHQD_NCrewInfG = RydHQD_NCrewInfG - (RydHQD_RAirG + RydHQD_StaticG);
	RydHQD_NCrewInf = RydHQD_NCrewInf - (RydHQD_RAir + RydHQD_Static);
	RydHQD_InfG = RydHQD_InfG - (RydHQD_RAirG + RydHQD_StaticG);
	RydHQD_Inf = RydHQD_Inf - (RydHQD_RAir + RydHQD_Static);

	RydHQD_CargoAirEx = [];
	RydHQD_CargoLandEx = [];
	if (RydHQD_NoAirCargo) then {RydHQD_CargoAirEx = RydHQD_AirG};
	if (RydHQD_NoLandCargo) then {RydHQD_CargoLandEx = (RydHQD_CargoG - RydHQD_AirG)};
	RydHQD_CargoG = RydHQD_CargoG - (RydHQD_CargoAirEx + RydHQD_CargoLandEx + RydHQD_AmmoDrop);

		{
		if not (_x in RydHQD_SupportG) then
			{
			RydHQD_SupportG set [(count RydHQD_SupportG),_x]
			}
		}
	foreach RydHQD_AmmoDrop;
		
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
				
				if (_SpecForcheck) then {if not (_vh in RydHQD_EnSpecFor) then {RydHQD_EnSpecFor set [(count RydHQD_EnSpecFor),_vh]};if not (_grp in RydHQD_EnSpecForG) then {RydHQD_EnSpecForG set [(count RydHQD_EnSpecForG),_grp]}};
				if (_reconcheck) then {if not (_vh in RydHQD_Enrecon) then {RydHQD_Enrecon set [(count RydHQD_Enrecon),_vh]};if not (_grp in RydHQD_EnreconG) then {RydHQD_EnreconG set [(count RydHQD_EnreconG),_grp]}};
				if (_FOcheck) then {if not (_vh in RydHQD_EnFO) then {RydHQD_EnFO set [(count RydHQD_EnFO),_vh]};if not (_grp in RydHQD_EnFOG) then {RydHQD_EnFOG set [(count RydHQD_EnFOG),_grp]}};
				if (_sniperscheck) then {if not (_vh in RydHQD_Ensnipers) then {RydHQD_Ensnipers set [(count RydHQD_Ensnipers),_vh]};if not (_grp in RydHQD_EnsnipersG) then {RydHQD_EnsnipersG set [(count RydHQD_EnsnipersG),_grp]}};
				if (_ATinfcheck) then {if not (_vh in RydHQD_EnATinf) then {RydHQD_EnATinf set [(count RydHQD_EnATinf),_vh]};if not (_grp in RydHQD_EnATinfG) then {RydHQD_EnATinfG set [(count RydHQD_EnATinfG),_grp]}};
				if (_AAinfcheck) then {if not (_vh in RydHQD_EnAAinf) then {RydHQD_EnAAinf set [(count RydHQD_EnAAinf),_vh]};if not (_grp in RydHQD_EnAAinfG) then {RydHQD_EnAAinfG set [(count RydHQD_EnAAinfG),_grp]}};
				if (_Infcheck) then {if not (_vh in RydHQD_EnInf) then {RydHQD_EValue = RydHQD_EValue + 1;RydHQD_EnInf set [(count RydHQD_EnInf),_vh]};if not (_grp in RydHQD_EnInfG) then {RydHQD_EnInfG set [(count RydHQD_EnInfG),_grp]}};
				if (_Artcheck) then {if not (_vh in RydHQD_EnArt) then {RydHQD_EValue = RydHQD_EValue + 3;RydHQD_EnArt set [(count RydHQD_EnArt),_vh]};if not (_grp in RydHQD_EnArtG) then {RydHQD_EnArtG set [(count RydHQD_EnArtG),_grp]}};
				if (_HArmorcheck) then {if not (_vh in RydHQD_EnHArmor) then {RydHQD_EValue = RydHQD_EValue + 10;RydHQD_EnHArmor set [(count RydHQD_EnHArmor),_vh]};if not (_grp in RydHQD_EnHArmorG) then {RydHQD_EnHArmorG set [(count RydHQD_EnHArmorG),_grp]}};
				if (_MArmorcheck) then {if not (_vh in RydHQD_EnMArmor) then {RydHQD_EnMArmor set [(count RydHQD_EnMArmor),_vh]};if not (_grp in RydHQD_EnMArmorG) then {RydHQD_EnMArmorG set [(count RydHQD_EnMArmorG),_grp]}};
				if (_LArmorcheck) then {if not (_vh in RydHQD_EnLArmor) then {RydHQD_EValue = RydHQD_EValue + 5;RydHQD_EnLArmor set [(count RydHQD_EnLArmor),_vh]};if not (_grp in RydHQD_EnLArmorG) then {RydHQD_EnLArmorG set [(count RydHQD_EnLArmorG),_grp]}};
				if (_LArmorATcheck) then {if not (_vh in RydHQD_EnLArmorAT) then {RydHQD_EnLArmorAT set [(count RydHQD_EnLArmorAT),_vh]};if not (_grp in RydHQD_EnLArmorATG) then {RydHQD_EnLArmorATG set [(count RydHQD_EnLArmorATG),_grp]}};
				if (_Carscheck) then {if not (_vh in RydHQD_EnCars) then {RydHQD_EValue = RydHQD_EValue + 3;RydHQD_EnCars set [(count RydHQD_EnCars),_vh]};if not (_grp in RydHQD_EnCarsG) then {RydHQD_EnCarsG set [(count RydHQD_EnCarsG),_grp]}};
				if (_Aircheck) then {if not (_vh in RydHQD_EnAir) then {RydHQD_EValue = RydHQD_EValue + 15;RydHQD_EnAir set [(count RydHQD_EnAir),_vh]};if not (_grp in RydHQD_EnAirG) then {RydHQD_EnAirG set [(count RydHQD_EnAirG),_grp]}};
				if (_BAircheck) then {if not (_vh in RydHQD_EnBAir) then {RydHQD_EnBAir set [(count RydHQD_EnBAir),_vh]};if not (_grp in RydHQD_EnBAirG) then {RydHQD_EnBAirG set [(count RydHQD_EnBAirG),_grp]}};				
				if (_RAircheck) then {if not (_vh in RydHQD_EnRAir) then {RydHQD_EnRAir set [(count RydHQD_EnRAir),_vh]};if not (_grp in RydHQD_EnRAirG) then {RydHQD_EnRAirG set [(count RydHQD_EnRAirG),_grp]}};
				if (_NCAircheck) then {if not (_vh in RydHQD_EnNCAir) then {RydHQD_EnNCAir set [(count RydHQD_EnNCAir),_vh]};if not (_grp in RydHQD_EnNCAirG) then {RydHQD_EnNCAirG set [(count RydHQD_EnNCAirG),_grp]}};
				if (_Navalcheck) then {if not (_vh in RydHQD_EnNaval) then {RydHQD_EnNaval set [(count RydHQD_EnNaval),_vh]};if not (_grp in RydHQD_EnNavalG) then {RydHQD_EnNavalG set [(count RydHQD_EnNavalG),_grp]}};
				if (_Staticcheck) then {if not (_vh in RydHQD_EnStatic) then {RydHQD_EValue = RydHQD_EValue + 1;RydHQD_EnStatic set [(count RydHQD_EnStatic),_vh]};if not (_grp in RydHQD_EnStaticG) then {RydHQD_EnStaticG set [(count RydHQD_EnStaticG),_grp]}};
				if (_StaticAAcheck) then {if not (_vh in RydHQD_EnStaticAA) then {RydHQD_EnStaticAA set [(count RydHQD_EnStaticAA),_vh]};if not (_grp in RydHQD_EnStaticAAG) then {RydHQD_EnStaticAAG set [(count RydHQD_EnStaticAAG),_grp]}};
				if (_StaticATcheck) then {if not (_vh in RydHQD_EnStaticAT) then {RydHQD_EnStaticAT set [(count RydHQD_EnStaticAT),_vh]};if not (_grp in RydHQD_EnStaticATG) then {RydHQD_EnStaticATG set [(count RydHQD_EnStaticATG),_grp]}};
				if (_Supportcheck) then {if not (_vh in RydHQD_EnSupport) then {RydHQD_EnSupport set [(count RydHQD_EnSupport),_vh]};if not (_grp in RydHQD_EnSupportG) then {RydHQD_EnSupportG set [(count RydHQD_EnSupportG),_grp]}};
				if (_Cargocheck) then {if not (_vh in RydHQD_EnCargo) then {RydHQD_EnCargo set [(count RydHQD_EnCargo),_vh]};if not (_grp in RydHQD_EnCargoG) then {RydHQD_EnCargoG set [(count RydHQD_EnCargoG),_grp]}};
				if (_NCCargocheck) then {if not (_vh in RydHQD_EnNCCargo) then {RydHQD_EnNCCargo set [(count RydHQD_EnNCCargo),_vh]};if not (_grp in RydHQD_EnNCCargoG) then {RydHQD_EnNCCargoG set [(count RydHQD_EnNCCargoG),_grp]}};
				if (_Crewcheck) then {if not (_vh in RydHQD_EnCrew) then {RydHQD_EnCrew set [(count RydHQD_EnCrew),_vh]};if not (_grp in RydHQD_EnCrewG) then {RydHQD_EnCrewG set [(count RydHQD_EnCrewG),_grp]}};
				if (_NCrewInfcheck) then {if not (_vh in RydHQD_EnNCrewInf) then {RydHQD_EnNCrewInf set [(count RydHQD_EnNCrewInf),_vh]};if not (_grp in RydHQD_EnNCrewInfG) then {RydHQD_EnNCrewInfG set [(count RydHQD_EnNCrewInfG),_grp]}};
				
			}
		foreach (units _x)
		}
	foreach RydHQD_KnEnemiesG;

	RydHQD_EnNCrewInfG = RydHQD_EnNCrewInfG - (RydHQD_EnRAirG + RydHQD_EnStaticG);
	RydHQD_EnNCrewInf = RydHQD_EnNCrewInf - (RydHQD_EnRAir + RydHQD_EnStatic);
	RydHQD_EnInfG = RydHQD_EnInfG - (RydHQD_EnRAirG + RydHQD_EnStaticG);
	RydHQD_EnInf = RydHQD_EnInf - (RydHQD_EnRAir + RydHQD_EnStatic);

	if (RydHQD_Flee) then
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
		foreach RydHQD_Friends;

		if (_AllPanic == 0) then {_AllPanic = 1};
		_midCow = 0;
		if not ((count RydHQD_Friends) == 0) then {_midCow = _AllCow/(count RydHQD_Friends)};

			{
			_cowF = ((- RydHQD_Morale)/(50 + (random 25))) + (random (2 * _midCow)) - _midCow;
			_cowF = _cowF * RydHQD_Muu;
			if (_x in RydHQD_SpecForG) then {_cowF = _cowF - 0.8};
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

			if (((random ((20 + (RydHQD_Morale/5))/_AllPanic)) < _cowF) and ((random 100) > (100/(_AllPanic + 1)))) then 
				{
				[_x] call RYD_WPdel;
				_x setVariable [("inPanic" + (str _x)), true];
				if (RydHQD_DebugII) then {_i = [(getPosATL (vehicle (leader _x))),_x,"markPanic","ColorYellow","ICON","mil_dot","D!","D!",[0.5,0.5]] call RYD_Mark};
				_x setVariable [("Busy" + (str _x)), true];

				_UL = leader _x;
				if not (isPlayer _UL) then 
					{
					if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_InPanic,"InPanic"] call RYD_AIChatter}
					};

				if (RydHQD_Surr) then
					{
					if ((random 100) > 50) then
						{
						if (RydHQD_DebugII) then {_i setMarkerColor "ColorPink";_i setMarkerText "D!!!"};
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
		foreach RydHQD_Friends
		};

		{
		RydHQD_KnEnPos set [(count RydHQD_KnEnPos),getPosATL (vehicle (leader _x))];
		if ((count RydHQD_KnEnPos) >= 100) then {RydHQD_KnEnPos = RydHQD_KnEnPos - [RydHQD_KnEnPos select 0]};
		}
	foreach RydHQD_KnEnemiesG;

	for [{_z = 0},{_z < (count RydHQD_KnEnemies)},{_z = _z + 1}] do
		{
		_KnEnemy = RydHQD_KnEnemies select _z;
			{
			if ((_x knowsAbout _KnEnemy) > 0.01) then {RydHQD reveal [_KnEnemy,2]}
			}
		foreach RydHQD_Friends
		};

	if ((RydBB_Active) and (leaderHQD in (RydBBa_HQs + RydBBb_HQs))) then {[] call RYD_BBArrRefresh};

	if (RydHQD_Cyclecount == 1) then
		{
		[] spawn D_EnemyScan;
		if (RydHQD_ArtyShells > 0) then
			{
			[RydHQD_ArtG,RydHQD_ArtyShells] call RYD_ArtyPrep;
			};

		if ((RydBB_Active) and (leaderHQD in (RydBBa_HQs + RydBBb_HQs))) then 
			{
			RydHQD_readyForBB = true;
			RydxHQ_Done = true;
			if (leaderHQD in RydBBa_HQs) then 
				{
				waitUntil {sleep 0.1;(RydBBa_InitDone)}
				};

			if (leaderHQD in RydBBb_HQs) then 
				{
				waitUntil {sleep 0.1;(RydBBb_InitDone)}
				}
			}
		};

	if (((count RydHQD_KnEnemies) > 0) and ((count RydHQD_ArtG) > 0) and (RydHQD_ArtyShells > 0)) then {[RydHQD_ArtG,RydHQD_KnEnemies,(RydHQD_EnHArmor + RydHQD_EnMArmor + RydHQD_EnLArmor),RydHQD_Friends,RydHQD_Debug,leaderHQD] call RYD_CFF};

	if (isNil ("RydHQD_Order")) then {RydHQD_Order = "ATTACK"};
	_gauss100 = (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10);
	if ((((_gauss100 + RydHQD_Inertia + RydHQD_Morale) > ((RydHQD_EValue/(RydHQD_FValue + 0.1)) * 60)) and not (isNil ("RydHQD_Obj")) and not (RydHQD_Order == "DEFEND")) or (RydHQD_Berserk)) then 
		{
		_lastS = RydHQD getVariable ["LastStance","At"];
		if ((_lastS == "De") or (RydHQD_CycleCount == 1)) then
			{
			if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQD,RydxHQ_AIC_OffStance,"OffStance"] call RYD_AIChatter};
			};

		RydHQD setVariable ["LastStance","At"];
		RydHQD_Inertia = 30 * (0.5 + RydHQD_Consistency)*(0.5 + RydHQD_Activity);
		[] spawn D_HQOrders 
		} 
	else 
		{
		_lastS = RydHQD getVariable ["LastStance","De"];
		if ((_lastS == "At") or (RydHQD_CycleCount == 1)) then
			{
			if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQD,RydxHQ_AIC_DefStance,"DefStance"] call RYD_AIChatter};
			};

		RydHQD setVariable ["LastStance","De"];
		RydHQD_Inertia = - (30  * (0.5 + RydHQD_Consistency))/(0.5 + RydHQD_Activity);
		[] spawn D_HQOrdersDef 
		};


	if ((((RydHQD_Circumspection + RydHQD_Fineness)/2) + 0.1) > (random 1.2)) then
		{
		_SFcount = {not (_x getVariable ["Busy" + (str _x),false]) and not (_x getVariable ["Resting" + (str _x),false])} count (RydHQD_SpecForG - RydHQD_SFBodyGuard);

		if (_SFcount > 0) then
			{
			_isNight = [] call RYD_isNight;
			_SFTgts = [];
			_chance = 40 + (60 * RydHQD_Activity);

				{
				_HQ = group _x;
				if (_HQ in RydHQD_KnEnemiesG) then
					{
					_SFTgts set [(count _SFTgts),_HQ]
					}
				}
			foreach (RydxHQ_AllLeaders - [leaderHQD]);

			if ((count _SFTgts) == 0) then
				{
				_chance = _chance/2;
				_SFTgts = RydHQD_EnArtG
				};

			if ((count _SFTgts) == 0) then
				{
				_chance = _chance/3;
				_SFTgts = RydHQD_EnStaticG
				};

			if (_isNight) then
				{
				_chance = _chance + 25
				};

			if ((count _SFTgts) > 0) then
				{
				_chance = _chance + (((2 * _SFcount) - (8/(0.75 + (RydHQD_Recklessness/2)))) * 20);
				_trgG = _SFTgts select (floor (random (count _SFTgts)));
				_alreadyAttacked = {_x == _trgG} count RydHQD_SFTargets;
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
								if not (_x in RydHQD_SFBodyGuard) then
									{	
									_SFAv set [(count _SFAv),_x]
									}
								}
							}
						}
					foreach RydHQD_SpecForG;

					_team = _SFAv select (floor (random (count _SFAv)));
					_trg = vehicle (leader _trgG);
					if (not ((typeOf _trg) in (_HArmor + _LArmor)) or ((random 100) > (90 - (RydHQD_Recklessness * 10)))) then {[_team,_trg,_trgG] spawn D_GoSFAttack}
					}
				}
			}
		};

	if (RydHQD_LRelocating) then
		{
		if ((abs (speed (vehicle leaderHQD))) < 0.1) then {RydHQD setVariable ["onMove",false]};
		_onMove = RydHQD getVariable ["onMove",false];

		if not (_onMove) then 
			{
			if (not (isPlayer leaderHQD) and ((RydHQD_Cyclecount == 1) or not (RydHQD_Progress == 0))) then
				{
				[RydHQD] call RYD_WPdel;

				_Lpos = position leaderHQD;
				if (RydHQD_Cyclecount == 1) then {RydHQD_Fpos = _Lpos};

				_rds = 0;

				if (RydHQD_LRelocating) then 
					{
					_rds = 0;
					if (RydHQD_NObj == 1) then {_Lpos = RydHQD_Fpos;if (leaderHQD in (RydBBa_HQs + RydBBb_HQs)) then {_Lpos = position leaderHQD};_rds = 0};
					if (RydHQD_NObj == 2) then {_Lpos = position RydHQD_Obj1};
					if (RydHQD_NObj == 3) then {_Lpos = position RydHQD_Obj2};
					if (RydHQD_NObj >= 4) then {_Lpos = position RydHQD_Obj3};
					};

				_spd = "LIMITED";
				if (RydHQD_Progress == -1) then {_spd = "NORMAL"};
				RydHQD_Progress = 0;
				_enemyN = false;

					{
					_eLdr = vehicle (leader _x);
					_eDst = _eLdr distance _Lpos;

					if (_eDst < 600) exitWith {_enemyN = true}
					}
				foreach RydHQD_KnEnemiesG;

				if not (_enemyN) then 
					{
					_wp = [RydHQD,_Lpos,"HOLD","AWARE","GREEN",_spd,["true",""],true,_rds,[0,0,0],"FILE"] call RYD_WPadd;
					if (isNull (assignedVehicle leaderHQD)) then
						{
						if (RydHQD_GetHQInside) then {[_wp] call RYD_GoInside}
						};

					if ((RydHQD_LRelocating) and (RydHQD_NObj > 1) and (RydHQD_Cyclecount > 1)) then 
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
								foreach RydHQD_KnEnemiesG;

								if (isNull RydHQD) then 
									{
									_onPlace = true
									}
								else
									{
									if not (_getBack) then
										{
										if (((vehicle leaderHQD) distance _LPos) < 30) then {_onPlace = true}
										}
									};
								

								((_getback) or (_onPlace))
								};

							if not (_onPlace) then
								{
								_rds = 30;
								if (RydHQD_NObj <= 2) then {_Lpos = getPosATL (vehicle leaderHQD);_rds = 0};
								if (RydHQD_NObj == 3) then {_Lpos = position RydHQD_Obj1};
								if (RydHQD_NObj >= 4) then {_Lpos = position RydHQD_Obj2};

								_getBack = false;

									{
									_eLdr = vehicle (leader _x);
									_eDst = _eLdr distance _Lpos;

									if (_eDst < 600) exitWith {_getBack = true}
									}
								foreach RydHQD_KnEnemiesG;

								if (_getBack) then {_Lpos = getPosATL (vehicle leaderHQD);_rds = 0};

								[RydHQD] call RYD_WPdel;	

								_spd = "NORMAL";
								if not (((vehicle leaderHQD) distance _LPos) < 50) then {_spd = "FULL"};

								_wp = [RydHQD,_Lpos,"HOLD","AWARE","GREEN",_spd,["true",""],true,_rds,[0,0,0],"FILE"] call RYD_WPadd;
								if (isNull (assignedVehicle leaderHQD)) then
									{
									if (RydHQD_GetHQInside) then {[_wp] call RYD_GoInside}
									};

								RydHQD setVariable ["onMove",true];
								}
							}
						}
					}
				}
			}
		};

	if (isNil ("RydHQD_CommDelay")) then {RydHQD_CommDelay = 1};
	_delay = (((22.5 + (count RydHQD_Friends))/(0.5 + RydHQD_Reflex)) * RydHQD_CommDelay);
	sleep _delay;

		{
		RydHQD reveal vehicle (leader _x)
		}
	foreach RydHQD_Friends;

	for [{_z = 0},{_z < (count RydHQD_KnEnemies)},{_z = _z + 1}] do
		{
		_KnEnemy = RydHQD_KnEnemies select _z;

			{
			if ((_x knowsAbout _KnEnemy) > 0.01) then {RydHQD reveal [_KnEnemy,2]} 
			}
		foreach RydHQD_Friends
		}
	};