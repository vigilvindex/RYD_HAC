
_HQ = _this select 0;

_HQ setVariable ["leaderHQ",(leader _HQ)];

_HQ setVariable ["RydHQ_Cyclecount",0];
_cycleC = 0;

if (isNil ("RydHQE_MAtt")) then {RydHQE_MAtt = false};
_HQ setVariable ["RydHQ_MAtt",RydHQE_MAtt];
if ((isNil ("RydHQE_Personality")) or not (_HQ getVariable ["RydHQ_MAtt",false])) then {RydHQE_Personality = "OTHER"};
_HQ setVariable ["RydHQ_Personality",RydHQE_Personality];

if (isNil ("RydHQE_Recklessness")) then {RydHQE_Recklessness = 0.5};
_HQ setVariable ["RydHQ_Recklessness",RydHQE_Recklessness];
if (isNil ("RydHQE_Consistency")) then {RydHQE_Consistency = 0.5};
_HQ setVariable ["RydHQ_Consistency",RydHQE_Consistency];
if (isNil ("RydHQE_Activity")) then {RydHQE_Activity = 0.5};
_HQ setVariable ["RydHQ_Activity",RydHQE_Activity];
if (isNil ("RydHQE_Reflex")) then {RydHQE_Reflex = 0.5};
_HQ setVariable ["RydHQ_Reflex",RydHQE_Reflex];
if (isNil ("RydHQE_Circumspection")) then {RydHQE_Circumspection = 0.5};
_HQ setVariable ["RydHQ_Circumspection",RydHQE_Circumspection];
if (isNil ("RydHQE_Fineness")) then {RydHQE_Fineness = 0.5};
_HQ setVariable ["RydHQ_Fineness",RydHQE_Fineness];

[_HQ] call HAL_Personality;

[[_HQ],HAL_LHQ] call RYD_Spawn;

if (isNil ("RydHQE_Boxed")) then {RydHQE_Boxed = []};
_HQ setVariable ["RydHQ_Boxed",RydHQE_Boxed];

if (isNil ("RydHQE_AmmoBoxes")) then 
	{
	RydHQE_AmmoBoxes = [];

	if not (isNil "RydHQE_AmmoDepot") then 
		{
		_rds = (triggerArea RydHQE_AmmoDepot) select 0;
		RydHQE_AmmoBoxes = (getPosATL RydHQE_AmmoDepot) nearObjects ["ReammoBox_F",_rds]
		}
	};
	
_HQ setVariable ["RydHQ_AmmoBoxes",RydHQE_AmmoBoxes];

_specFor_class = RHQ_SpecFor + 
	[
	] - RHQs_SpecFor;

_recon_class = RHQ_Recon + 
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
	
_FO_class = RHQ_FO + 
	[
	"I_Spotter_F",
	"O_spotter_F",
	"B_spotter_F",
	"O_recon_JTAC_F",
	"B_recon_JTAC_F"
	] - RHQs_FO;
	
_snipers_class = RHQ_Snipers + 
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
	
_ATinf_class = RHQ_ATInf + 
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
	
_AAinf_class = RHQ_AAInf + 
	[
	"I_Soldier_AA_F",
	"B_soldier_AA_F",
	"O_Soldier_AA_F",
	"O_APC_Tracked_02_AA_F",
	"B_APC_Tracked_01_AA_F",
	"O_soldierU_AA_F"
	] - RHQs_AAInf;

_Inf_class = RHQ_Inf + 
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
	
_Art_class = RHQ_Art + 
	[
	"B_MBT_01_arty_F",
	"O_MBT_02_arty_F",
	"B_MBT_01_mlrs_F",
	"I_Mortar_01_F",
	"O_Mortar_01_F",
	"B_G_Mortar_01_F",
	"B_Mortar_01_F"
	] - RHQs_Art;
	
_HArmor_class = RHQ_HArmor + 
	[
	"B_MBT_01_cannon_F",
	"B_MBT_01_TUSK_F",
	"O_MBT_02_cannon_F",
	"I_MBT_03_cannon_F"
	] - RHQs_HArmor;
	
_MArmor_class = RHQ_MArmor + 
	[
	] - RHQs_MArmor;

_LArmor_class = RHQ_LArmor + 
	[
	"I_APC_Wheeled_03_cannon_F",
	"O_APC_Tracked_02_AA_F",
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Wheeled_02_rcws_F",
	"B_APC_Tracked_01_AA_F",
	"B_APC_Tracked_01_rcws_F",
	"B_APC_Wheeled_01_cannon_F",
	"I_APC_tracked_03_cannon_F"
	] - RHQs_LArmor;
	
_LArmorAT_class = RHQ_LArmorAT + 
	[
	"B_APC_Wheeled_01_cannon_F",
	"I_APC_Wheeled_03_cannon_F",
	"O_APC_Tracked_02_cannon_F",
	"I_APC_tracked_03_cannon_F"
	] - RHQs_LArmorAT;

_Cars_class = RHQ_Cars + 
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
	"O_Truck_03_device_F",
	"O_Truck_03_transport_F",
	"O_Truck_03_covered_F",
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
	"O_Truck_03_ammo_F",
	"O_Truck_03_fuel_F",
	"O_Truck_03_medical_F",
	"O_Truck_03_repair_F",
	"I_UGV_01_F",
	"I_UGV_01_rcws_F",
	"O_UGV_01_F",
	"O_UGV_01_rcws_F",
	"B_UGV_01_F",
	"B_UGV_01_rcws_F"
	] - RHQs_Cars;
	
_Air_class = RHQ_Air + 
	[
	"I_Heli_Transport_02_F",
	"I_Plane_Fighter_03_AA_F",
	"I_Plane_Fighter_03_CAS_F",
	"B_Plane_CAS_01_F",
	"O_Plane_CAS_02_F",
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
	"B_UAV_02_F",
	"I_Heli_light_03_F",
	"I_Heli_light_03_unarmed_F"
	] - RHQs_Air;
	
_BAir_class = RHQ_BAir + 
	[
	"I_Plane_Fighter_03_CAS_F",
	"B_Plane_CAS_01_F",
	"O_Plane_CAS_02_F"
	] - RHQs_BAir;
	
_RAir_class = RHQ_RAir + 
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
	
_NCAir_class = RHQ_NCAir + 
	[
	"I_Heli_Transport_02_F",
	"O_Heli_Light_02_unarmed_F",
	"B_Heli_Light_01_F",
	"B_Heli_Transport_01_camo_F",
	"B_Heli_Transport_01_F",
	"I_Heli_light_03_unarmed_F",
	"I_UAV_01_F",
	"I_UAV_02_F",
	"O_UAV_01_F",
	"O_UAV_02_F",
	"B_UAV_01_F",
	"B_UAV_02_F"	
	] - RHQs_NCAir;

_Naval_class = RHQ_Naval + 
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

_Static_class = RHQ_Static + 
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
	
_StaticAA_class = RHQ_StaticAA + 
	[
	"I_static_AA_F",
	"O_static_AA_F",
	"B_static_AA_F"
	] - RHQs_StaticAA;
	
_StaticAT_class = RHQ_StaticAT + 
	[
	"I_static_AT_F",
	"O_static_AT_F",
	"B_static_AT_F"
	] - RHQs_StaticAT;
	
_Support_class = RHQ_Support + 
	[
	"I_Truck_02_ammo_F",
	"I_Truck_02_box_F",
	"I_Truck_02_fuel_F",
	"I_Truck_02_medical_F",
	"O_Truck_02_Ammo_F",
	"O_Truck_02_box_F",
	"O_Truck_02_fuel_F",
	"O_Truck_02_medical_F",
	"O_Truck_03_ammo_F",
	"O_Truck_03_fuel_F",
	"O_Truck_03_medical_F",
	"O_Truck_03_repair_F",
	"B_G_Van_01_fuel_F",
	"B_APC_Tracked_01_CRV_F",
	"B_Truck_01_ammo_F",
	"B_Truck_01_Repair_F",
	"B_Truck_01_fuel_F",
	"B_Truck_01_medical_F"
	] - RHQs_Support;
	
_Cargo_class = RHQ_Cargo + 
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
	"O_Truck_03_medical_F",
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
	"O_Truck_03_device_F",
	"O_Truck_03_transport_F",
	"O_Truck_03_covered_F",
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
	"I_Heli_light_03_F",
	"I_Heli_light_03_unarmed_F",
	"I_APC_tracked_03_cannon_F"	
	] - RHQs_Cargo;
	
_NCCargo_class = RHQ_NCCargo + 
	[
	"I_Heli_Transport_02_F",
	"O_Heli_Light_02_unarmed_F",
	"B_Heli_Light_01_F",
	"B_Heli_Transport_01_camo_F",
	"B_Heli_Transport_01_F",
	"I_Heli_light_03_unarmed_F",
	"I_Truck_02_medical_F",
	"O_Truck_02_medical_F",
	"B_Truck_01_medical_F",
	"O_Truck_03_medical_F",
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
	"O_Truck_03_device_F",
	"O_Truck_03_transport_F",
	"O_Truck_03_covered_F",
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
	
_Crew_class = RHQ_Crew + 
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
	
_Other_class = RHQ_Other + 
	[
	"I_UAV_AI",
	"O_UAV_AI",
	"B_UAV_AI"	
	];
		
_NCrewInf_class = _Inf_class - _Crew_class;
_Cargo_class = _Cargo_class - (_Support_class - ["MH60S"]);

_HQ setVariable ["RydHQ_NCVeh",_NCCargo_class + (_Support_class - ["MH60S"])];

_HQ setVariable ["RydHQ_ReconDone",false];
_HQ setVariable ["RydHQ_DefDone",false];
_HQ setVariable ["RydHQ_ReconStage",1];
_HQ setVariable ["RydHQ_ReconStage2",1];
_HQ setVariable ["RydHQ_AirInDef",[]];

_KnEnPos = [];

if (isNil ("RydHQE_Excluded")) then {RydHQE_Excluded = []};
_HQ setVariable ["RydHQ_Excluded",RydHQE_Excluded];
if (isNil ("RydHQE_Fast")) then {RydHQE_Fast = false};
_HQ setVariable ["RydHQ_Fast",RydHQE_Fast];
if (isNil ("RydHQE_ExInfo")) then {RydHQE_ExInfo = false};
_HQ setVariable ["RydHQ_ExInfo",RydHQE_ExInfo];
if (isNil ("RydHQE_ObjHoldTime")) then {RydHQE_ObjHoldTime = 600};
_HQ setVariable ["RydHQ_ObjHoldTime",RydHQE_ObjHoldTime];
if (isNil "RydHQE_NObj") then {RydHQE_NObj = 1};
_HQ setVariable ["RydHQ_NObj",RydHQE_NObj];

_HQ setVariable ["RydHQ_Init",true];

_HQ setVariable ["RydHQ_Inertia",0];
_HQ setVariable ["RydHQ_Morale",0];
_HQ setVariable ["RydHQ_CInitial",0];
_HQ setVariable ["RydHQ_CLast",0];
_HQ setVariable ["RydHQ_CCurrent",0];
_HQ setVariable ["RydHQ_CIMoraleC",0];
_HQ setVariable ["RydHQ_CLMoraleC",0];
_HQ setVariable ["RydHQ_Surrender",false];

_HQ setVariable ["RydHQ_FirstEMark",true];
_HQ setVariable ["RydHQ_LastE",0];
_HQ setVariable ["RydHQ_FlankingInit",false];
_HQ setVariable ["RydHQ_FlankingDone",false];
_HQ setVariable ["RydHQ_Progress",0];

_HQ setVariable ["RydHQ_AAthreat",[]];
_HQ setVariable ["RydHQ_ATthreat",[]];
_HQ setVariable ["RydHQ_Airthreat",[]];
_HQ setVariable ["RydHQ_Exhausted",[]];

if (isNil ("RydHQE_SupportWP")) then {RydHQE_SupportWP = false};
	
_HQ setVariable ["RydHQ_SupportWP",RydHQE_SupportWP];

_lastHQ = _HQ getVariable ["leaderHQ",objNull];
_OLmpl = 0;
_cycleCap = 0;
_firstMC = 0; 
_wp = [];
_lastReset = 0;
_HQlPos = [-10,-10,0];
_cInitial = 0;

while {true} do
	{
	if (isNull _HQ) exitWith {RydxHQ_AllHQ = RydxHQ_AllHQ - [_HQ]};
	if (({alive _x} count (units _HQ)) == 0) exitWith {RydxHQ_AllHQ = RydxHQ_AllHQ - [_HQ]};
	if (_HQ getVariable ["RydHQ_Surrender",false]) exitWith {RydxHQ_AllHQ = RydxHQ_AllHQ - [_HQ]};
	
	if not (_HQ getVariable ["RydHQ_Fast",false]) then 
		{
		waituntil 
			{
			sleep 0.1;
			((({(_x getVariable ["RydHQ_Pending",false])} count RydxHQ_AllHQ) == 0) or (_HQ getVariable ["RydHQ_KIA",false]))
			}
		};
		
	if (_HQ getVariable ["RydHQ_KIA",false]) exitWith {RydxHQ_AllHQ = RydxHQ_AllHQ - [_HQ]};
	
	_HQ setVariable ["RydHQ_Pending",true];

	if (_cycleC > 1) then
		{
		if not (_lastHQ == (_HQ getVariable ["leaderHQ",objNull])) then {sleep (60 + (random 60))};
		};
		
	if (_HQ getVariable ["RydHQ_KIA",false]) exitWith {RydxHQ_AllHQ = RydxHQ_AllHQ - [_HQ]};
	
	_lastHQ = (leader _HQ);
	
	_HQ setVariable ["RydHQ_Cyclecount",_cycleC + 1];
	_cycleC = _HQ getVariable ["RydHQ_Cyclecount",1];
	
	_SpecFor = [];
	_recon = [];
	_FO = [];
	_snipers = [];
	_ATinf = [];
	_AAinf = [];
	_Inf = [];
	_Art = [];
	_HArmor = [];
	_MArmor = [];
	_LArmor = [];
	_LArmorAT = [];
	_Cars = [];
	_Air = [];
	_BAir = [];
	_RAir = [];
	_NCAir = [];
	_Naval = [];
	_Static = [];
	_StaticAA = [];
	_StaticAT = [];
	_Support = [];
	_Cargo = [];
	_NCCargo = [];
	_Other = [];
	_Crew = [];
	_NCrewInf = [];

	_SpecForG = [];
	_reconG = [];
	_FOG = [];
	_snipersG = [];
	_ATinfG = [];
	_AAinfG = [];
	_InfG = [];
	_ArtG = [];
	_HArmorG = [];
	_MArmorG = [];
	_LArmorG = [];
	_LArmorATG = [];
	_CarsG = [];
	_AirG = [];
	_BAirG = [];
	_RAirG = [];
	_NCAirG = [];
	_NavalG = [];
	_StaticG = [];
	_StaticAAG = [];
	_StaticATG = [];
	_SupportG = [];
	_CargoG = [];
	_NCCargoG = [];
	_OtherG = [];
	_CrewG = [];
	_NCrewInfG = [];

	_EnSpecFor = [];
	_Enrecon = [];
	_EnFO = [];
	_Ensnipers = [];
	_EnATinf = [];
	_EnAAinf = [];
	_EnInf = [];
	_EnArt = [];
	_EnHArmor = [];
	_EnMArmor = [];
	_EnLArmor = [];
	_EnLArmorAT = [];
	_EnCars = [];
	_EnAir = [];
	_EnBAir = [];
	_EnRAir = [];
	_EnNCAir = [];
	_EnNaval = [];
	_EnStatic = [];
	_EnStaticAA = [];
	_EnStaticAT = [];
	_EnSupport = [];
	_EnCargo = [];
	_EnNCCargo = [];
	_EnOther = [];
	_EnCrew = [];
	_EnNCrewInf = [];

	_EnSpecForG = [];
	_EnreconG = [];
	_EnFOG = [];
	_EnsnipersG = [];
	_EnATinfG = [];
	_EnAAinfG = [];
	_EnInfG = [];
	_EnArtG = [];
	_EnHArmorG = [];
	_EnMArmorG = [];
	_EnLArmorG = [];
	_EnLArmorATG = [];
	_EnCarsG = [];
	_EnAirG = [];
	_EnBAirG = [];
	_EnRAirG = [];
	_EnNCAirG = [];
	_EnNavalG = [];
	_EnStaticG = [];
	_EnStaticAAG = [];
	_EnStaticATG = [];
	_EnSupportG = [];
	_EnCargoG = [];
	_EnNCCargoG = [];
	_EnOtherG = [];
	_EnCrewG = [];
	_EnNCrewInfG = [];

	_HQ setVariable ["RydHQ_LastE",count (_HQ getVariable ["RydHQ_KnEnemies",[]])];
	_HQ setVariable ["RydHQ_LastFriends",_HQ getVariable ["RydHQ_Friends",[]]];
	
	if (isNil "RydHQE_Garrison") then {RydHQE_Garrison = []};
	_HQ setVariable ["RydHQ_Garrison",RydHQE_Garrison];
	
	if (isNil ("RydHQE_NoAirCargo")) then {RydHQE_NoAirCargo = false};
	_HQ setVariable ["RydHQ_NoAirCargo",RydHQE_NoAirCargo];
	if (isNil ("RydHQE_NoLandCargo")) then {RydHQE_NoLandCargo = false};
	_HQ setVariable ["RydHQ_NoLandCargo",RydHQE_NoLandCargo];
	if (isNil ("RydHQE_LastFriends")) then {RydHQE_LastFriends = []};
	_HQ setVariable ["RydHQ_LastFriends",RydHQE_LastFriends];
	if (isNil ("RydHQE_CargoFind")) then {RydHQE_CargoFind = 0};
	_HQ setVariable ["RydHQ_CargoFind",RydHQE_CargoFind];
	if (isNil ("RydHQE_Subordinated")) then {RydHQE_Subordinated = []};
	_HQ setVariable ["RydHQ_Subordinated",RydHQE_Subordinated];
	if (isNil ("RydHQE_Included")) then {RydHQE_Included = []};
	_HQ setVariable ["RydHQ_Included",RydHQE_Included];
	if (isNil ("RydHQE_ExcludedG")) then {RydHQE_ExcludedG = []};
	_HQ setVariable ["RydHQ_ExcludedG",RydHQE_ExcludedG];
	if (isNil ("RydHQE_SubAll")) then {RydHQE_SubAll = true};
	_HQ setVariable ["RydHQ_SubAll",RydHQE_SubAll];
	if (isNil ("RydHQE_SubSynchro")) then {RydHQE_SubSynchro = false};
	_HQ setVariable ["RydHQ_SubSynchro",RydHQE_SubSynchro];
	if (isNil ("RydHQE_SubNamed")) then {RydHQE_SubNamed = false};
	_HQ setVariable ["RydHQ_SubNamed",RydHQE_SubNamed];
	if (isNil ("RydHQE_SubZero")) then {RydHQE_SubZero = false};
	_HQ setVariable ["RydHQ_SubZero",RydHQE_SubZero];
	if (isNil ("RydHQE_ReSynchro")) then {RydHQE_ReSynchro = true};
	_HQ setVariable ["RydHQ_ReSynchro",RydHQE_ReSynchro];
	if (isNil ("RydHQE_NameLimit")) then {RydHQE_NameLimit = 100};
	_HQ setVariable ["RydHQ_NameLimit",RydHQE_NameLimit];
	if (isNil ("RydHQE_Surr")) then {RydHQE_Surr = false};
	_HQ setVariable ["RydHQ_Surr",RydHQE_Surr];
	if (isNil ("RydHQE_NoRecon")) then {RydHQE_NoRecon = []};
	_HQ setVariable ["RydHQ_NoRecon",RydHQE_NoRecon];
	if (isNil ("RydHQE_NoAttack")) then {RydHQE_NoAttack = []};
	_HQ setVariable ["RydHQ_NoAttack",RydHQE_NoAttack];
	if (isNil ("RydHQE_CargoOnly")) then {RydHQE_CargoOnly = []};
	_HQ setVariable ["RydHQ_CargoOnly",RydHQE_CargoOnly];
	if (isNil ("RydHQE_NoCargo")) then {RydHQE_NoCargo = []};
	_HQ setVariable ["RydHQ_NoCargo",RydHQE_NoCargo];
	if (isNil ("RydHQE_NoFlank")) then {RydHQE_NoFlank = []};
	_HQ setVariable ["RydHQ_NoFlank",RydHQE_NoFlank];
	if (isNil ("RydHQE_NoDef")) then {RydHQE_NoDef = []};
	_HQ setVariable ["RydHQ_NoDef",RydHQE_NoDef];
	if (isNil ("RydHQE_FirstToFight")) then {RydHQE_FirstToFight = []};
	_HQ setVariable ["RydHQ_FirstToFight",RydHQE_FirstToFight];
	if (isNil ("RydHQE_VoiceComm")) then {RydHQE_VoiceComm = true};
	_HQ setVariable ["RydHQ_VoiceComm",RydHQE_VoiceComm];
	if (isNil ("RydHQE_FrontA")) then {RydHQE_Front = false};
	_HQ setVariable ["RydHQ_FrontA",RydHQE_Front];
	if (isNil ("RydHQE_LRelocating")) then {RydHQE_LRelocating = false};
	_HQ setVariable ["RydHQ_LRelocating",RydHQE_LRelocating];
	if (isNil ("RydHQE_Flee")) then {RydHQE_Flee = true};
	_HQ setVariable ["RydHQ_Flee",RydHQE_Flee];
	if (isNil ("RydHQE_GarrR")) then {RydHQE_GarrR = 500};
	_HQ setVariable ["RydHQ_GarrR",RydHQE_GarrR];
	if (isNil ("RydHQE_Rush")) then {RydHQE_Rush = false};
	_HQ setVariable ["RydHQ_Rush",RydHQE_Rush];
	if (isNil ("RydHQE_GarrVehAb")) then {RydHQE_GarrVehAb = false};
	_HQ setVariable ["RydHQ_GarrVehAb",RydHQE_GarrVehAb];
	if (isNil ("RydHQE_DefendObjectives")) then {RydHQE_DefendObjectives = 4};
	_HQ setVariable ["RydHQ_DefendObjectives",RydHQE_DefendObjectives];
	if (isNil ("RydHQE_DefSpot")) then {RydHQE_DefSpot = []};
	_HQ setVariable ["RydHQ_DefSpot",RydHQE_DefSpot];
	if (isNil ("RydHQE_RecDefSpot")) then {RydHQE_RecDefSpot = []};
	_HQ setVariable ["RydHQ_RecDefSpot",RydHQE_RecDefSpot];
	if (isNil "RydHQE_Flare") then {RydHQE_Flare = true};
	_HQ setVariable ["RydHQ_Flare",RydHQE_Flare];
	if (isNil "RydHQE_Smoke") then {RydHQE_Smoke = true};
	_HQ setVariable ["RydHQ_Smoke",RydHQE_Smoke];
	if (isNil "RydHQE_NoRec") then {RydHQE_NoRec = 1};
	_HQ setVariable ["RydHQ_NoRec",RydHQE_NoRec];
	if (isNil "RydHQE_RapidCapt") then {RydHQE_RapidCapt = 10};
	_HQ setVariable ["RydHQ_RapidCapt",RydHQE_RapidCapt];
	if (isNil "RydHQE_Muu") then {RydHQE_Muu = 1};
	_HQ setVariable ["RydHQ_Muu",RydHQE_Muu];
	if (isNil "RydHQE_ArtyShells") then {RydHQE_ArtyShells = 1};
	_HQ setVariable ["RydHQ_ArtyShells",RydHQE_ArtyShells];
	if (isNil "RydHQE_Withdraw") then {RydHQE_Withdraw = 1};
	_HQ setVariable ["RydHQ_Withdraw",RydHQE_Withdraw];
	if (isNil "RydHQE_Berserk") then {RydHQE_Berserk = false};
	_HQ setVariable ["RydHQ_Berserk",RydHQE_Berserk];
	if (isNil "RydHQE_IDChance") then {RydHQE_IDChance = 100};
	_HQ setVariable ["RydHQ_IDChance",RydHQE_IDChance];
	if (isNil "RydHQE_RDChance") then {RydHQE_RDChance = 100};
	_HQ setVariable ["RydHQ_RDChance",RydHQE_RDChance];
	if (isNil "RydHQE_SDChance") then {RydHQE_SDChance = 100};
	_HQ setVariable ["RydHQ_SDChance",RydHQE_SDChance];
	if (isNil "RydHQE_AmmoDrop") then {RydHQE_AmmoDrop = []};
	_HQ setVariable ["RydHQ_AmmoDrop",RydHQE_AmmoDrop];
	if (isNil "RydHQE_SFTargets") then {RydHQE_SFTargets = []};
	_HQ setVariable ["RydHQ_SFTargets",RydHQE_SFTargets];
	if (isNil "RydHQE_LZ") then {RydHQE_LZ = false};
	_HQ setVariable ["RydHQ_LZ",RydHQE_LZ];
	if (isNil "RydHQE_SFBodyGuard") then {RydHQE_SFBodyGuard = []};
	_HQ setVariable ["RydHQ_SFBodyGuard",RydHQE_SFBodyGuard];
	if (isNil "RydHQE_DynForm") then {RydHQE_DynForm = false};
	_HQ setVariable ["RydHQ_DynForm",RydHQE_DynForm];
	if (isNil "RydHQE_UnlimitedCapt") then {RydHQE_UnlimitedCapt = false};
	_HQ setVariable ["RydHQ_UnlimitedCapt",RydHQE_UnlimitedCapt];
	if (isNil "RydHQE_CaptLimit") then {RydHQE_CaptLimit = 10};
	_HQ setVariable ["RydHQ_CaptLimit",RydHQE_CaptLimit];
	if (isNil "RydHQE_GetHQInside") then {RydHQE_GetHQInside = false};
	_HQ setVariable ["RydHQ_GetHQInside",RydHQE_GetHQInside];
	if (isNil "RydHQE_WA") then {RydHQE_WA = true};
	_HQ setVariable ["RydHQ_WA",RydHQE_WA];
	
	if (isNil ("RydHQE_ResetNow")) then {RydHQE_ResetNow = false};
	_HQ setVariable ["RydHQ_ResetNow",RydHQE_ResetNow];
	if (isNil ("RydHQE_ResetOnDemand")) then {RydHQE_ResetOnDemand = false};
	_HQ setVariable ["RydHQ_ResetOnDemand",RydHQE_ResetOnDemand];
	if (isNil ("RydHQE_ResetTime")) then {RydHQE_ResetTime = 600};
	_HQ setVariable ["RydHQ_ResetTime",RydHQE_ResetTime];
	if (isNil ("RydHQE_Combining")) then {RydHQE_Combining = false};
	_HQ setVariable ["RydHQ_Combining",RydHQE_Combining];
	if (isNil ("RydHQE_ObjRadius1")) then {RydHQE_ObjRadius1 = 300};
	_HQ setVariable ["RydHQ_ObjRadius1",RydHQE_ObjRadius1];
	if (isNil ("RydHQE_ObjRadius2")) then {RydHQE_ObjRadius2 = 500};
	_HQ setVariable ["RydHQ_ObjRadius2",RydHQE_ObjRadius2];
	if (isNil ("RydHQE_KnowTL")) then {RydHQE_KnowTL = true};
	_HQ setVariable ["RydHQ_KnowTL",RydHQE_KnowTL];
	
	if (isNil ("RydHQE_SMed")) then {RydHQE_SMed = true};
	_HQ setVariable ["RydHQ_SMed",RydHQE_SMed];
	if (isNil ("RydHQE_ExMedic")) then {RydHQE_ExMedic = []};
	_HQ setVariable ["RydHQ_ExMedic",RydHQE_ExMedic];
	if (isNil ("RydHQE_MedPoints")) then {RydHQE_MedPoints = []};
	_HQ setVariable ["RydHQ_MedPoints",RydHQE_MedPoints];
	if (isNil ("RydHQE_SupportedG")) then {RydHQE_SupportedG = []};
	_HQ setVariable ["RydHQ_SupportedG",RydHQE_SupportedG];
	
	if (isNil ("RydHQE_SFuel")) then {RydHQE_SFuel = true};
	_HQ setVariable ["RydHQ_SFuel",RydHQE_SFuel];
	if (isNil ("RydHQE_ExRefuel")) then {RydHQE_ExRefuel = []};
	_HQ setVariable ["RydHQ_ExRefuel",RydHQE_ExRefuel];
	if (isNil ("RydHQE_FuelPoints")) then {RydHQE_FuelPoints = []};
	_HQ setVariable ["RydHQ_FuelPoints",RydHQE_FuelPoints];
	if (isNil ("RydHQE_FSupportedG")) then {RydHQE_FSupportedG = []};
	_HQ setVariable ["RydHQ_FSupportedG",RydHQE_FSupportedG];
	
	if (isNil ("RydHQE_SAmmo")) then {RydHQE_SAmmo = true};
	_HQ setVariable ["RydHQ_SAmmo",RydHQE_SAmmo];
	if (isNil ("RydHQE_ExReammo")) then {RydHQE_ExReammo = []};
	_HQ setVariable ["RydHQ_ExReammo",RydHQE_ExReammo];
	if (isNil ("RydHQE_AmmoPoints")) then {RydHQE_AmmoPoints = []};
	_HQ setVariable ["RydHQ_AmmoPoints",RydHQE_AmmoPoints];
	if (isNil ("RydHQE_ASupportedG")) then {RydHQE_ASupportedG = []};
	_HQ setVariable ["RydHQ_ASupportedG",RydHQE_ASupportedG];
	
	if (isNil ("RydHQE_SRep")) then {RydHQE_SRep = true};
	_HQ setVariable ["RydHQ_SRep",RydHQE_SRep];
	if (isNil ("RydHQE_ExRepair")) then {RydHQE_ExRepair = []};
	_HQ setVariable ["RydHQ_ExRepair",RydHQE_ExRepair];
	if (isNil ("RydHQE_RepPoints")) then {RydHQE_RepPoints = []};
	_HQ setVariable ["RydHQ_RepPoints",RydHQE_RepPoints];
	if (isNil ("RydHQE_RSupportedG")) then {RydHQE_RSupportedG = []};
	_HQ setVariable ["RydHQ_RSupportedG",RydHQE_RSupportedG];
	
	if (isNil "RydHQE_AirDist") then {RydHQE_AirDist = 4000};
	_HQ setVariable ["RydHQ_AirDist",RydHQE_AirDist];
	
	if (isNil ("RydHQE_CommDelay")) then {RydHQE_CommDelay = 1};
	_HQ setVariable ["RydHQ_CommDelay",RydHQE_CommDelay];
	if (isNil ("RydHQE_Order")) then {RydHQE_Order = "ATTACK"};
	_HQ setVariable ["RydHQ_Order",RydHQE_Order];
	if (isNil ("RydHQE_ReconReserve")) then {RydHQE_ReconReserve = (0.3 * (0.5 + (_HQ getVariable ["RydHQ_Circumspection",0.5])))};
	_HQ setVariable ["RydHQ_ReconReserve",RydHQE_ReconReserve];
	if (isNil ("RydHQE_Exhausted")) then {RydHQE_Exhausted = []};
	_HQ setVariable ["RydHQ_Exhausted",RydHQE_Exhausted];
	if (isNil ("RydHQE_AttackReserve")) then {RydHQE_AttackReserve = (0.5 * (0.5 + ((_HQ getVariable ["RydHQ_Circumspection",0.5])/1.5)))};
	_HQ setVariable ["RydHQ_AttackReserve",RydHQE_AttackReserve];
	if (isNil ("RydHQE_IdleOrd")) then {RydHQE_IdleOrd = true};
	_HQ setVariable ["RydHQ_IdleOrd",RydHQE_IdleOrd];
	if (isNil "RydHQE_IdleDecoy") then {RydHQE_IdleDecoy = objNull};
	_HQ setVariable ["RydHQ_IdleDecoy",RydHQE_IdleDecoy]; 
	if (isNil "RydHQE_SupportDecoy") then {RydHQE_SupportDecoy = objNull};
	_HQ setVariable ["RydHQ_SupportDecoy",RydHQE_SupportDecoy]; 
	if (isNil "RydHQE_RestDecoy") then {RydHQE_RestDecoy = objNull};
	_HQ setVariable ["RydHQ_RestDecoy",RydHQE_RestDecoy]; 
	if (isNil "RydHQE_Sec1") then {RydHQE_Sec1 = objNull};
	_HQ setVariable ["RydHQ_Sec1",RydHQE_Sec1]; 
	if (isNil "RydHQE_Sec2") then {RydHQE_Sec2 = objNull};
	_HQ setVariable ["RydHQ_Sec2",RydHQE_Sec2];
	
	if (isNil "RydHQE_Debug") then {RydHQE_Debug = false};
	_HQ setVariable ["RydHQ_Debug",RydHQE_Debug]; 
	if (isNil "RydHQE_DebugII") then {RydHQE_DebugII = false};
	_HQ setVariable ["RydHQ_DebugII",RydHQE_DebugII]; 
	
	if (isNil "RydHQE_AlwaysKnownU") then {RydHQE_AlwaysKnownU = []};
	_HQ setVariable ["RydHQ_AlwaysKnownU",RydHQE_AlwaysKnownU]; 
	if (isNil "RydHQE_AlwaysUnKnownU") then {RydHQE_AlwaysUnKnownU = []};
	_HQ setVariable ["RydHQ_AlwaysUnKnownU",RydHQE_AlwaysUnKnownU];
	
 	if (isNil "RydHQE_AOnly") then {RydHQE_AOnly = []};
	_HQ setVariable ["RydHQ_AOnly",RydHQE_AOnly]; 
	if (isNil "RydHQE_ROnly") then {RydHQE_ROnly = []};
	_HQ setVariable ["RydHQ_ROnly",RydHQE_ROnly]; 
	
	if (isNil "RydHQE_AirEvac") then {RydHQE_AirEvac = false};
	_HQ setVariable ["RydHQ_AirEvac",RydHQE_AirEvac]; 
	
	if (isNil "RydHQE_AAO") then {RydHQE_AAO = false};
	_HQ setVariable ["RydHQ_AAO",RydHQ_AAO]; 
	if (isNil "RydHQE_ForceAAO") then {RydHQE_ForceAAO = false};
	_HQ setVariable ["RydHQ_ForceAAO",RydHQ_ForceAAO];
	
	if (isNil "RydHQE_Taken") then {RydHQE_Taken = []};
	_HQ setVariable ["RydHQ_Taken",RydHQE_Taken];
	
	if (isNil "RydHQE_EBDoctrine") then {RydHQE_EBDoctrine = false};
	_HQ setVariable ["RydHQ_EBDoctrine",RydHQE_EBDoctrine]; 
	if (isNil "RydHQE_ForceEBDoctrine") then {RydHQE_ForceEBDoctrine = false};
	_HQ setVariable ["RydHQ_ForceEBDoctrine",RydHQE_ForceEBDoctrine]; 
	
	_HQ setVariable ["RydHQ_Obj1",RydHQE_Obj1];
	_HQ setVariable ["RydHQ_Obj2",RydHQE_Obj2];
	_HQ setVariable ["RydHQ_Obj3",RydHQE_Obj3];
	_HQ setVariable ["RydHQ_Obj4",RydHQE_Obj4];
	
	_objectives = [RydHQE_Obj1,RydHQE_Obj2,RydHQE_Obj3,RydHQE_Obj4];
	
	_HQ setVariable ["RydHQ_Objectives",_objectives];
	
	_listed = _HQ getVariable "BBProgress";

	if (isNil "_listed") then
		{
		_midX = 0;
		_midY = 0;
		
		_notTaken = _objectives - (_HQ getVariable ["RydHQ_Taken",[]]);
		
		_nTc = count _notTaken;
		
		if (_nTc < 1) then 
			{
			_notTaken = _objectives;
			_nTc = 4
			};
		
			{
			_pos = getPosATL _x;
			_midX = _midX + (_pos select 0);
			_midY = _midY + (_pos select 1);
			}
		foreach _notTaken;
			
		_HQ setVariable ["RydHQ_EyeOfBattle",[_midX/_nTc,_midY/_nTc,0]];
		};
				
	if not (isNil "RydHQE_DefFrontL") then {_HQ setVariable ["RydHQ_DefFrontL",RydHQE_DefFrontL]};
	if not (isNil "RydHQE_DefFront1") then {_HQ setVariable ["RydHQ_DefFront1",RydHQE_DefFront1]};
	if not (isNil "RydHQE_DefFront2") then {_HQ setVariable ["RydHQ_DefFront2",RydHQE_DefFront2]};
	if not (isNil "RydHQE_DefFront3") then {_HQ setVariable ["RydHQ_DefFront3",RydHQE_DefFront3]};
	if not (isNil "RydHQE_DefFront4") then {_HQ setVariable ["RydHQ_DefFront4",RydHQE_DefFront4]};
	
	_civF = ["CIV_F","CIV","CIV_RU","BIS_TK_CIV","BIS_CIV_special"];
	if not (isNil ("RydHQE_CivF")) then {_civF = RydHQE_CivF};
	_HQ setVariable ["RydHQ_CivF",_civF];
	
	if (isNil ("RydHQE_Def")) then {RydHQE_Def = []};
	_HQ setVariable ["RydHQ_Def",RydHQE_Def];
	
	_nObj = _HQ getVariable ["RydHQ_NObj",1];

	switch (_nObj) do
		{
		case (1) : {_HQ setVariable ["RydHQ_Obj",RydHQE_Obj1]};
		case (2) : {_HQ setVariable ["RydHQ_Obj",RydHQE_Obj2]};
		case (3) : {_HQ setVariable ["RydHQ_Obj",RydHQE_Obj3]};
		default {_HQ setVariable ["RydHQ_Obj",RydHQE_Obj4]};
		};
		
	call RYD_StatusQuo;
	};