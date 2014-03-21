
_HQ = _this select 0;

_HQ setVariable ["leaderHQ",(leader _HQ)];

_HQ setVariable ["RydHQ_Cyclecount",0];
_cycleC = 0;

if (isNil ("RydHQC_MAtt")) then {RydHQC_MAtt = false};
_HQ setVariable ["RydHQ_MAtt",RydHQC_MAtt];
if ((isNil ("RydHQC_Personality")) or not (_HQ getVariable ["RydHQ_MAtt",false])) then {RydHQC_Personality = "OTHER"};
_HQ setVariable ["RydHQ_Personality",RydHQC_Personality];

if (isNil ("RydHQC_Recklessness")) then {RydHQC_Recklessness = 0.5};
_HQ setVariable ["RydHQ_Recklessness",RydHQC_Recklessness];
if (isNil ("RydHQC_Consistency")) then {RydHQC_Consistency = 0.5};
_HQ setVariable ["RydHQ_Consistency",RydHQC_Consistency];
if (isNil ("RydHQC_Activity")) then {RydHQC_Activity = 0.5};
_HQ setVariable ["RydHQ_Activity",RydHQC_Activity];
if (isNil ("RydHQC_Reflex")) then {RydHQC_Reflex = 0.5};
_HQ setVariable ["RydHQ_Reflex",RydHQC_Reflex];
if (isNil ("RydHQC_Circumspection")) then {RydHQC_Circumspection = 0.5};
_HQ setVariable ["RydHQ_Circumspection",RydHQC_Circumspection];
if (isNil ("RydHQC_Fineness")) then {RydHQC_Fineness = 0.5};
_HQ setVariable ["RydHQ_Fineness",RydHQC_Fineness];

[_HQ] call HAL_Personality;

[[_HQ],HAL_LHQ] call RYD_Spawn;

if (isNil ("RydHQC_Boxed")) then {RydHQC_Boxed = []};
_HQ setVariable ["RydHQ_Boxed",RydHQC_Boxed];

if (isNil ("RydHQC_AmmoBoxes")) then 
	{
	RydHQC_AmmoBoxes = [];

	if not (isNil "RydHQC_AmmoDepot") then 
		{
		_rds = (triggerArea RydHQC_AmmoDepot) select 0;
		RydHQC_AmmoBoxes = (getPosATL RydHQC_AmmoDepot) nearObjects ["ReammoBox_F",_rds]
		}
	};
	
_HQ setVariable ["RydHQ_AmmoBoxes",RydHQC_AmmoBoxes];

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

if (isNil ("RydHQC_Excluded")) then {RydHQC_Excluded = []};
_HQ setVariable ["RydHQ_Excluded",RydHQC_Excluded];
if (isNil ("RydHQC_Fast")) then {RydHQC_Fast = false};
_HQ setVariable ["RydHQ_Fast",RydHQC_Fast];
if (isNil ("RydHQC_ExInfo")) then {RydHQC_ExInfo = false};
_HQ setVariable ["RydHQ_ExInfo",RydHQC_ExInfo];
if (isNil ("RydHQC_ObjHoldTime")) then {RydHQC_ObjHoldTime = 600};
_HQ setVariable ["RydHQ_ObjHoldTime",RydHQC_ObjHoldTime];
if (isNil "RydHQC_NObj") then {RydHQC_NObj = 1};
_HQ setVariable ["RydHQ_NObj",RydHQC_NObj];

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

if (isNil ("RydHQC_SupportWP")) then {RydHQC_SupportWP = false};
	
_HQ setVariable ["RydHQ_SupportWP",RydHQC_SupportWP];

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
	
	if (isNil "RydHQC_Garrison") then {RydHQC_Garrison = []};
	_HQ setVariable ["RydHQ_Garrison",RydHQC_Garrison];
	
	if (isNil ("RydHQC_NoAirCargo")) then {RydHQC_NoAirCargo = false};
	_HQ setVariable ["RydHQ_NoAirCargo",RydHQC_NoAirCargo];
	if (isNil ("RydHQC_NoLandCargo")) then {RydHQC_NoLandCargo = false};
	_HQ setVariable ["RydHQ_NoLandCargo",RydHQC_NoLandCargo];
	if (isNil ("RydHQC_LastFriends")) then {RydHQC_LastFriends = []};
	_HQ setVariable ["RydHQ_LastFriends",RydHQC_LastFriends];
	if (isNil ("RydHQC_CargoFind")) then {RydHQC_CargoFind = 0};
	_HQ setVariable ["RydHQ_CargoFind",RydHQC_CargoFind];
	if (isNil ("RydHQC_Subordinated")) then {RydHQC_Subordinated = []};
	_HQ setVariable ["RydHQ_Subordinated",RydHQC_Subordinated];
	if (isNil ("RydHQC_Included")) then {RydHQC_Included = []};
	_HQ setVariable ["RydHQ_Included",RydHQC_Included];
	if (isNil ("RydHQC_ExcludedG")) then {RydHQC_ExcludedG = []};
	_HQ setVariable ["RydHQ_ExcludedG",RydHQC_ExcludedG];
	if (isNil ("RydHQC_SubAll")) then {RydHQC_SubAll = true};
	_HQ setVariable ["RydHQ_SubAll",RydHQC_SubAll];
	if (isNil ("RydHQC_SubSynchro")) then {RydHQC_SubSynchro = false};
	_HQ setVariable ["RydHQ_SubSynchro",RydHQC_SubSynchro];
	if (isNil ("RydHQC_SubNamed")) then {RydHQC_SubNamed = false};
	_HQ setVariable ["RydHQ_SubNamed",RydHQC_SubNamed];
	if (isNil ("RydHQC_SubZero")) then {RydHQC_SubZero = false};
	_HQ setVariable ["RydHQ_SubZero",RydHQC_SubZero];
	if (isNil ("RydHQC_ReSynchro")) then {RydHQC_ReSynchro = true};
	_HQ setVariable ["RydHQ_ReSynchro",RydHQC_ReSynchro];
	if (isNil ("RydHQC_NameLimit")) then {RydHQC_NameLimit = 100};
	_HQ setVariable ["RydHQ_NameLimit",RydHQC_NameLimit];
	if (isNil ("RydHQC_Surr")) then {RydHQC_Surr = false};
	_HQ setVariable ["RydHQ_Surr",RydHQC_Surr];
	if (isNil ("RydHQC_NoRecon")) then {RydHQC_NoRecon = []};
	_HQ setVariable ["RydHQ_NoRecon",RydHQC_NoRecon];
	if (isNil ("RydHQC_NoAttack")) then {RydHQC_NoAttack = []};
	_HQ setVariable ["RydHQ_NoAttack",RydHQC_NoAttack];
	if (isNil ("RydHQC_CargoOnly")) then {RydHQC_CargoOnly = []};
	_HQ setVariable ["RydHQ_CargoOnly",RydHQC_CargoOnly];
	if (isNil ("RydHQC_NoCargo")) then {RydHQC_NoCargo = []};
	_HQ setVariable ["RydHQ_NoCargo",RydHQC_NoCargo];
	if (isNil ("RydHQC_NoFlank")) then {RydHQC_NoFlank = []};
	_HQ setVariable ["RydHQ_NoFlank",RydHQC_NoFlank];
	if (isNil ("RydHQC_NoDef")) then {RydHQC_NoDef = []};
	_HQ setVariable ["RydHQ_NoDef",RydHQC_NoDef];
	if (isNil ("RydHQC_FirstToFight")) then {RydHQC_FirstToFight = []};
	_HQ setVariable ["RydHQ_FirstToFight",RydHQC_FirstToFight];
	if (isNil ("RydHQC_VoiceComm")) then {RydHQC_VoiceComm = true};
	_HQ setVariable ["RydHQ_VoiceComm",RydHQC_VoiceComm];
	if (isNil ("RydHQC_FrontA")) then {RydHQC_Front = false};
	_HQ setVariable ["RydHQ_FrontA",RydHQC_Front];
	if (isNil ("RydHQC_LRelocating")) then {RydHQC_LRelocating = false};
	_HQ setVariable ["RydHQ_LRelocating",RydHQC_LRelocating];
	if (isNil ("RydHQC_Flee")) then {RydHQC_Flee = true};
	_HQ setVariable ["RydHQ_Flee",RydHQC_Flee];
	if (isNil ("RydHQC_GarrR")) then {RydHQC_GarrR = 500};
	_HQ setVariable ["RydHQ_GarrR",RydHQC_GarrR];
	if (isNil ("RydHQC_Rush")) then {RydHQC_Rush = false};
	_HQ setVariable ["RydHQ_Rush",RydHQC_Rush];
	if (isNil ("RydHQC_GarrVehAb")) then {RydHQC_GarrVehAb = false};
	_HQ setVariable ["RydHQ_GarrVehAb",RydHQC_GarrVehAb];
	if (isNil ("RydHQC_DefendObjectives")) then {RydHQC_DefendObjectives = 4};
	_HQ setVariable ["RydHQ_DefendObjectives",RydHQC_DefendObjectives];
	if (isNil ("RydHQC_DefSpot")) then {RydHQC_DefSpot = []};
	_HQ setVariable ["RydHQ_DefSpot",RydHQC_DefSpot];
	if (isNil ("RydHQC_RecDefSpot")) then {RydHQC_RecDefSpot = []};
	_HQ setVariable ["RydHQ_RecDefSpot",RydHQC_RecDefSpot];
	if (isNil "RydHQC_Flare") then {RydHQC_Flare = true};
	_HQ setVariable ["RydHQ_Flare",RydHQC_Flare];
	if (isNil "RydHQC_Smoke") then {RydHQC_Smoke = true};
	_HQ setVariable ["RydHQ_Smoke",RydHQC_Smoke];
	if (isNil "RydHQC_NoRec") then {RydHQC_NoRec = 1};
	_HQ setVariable ["RydHQ_NoRec",RydHQC_NoRec];
	if (isNil "RydHQC_RapidCapt") then {RydHQC_RapidCapt = 10};
	_HQ setVariable ["RydHQ_RapidCapt",RydHQC_RapidCapt];
	if (isNil "RydHQC_Muu") then {RydHQC_Muu = 1};
	_HQ setVariable ["RydHQ_Muu",RydHQC_Muu];
	if (isNil "RydHQC_ArtyShells") then {RydHQC_ArtyShells = 1};
	_HQ setVariable ["RydHQ_ArtyShells",RydHQC_ArtyShells];
	if (isNil "RydHQC_Withdraw") then {RydHQC_Withdraw = 1};
	_HQ setVariable ["RydHQ_Withdraw",RydHQC_Withdraw];
	if (isNil "RydHQC_Berserk") then {RydHQC_Berserk = false};
	_HQ setVariable ["RydHQ_Berserk",RydHQC_Berserk];
	if (isNil "RydHQC_IDChance") then {RydHQC_IDChance = 100};
	_HQ setVariable ["RydHQ_IDChance",RydHQC_IDChance];
	if (isNil "RydHQC_RDChance") then {RydHQC_RDChance = 100};
	_HQ setVariable ["RydHQ_RDChance",RydHQC_RDChance];
	if (isNil "RydHQC_SDChance") then {RydHQC_SDChance = 100};
	_HQ setVariable ["RydHQ_SDChance",RydHQC_SDChance];
	if (isNil "RydHQC_AmmoDrop") then {RydHQC_AmmoDrop = []};
	_HQ setVariable ["RydHQ_AmmoDrop",RydHQC_AmmoDrop];
	if (isNil "RydHQC_SFTargets") then {RydHQC_SFTargets = []};
	_HQ setVariable ["RydHQ_SFTargets",RydHQC_SFTargets];
	if (isNil "RydHQC_LZ") then {RydHQC_LZ = false};
	_HQ setVariable ["RydHQ_LZ",RydHQC_LZ];
	if (isNil "RydHQC_SFBodyGuard") then {RydHQC_SFBodyGuard = []};
	_HQ setVariable ["RydHQ_SFBodyGuard",RydHQC_SFBodyGuard];
	if (isNil "RydHQC_DynForm") then {RydHQC_DynForm = false};
	_HQ setVariable ["RydHQ_DynForm",RydHQC_DynForm];
	if (isNil "RydHQC_UnlimitedCapt") then {RydHQC_UnlimitedCapt = false};
	_HQ setVariable ["RydHQ_UnlimitedCapt",RydHQC_UnlimitedCapt];
	if (isNil "RydHQC_CaptLimit") then {RydHQC_CaptLimit = 10};
	_HQ setVariable ["RydHQ_CaptLimit",RydHQC_CaptLimit];
	if (isNil "RydHQC_GetHQInside") then {RydHQC_GetHQInside = false};
	_HQ setVariable ["RydHQ_GetHQInside",RydHQC_GetHQInside];
	if (isNil "RydHQC_WA") then {RydHQC_WA = true};
	_HQ setVariable ["RydHQ_WA",RydHQC_WA];
	
	if (isNil ("RydHQC_ResetNow")) then {RydHQC_ResetNow = false};
	_HQ setVariable ["RydHQ_ResetNow",RydHQC_ResetNow];
	if (isNil ("RydHQC_ResetOnDemand")) then {RydHQC_ResetOnDemand = false};
	_HQ setVariable ["RydHQ_ResetOnDemand",RydHQC_ResetOnDemand];
	if (isNil ("RydHQC_ResetTime")) then {RydHQC_ResetTime = 600};
	_HQ setVariable ["RydHQ_ResetTime",RydHQC_ResetTime];
	if (isNil ("RydHQC_Combining")) then {RydHQC_Combining = false};
	_HQ setVariable ["RydHQ_Combining",RydHQC_Combining];
	if (isNil ("RydHQC_ObjRadius1")) then {RydHQC_ObjRadius1 = 300};
	_HQ setVariable ["RydHQ_ObjRadius1",RydHQC_ObjRadius1];
	if (isNil ("RydHQC_ObjRadius2")) then {RydHQC_ObjRadius2 = 500};
	_HQ setVariable ["RydHQ_ObjRadius2",RydHQC_ObjRadius2];
	if (isNil ("RydHQC_KnowTL")) then {RydHQC_KnowTL = true};
	_HQ setVariable ["RydHQ_KnowTL",RydHQC_KnowTL];
	
	if (isNil ("RydHQC_SMed")) then {RydHQC_SMed = true};
	_HQ setVariable ["RydHQ_SMed",RydHQC_SMed];
	if (isNil ("RydHQC_ExMedic")) then {RydHQC_ExMedic = []};
	_HQ setVariable ["RydHQ_ExMedic",RydHQC_ExMedic];
	if (isNil ("RydHQC_MedPoints")) then {RydHQC_MedPoints = []};
	_HQ setVariable ["RydHQ_MedPoints",RydHQC_MedPoints];
	if (isNil ("RydHQC_SupportedG")) then {RydHQC_SupportedG = []};
	_HQ setVariable ["RydHQ_SupportedG",RydHQC_SupportedG];
	
	if (isNil ("RydHQC_SFuel")) then {RydHQC_SFuel = true};
	_HQ setVariable ["RydHQ_SFuel",RydHQC_SFuel];
	if (isNil ("RydHQC_ExRefuel")) then {RydHQC_ExRefuel = []};
	_HQ setVariable ["RydHQ_ExRefuel",RydHQC_ExRefuel];
	if (isNil ("RydHQC_FuelPoints")) then {RydHQC_FuelPoints = []};
	_HQ setVariable ["RydHQ_FuelPoints",RydHQC_FuelPoints];
	if (isNil ("RydHQC_FSupportedG")) then {RydHQC_FSupportedG = []};
	_HQ setVariable ["RydHQ_FSupportedG",RydHQC_FSupportedG];
	
	if (isNil ("RydHQC_SAmmo")) then {RydHQC_SAmmo = true};
	_HQ setVariable ["RydHQ_SAmmo",RydHQC_SAmmo];
	if (isNil ("RydHQC_ExReammo")) then {RydHQC_ExReammo = []};
	_HQ setVariable ["RydHQ_ExReammo",RydHQC_ExReammo];
	if (isNil ("RydHQC_AmmoPoints")) then {RydHQC_AmmoPoints = []};
	_HQ setVariable ["RydHQ_AmmoPoints",RydHQC_AmmoPoints];
	if (isNil ("RydHQC_ASupportedG")) then {RydHQC_ASupportedG = []};
	_HQ setVariable ["RydHQ_ASupportedG",RydHQC_ASupportedG];
	
	if (isNil ("RydHQC_SRep")) then {RydHQC_SRep = true};
	_HQ setVariable ["RydHQ_SRep",RydHQC_SRep];
	if (isNil ("RydHQC_ExRepair")) then {RydHQC_ExRepair = []};
	_HQ setVariable ["RydHQ_ExRepair",RydHQC_ExRepair];
	if (isNil ("RydHQC_RepPoints")) then {RydHQC_RepPoints = []};
	_HQ setVariable ["RydHQ_RepPoints",RydHQC_RepPoints];
	if (isNil ("RydHQC_RSupportedG")) then {RydHQC_RSupportedG = []};
	_HQ setVariable ["RydHQ_RSupportedG",RydHQC_RSupportedG];
	
	if (isNil "RydHQC_AirDist") then {RydHQC_AirDist = 4000};
	_HQ setVariable ["RydHQ_AirDist",RydHQC_AirDist];
	
	if (isNil ("RydHQC_CommDelay")) then {RydHQC_CommDelay = 1};
	_HQ setVariable ["RydHQ_CommDelay",RydHQC_CommDelay];
	if (isNil ("RydHQC_Order")) then {RydHQC_Order = "ATTACK"};
	_HQ setVariable ["RydHQ_Order",RydHQC_Order];
	if (isNil ("RydHQC_ReconReserve")) then {RydHQC_ReconReserve = (0.3 * (0.5 + (_HQ getVariable ["RydHQ_Circumspection",0.5])))};
	_HQ setVariable ["RydHQ_ReconReserve",RydHQC_ReconReserve];
	if (isNil ("RydHQC_Exhausted")) then {RydHQC_Exhausted = []};
	_HQ setVariable ["RydHQ_Exhausted",RydHQC_Exhausted];
	if (isNil ("RydHQC_AttackReserve")) then {RydHQC_AttackReserve = (0.5 * (0.5 + ((_HQ getVariable ["RydHQ_Circumspection",0.5])/1.5)))};
	_HQ setVariable ["RydHQ_AttackReserve",RydHQC_AttackReserve];
	if (isNil ("RydHQC_IdleOrd")) then {RydHQC_IdleOrd = true};
	_HQ setVariable ["RydHQ_IdleOrd",RydHQC_IdleOrd];
	if (isNil "RydHQC_IdleDecoy") then {RydHQC_IdleDecoy = objNull};
	_HQ setVariable ["RydHQ_IdleDecoy",RydHQC_IdleDecoy]; 
	if (isNil "RydHQC_SupportDecoy") then {RydHQC_SupportDecoy = objNull};
	_HQ setVariable ["RydHQ_SupportDecoy",RydHQC_SupportDecoy]; 
	if (isNil "RydHQC_RestDecoy") then {RydHQC_RestDecoy = objNull};
	_HQ setVariable ["RydHQ_RestDecoy",RydHQC_RestDecoy]; 
	if (isNil "RydHQC_Sec1") then {RydHQC_Sec1 = objNull};
	_HQ setVariable ["RydHQ_Sec1",RydHQC_Sec1]; 
	if (isNil "RydHQC_Sec2") then {RydHQC_Sec2 = objNull};
	_HQ setVariable ["RydHQ_Sec2",RydHQC_Sec2];
	
	if (isNil "RydHQC_Debug") then {RydHQC_Debug = false};
	_HQ setVariable ["RydHQ_Debug",RydHQC_Debug]; 
	if (isNil "RydHQC_DebugII") then {RydHQC_DebugII = false};
	_HQ setVariable ["RydHQ_DebugII",RydHQC_DebugII]; 
	
	if (isNil "RydHQC_AlwaysKnownU") then {RydHQC_AlwaysKnownU = []};
	_HQ setVariable ["RydHQ_AlwaysKnownU",RydHQC_AlwaysKnownU]; 
	if (isNil "RydHQC_AlwaysUnKnownU") then {RydHQC_AlwaysUnKnownU = []};
	_HQ setVariable ["RydHQ_AlwaysUnKnownU",RydHQC_AlwaysUnKnownU]; 
	
	if (isNil "RydHQC_AOnly") then {RydHQC_AOnly = []};
	_HQ setVariable ["RydHQ_AOnly",RydHQC_AOnly]; 
	if (isNil "RydHQC_ROnly") then {RydHQC_ROnly = []};
	_HQ setVariable ["RydHQ_ROnly",RydHQC_ROnly]; 
	
	if (isNil "RydHQC_AirEvac") then {RydHQC_AirEvac = false};
	_HQ setVariable ["RydHQ_AirEvac",RydHQC_AirEvac];
	
	if (isNil "RydHQC_AAO") then {RydHQC_AAO = false};
	_HQ setVariable ["RydHQ_AAO",RydHQC_AAO]; 
	if (isNil "RydHQC_ForceAAO") then {RydHQC_ForceAAO = false};
	_HQ setVariable ["RydHQ_ForceAAO",RydHQC_ForceAAO];
	
	if (isNil "RydHQC_Taken") then {RydHQC_Taken = []};
	_HQ setVariable ["RydHQ_Taken",RydHQC_Taken]; 
	
	if (isNil "RydHQC_EBDoctrine") then {RydHQC_EBDoctrine = false};
	_HQ setVariable ["RydHQ_EBDoctrine",RydHQC_EBDoctrine]; 
	if (isNil "RydHQC_ForceEBDoctrine") then {RydHQC_ForceEBDoctrine = false};
	_HQ setVariable ["RydHQ_ForceEBDoctrine",RydHQC_ForceEBDoctrine]; 
	
	_HQ setVariable ["RydHQ_Obj1",RydHQC_Obj1];
	_HQ setVariable ["RydHQ_Obj2",RydHQC_Obj2];
	_HQ setVariable ["RydHQ_Obj3",RydHQC_Obj3];
	_HQ setVariable ["RydHQ_Obj4",RydHQC_Obj4];
	
	_objectives = [RydHQC_Obj1,RydHQC_Obj2,RydHQC_Obj3,RydHQC_Obj4];
		
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
		
	if not (isNil "RydHQC_DefFrontL") then {_HQ setVariable ["RydHQ_DefFrontL",RydHQC_DefFrontL]};
	if not (isNil "RydHQC_DefFront1") then {_HQ setVariable ["RydHQ_DefFront1",RydHQC_DefFront1]};
	if not (isNil "RydHQC_DefFront2") then {_HQ setVariable ["RydHQ_DefFront2",RydHQC_DefFront2]};
	if not (isNil "RydHQC_DefFront3") then {_HQ setVariable ["RydHQ_DefFront3",RydHQC_DefFront3]};
	if not (isNil "RydHQC_DefFront4") then {_HQ setVariable ["RydHQ_DefFront4",RydHQC_DefFront4]};
	
	_civF = ["CIV_F","CIV","CIV_RU","BIS_TK_CIV","BIS_CIV_special"];
	if not (isNil ("RydHQC_CivF")) then {_civF = RydHQC_CivF};
	_HQ setVariable ["RydHQ_CivF",_civF];
	
	if (isNil ("RydHQC_Def")) then {RydHQC_Def = []};
	_HQ setVariable ["RydHQ_Def",RydHQC_Def];
	
	_nObj = _HQ getVariable ["RydHQ_NObj",1];

	switch (_nObj) do
		{
		case (1) : {_HQ setVariable ["RydHQ_Obj",RydHQC_Obj1]};
		case (2) : {_HQ setVariable ["RydHQ_Obj",RydHQC_Obj2]};
		case (3) : {_HQ setVariable ["RydHQ_Obj",RydHQC_Obj3]};
		default {_HQ setVariable ["RydHQ_Obj",RydHQC_Obj4]};
		};
		
	call RYD_StatusQuo;
	};