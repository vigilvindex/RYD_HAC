_SCRname = "SitRep";
_HQ = _this select 0;

_HQ setVariable ["leaderHQ",(leader _HQ)];

_HQ setVariable ["RydHQ_Cyclecount",0];
_cycleC = 0;

if (isNil ("RydHQ_MAtt")) then {RydHQ_MAtt = false};
_HQ setVariable ["RydHQ_MAtt",RydHQ_MAtt];
if ((isNil ("RydHQ_Personality")) or not (_HQ getVariable ["RydHQ_MAtt",false])) then {RydHQ_Personality = "OTHER"};
_HQ setVariable ["RydHQ_Personality",RydHQ_Personality];

if (isNil ("RydHQ_Recklessness")) then {RydHQ_Recklessness = 0.5};
_HQ setVariable ["RydHQ_Recklessness",RydHQ_Recklessness];
if (isNil ("RydHQ_Consistency")) then {RydHQ_Consistency = 0.5};
_HQ setVariable ["RydHQ_Consistency",RydHQ_Consistency];
if (isNil ("RydHQ_Activity")) then {RydHQ_Activity = 0.5};
_HQ setVariable ["RydHQ_Activity",RydHQ_Activity];
if (isNil ("RydHQ_Reflex")) then {RydHQ_Reflex = 0.5};
_HQ setVariable ["RydHQ_Reflex",RydHQ_Reflex];
if (isNil ("RydHQ_Circumspection")) then {RydHQ_Circumspection = 0.5};
_HQ setVariable ["RydHQ_Circumspection",RydHQ_Circumspection];
if (isNil ("RydHQ_Fineness")) then {RydHQ_Fineness = 0.5};
_HQ setVariable ["RydHQ_Fineness",RydHQ_Fineness];

[_HQ] call HAL_Personality;

[[_HQ],HAL_LHQ] call RYD_Spawn;

if (isNil ("RydHQ_Boxed")) then {RydHQ_Boxed = []};
_HQ setVariable ["RydHQ_Boxed",RydHQ_Boxed];

if (isNil ("RydHQ_AmmoBoxes")) then 
	{
	RydHQ_AmmoBoxes = [];

	if not (isNil "RydHQ_AmmoDepot") then 
		{
		_rds = (triggerArea RydHQ_AmmoDepot) select 0;
		RydHQ_AmmoBoxes = (getPosATL RydHQ_AmmoDepot) nearObjects ["ReammoBox_F",_rds]
		}
	};
	
_HQ setVariable ["RydHQ_AmmoBoxes",RydHQ_AmmoBoxes];

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

if (isNil ("RydHQ_Excluded")) then {RydHQ_Excluded = []};
_HQ setVariable ["RydHQ_Excluded",RydHQ_Excluded];
if (isNil ("RydHQ_Fast")) then {RydHQ_Fast = false};
_HQ setVariable ["RydHQ_Fast",RydHQ_Fast];
if (isNil ("RydHQ_ExInfo")) then {RydHQ_ExInfo = false};
_HQ setVariable ["RydHQ_ExInfo",RydHQ_ExInfo];
if (isNil ("RydHQ_ObjHoldTime")) then {RydHQ_ObjHoldTime = 600};
_HQ setVariable ["RydHQ_ObjHoldTime",RydHQ_ObjHoldTime];
if (isNil "RydHQ_NObj") then {RydHQ_NObj = 1};
_HQ setVariable ["RydHQ_NObj",RydHQ_NObj];

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

if (isNil ("RydHQ_SupportWP")) then {RydHQ_SupportWP = false};
	
_HQ setVariable ["RydHQ_SupportWP",RydHQ_SupportWP];

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
	
	if (isNil "RydHQ_Garrison") then {RydHQ_Garrison = []};
	_HQ setVariable ["RydHQ_Garrison",RydHQ_Garrison];
	
	if (isNil ("RydHQ_NoAirCargo")) then {RydHQ_NoAirCargo = false};
	_HQ setVariable ["RydHQ_NoAirCargo",RydHQ_NoAirCargo];
	if (isNil ("RydHQ_NoLandCargo")) then {RydHQ_NoLandCargo = false};
	_HQ setVariable ["RydHQ_NoLandCargo",RydHQ_NoLandCargo];
	if (isNil ("RydHQ_LastFriends")) then {RydHQ_LastFriends = []};
	_HQ setVariable ["RydHQ_LastFriends",RydHQ_LastFriends];
	if (isNil ("RydHQ_CargoFind")) then {RydHQ_CargoFind = 0};
	_HQ setVariable ["RydHQ_CargoFind",RydHQ_CargoFind];
	if (isNil ("RydHQ_Subordinated")) then {RydHQ_Subordinated = []};
	_HQ setVariable ["RydHQ_Subordinated",RydHQ_Subordinated];
	if (isNil ("RydHQ_Included")) then {RydHQ_Included = []};
	_HQ setVariable ["RydHQ_Included",RydHQ_Included];
	if (isNil ("RydHQ_ExcludedG")) then {RydHQ_ExcludedG = []};
	_HQ setVariable ["RydHQ_ExcludedG",RydHQ_ExcludedG];
	if (isNil ("RydHQ_SubAll")) then {RydHQ_SubAll = true};
	_HQ setVariable ["RydHQ_SubAll",RydHQ_SubAll];
	if (isNil ("RydHQ_SubSynchro")) then {RydHQ_SubSynchro = false};
	_HQ setVariable ["RydHQ_SubSynchro",RydHQ_SubSynchro];
	if (isNil ("RydHQ_SubNamed")) then {RydHQ_SubNamed = false};
	_HQ setVariable ["RydHQ_SubNamed",RydHQ_SubNamed];
	if (isNil ("RydHQ_SubZero")) then {RydHQ_SubZero = false};
	_HQ setVariable ["RydHQ_SubZero",RydHQ_SubZero];
	if (isNil ("RydHQ_ReSynchro")) then {RydHQ_ReSynchro = true};
	_HQ setVariable ["RydHQ_ReSynchro",RydHQ_ReSynchro];
	if (isNil ("RydHQ_NameLimit")) then {RydHQ_NameLimit = 100};
	_HQ setVariable ["RydHQ_NameLimit",RydHQ_NameLimit];
	if (isNil ("RydHQ_Surr")) then {RydHQ_Surr = false};
	_HQ setVariable ["RydHQ_Surr",RydHQ_Surr];
	if (isNil ("RydHQ_NoRecon")) then {RydHQ_NoRecon = []};
	_HQ setVariable ["RydHQ_NoRecon",RydHQ_NoRecon];
	if (isNil ("RydHQ_NoAttack")) then {RydHQ_NoAttack = []};
	_HQ setVariable ["RydHQ_NoAttack",RydHQ_NoAttack];
	if (isNil ("RydHQ_CargoOnly")) then {RydHQ_CargoOnly = []};
	_HQ setVariable ["RydHQ_CargoOnly",RydHQ_CargoOnly];
	if (isNil ("RydHQ_NoCargo")) then {RydHQ_NoCargo = []};
	_HQ setVariable ["RydHQ_NoCargo",RydHQ_NoCargo];
	if (isNil ("RydHQ_NoFlank")) then {RydHQ_NoFlank = []};
	_HQ setVariable ["RydHQ_NoFlank",RydHQ_NoFlank];
	if (isNil ("RydHQ_NoDef")) then {RydHQ_NoDef = []};
	_HQ setVariable ["RydHQ_NoDef",RydHQ_NoDef];
	if (isNil ("RydHQ_FirstToFight")) then {RydHQ_FirstToFight = []};
	_HQ setVariable ["RydHQ_FirstToFight",RydHQ_FirstToFight];
	if (isNil ("RydHQ_VoiceComm")) then {RydHQ_VoiceComm = true};
	_HQ setVariable ["RydHQ_VoiceComm",RydHQ_VoiceComm];
	if (isNil ("RydHQ_FrontA")) then {RydHQ_Front = false};
	_HQ setVariable ["RydHQ_FrontA",RydHQ_Front];
	if (isNil ("RydHQ_LRelocating")) then {RydHQ_LRelocating = false};
	_HQ setVariable ["RydHQ_LRelocating",RydHQ_LRelocating];
	if (isNil ("RydHQ_Flee")) then {RydHQ_Flee = true};
	_HQ setVariable ["RydHQ_Flee",RydHQ_Flee];
	if (isNil ("RydHQ_GarrR")) then {RydHQ_GarrR = 500};
	_HQ setVariable ["RydHQ_GarrR",RydHQ_GarrR];
	if (isNil ("RydHQ_Rush")) then {RydHQ_Rush = false};
	_HQ setVariable ["RydHQ_Rush",RydHQ_Rush];
	if (isNil ("RydHQ_GarrVehAb")) then {RydHQ_GarrVehAb = false};
	_HQ setVariable ["RydHQ_GarrVehAb",RydHQ_GarrVehAb];
	if (isNil ("RydHQ_DefendObjectives")) then {RydHQ_DefendObjectives = 4};
	_HQ setVariable ["RydHQ_DefendObjectives",RydHQ_DefendObjectives];
	if (isNil ("RydHQ_DefSpot")) then {RydHQ_DefSpot = []};
	_HQ setVariable ["RydHQ_DefSpot",RydHQ_DefSpot];
	if (isNil ("RydHQ_RecDefSpot")) then {RydHQ_RecDefSpot = []};
	_HQ setVariable ["RydHQ_RecDefSpot",RydHQ_RecDefSpot];
	if (isNil "RydHQ_Flare") then {RydHQ_Flare = true};
	_HQ setVariable ["RydHQ_Flare",RydHQ_Flare];
	if (isNil "RydHQ_Smoke") then {RydHQ_Smoke = true};
	_HQ setVariable ["RydHQ_Smoke",RydHQ_Smoke];
	if (isNil "RydHQ_NoRec") then {RydHQ_NoRec = 1};
	_HQ setVariable ["RydHQ_NoRec",RydHQ_NoRec];
	if (isNil "RydHQ_RapidCapt") then {RydHQ_RapidCapt = 10};
	_HQ setVariable ["RydHQ_RapidCapt",RydHQ_RapidCapt];
	if (isNil "RydHQ_Muu") then {RydHQ_Muu = 1};
	_HQ setVariable ["RydHQ_Muu",RydHQ_Muu];
	if (isNil "RydHQ_ArtyShells") then {RydHQ_ArtyShells = 1};
	_HQ setVariable ["RydHQ_ArtyShells",RydHQ_ArtyShells];
	if (isNil "RydHQ_Withdraw") then {RydHQ_Withdraw = 1};
	_HQ setVariable ["RydHQ_Withdraw",RydHQ_Withdraw];
	if (isNil "RydHQ_Berserk") then {RydHQ_Berserk = false};
	_HQ setVariable ["RydHQ_Berserk",RydHQ_Berserk];
	if (isNil "RydHQ_IDChance") then {RydHQ_IDChance = 100};
	_HQ setVariable ["RydHQ_IDChance",RydHQ_IDChance];
	if (isNil "RydHQ_RDChance") then {RydHQ_RDChance = 100};
	_HQ setVariable ["RydHQ_RDChance",RydHQ_RDChance];
	if (isNil "RydHQ_SDChance") then {RydHQ_SDChance = 100};
	_HQ setVariable ["RydHQ_SDChance",RydHQ_SDChance];
	if (isNil "RydHQ_AmmoDrop") then {RydHQ_AmmoDrop = []};
	_HQ setVariable ["RydHQ_AmmoDrop",RydHQ_AmmoDrop];
	if (isNil "RydHQ_SFTargets") then {RydHQ_SFTargets = []};
	_HQ setVariable ["RydHQ_SFTargets",RydHQ_SFTargets];
	if (isNil "RydHQ_LZ") then {RydHQ_LZ = false};
	_HQ setVariable ["RydHQ_LZ",RydHQ_LZ];
	if (isNil "RydHQ_SFBodyGuard") then {RydHQ_SFBodyGuard = []};
	_HQ setVariable ["RydHQ_SFBodyGuard",RydHQ_SFBodyGuard];
	if (isNil "RydHQ_DynForm") then {RydHQ_DynForm = false};
	_HQ setVariable ["RydHQ_DynForm",RydHQ_DynForm];
	if (isNil "RydHQ_UnlimitedCapt") then {RydHQ_UnlimitedCapt = false};
	_HQ setVariable ["RydHQ_UnlimitedCapt",RydHQ_UnlimitedCapt];
	if (isNil "RydHQ_CaptLimit") then {RydHQ_CaptLimit = 10};
	_HQ setVariable ["RydHQ_CaptLimit",RydHQ_CaptLimit];
	if (isNil "RydHQ_GetHQInside") then {RydHQ_GetHQInside = false};
	_HQ setVariable ["RydHQ_GetHQInside",RydHQ_GetHQInside];
	if (isNil "RydHQ_WA") then {RydHQ_WA = true};
	_HQ setVariable ["RydHQ_WA",RydHQ_WA];
	
	if (isNil ("RydHQ_ResetNow")) then {RydHQ_ResetNow = false};
	_HQ setVariable ["RydHQ_ResetNow",RydHQ_ResetNow];
	if (isNil ("RydHQ_ResetOnDemand")) then {RydHQ_ResetOnDemand = false};
	_HQ setVariable ["RydHQ_ResetOnDemand",RydHQ_ResetOnDemand];
	if (isNil ("RydHQ_ResetTime")) then {RydHQ_ResetTime = 600};
	_HQ setVariable ["RydHQ_ResetTime",RydHQ_ResetTime];
	if (isNil ("RydHQ_Combining")) then {RydHQ_Combining = false};
	_HQ setVariable ["RydHQ_Combining",RydHQ_Combining];
	if (isNil ("RydHQ_ObjRadius1")) then {RydHQ_ObjRadius1 = 300};
	_HQ setVariable ["RydHQ_ObjRadius1",RydHQ_ObjRadius1];
	if (isNil ("RydHQ_ObjRadius2")) then {RydHQ_ObjRadius2 = 500};
	_HQ setVariable ["RydHQ_ObjRadius2",RydHQ_ObjRadius2];
	if (isNil ("RydHQ_KnowTL")) then {RydHQ_KnowTL = true};
	_HQ setVariable ["RydHQ_KnowTL",RydHQ_KnowTL];
	
	if (isNil ("RydHQ_SMed")) then {RydHQ_SMed = true};
	_HQ setVariable ["RydHQ_SMed",RydHQ_SMed];
	if (isNil ("RydHQ_ExMedic")) then {RydHQ_ExMedic = []};
	_HQ setVariable ["RydHQ_ExMedic",RydHQ_ExMedic];
	if (isNil ("RydHQ_MedPoints")) then {RydHQ_MedPoints = []};
	_HQ setVariable ["RydHQ_MedPoints",RydHQ_MedPoints];
	if (isNil ("RydHQ_SupportedG")) then {RydHQ_SupportedG = []};
	_HQ setVariable ["RydHQ_SupportedG",RydHQ_SupportedG];
	
	if (isNil ("RydHQ_SFuel")) then {RydHQ_SFuel = true};
	_HQ setVariable ["RydHQ_SFuel",RydHQ_SFuel];
	if (isNil ("RydHQ_ExRefuel")) then {RydHQ_ExRefuel = []};
	_HQ setVariable ["RydHQ_ExRefuel",RydHQ_ExRefuel];
	if (isNil ("RydHQ_FuelPoints")) then {RydHQ_FuelPoints = []};
	_HQ setVariable ["RydHQ_FuelPoints",RydHQ_FuelPoints];
	if (isNil ("RydHQ_FSupportedG")) then {RydHQ_FSupportedG = []};
	_HQ setVariable ["RydHQ_FSupportedG",RydHQ_FSupportedG];
	
	if (isNil ("RydHQ_SAmmo")) then {RydHQ_SAmmo = true};
	_HQ setVariable ["RydHQ_SAmmo",RydHQ_SAmmo];
	if (isNil ("RydHQ_ExReammo")) then {RydHQ_ExReammo = []};
	_HQ setVariable ["RydHQ_ExReammo",RydHQ_ExReammo];
	if (isNil ("RydHQ_AmmoPoints")) then {RydHQ_AmmoPoints = []};
	_HQ setVariable ["RydHQ_AmmoPoints",RydHQ_AmmoPoints];
	if (isNil ("RydHQ_ASupportedG")) then {RydHQ_ASupportedG = []};
	_HQ setVariable ["RydHQ_ASupportedG",RydHQ_ASupportedG];
	
	if (isNil ("RydHQ_SRep")) then {RydHQ_SRep = true};
	_HQ setVariable ["RydHQ_SRep",RydHQ_SRep];
	if (isNil ("RydHQ_ExRepair")) then {RydHQ_ExRepair = []};
	_HQ setVariable ["RydHQ_ExRepair",RydHQ_ExRepair];
	if (isNil ("RydHQ_RepPoints")) then {RydHQ_RepPoints = []};
	_HQ setVariable ["RydHQ_RepPoints",RydHQ_RepPoints];
	if (isNil ("RydHQ_RSupportedG")) then {RydHQ_RSupportedG = []};
	_HQ setVariable ["RydHQ_RSupportedG",RydHQ_RSupportedG];
	
	if (isNil "RydHQ_AirDist") then {RydHQ_AirDist = 4000};
	_HQ setVariable ["RydHQ_AirDist",RydHQ_AirDist];
	
	if (isNil ("RydHQ_CommDelay")) then {RydHQ_CommDelay = 1};
	_HQ setVariable ["RydHQ_CommDelay",RydHQ_CommDelay];
	if (isNil ("RydHQ_Order")) then {RydHQ_Order = "ATTACK"};
	_HQ setVariable ["RydHQ_Order",RydHQ_Order];
	if (isNil ("RydHQ_ReconReserve")) then {RydHQ_ReconReserve = (0.3 * (0.5 + (_HQ getVariable ["RydHQ_Circumspection",0.5])))};
	_HQ setVariable ["RydHQ_ReconReserve",RydHQ_ReconReserve];
	if (isNil ("RydHQ_Exhausted")) then {RydHQ_Exhausted = []};
	_HQ setVariable ["RydHQ_Exhausted",RydHQ_Exhausted];
	if (isNil ("RydHQ_AttackReserve")) then {RydHQ_AttackReserve = (0.5 * (0.5 + ((_HQ getVariable ["RydHQ_Circumspection",0.5])/1.5)))};
	_HQ setVariable ["RydHQ_AttackReserve",RydHQ_AttackReserve];
	if (isNil ("RydHQ_IdleOrd")) then {RydHQ_IdleOrd = true};
	_HQ setVariable ["RydHQ_IdleOrd",RydHQ_IdleOrd];
	if (isNil "RydHQ_IdleDecoy") then {RydHQ_IdleDecoy = objNull};
	_HQ setVariable ["RydHQ_IdleDecoy",RydHQ_IdleDecoy]; 
	if (isNil "RydHQ_SupportDecoy") then {RydHQ_SupportDecoy = objNull};
	_HQ setVariable ["RydHQ_SupportDecoy",RydHQ_SupportDecoy]; 
	if (isNil "RydHQ_RestDecoy") then {RydHQ_RestDecoy = objNull};
	_HQ setVariable ["RydHQ_RestDecoy",RydHQ_RestDecoy]; 
	if (isNil "RydHQ_Sec1") then {RydHQ_Sec1 = objNull};
	_HQ setVariable ["RydHQ_Sec1",RydHQ_Sec1]; 
	if (isNil "RydHQ_Sec2") then {RydHQ_Sec2 = objNull};
	_HQ setVariable ["RydHQ_Sec2",RydHQ_Sec2]; 
	
	if (isNil "RydHQ_Debug") then {RydHQ_Debug = false};
	_HQ setVariable ["RydHQ_Debug",RydHQ_Debug]; 
	if (isNil "RydHQ_DebugII") then {RydHQ_DebugII = false};
	_HQ setVariable ["RydHQ_DebugII",RydHQ_DebugII]; 
	
	if (isNil "RydHQ_AlwaysKnownU") then {RydHQ_AlwaysKnownU = []};
	_HQ setVariable ["RydHQ_AlwaysKnownU",RydHQ_AlwaysKnownU]; 
	if (isNil "RydHQ_AlwaysUnKnownU") then {RydHQ_AlwaysUnKnownU = []};
	_HQ setVariable ["RydHQ_AlwaysUnKnownU",RydHQ_AlwaysUnKnownU]; 
	
	if (isNil "RydHQ_AOnly") then {RydHQ_AOnly = []};
	_HQ setVariable ["RydHQ_AOnly",RydHQ_AOnly]; 
	if (isNil "RydHQ_ROnly") then {RydHQ_ROnly = []};
	_HQ setVariable ["RydHQ_ROnly",RydHQ_ROnly]; 
	
	if (isNil "RydHQ_AirEvac") then {RydHQ_AirEvac = false};
	_HQ setVariable ["RydHQ_AirEvac",RydHQ_AirEvac]; 
	
	if (isNil "RydHQ_AAO") then {RydHQ_AAO = false};
	_HQ setVariable ["RydHQ_AAO",RydHQ_AAO]; 
	if (isNil "RydHQ_ForceAAO") then {RydHQ_ForceAAO = false};
	_HQ setVariable ["RydHQ_ForceAAO",RydHQ_ForceAAO];
	
	if (isNil "RydHQ_Taken") then {RydHQ_Taken = []};
	_HQ setVariable ["RydHQ_Taken",RydHQ_Taken];
	
	if (isNil "RydHQ_EBDoctrine") then {RydHQ_EBDoctrine = false};
	_HQ setVariable ["RydHQ_EBDoctrine",RydHQ_EBDoctrine]; 
	if (isNil "RydHQ_ForceEBDoctrine") then {RydHQ_ForceEBDoctrine = false};
	_HQ setVariable ["RydHQ_ForceEBDoctrine",RydHQ_ForceEBDoctrine]; 

	_HQ setVariable ["RydHQ_Obj1",RydHQ_Obj1];
	_HQ setVariable ["RydHQ_Obj2",RydHQ_Obj2];
	_HQ setVariable ["RydHQ_Obj3",RydHQ_Obj3];
	_HQ setVariable ["RydHQ_Obj4",RydHQ_Obj4];
		
	_objectives = [RydHQ_Obj1,RydHQ_Obj2,RydHQ_Obj3,RydHQ_Obj4];
	
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

	if not (isNil "RydHQ_DefFrontL") then {_HQ setVariable ["RydHQ_DefFrontL",RydHQ_DefFrontL]};
	if not (isNil "RydHQ_DefFront1") then {_HQ setVariable ["RydHQ_DefFront1",RydHQ_DefFront1]};
	if not (isNil "RydHQ_DefFront2") then {_HQ setVariable ["RydHQ_DefFront2",RydHQ_DefFront2]};
	if not (isNil "RydHQ_DefFront3") then {_HQ setVariable ["RydHQ_DefFront3",RydHQ_DefFront3]};
	if not (isNil "RydHQ_DefFront4") then {_HQ setVariable ["RydHQ_DefFront4",RydHQ_DefFront4]};
	
	_civF = ["CIV_F","CIV","CIV_RU","BIS_TK_CIV","BIS_CIV_special"];
	if not (isNil ("RydHQ_CivF")) then {_civF = RydHQ_CivF};
	_HQ setVariable ["RydHQ_CivF",_civF];
	
	if (isNil ("RydHQ_Def")) then {RydHQ_Def = []};
	_HQ setVariable ["RydHQ_Def",RydHQ_Def];
	
	_nObj = _HQ getVariable ["RydHQ_NObj",1];

	switch (_nObj) do
		{
		case (1) : {_HQ setVariable ["RydHQ_Obj",RydHQ_Obj1]};
		case (2) : {_HQ setVariable ["RydHQ_Obj",RydHQ_Obj2]};
		case (3) : {_HQ setVariable ["RydHQ_Obj",RydHQ_Obj3]};
		default {_HQ setVariable ["RydHQ_Obj",RydHQ_Obj4]};
		};
	
	call RYD_StatusQuo;
	};