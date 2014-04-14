_SCRname = "SitRepB";
_HQ = _this select 0;

_HQ setVariable ["leaderHQ",(leader _HQ)];

_HQ setVariable ["RydHQ_Cyclecount",0];
_cycleC = 0;

if (isNil ("RydHQB_MAtt")) then {RydHQB_MAtt = false};
_HQ setVariable ["RydHQ_MAtt",RydHQB_MAtt];
if ((isNil ("RydHQB_Personality")) or not (_HQ getVariable ["RydHQ_MAtt",false])) then {RydHQB_Personality = "OTHER"};
_HQ setVariable ["RydHQ_Personality",RydHQB_Personality];
	
if (isNil ("RydHQB_Recklessness")) then {RydHQB_Recklessness = 0.5};
_HQ setVariable ["RydHQ_Recklessness",RydHQB_Recklessness];
if (isNil ("RydHQB_Consistency")) then {RydHQB_Consistency = 0.5};
_HQ setVariable ["RydHQ_Consistency",RydHQB_Consistency];
if (isNil ("RydHQB_Activity")) then {RydHQB_Activity = 0.5};
_HQ setVariable ["RydHQ_Activity",RydHQB_Activity];
if (isNil ("RydHQB_Reflex")) then {RydHQB_Reflex = 0.5};
_HQ setVariable ["RydHQ_Reflex",RydHQB_Reflex];
if (isNil ("RydHQB_Circumspection")) then {RydHQB_Circumspection = 0.5};
_HQ setVariable ["RydHQ_Circumspection",RydHQB_Circumspection];
if (isNil ("RydHQB_Fineness")) then {RydHQB_Fineness = 0.5};
_HQ setVariable ["RydHQ_Fineness",RydHQB_Fineness];

[_HQ] call HAL_Personality;

[[_HQ],HAL_LHQ] call RYD_Spawn;

if (isNil ("RydHQB_Boxed")) then {RydHQB_Boxed = []};
_HQ setVariable ["RydHQ_Boxed",RydHQB_Boxed];

if (isNil ("RydHQB_AmmoBoxes")) then 
	{
	RydHQB_AmmoBoxes = [];

	if not (isNil "RydHQB_AmmoDepot") then 
		{
		_rds = (triggerArea RydHQB_AmmoDepot) select 0;
		RydHQB_AmmoBoxes = (getPosATL RydHQB_AmmoDepot) nearObjects ["ReammoBox_F",_rds]
		}
	};
	
_HQ setVariable ["RydHQ_AmmoBoxes",RydHQB_AmmoBoxes];

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

if (isNil ("RydHQB_Excluded")) then {RydHQB_Excluded = []};
_HQ setVariable ["RydHQ_Excluded",RydHQB_Excluded];
if (isNil ("RydHQB_Fast")) then {RydHQB_Fast = false};
_HQ setVariable ["RydHQ_Fast",RydHQB_Fast];
if (isNil ("RydHQB_ExInfo")) then {RydHQB_ExInfo = false};
_HQ setVariable ["RydHQ_ExInfo",RydHQB_ExInfo];
if (isNil ("RydHQB_ObjHoldTime")) then {RydHQB_ObjHoldTime = 600};
_HQ setVariable ["RydHQ_ObjHoldTime",RydHQB_ObjHoldTime];
if (isNil "RydHQB_NObj") then {RydHQB_NObj = 1};
_HQ setVariable ["RydHQ_NObj",RydHQB_NObj];

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

if (isNil ("RydHQB_SupportWP")) then {RydHQB_SupportWP = false};
	
_HQ setVariable ["RydHQ_SupportWP",RydHQB_SupportWP];

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
	
	if (isNil "RydHQB_Garrison") then {RydHQB_Garrison = []};
	_HQ setVariable ["RydHQ_Garrison",RydHQB_Garrison];
	
	if (isNil ("RydHQB_NoAirCargo")) then {RydHQB_NoAirCargo = false};
	_HQ setVariable ["RydHQ_NoAirCargo",RydHQB_NoAirCargo];
	if (isNil ("RydHQB_NoLandCargo")) then {RydHQB_NoLandCargo = false};
	_HQ setVariable ["RydHQ_NoLandCargo",RydHQB_NoLandCargo];
	if (isNil ("RydHQB_LastFriends")) then {RydHQB_LastFriends = []};
	_HQ setVariable ["RydHQ_LastFriends",RydHQB_LastFriends];
	if (isNil ("RydHQB_CargoFind")) then {RydHQB_CargoFind = 0};
	_HQ setVariable ["RydHQ_CargoFind",RydHQB_CargoFind];
	if (isNil ("RydHQB_Subordinated")) then {RydHQB_Subordinated = []};
	_HQ setVariable ["RydHQ_Subordinated",RydHQB_Subordinated];
	if (isNil ("RydHQB_Included")) then {RydHQB_Included = []};
	_HQ setVariable ["RydHQ_Included",RydHQB_Included];
	if (isNil ("RydHQB_ExcludedG")) then {RydHQB_ExcludedG = []};
	_HQ setVariable ["RydHQ_ExcludedG",RydHQB_ExcludedG];
	if (isNil ("RydHQB_SubAll")) then {RydHQB_SubAll = true};
	_HQ setVariable ["RydHQ_SubAll",RydHQB_SubAll];
	if (isNil ("RydHQB_SubSynchro")) then {RydHQB_SubSynchro = false};
	_HQ setVariable ["RydHQ_SubSynchro",RydHQB_SubSynchro];
	if (isNil ("RydHQB_SubNamed")) then {RydHQB_SubNamed = false};
	_HQ setVariable ["RydHQ_SubNamed",RydHQB_SubNamed];
	if (isNil ("RydHQB_SubZero")) then {RydHQB_SubZero = false};
	_HQ setVariable ["RydHQ_SubZero",RydHQB_SubZero];
	if (isNil ("RydHQB_ReSynchro")) then {RydHQB_ReSynchro = true};
	_HQ setVariable ["RydHQ_ReSynchro",RydHQB_ReSynchro];
	if (isNil ("RydHQB_NameLimit")) then {RydHQB_NameLimit = 100};
	_HQ setVariable ["RydHQ_NameLimit",RydHQB_NameLimit];
	if (isNil ("RydHQB_Surr")) then {RydHQB_Surr = false};
	_HQ setVariable ["RydHQ_Surr",RydHQB_Surr];
	if (isNil ("RydHQB_NoRecon")) then {RydHQB_NoRecon = []};
	_HQ setVariable ["RydHQ_NoRecon",RydHQB_NoRecon];
	if (isNil ("RydHQB_NoAttack")) then {RydHQB_NoAttack = []};
	_HQ setVariable ["RydHQ_NoAttack",RydHQB_NoAttack];
	if (isNil ("RydHQB_CargoOnly")) then {RydHQB_CargoOnly = []};
	_HQ setVariable ["RydHQ_CargoOnly",RydHQB_CargoOnly];
	if (isNil ("RydHQB_NoCargo")) then {RydHQB_NoCargo = []};
	_HQ setVariable ["RydHQ_NoCargo",RydHQB_NoCargo];
	if (isNil ("RydHQB_NoFlank")) then {RydHQB_NoFlank = []};
	_HQ setVariable ["RydHQ_NoFlank",RydHQB_NoFlank];
	if (isNil ("RydHQB_NoDef")) then {RydHQB_NoDef = []};
	_HQ setVariable ["RydHQ_NoDef",RydHQB_NoDef];
	if (isNil ("RydHQB_FirstToFight")) then {RydHQB_FirstToFight = []};
	_HQ setVariable ["RydHQ_FirstToFight",RydHQB_FirstToFight];
	if (isNil ("RydHQB_VoiceComm")) then {RydHQB_VoiceComm = true};
	_HQ setVariable ["RydHQ_VoiceComm",RydHQB_VoiceComm];
	if (isNil ("RydHQB_FrontA")) then {RydHQB_Front = false};
	_HQ setVariable ["RydHQ_FrontA",RydHQB_Front];
	if (isNil ("RydHQB_LRelocating")) then {RydHQB_LRelocating = false};
	_HQ setVariable ["RydHQ_LRelocating",RydHQB_LRelocating];
	if (isNil ("RydHQB_Flee")) then {RydHQB_Flee = true};
	_HQ setVariable ["RydHQ_Flee",RydHQB_Flee];
	if (isNil ("RydHQB_GarrR")) then {RydHQB_GarrR = 500};
	_HQ setVariable ["RydHQ_GarrR",RydHQB_GarrR];
	if (isNil ("RydHQB_Rush")) then {RydHQB_Rush = false};
	_HQ setVariable ["RydHQ_Rush",RydHQB_Rush];
	if (isNil ("RydHQB_GarrVehAb")) then {RydHQB_GarrVehAb = false};
	_HQ setVariable ["RydHQ_GarrVehAb",RydHQB_GarrVehAb];
	if (isNil ("RydHQB_DefendObjectives")) then {RydHQB_DefendObjectives = 4};
	_HQ setVariable ["RydHQ_DefendObjectives",RydHQB_DefendObjectives];
	if (isNil ("RydHQB_DefSpot")) then {RydHQB_DefSpot = []};
	_HQ setVariable ["RydHQ_DefSpot",RydHQB_DefSpot];
	if (isNil ("RydHQB_RecDefSpot")) then {RydHQB_RecDefSpot = []};
	_HQ setVariable ["RydHQ_RecDefSpot",RydHQB_RecDefSpot];
	if (isNil "RydHQB_Flare") then {RydHQB_Flare = true};
	_HQ setVariable ["RydHQ_Flare",RydHQB_Flare];
	if (isNil "RydHQB_Smoke") then {RydHQB_Smoke = true};
	_HQ setVariable ["RydHQ_Smoke",RydHQB_Smoke];
	if (isNil "RydHQB_NoRec") then {RydHQB_NoRec = 1};
	_HQ setVariable ["RydHQ_NoRec",RydHQB_NoRec];
	if (isNil "RydHQB_RapidCapt") then {RydHQB_RapidCapt = 10};
	_HQ setVariable ["RydHQ_RapidCapt",RydHQB_RapidCapt];
	if (isNil "RydHQB_Muu") then {RydHQB_Muu = 1};
	_HQ setVariable ["RydHQ_Muu",RydHQB_Muu];
	if (isNil "RydHQB_ArtyShells") then {RydHQB_ArtyShells = 1};
	_HQ setVariable ["RydHQ_ArtyShells",RydHQB_ArtyShells];
	if (isNil "RydHQB_Withdraw") then {RydHQB_Withdraw = 1};
	_HQ setVariable ["RydHQ_Withdraw",RydHQB_Withdraw];
	if (isNil "RydHQB_Berserk") then {RydHQB_Berserk = false};
	_HQ setVariable ["RydHQ_Berserk",RydHQB_Berserk];
	if (isNil "RydHQB_IDChance") then {RydHQB_IDChance = 100};
	_HQ setVariable ["RydHQ_IDChance",RydHQB_IDChance];
	if (isNil "RydHQB_RDChance") then {RydHQB_RDChance = 100};
	_HQ setVariable ["RydHQ_RDChance",RydHQB_RDChance];
	if (isNil "RydHQB_SDChance") then {RydHQB_SDChance = 100};
	_HQ setVariable ["RydHQ_SDChance",RydHQB_SDChance];
	if (isNil "RydHQB_AmmoDrop") then {RydHQB_AmmoDrop = []};
	_HQ setVariable ["RydHQ_AmmoDrop",RydHQB_AmmoDrop];
	if (isNil "RydHQB_SFTargets") then {RydHQB_SFTargets = []};
	_HQ setVariable ["RydHQ_SFTargets",RydHQB_SFTargets];
	if (isNil "RydHQB_LZ") then {RydHQB_LZ = false};
	_HQ setVariable ["RydHQ_LZ",RydHQB_LZ];
	if (isNil "RydHQB_SFBodyGuard") then {RydHQB_SFBodyGuard = []};
	_HQ setVariable ["RydHQ_SFBodyGuard",RydHQB_SFBodyGuard];
	if (isNil "RydHQB_DynForm") then {RydHQB_DynForm = false};
	_HQ setVariable ["RydHQ_DynForm",RydHQB_DynForm];
	if (isNil "RydHQB_UnlimitedCapt") then {RydHQB_UnlimitedCapt = false};
	_HQ setVariable ["RydHQ_UnlimitedCapt",RydHQB_UnlimitedCapt];
	if (isNil "RydHQB_CaptLimit") then {RydHQB_CaptLimit = 10};
	_HQ setVariable ["RydHQ_CaptLimit",RydHQB_CaptLimit];
	if (isNil "RydHQB_GetHQInside") then {RydHQB_GetHQInside = false};
	_HQ setVariable ["RydHQ_GetHQInside",RydHQB_GetHQInside];
	if (isNil "RydHQB_WA") then {RydHQB_WA = true};
	_HQ setVariable ["RydHQ_WA",RydHQB_WA];
	
	if (isNil ("RydHQB_ResetNow")) then {RydHQB_ResetNow = false};
	_HQ setVariable ["RydHQ_ResetNow",RydHQB_ResetNow];
	if (isNil ("RydHQB_ResetOnDemand")) then {RydHQB_ResetOnDemand = false};
	_HQ setVariable ["RydHQ_ResetOnDemand",RydHQB_ResetOnDemand];
	if (isNil ("RydHQB_ResetTime")) then {RydHQB_ResetTime = 600};
	_HQ setVariable ["RydHQ_ResetTime",RydHQB_ResetTime];
	if (isNil ("RydHQB_Combining")) then {RydHQB_Combining = false};
	_HQ setVariable ["RydHQ_Combining",RydHQB_Combining];
	if (isNil ("RydHQB_ObjRadius1")) then {RydHQB_ObjRadius1 = 300};
	_HQ setVariable ["RydHQ_ObjRadius1",RydHQB_ObjRadius1];
	if (isNil ("RydHQB_ObjRadius2")) then {RydHQB_ObjRadius2 = 500};
	_HQ setVariable ["RydHQ_ObjRadius2",RydHQB_ObjRadius2];
	if (isNil ("RydHQB_KnowTL")) then {RydHQB_KnowTL = true};
	_HQ setVariable ["RydHQ_KnowTL",RydHQB_KnowTL];
	
	if (isNil ("RydHQB_SMed")) then {RydHQB_SMed = true};
	_HQ setVariable ["RydHQ_SMed",RydHQB_SMed];
	if (isNil ("RydHQB_ExMedic")) then {RydHQB_ExMedic = []};
	_HQ setVariable ["RydHQ_ExMedic",RydHQB_ExMedic];
	if (isNil ("RydHQB_MedPoints")) then {RydHQB_MedPoints = []};
	_HQ setVariable ["RydHQ_MedPoints",RydHQB_MedPoints];
	if (isNil ("RydHQB_SupportedG")) then {RydHQB_SupportedG = []};
	_HQ setVariable ["RydHQ_SupportedG",RydHQB_SupportedG];
	
	if (isNil ("RydHQB_SFuel")) then {RydHQB_SFuel = true};
	_HQ setVariable ["RydHQ_SFuel",RydHQB_SFuel];
	if (isNil ("RydHQB_ExRefuel")) then {RydHQB_ExRefuel = []};
	_HQ setVariable ["RydHQ_ExRefuel",RydHQB_ExRefuel];
	if (isNil ("RydHQB_FuelPoints")) then {RydHQB_FuelPoints = []};
	_HQ setVariable ["RydHQ_FuelPoints",RydHQB_FuelPoints];
	if (isNil ("RydHQB_FSupportedG")) then {RydHQB_FSupportedG = []};
	_HQ setVariable ["RydHQ_FSupportedG",RydHQB_FSupportedG];
	
	if (isNil ("RydHQB_SAmmo")) then {RydHQB_SAmmo = true};
	_HQ setVariable ["RydHQ_SAmmo",RydHQB_SAmmo];
	if (isNil ("RydHQB_ExReammo")) then {RydHQB_ExReammo = []};
	_HQ setVariable ["RydHQ_ExReammo",RydHQB_ExReammo];
	if (isNil ("RydHQB_AmmoPoints")) then {RydHQB_AmmoPoints = []};
	_HQ setVariable ["RydHQ_AmmoPoints",RydHQB_AmmoPoints];
	if (isNil ("RydHQB_ASupportedG")) then {RydHQB_ASupportedG = []};
	_HQ setVariable ["RydHQ_ASupportedG",RydHQB_ASupportedG];
	
	if (isNil ("RydHQB_SRep")) then {RydHQB_SRep = true};
	_HQ setVariable ["RydHQ_SRep",RydHQB_SRep];
	if (isNil ("RydHQB_ExRepair")) then {RydHQB_ExRepair = []};
	_HQ setVariable ["RydHQ_ExRepair",RydHQB_ExRepair];
	if (isNil ("RydHQB_RepPoints")) then {RydHQB_RepPoints = []};
	_HQ setVariable ["RydHQ_RepPoints",RydHQB_RepPoints];
	if (isNil ("RydHQB_RSupportedG")) then {RydHQB_RSupportedG = []};
	_HQ setVariable ["RydHQ_RSupportedG",RydHQB_RSupportedG];
	
	if (isNil "RydHQB_AirDist") then {RydHQB_AirDist = 4000};
	_HQ setVariable ["RydHQ_AirDist",RydHQB_AirDist];
	
	if (isNil ("RydHQB_CommDelay")) then {RydHQB_CommDelay = 1};
	_HQ setVariable ["RydHQ_CommDelay",RydHQB_CommDelay];
	if (isNil ("RydHQB_Order")) then {RydHQB_Order = "ATTACK"};
	_HQ setVariable ["RydHQ_Order",RydHQB_Order];
	if (isNil ("RydHQB_ReconReserve")) then {RydHQB_ReconReserve = (0.3 * (0.5 + (_HQ getVariable ["RydHQ_Circumspection",0.5])))};
	_HQ setVariable ["RydHQ_ReconReserve",RydHQB_ReconReserve];
	if (isNil ("RydHQB_Exhausted")) then {RydHQB_Exhausted = []};
	_HQ setVariable ["RydHQ_Exhausted",RydHQB_Exhausted];
	if (isNil ("RydHQB_AttackReserve")) then {RydHQB_AttackReserve = (0.5 * (0.5 + ((_HQ getVariable ["RydHQ_Circumspection",0.5])/1.5)))};
	_HQ setVariable ["RydHQ_AttackReserve",RydHQB_AttackReserve];
	if (isNil ("RydHQB_IdleOrd")) then {RydHQB_IdleOrd = true};
	_HQ setVariable ["RydHQ_IdleOrd",RydHQB_IdleOrd];
	if (isNil "RydHQB_IdleDecoy") then {RydHQB_IdleDecoy = objNull};
	_HQ setVariable ["RydHQ_IdleDecoy",RydHQB_IdleDecoy]; 
	if (isNil "RydHQB_SupportDecoy") then {RydHQB_SupportDecoy = objNull};
	_HQ setVariable ["RydHQ_SupportDecoy",RydHQB_SupportDecoy]; 
	if (isNil "RydHQB_RestDecoy") then {RydHQB_RestDecoy = objNull};
	_HQ setVariable ["RydHQ_RestDecoy",RydHQB_RestDecoy]; 
	if (isNil "RydHQB_Sec1") then {RydHQB_Sec1 = objNull};
	_HQ setVariable ["RydHQ_Sec1",RydHQB_Sec1]; 
	if (isNil "RydHQB_Sec2") then {RydHQB_Sec2 = objNull};
	_HQ setVariable ["RydHQ_Sec2",RydHQB_Sec2];
	
	if (isNil "RydHQB_Debug") then {RydHQB_Debug = false};
	_HQ setVariable ["RydHQ_Debug",RydHQB_Debug]; 
	if (isNil "RydHQB_DebugII") then {RydHQB_DebugII = false};
	_HQ setVariable ["RydHQ_DebugII",RydHQB_DebugII]; 
	
	if (isNil "RydHQB_AlwaysKnownU") then {RydHQB_AlwaysKnownU = []};
	_HQ setVariable ["RydHQ_AlwaysKnownU",RydHQB_AlwaysKnownU]; 
	if (isNil "RydHQB_AlwaysUnKnownU") then {RydHQB_AlwaysUnKnownU = []};
	_HQ setVariable ["RydHQ_AlwaysUnKnownU",RydHQB_AlwaysUnKnownU]; 
	
	if (isNil "RydHQB_AOnly") then {RydHQB_AOnly = []};
	_HQ setVariable ["RydHQ_AOnly",RydHQB_AOnly]; 
	if (isNil "RydHQB_ROnly") then {RydHQB_ROnly = []};
	_HQ setVariable ["RydHQ_ROnly",RydHQB_ROnly]; 
	
	if (isNil "RydHQB_AirEvac") then {RydHQB_AirEvac = false};
	_HQ setVariable ["RydHQ_AirEvac",RydHQB_AirEvac];
	
	if (isNil "RydHQB_AAO") then {RydHQB_AAO = false};
	_HQ setVariable ["RydHQ_AAO",RydHQB_AAO]; 
	if (isNil "RydHQB_ForceAAO") then {RydHQB_ForceAAO = false};
	_HQ setVariable ["RydHQ_ForceAAO",RydHQB_ForceAAO];
	
	if (isNil "RydHQB_Taken") then {RydHQB_Taken = []};
	_HQ setVariable ["RydHQ_Taken",RydHQB_Taken]; 
	
	if (isNil "RydHQB_EBDoctrine") then {RydHQB_EBDoctrine = false};
	_HQ setVariable ["RydHQ_EBDoctrine",RydHQB_EBDoctrine]; 
	if (isNil "RydHQB_ForceEBDoctrine") then {RydHQB_ForceEBDoctrine = false};
	_HQ setVariable ["RydHQ_ForceEBDoctrine",RydHQB_ForceEBDoctrine]; 
	
	_HQ setVariable ["RydHQ_Obj1",RydHQB_Obj1];
	_HQ setVariable ["RydHQ_Obj2",RydHQB_Obj2];
	_HQ setVariable ["RydHQ_Obj3",RydHQB_Obj3];
	_HQ setVariable ["RydHQ_Obj4",RydHQB_Obj4];
		
	_objectives = [RydHQB_Obj1,RydHQB_Obj2,RydHQB_Obj3,RydHQB_Obj4];
		
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
			
	if not (isNil "RydHQB_DefFrontL") then {_HQ setVariable ["RydHQ_DefFrontL",RydHQB_DefFrontL]};
	if not (isNil "RydHQB_DefFront1") then {_HQ setVariable ["RydHQ_DefFront1",RydHQB_DefFront1]};
	if not (isNil "RydHQB_DefFront2") then {_HQ setVariable ["RydHQ_DefFront2",RydHQB_DefFront2]};
	if not (isNil "RydHQB_DefFront3") then {_HQ setVariable ["RydHQ_DefFront3",RydHQB_DefFront3]};
	if not (isNil "RydHQB_DefFront4") then {_HQ setVariable ["RydHQ_DefFront4",RydHQB_DefFront4]};
	
	_civF = ["CIV_F","CIV","CIV_RU","BIS_TK_CIV","BIS_CIV_special"];
	if not (isNil ("RydHQB_CivF")) then {_civF = RydHQB_CivF};
	_HQ setVariable ["RydHQ_CivF",_civF];
	
	if (isNil ("RydHQB_Def")) then {RydHQB_Def = []};
	_HQ setVariable ["RydHQ_Def",RydHQB_Def];
	
	_nObj = _HQ getVariable ["RydHQ_NObj",1];

	switch (_nObj) do
		{
		case (1) : {_HQ setVariable ["RydHQ_Obj",RydHQB_Obj1]};
		case (2) : {_HQ setVariable ["RydHQ_Obj",RydHQB_Obj2]};
		case (3) : {_HQ setVariable ["RydHQ_Obj",RydHQB_Obj3]};
		default {_HQ setVariable ["RydHQ_Obj",RydHQB_Obj4]};
		};
	
	call RYD_StatusQuo;
	};