_SCRname = "SitRepH";
_HQ = _this select 0;

_HQ setVariable ["leaderHQ",(leader _HQ)];

_HQ setVariable ["RydHQ_Cyclecount",0];
_cycleC = 0;

if (isNil ("RydHQH_MAtt")) then {RydHQH_MAtt = false};
_HQ setVariable ["RydHQ_MAtt",RydHQH_MAtt];
if ((isNil ("RydHQH_Personality")) or not (_HQ getVariable ["RydHQ_MAtt",false])) then {RydHQH_Personality = "OTHER"};
_HQ setVariable ["RydHQ_Personality",RydHQH_Personality];

if (isNil ("RydHQH_Recklessness")) then {RydHQH_Recklessness = 0.5};
_HQ setVariable ["RydHQ_Recklessness",RydHQH_Recklessness];
if (isNil ("RydHQH_Consistency")) then {RydHQH_Consistency = 0.5};
_HQ setVariable ["RydHQ_Consistency",RydHQH_Consistency];
if (isNil ("RydHQH_Activity")) then {RydHQH_Activity = 0.5};
_HQ setVariable ["RydHQ_Activity",RydHQH_Activity];
if (isNil ("RydHQH_Reflex")) then {RydHQH_Reflex = 0.5};
_HQ setVariable ["RydHQ_Reflex",RydHQH_Reflex];
if (isNil ("RydHQH_Circumspection")) then {RydHQH_Circumspection = 0.5};
_HQ setVariable ["RydHQ_Circumspection",RydHQH_Circumspection];
if (isNil ("RydHQH_Fineness")) then {RydHQH_Fineness = 0.5};
_HQ setVariable ["RydHQ_Fineness",RydHQH_Fineness];

[_HQ] call HAL_Personality;

[[_HQ],HAL_LHQ] call RYD_Spawn;

if (isNil ("RydHQH_Boxed")) then {RydHQH_Boxed = []};
_HQ setVariable ["RydHQ_Boxed",RydHQH_Boxed];

if (isNil ("RydHQH_AmmoBoxes")) then 
	{
	RydHQH_AmmoBoxes = [];

	if not (isNil "RydHQH_AmmoDepot") then 
		{
		_rds = (triggerArea RydHQH_AmmoDepot) select 0;
		RydHQH_AmmoBoxes = (getPosATL RydHQH_AmmoDepot) nearObjects ["ReammoBox_F",_rds]
		}
	};
	
_HQ setVariable ["RydHQ_AmmoBoxes",RydHQH_AmmoBoxes];

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

if (isNil ("RydHQH_Excluded")) then {RydHQH_Excluded = []};
_HQ setVariable ["RydHQ_Excluded",RydHQH_Excluded];
if (isNil ("RydHQH_Fast")) then {RydHQH_Fast = false};
_HQ setVariable ["RydHQ_Fast",RydHQH_Fast];
if (isNil ("RydHQH_ExInfo")) then {RydHQH_ExInfo = false};
_HQ setVariable ["RydHQ_ExInfo",RydHQH_ExInfo];
if (isNil ("RydHQH_ObjHoldTime")) then {RydHQH_ObjHoldTime = 600};
_HQ setVariable ["RydHQ_ObjHoldTime",RydHQH_ObjHoldTime];
if (isNil "RydHQH_NObj") then {RydHQH_NObj = 1};
_HQ setVariable ["RydHQ_NObj",RydHQH_NObj];

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

if (isNil ("RydHQH_SupportWP")) then {RydHQH_SupportWP = false};
	
_HQ setVariable ["RydHQ_SupportWP",RydHQH_SupportWP];

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
	
	if (isNil "RydHQH_Garrison") then {RydHQH_Garrison = []};
	_HQ setVariable ["RydHQ_Garrison",RydHQH_Garrison];
	
	if (isNil ("RydHQH_NoAirCargo")) then {RydHQH_NoAirCargo = false};
	_HQ setVariable ["RydHQ_NoAirCargo",RydHQH_NoAirCargo];
	if (isNil ("RydHQH_NoLandCargo")) then {RydHQH_NoLandCargo = false};
	_HQ setVariable ["RydHQ_NoLandCargo",RydHQH_NoLandCargo];
	if (isNil ("RydHQH_LastFriends")) then {RydHQH_LastFriends = []};
	_HQ setVariable ["RydHQ_LastFriends",RydHQH_LastFriends];
	if (isNil ("RydHQH_CargoFind")) then {RydHQH_CargoFind = 0};
	_HQ setVariable ["RydHQ_CargoFind",RydHQH_CargoFind];
	if (isNil ("RydHQH_Subordinated")) then {RydHQH_Subordinated = []};
	_HQ setVariable ["RydHQ_Subordinated",RydHQH_Subordinated];
	if (isNil ("RydHQH_Included")) then {RydHQH_Included = []};
	_HQ setVariable ["RydHQ_Included",RydHQH_Included];
	if (isNil ("RydHQH_ExcludedG")) then {RydHQH_ExcludedG = []};
	_HQ setVariable ["RydHQ_ExcludedG",RydHQH_ExcludedG];
	if (isNil ("RydHQH_SubAll")) then {RydHQH_SubAll = true};
	_HQ setVariable ["RydHQ_SubAll",RydHQH_SubAll];
	if (isNil ("RydHQH_SubSynchro")) then {RydHQH_SubSynchro = false};
	_HQ setVariable ["RydHQ_SubSynchro",RydHQH_SubSynchro];
	if (isNil ("RydHQH_SubNamed")) then {RydHQH_SubNamed = false};
	_HQ setVariable ["RydHQ_SubNamed",RydHQH_SubNamed];
	if (isNil ("RydHQH_SubZero")) then {RydHQH_SubZero = false};
	_HQ setVariable ["RydHQ_SubZero",RydHQH_SubZero];
	if (isNil ("RydHQH_ReSynchro")) then {RydHQH_ReSynchro = true};
	_HQ setVariable ["RydHQ_ReSynchro",RydHQH_ReSynchro];
	if (isNil ("RydHQH_NameLimit")) then {RydHQH_NameLimit = 100};
	_HQ setVariable ["RydHQ_NameLimit",RydHQH_NameLimit];
	if (isNil ("RydHQH_Surr")) then {RydHQH_Surr = false};
	_HQ setVariable ["RydHQ_Surr",RydHQH_Surr];
	if (isNil ("RydHQH_NoRecon")) then {RydHQH_NoRecon = []};
	_HQ setVariable ["RydHQ_NoRecon",RydHQH_NoRecon];
	if (isNil ("RydHQH_NoAttack")) then {RydHQH_NoAttack = []};
	_HQ setVariable ["RydHQ_NoAttack",RydHQH_NoAttack];
	if (isNil ("RydHQH_CargoOnly")) then {RydHQH_CargoOnly = []};
	_HQ setVariable ["RydHQ_CargoOnly",RydHQH_CargoOnly];
	if (isNil ("RydHQH_NoCargo")) then {RydHQH_NoCargo = []};
	_HQ setVariable ["RydHQ_NoCargo",RydHQH_NoCargo];
	if (isNil ("RydHQH_NoFlank")) then {RydHQH_NoFlank = []};
	_HQ setVariable ["RydHQ_NoFlank",RydHQH_NoFlank];
	if (isNil ("RydHQH_NoDef")) then {RydHQH_NoDef = []};
	_HQ setVariable ["RydHQ_NoDef",RydHQH_NoDef];
	if (isNil ("RydHQH_FirstToFight")) then {RydHQH_FirstToFight = []};
	_HQ setVariable ["RydHQ_FirstToFight",RydHQH_FirstToFight];
	if (isNil ("RydHQH_VoiceComm")) then {RydHQH_VoiceComm = true};
	_HQ setVariable ["RydHQ_VoiceComm",RydHQH_VoiceComm];
	if (isNil ("RydHQH_FrontA")) then {RydHQH_Front = false};
	_HQ setVariable ["RydHQ_FrontA",RydHQH_Front];
	if (isNil ("RydHQH_LRelocating")) then {RydHQH_LRelocating = false};
	_HQ setVariable ["RydHQ_LRelocating",RydHQH_LRelocating];
	if (isNil ("RydHQH_Flee")) then {RydHQH_Flee = true};
	_HQ setVariable ["RydHQ_Flee",RydHQH_Flee];
	if (isNil ("RydHQH_GarrR")) then {RydHQH_GarrR = 500};
	_HQ setVariable ["RydHQ_GarrR",RydHQH_GarrR];
	if (isNil ("RydHQH_Rush")) then {RydHQH_Rush = false};
	_HQ setVariable ["RydHQ_Rush",RydHQH_Rush];
	if (isNil ("RydHQH_GarrVehAb")) then {RydHQH_GarrVehAb = false};
	_HQ setVariable ["RydHQ_GarrVehAb",RydHQH_GarrVehAb];
	if (isNil ("RydHQH_DefendObjectives")) then {RydHQH_DefendObjectives = 4};
	_HQ setVariable ["RydHQ_DefendObjectives",RydHQH_DefendObjectives];
	if (isNil ("RydHQH_DefSpot")) then {RydHQH_DefSpot = []};
	_HQ setVariable ["RydHQ_DefSpot",RydHQH_DefSpot];
	if (isNil ("RydHQH_RecDefSpot")) then {RydHQH_RecDefSpot = []};
	_HQ setVariable ["RydHQ_RecDefSpot",RydHQH_RecDefSpot];
	if (isNil "RydHQH_Flare") then {RydHQH_Flare = true};
	_HQ setVariable ["RydHQ_Flare",RydHQH_Flare];
	if (isNil "RydHQH_Smoke") then {RydHQH_Smoke = true};
	_HQ setVariable ["RydHQ_Smoke",RydHQH_Smoke];
	if (isNil "RydHQH_NoRec") then {RydHQH_NoRec = 1};
	_HQ setVariable ["RydHQ_NoRec",RydHQH_NoRec];
	if (isNil "RydHQH_RapidCapt") then {RydHQH_RapidCapt = 10};
	_HQ setVariable ["RydHQ_RapidCapt",RydHQH_RapidCapt];
	if (isNil "RydHQH_Muu") then {RydHQH_Muu = 1};
	_HQ setVariable ["RydHQ_Muu",RydHQH_Muu];
	if (isNil "RydHQH_ArtyShells") then {RydHQH_ArtyShells = 1};
	_HQ setVariable ["RydHQ_ArtyShells",RydHQH_ArtyShells];
	if (isNil "RydHQH_Withdraw") then {RydHQH_Withdraw = 1};
	_HQ setVariable ["RydHQ_Withdraw",RydHQH_Withdraw];
	if (isNil "RydHQH_Berserk") then {RydHQH_Berserk = false};
	_HQ setVariable ["RydHQ_Berserk",RydHQH_Berserk];
	if (isNil "RydHQH_IDChance") then {RydHQH_IDChance = 100};
	_HQ setVariable ["RydHQ_IDChance",RydHQH_IDChance];
	if (isNil "RydHQH_RDChance") then {RydHQH_RDChance = 100};
	_HQ setVariable ["RydHQ_RDChance",RydHQH_RDChance];
	if (isNil "RydHQH_SDChance") then {RydHQH_SDChance = 100};
	_HQ setVariable ["RydHQ_SDChance",RydHQH_SDChance];
	if (isNil "RydHQH_AmmoDrop") then {RydHQH_AmmoDrop = []};
	_HQ setVariable ["RydHQ_AmmoDrop",RydHQH_AmmoDrop];
	if (isNil "RydHQH_SFTargets") then {RydHQH_SFTargets = []};
	_HQ setVariable ["RydHQ_SFTargets",RydHQH_SFTargets];
	if (isNil "RydHQH_LZ") then {RydHQH_LZ = false};
	_HQ setVariable ["RydHQ_LZ",RydHQH_LZ];
	if (isNil "RydHQH_SFBodyGuard") then {RydHQH_SFBodyGuard = []};
	_HQ setVariable ["RydHQ_SFBodyGuard",RydHQH_SFBodyGuard];
	if (isNil "RydHQH_DynForm") then {RydHQH_DynForm = false};
	_HQ setVariable ["RydHQ_DynForm",RydHQH_DynForm];
	if (isNil "RydHQH_UnlimitedCapt") then {RydHQH_UnlimitedCapt = false};
	_HQ setVariable ["RydHQ_UnlimitedCapt",RydHQH_UnlimitedCapt];
	if (isNil "RydHQH_CaptLimit") then {RydHQH_CaptLimit = 10};
	_HQ setVariable ["RydHQ_CaptLimit",RydHQH_CaptLimit];
	if (isNil "RydHQH_GetHQInside") then {RydHQH_GetHQInside = false};
	_HQ setVariable ["RydHQ_GetHQInside",RydHQH_GetHQInside];
	if (isNil "RydHQH_WA") then {RydHQH_WA = true};
	_HQ setVariable ["RydHQ_WA",RydHQH_WA];
	
	if (isNil ("RydHQH_ResetNow")) then {RydHQH_ResetNow = false};
	_HQ setVariable ["RydHQ_ResetNow",RydHQH_ResetNow];
	if (isNil ("RydHQH_ResetOnDemand")) then {RydHQH_ResetOnDemand = false};
	_HQ setVariable ["RydHQ_ResetOnDemand",RydHQH_ResetOnDemand];
	if (isNil ("RydHQH_ResetTime")) then {RydHQH_ResetTime = 600};
	_HQ setVariable ["RydHQ_ResetTime",RydHQH_ResetTime];
	if (isNil ("RydHQH_Combining")) then {RydHQH_Combining = false};
	_HQ setVariable ["RydHQ_Combining",RydHQH_Combining];
	if (isNil ("RydHQH_ObjRadius1")) then {RydHQH_ObjRadius1 = 300};
	_HQ setVariable ["RydHQ_ObjRadius1",RydHQH_ObjRadius1];
	if (isNil ("RydHQH_ObjRadius2")) then {RydHQH_ObjRadius2 = 500};
	_HQ setVariable ["RydHQ_ObjRadius2",RydHQH_ObjRadius2];
	if (isNil ("RydHQH_KnowTL")) then {RydHQH_KnowTL = true};
	_HQ setVariable ["RydHQ_KnowTL",RydHQH_KnowTL];
	
	if (isNil ("RydHQH_SMed")) then {RydHQH_SMed = true};
	_HQ setVariable ["RydHQ_SMed",RydHQH_SMed];
	if (isNil ("RydHQH_ExMedic")) then {RydHQH_ExMedic = []};
	_HQ setVariable ["RydHQ_ExMedic",RydHQH_ExMedic];
	if (isNil ("RydHQH_MedPoints")) then {RydHQH_MedPoints = []};
	_HQ setVariable ["RydHQ_MedPoints",RydHQH_MedPoints];
	if (isNil ("RydHQH_SupportedG")) then {RydHQH_SupportedG = []};
	_HQ setVariable ["RydHQ_SupportedG",RydHQH_SupportedG];
	
	if (isNil ("RydHQH_SFuel")) then {RydHQH_SFuel = true};
	_HQ setVariable ["RydHQ_SFuel",RydHQH_SFuel];
	if (isNil ("RydHQH_ExRefuel")) then {RydHQH_ExRefuel = []};
	_HQ setVariable ["RydHQ_ExRefuel",RydHQH_ExRefuel];
	if (isNil ("RydHQH_FuelPoints")) then {RydHQH_FuelPoints = []};
	_HQ setVariable ["RydHQ_FuelPoints",RydHQH_FuelPoints];
	if (isNil ("RydHQH_FSupportedG")) then {RydHQH_FSupportedG = []};
	_HQ setVariable ["RydHQ_FSupportedG",RydHQH_FSupportedG];
	
	if (isNil ("RydHQH_SAmmo")) then {RydHQH_SAmmo = true};
	_HQ setVariable ["RydHQ_SAmmo",RydHQH_SAmmo];
	if (isNil ("RydHQH_ExReammo")) then {RydHQH_ExReammo = []};
	_HQ setVariable ["RydHQ_ExReammo",RydHQH_ExReammo];
	if (isNil ("RydHQH_AmmoPoints")) then {RydHQH_AmmoPoints = []};
	_HQ setVariable ["RydHQ_AmmoPoints",RydHQH_AmmoPoints];
	if (isNil ("RydHQH_ASupportedG")) then {RydHQH_ASupportedG = []};
	_HQ setVariable ["RydHQ_ASupportedG",RydHQH_ASupportedG];
	
	if (isNil ("RydHQH_SRep")) then {RydHQH_SRep = true};
	_HQ setVariable ["RydHQ_SRep",RydHQH_SRep];
	if (isNil ("RydHQH_ExRepair")) then {RydHQH_ExRepair = []};
	_HQ setVariable ["RydHQ_ExRepair",RydHQH_ExRepair];
	if (isNil ("RydHQH_RepPoints")) then {RydHQH_RepPoints = []};
	_HQ setVariable ["RydHQ_RepPoints",RydHQH_RepPoints];
	if (isNil ("RydHQH_RSupportedG")) then {RydHQH_RSupportedG = []};
	_HQ setVariable ["RydHQ_RSupportedG",RydHQH_RSupportedG];
	
	if (isNil "RydHQH_AirDist") then {RydHQH_AirDist = 4000};
	_HQ setVariable ["RydHQ_AirDist",RydHQH_AirDist];
	
	if (isNil ("RydHQH_CommDelay")) then {RydHQH_CommDelay = 1};
	_HQ setVariable ["RydHQ_CommDelay",RydHQH_CommDelay];
	if (isNil ("RydHQH_Order")) then {RydHQH_Order = "ATTACK"};
	_HQ setVariable ["RydHQ_Order",RydHQH_Order];
	if (isNil ("RydHQH_ReconReserve")) then {RydHQH_ReconReserve = (0.3 * (0.5 + (_HQ getVariable ["RydHQ_Circumspection",0.5])))};
	_HQ setVariable ["RydHQ_ReconReserve",RydHQH_ReconReserve];
	if (isNil ("RydHQH_Exhausted")) then {RydHQH_Exhausted = []};
	_HQ setVariable ["RydHQ_Exhausted",RydHQH_Exhausted];
	if (isNil ("RydHQH_AttackReserve")) then {RydHQH_AttackReserve = (0.5 * (0.5 + ((_HQ getVariable ["RydHQ_Circumspection",0.5])/1.5)))};
	_HQ setVariable ["RydHQ_AttackReserve",RydHQH_AttackReserve];
	if (isNil ("RydHQH_IdleOrd")) then {RydHQH_IdleOrd = true};
	_HQ setVariable ["RydHQ_IdleOrd",RydHQH_IdleOrd];
	if (isNil "RydHQH_IdleDecoy") then {RydHQH_IdleDecoy = objNull};
	_HQ setVariable ["RydHQ_IdleDecoy",RydHQH_IdleDecoy]; 
	if (isNil "RydHQH_SupportDecoy") then {RydHQH_SupportDecoy = objNull};
	_HQ setVariable ["RydHQ_SupportDecoy",RydHQH_SupportDecoy]; 
	if (isNil "RydHQH_RestDecoy") then {RydHQH_RestDecoy = objNull};
	_HQ setVariable ["RydHQ_RestDecoy",RydHQH_RestDecoy]; 
	if (isNil "RydHQH_Sec1") then {RydHQH_Sec1 = objNull};
	_HQ setVariable ["RydHQ_Sec1",RydHQH_Sec1]; 
	if (isNil "RydHQH_Sec2") then {RydHQH_Sec2 = objNull};
	_HQ setVariable ["RydHQ_Sec2",RydHQH_Sec2]; 
	
	if (isNil "RydHQH_Debug") then {RydHQH_Debug = false};
	_HQ setVariable ["RydHQ_Debug",RydHQH_Debug]; 
	if (isNil "RydHQH_DebugII") then {RydHQH_DebugII = false};
	_HQ setVariable ["RydHQ_DebugII",RydHQH_DebugII]; 
	
	if (isNil "RydHQH_AlwaysKnownU") then {RydHQH_AlwaysKnownU = []};
	_HQ setVariable ["RydHQ_AlwaysKnownU",RydHQH_AlwaysKnownU]; 
	if (isNil "RydHQH_AlwaysUnKnownU") then {RydHQH_AlwaysUnKnownU = []};
	_HQ setVariable ["RydHQ_AlwaysUnKnownU",RydHQH_AlwaysUnKnownU];
	
	if (isNil "RydHQH_AOnly") then {RydHQH_AOnly = []};
	_HQ setVariable ["RydHQ_AOnly",RydHQH_AOnly]; 
	if (isNil "RydHQH_ROnly") then {RydHQH_ROnly = []};
	_HQ setVariable ["RydHQ_ROnly",RydHQH_ROnly];
	
	if (isNil "RydHQH_AirEvac") then {RydHQH_AirEvac = false};
	_HQ setVariable ["RydHQ_AirEvac",RydHQH_AirEvac]; 
	
	if (isNil "RydHQH_AAO") then {RydHQH_AAO = false};
	_HQ setVariable ["RydHQ_AAO",RydHQH_AAO]; 
	if (isNil "RydHQH_ForceAAO") then {RydHQH_ForceAAO = false};
	_HQ setVariable ["RydHQ_ForceAAO",RydHQH_ForceAAO];
	
	if (isNil "RydHQH_Taken") then {RydHQH_Taken = []};
	_HQ setVariable ["RydHQ_Taken",RydHQH_Taken];
	
	if (isNil "RydHQH_EBDoctrine") then {RydHQH_EBDoctrine = false};
	_HQ setVariable ["RydHQ_EBDoctrine",RydHQH_EBDoctrine]; 
	if (isNil "RydHQH_ForceEBDoctrine") then {RydHQH_ForceEBDoctrine = false};
	_HQ setVariable ["RydHQ_ForceEBDoctrine",RydHQH_ForceEBDoctrine];  
	
	_HQ setVariable ["RydHQ_Obj1",RydHQH_Obj1];
	_HQ setVariable ["RydHQ_Obj2",RydHQH_Obj2];
	_HQ setVariable ["RydHQ_Obj3",RydHQH_Obj3];
	_HQ setVariable ["RydHQ_Obj4",RydHQH_Obj4];
	
	_objectives = [RydHQH_Obj1,RydHQH_Obj2,RydHQH_Obj3,RydHQH_Obj4];
	
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
			
	if not (isNil "RydHQH_DefFrontL") then {_HQ setVariable ["RydHQ_DefFrontL",RydHQH_DefFrontL]};
	if not (isNil "RydHQH_DefFront1") then {_HQ setVariable ["RydHQ_DefFront1",RydHQH_DefFront1]};
	if not (isNil "RydHQH_DefFront2") then {_HQ setVariable ["RydHQ_DefFront2",RydHQH_DefFront2]};
	if not (isNil "RydHQH_DefFront3") then {_HQ setVariable ["RydHQ_DefFront3",RydHQH_DefFront3]};
	if not (isNil "RydHQH_DefFront4") then {_HQ setVariable ["RydHQ_DefFront4",RydHQH_DefFront4]};
	
	_civF = ["CIV_F","CIV","CIV_RU","BIS_TK_CIV","BIS_CIV_special"];
	if not (isNil ("RydHQH_CivF")) then {_civF = RydHQH_CivF};
	_HQ setVariable ["RydHQ_CivF",_civF];
	
	if (isNil ("RydHQH_Def")) then {RydHQH_Def = []};
	_HQ setVariable ["RydHQ_Def",RydHQH_Def];
	
	_nObj = _HQ getVariable ["RydHQ_NObj",1];

	switch (_nObj) do
		{
		case (1) : {_HQ setVariable ["RydHQ_Obj",RydHQH_Obj1]};
		case (2) : {_HQ setVariable ["RydHQ_Obj",RydHQH_Obj2]};
		case (3) : {_HQ setVariable ["RydHQ_Obj",RydHQH_Obj3]};
		default {_HQ setVariable ["RydHQ_Obj",RydHQH_Obj4]};
		};
		
	call RYD_StatusQuo;
	};