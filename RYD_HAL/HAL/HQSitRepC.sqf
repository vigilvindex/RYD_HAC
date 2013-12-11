
_HQ = _this select 0;

_HQ setVariable ["leaderHQ",(leader _HQ)];

_HQ setVariable ["RydHQ_Cyclecount",0];
_cycleC = 0;

if ( isNil ("RydHQC_MAtt")) then {RydHQC_MAtt = false};
_HQ setVariable ["RydHQ_MAtt",RydHQC_MAtt];
if (( isNil ("RydHQC_Personality")) or not (_HQ getVariable ["RydHQ_MAtt",false])) then {RydHQC_Personality = "OTHER"};
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

[_HQ] spawn HAL_LHQ;

if ( isNil ("RydHQC_Boxed")) then {RydHQC_Boxed = []};
_HQ setVariable ["RydHQ_Boxed",RydHQC_Boxed];

if ( isNil ("RydHQC_AmmoBoxes")) then 
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
	"O_MBT_02_cannon_F"
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
	"B_APC_Wheeled_01_cannon_F"
	] - RHQs_LArmor;
	
_LArmorAT_class = RHQ_LArmorAT + 
	[
	"I_APC_Wheeled_03_cannon_F",
	"O_APC_Tracked_02_cannon_F"
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
	
_Air_class = RHQ_Air + 
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
	
_BAir_class = RHQ_BAir + 
	[
	"I_Plane_Fighter_03_CAS_F"
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
	
_NCCargo_class = RHQ_NCCargo + 
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
_HQ setVariable ["RydHQ_AirInDef",[]];

_KnEnPos = [];

if ( isNil ("RydHQC_Excluded")) then {RydHQC_Excluded = []};
_HQ setVariable ["RydHQ_Excluded",RydHQC_Excluded];
if ( isNil ("RydHQC_Fast")) then {RydHQC_Fast = false};
_HQ setVariable ["RydHQ_Fast",RydHQC_Fast];
if ( isNil ("RydHQC_ExInfo")) then {RydHQC_ExInfo = false};
_HQ setVariable ["RydHQ_ExInfo",RydHQC_ExInfo];
if ( isNil ("RydHQC_ObjHoldTime")) then {RydHQC_ObjHoldTime = 600};
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

if ( isNil ("RydHQC_SupportWP")) then {RydHQC_SupportWP = false};
	
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
			(({(_x getVariable ["RydHQ_Pending",false])} count RydxHQ_AllHQ) == 0)
			}
		};
		
	_HQ setVariable ["RydHQ_Pending",true];

	if (_cycleC > 1) then
		{
		if not (_lastHQ == (_HQ getVariable ["leaderHQ",objNull])) then {sleep (60 + (random 60))};
		};

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
	
	if ( isNil ("RydHQC_NoAirCargo")) then {RydHQC_NoAirCargo = false};
	_HQ setVariable ["RydHQ_NoAirCargo",RydHQC_NoAirCargo];
	if ( isNil ("RydHQC_NoLandCargo")) then {RydHQC_NoLandCargo = false};
	_HQ setVariable ["RydHQ_NoLandCargo",RydHQC_NoLandCargo];
	if ( isNil ("RydHQC_LastFriends")) then {RydHQC_LastFriends = []};
	_HQ setVariable ["RydHQ_LastFriends",RydHQC_LastFriends];
	if ( isNil ("RydHQC_CargoFind")) then {RydHQC_CargoFind = 0};
	_HQ setVariable ["RydHQ_CargoFind",RydHQC_CargoFind];
	if ( isNil ("RydHQC_Subordinated")) then {RydHQC_Subordinated = []};
	_HQ setVariable ["RydHQ_Subordinated",RydHQC_Subordinated];
	if ( isNil ("RydHQC_Included")) then {RydHQC_Included = []};
	_HQ setVariable ["RydHQ_Included",RydHQC_Included];
	if ( isNil ("RydHQC_ExcludedG")) then {RydHQC_ExcludedG = []};
	_HQ setVariable ["RydHQ_ExcludedG",RydHQC_ExcludedG];
	if ( isNil ("RydHQC_SubAll")) then {RydHQC_SubAll = true};
	_HQ setVariable ["RydHQ_SubAll",RydHQC_SubAll];
	if ( isNil ("RydHQC_SubSynchro")) then {RydHQC_SubSynchro = false};
	_HQ setVariable ["RydHQ_SubSynchro",RydHQC_SubSynchro];
	if ( isNil ("RydHQC_SubNamed")) then {RydHQC_SubNamed = false};
	_HQ setVariable ["RydHQ_SubNamed",RydHQC_SubNamed];
	if ( isNil ("RydHQC_SubZero")) then {RydHQC_SubZero = false};
	_HQ setVariable ["RydHQ_SubZero",RydHQC_SubZero];
	if ( isNil ("RydHQC_ReSynchro")) then {RydHQC_ReSynchro = true};
	_HQ setVariable ["RydHQ_ReSynchro",RydHQC_ReSynchro];
	if ( isNil ("RydHQC_NameLimit")) then {RydHQC_NameLimit = 100};
	_HQ setVariable ["RydHQ_NameLimit",RydHQC_NameLimit];
	if ( isNil ("RydHQC_Surr")) then {RydHQC_Surr = false};
	_HQ setVariable ["RydHQ_Surr",RydHQC_Surr];
	if ( isNil ("RydHQC_AOnly")) then {RydHQC_AOnly = []};
	_HQ setVariable ["RydHQ_AOnly",RydHQC_AOnly];
	if ( isNil ("RydHQC_ROnly")) then {RydHQC_ROnly = []};
	_HQ setVariable ["RydHQ_ROnly",RydHQC_ROnly];
	if ( isNil ("RydHQC_CargoOnly")) then {RydHQC_CargoOnly = []};
	_HQ setVariable ["RydHQ_CargoOnly",RydHQC_CargoOnly];
	if ( isNil ("RydHQC_NoCargo")) then {RydHQC_NoCargo = []};
	_HQ setVariable ["RydHQ_NoCargo",RydHQC_NoCargo];
	if ( isNil ("RydHQC_NoFlank")) then {RydHQC_NoFlank = []};
	_HQ setVariable ["RydHQ_NoFlank",RydHQC_NoFlank];
	if ( isNil ("RydHQC_NoDef")) then {RydHQC_NoDef = []};
	_HQ setVariable ["RydHQ_NoDef",RydHQC_NoDef];
	if ( isNil ("RydHQC_FirstToFight")) then {RydHQC_FirstToFight = []};
	_HQ setVariable ["RydHQ_FirstToFight",RydHQC_FirstToFight];
	if ( isNil ("RydHQC_VoiceComm")) then {RydHQC_VoiceComm = true};
	_HQ setVariable ["RydHQ_VoiceComm",RydHQC_VoiceComm];
	if ( isNil ("RydHQC_FrontA")) then {RydHQC_Front = false};
	_HQ setVariable ["RydHQ_FrontA",RydHQC_Front];
	if ( isNil ("RydHQC_LRelocating")) then {RydHQC_LRelocating = false};
	_HQ setVariable ["RydHQ_LRelocating",RydHQC_LRelocating];
	if ( isNil ("RydHQC_Flee")) then {RydHQC_Flee = true};
	_HQ setVariable ["RydHQ_Flee",RydHQC_Flee];
	if ( isNil ("RydHQC_GarrR")) then {RydHQC_GarrR = 500};
	_HQ setVariable ["RydHQ_GarrR",RydHQC_GarrR];
	if ( isNil ("RydHQC_Rush")) then {RydHQC_Rush = false};
	_HQ setVariable ["RydHQ_Rush",RydHQC_Rush];
	if ( isNil ("RydHQC_GarrVehAb")) then {RydHQC_GarrVehAb = false};
	_HQ setVariable ["RydHQ_GarrVehAb",RydHQC_GarrVehAb];
	if ( isNil ("RydHQC_DefendObjectives")) then {RydHQC_DefendObjectives = 4};
	_HQ setVariable ["RydHQ_DefendObjectives",RydHQC_DefendObjectives];
	if ( isNil ("RydHQC_DefSpot")) then {RydHQC_DefSpot = []};
	_HQ setVariable ["RydHQ_DefSpot",RydHQC_DefSpot];
	if ( isNil ("RydHQC_RecDefSpot")) then {RydHQC_RecDefSpot = []};
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
	
	if ( isNil ("RydHQC_ResetNow")) then {RydHQC_ResetNow = false};
	_HQ setVariable ["RydHQ_ResetNow",RydHQC_ResetNow];
	if ( isNil ("RydHQC_ResetOnDemand")) then {RydHQC_ResetOnDemand = false};
	_HQ setVariable ["RydHQ_ResetOnDemand",RydHQC_ResetOnDemand];
	if ( isNil ("RydHQC_ResetTime")) then {RydHQC_ResetTime = 600};
	_HQ setVariable ["RydHQ_ResetTime",RydHQC_ResetTime];
	if ( isNil ("RydHQC_Combining")) then {RydHQC_Combining = false};
	_HQ setVariable ["RydHQ_Combining",RydHQC_Combining];
	if ( isNil ("RydHQC_ObjRadius1")) then {RydHQC_ObjRadius1 = 300};
	_HQ setVariable ["RydHQ_ObjRadius1",RydHQC_ObjRadius1];
	if ( isNil ("RydHQC_ObjRadius2")) then {RydHQC_ObjRadius2 = 500};
	_HQ setVariable ["RydHQ_ObjRadius2",RydHQC_ObjRadius2];
	if ( isNil ("RydHQC_KnowTL")) then {RydHQC_KnowTL = true};
	_HQ setVariable ["RydHQ_KnowTL",RydHQC_KnowTL];
	
	if ( isNil ("RydHQC_SMed")) then {RydHQC_SMed = true};
	_HQ setVariable ["RydHQ_SMed",RydHQC_SMed];
	if ( isNil ("RydHQC_ExMedic")) then {RydHQC_ExMedic = []};
	_HQ setVariable ["RydHQ_ExMedic",RydHQC_ExMedic];
	if ( isNil ("RydHQC_MedPoints")) then {RydHQC_MedPoints = []};
	_HQ setVariable ["RydHQ_MedPoints",RydHQC_MedPoints];
	if ( isNil ("RydHQC_SupportedG")) then {RydHQC_SupportedG = []};
	_HQ setVariable ["RydHQ_SupportedG",RydHQC_SupportedG];
	
	if ( isNil ("RydHQC_SFuel")) then {RydHQC_SFuel = true};
	_HQ setVariable ["RydHQ_SFuel",RydHQC_SFuel];
	if ( isNil ("RydHQC_ExRefuel")) then {RydHQC_ExRefuel = []};
	_HQ setVariable ["RydHQ_ExRefuel",RydHQC_ExRefuel];
	if ( isNil ("RydHQC_FuelPoints")) then {RydHQC_FuelPoints = []};
	_HQ setVariable ["RydHQ_FuelPoints",RydHQC_FuelPoints];
	if ( isNil ("RydHQC_FSupportedG")) then {RydHQC_FSupportedG = []};
	_HQ setVariable ["RydHQ_FSupportedG",RydHQC_FSupportedG];
	
	if ( isNil ("RydHQC_SAmmo")) then {RydHQC_SAmmo = true};
	_HQ setVariable ["RydHQ_SAmmo",RydHQC_SAmmo];
	if ( isNil ("RydHQC_ExReammo")) then {RydHQC_ExReammo = []};
	_HQ setVariable ["RydHQ_ExReammo",RydHQC_ExReammo];
	if ( isNil ("RydHQC_AmmoPoints")) then {RydHQC_AmmoPoints = []};
	_HQ setVariable ["RydHQ_AmmoPoints",RydHQC_AmmoPoints];
	if ( isNil ("RydHQC_ASupportedG")) then {RydHQC_ASupportedG = []};
	_HQ setVariable ["RydHQ_ASupportedG",RydHQC_ASupportedG];
	
	if ( isNil ("RydHQC_SRep")) then {RydHQC_SRep = true};
	_HQ setVariable ["RydHQ_SRep",RydHQC_SRep];
	if ( isNil ("RydHQC_ExRepair")) then {RydHQC_ExRepair = []};
	_HQ setVariable ["RydHQ_ExRepair",RydHQC_ExRepair];
	if ( isNil ("RydHQC_RepPoints")) then {RydHQC_RepPoints = []};
	_HQ setVariable ["RydHQ_RepPoints",RydHQC_RepPoints];
	if ( isNil ("RydHQC_RSupportedG")) then {RydHQC_RSupportedG = []};
	_HQ setVariable ["RydHQ_RSupportedG",RydHQC_RSupportedG];
	
	if (isNil "RydHQC_AirDist") then {RydHQC_AirDist = 4000};
	_HQ setVariable ["RydHQ_AirDist",RydHQC_AirDist];
	
	if ( isNil ("RydHQC_CommDelay")) then {RydHQC_CommDelay = 1};
	_HQ setVariable ["RydHQ_CommDelay",RydHQC_CommDelay];
	if ( isNil ("RydHQC_Order")) then {RydHQC_Order = "ATTACK"};
	_HQ setVariable ["RydHQ_Order",RydHQC_Order];
	if ( isNil ("RydHQC_ReconReserve")) then {RydHQC_ReconReserve = (0.3 * (0.5 + (_HQ getVariable ["RydHQ_Circumspection",0.5])))};
	_HQ setVariable ["RydHQ_ReconReserve",RydHQC_ReconReserve];
	if ( isNil ("RydHQC_Exhausted")) then {RydHQC_Exhausted = []};
	_HQ setVariable ["RydHQ_Exhausted",RydHQC_Exhausted];
	if ( isNil ("RydHQC_AttackReserve")) then {RydHQC_AttackReserve = (0.5 * (0.5 + ((_HQ getVariable ["RydHQ_Circumspection",0.5])/1.5)))};
	_HQ setVariable ["RydHQ_AttackReserve",RydHQC_AttackReserve];
	if ( isNil ("RydHQC_IdleOrd")) then {RydHQC_IdleOrd = true};
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
	
	_HQ setVariable ["RydHQ_Obj1",RydHQC_Obj1];
	_HQ setVariable ["RydHQ_Obj2",RydHQC_Obj2];
	_HQ setVariable ["RydHQ_Obj3",RydHQC_Obj3];
	_HQ setVariable ["RydHQ_Obj4",RydHQC_Obj4]; 
	
	if not (isNil "RydHQC_DefFrontL") then {_HQ setVariable ["RydHQ_DefFrontL",RydHQC_DefFrontL]};
	if not (isNil "RydHQC_DefFront1") then {_HQ setVariable ["RydHQ_DefFront1",RydHQC_DefFront1]};
	if not (isNil "RydHQC_DefFront2") then {_HQ setVariable ["RydHQ_DefFront2",RydHQC_DefFront2]};
	if not (isNil "RydHQC_DefFront3") then {_HQ setVariable ["RydHQ_DefFront3",RydHQC_DefFront3]};
	if not (isNil "RydHQC_DefFront4") then {_HQ setVariable ["RydHQ_DefFront4",RydHQC_DefFront4]};
	
	if ( isNil ("RydHQC_Def")) then {RydHQC_Def = []};
	_HQ setVariable ["RydHQ_Def",RydHQC_Def];
	
	_orderFirst = _HQ getVariable "RydHQ_Orderfirst";
	
	if (isNil ("_orderFirst")) then 
		{
		_HQ setVariable ["RydHQ_Orderfirst",true];
		_HQ setVariable ["RydHQ_FlankReady",false];
		};
	
	if (_cycleC > 1) then
		{
		if not (_HQ getVariable ["RydHQ_ResetOnDemand",false]) then
			{
			if ((time - _lastReset) > (_HQ getVariable ["RydHQ_ResetTime",600])) then
				{
				_lastReset = time;
				[_HQ] call HAL_HQReset
				}
			}
		else 
			{
			[_HQ] spawn
				{
				_HQ = _this select 0;
				
				waitUntil 
					{
					sleep 1; 
					(_HQ getVariable ["RydHQ_ResetNow",false])
					};
					
				_HQ setVariable ["RydHQ_ResetNow",false];
				[_HQ] call HAL_HQReset
				}
			};
		
		};
	
	_HQ setVariable ["RydHQ_Friends",[]];
	_HQ setVariable ["RydHQ_Enemies",[]];
	_HQ setVariable ["RydHQ_KnEnemies",[]];
	_HQ setVariable ["RydHQ_KnEnemiesG",[]];
	_HQ setVariable ["RydHQ_FValue",0];
	_HQ setVariable ["RydHQ_EValue",0];
		
	_FValue = 0;
	_EValue = 0;

	if (RydxHQ_AIChatDensity > 0) then
		{
		_varName1 = "HAC_AIChatRep";
		_varName2 = "_West";

		switch ((side _HQ)) do
			{
			case (east) : {_varName2 = "_East"};
			case (resistance) : {_varName2 = "_Guer"};
			};

		missionNamespace setVariable [_varName1 + _varName2,0];

		_varName1 = "HAC_AIChatLT";

		missionNamespace setVariable [_varName1 + _varName2,[0,""]]
		};
		
	_nObj = _HQ getVariable ["RydHQ_NObj",1];

	switch (_nObj) do
		{
		case (1) : {_HQ setVariable ["RydHQ_Obj",RydHQC_Obj1]};
		case (2) : {_HQ setVariable ["RydHQ_Obj",RydHQC_Obj2]};
		case (3) : {_HQ setVariable ["RydHQ_Obj",RydHQC_Obj3]};
		default {_HQ setVariable ["RydHQ_Obj",RydHQC_Obj4]};
		};
	
	_HQ setVariable ["RydHQ_LastSub",_HQ getVariable ["RydHQ_Subordinated",[]]];
	_HQ setVariable ["RydHQ_Subordinated",[]];

	_civF = ["CIV_F","CIV","CIV_RU","BIS_TK_CIV","BIS_CIV_special"];
	if not ( isNil ("RydHQC_CivF")) then {_civF = RydHQC_CivF};
	_HQ setVariable ["RydHQ_CivF",_civF];
	
	_enemies = _HQ getVariable ["RydHQ_Enemies",[]];
	_friends = _HQ getVariable ["RydHQ_Friends",[]];	

		{
		_isCaptive = _x getVariable ("isCaptive" + (str _x));
		if (isNil "_isCaptive") then {_isCaptive = false};

		_isCiv = false;
		if ((faction (leader _x)) in _civF) then {_isCiv = true};
		if not ((isNull ((_HQ getVariable ["leaderHQ",(leader _HQ)]))) and not (isNull _x) and (alive ((_HQ getVariable ["leaderHQ",(leader _HQ)]))) and (alive (leader _x)) and not (_isCaptive)) then
			{
			if (not ((_HQ getVariable ["RydHQ_FrontA",false])) and ((side _x) getFriend (side _HQ) < 0.6) and not (_isCiv)) then 
				{
				if not (_x in _enemies) then 
					{
					_enemies set [(count _enemies), _x]
					}
				};
			
			_front = true;
			_fr = _HQ getvariable ["RydHQ_Front",locationNull];
			if not (isNull _fr) then 
				{
				_front = ((getPosATL (vehicle (leader _x))) in _fr)
				};
				
			if ((_HQ getVariable ["RydHQ_FrontA",false]) and ((side _x) getFriend (side _HQ) < 0.6) and (_front) and not (_isCiv)) then 
				{
				if not (_x in _enemies) then 
					{
					_enemies set [(count _enemies), _x];
					}
				};
				
			if ((_HQ getVariable ["RydHQ_SubAll",true])) then 
				{
				if not ((side _x) getFriend (side _HQ) < 0.6) then 
					{
					if (not (_x in _friends) and not (((leader _x) in (_HQ getVariable ["RydHQ_Excluded",[]])) or (_isCiv))) then 
						{
						_friends set [(count _friends), _x]
						}
					};
				};
			}
		}
	foreach allGroups;
	
	_HQ setVariable ["RydHQ_Enemies",_enemies];

	_excl = [];

		{
		if not ((group _x) in _excl) then 
			{
			_excl set [(count _excl),group _x]
			} 
		}
	foreach (_HQ getVariable ["RydHQ_Excluded",[]]);
	
	_HQ setVariable ["RydHQ_Excl",_excl];
	
	_subOrd = [];

	if (_HQ getVariable ["RydHQ_SubSynchro",false]) then 
		{
			{
			if ((_x in (_HQ getVariable ["RydHQ_LastSub",[]])) and not ((leader _x) in (synchronizedObjects (_HQ getVariable ["leaderHQ",(leader _HQ)]))) and (_HQ getVariable ["RydHQ_SubSynchro",false])) then 
				{
				_subOrd set [(count _subOrd),_x]
				};
				
			if (not (_x in _subOrd) and (({(_x in (synchronizedObjects (_HQ getVariable ["leaderHQ",(leader _HQ)])))} count (units _x)) > 0)) then 
				{
				_subOrd set [(count _subOrd),_x]
				};
			}
		foreach allGroups;
		};

	if (_HQ getVariable ["RydHQ_SubNamed",false]) then 
		{
		_signum = _HQ getVariable ["RydHQ_CodeSign","X"];
		if (_signum in ["A","X"]) then {_signum = ""};
		
			{
			for [{_i = 1},{_i <= (_HQ getVariable ["RydHQ_NameLimit",100])},{_i = _i + 1}] do
				{
				if (not (_x in _subOrd) and ((str (leader _x)) == ("Ryd" + _signum + str (_i)))) then 
					{
					_subOrd set [(count _subOrd),_x]
					};
				};
			}
		foreach allGroups;
		};
		
	_HQ setVariable ["RydHQ_Subordinated",_subOrd];

	_friends = _friends + _subOrd + (_HQ getVariable ["RydHQ_Included",[]]) - ((_HQ getVariable ["RydHQ_ExcludedG",[]]) + _excl + [_HQ]);
	_HQ setVariable ["RydHQ_NoWayD",allGroups - (_HQ getVariable ["RydHQ_LastFriends",[]])];

	_friends = [_friends] call RYD_RandomOrd;
	
	_HQ setVariable ["RydHQ_Friends",_friends];

		{
		[_x] call RYD_WPdel;
		}
	foreach (((_HQ getVariable ["RydHQ_ExcludedG",[]]) + _excl) - (_HQ getVariable ["RydHQ_NoWayD",[]]));

	if (_HQ getVariable ["RydHQ_Init",true]) then 
		{
			{
			_cInitial = _cInitial + (count (units _x))
			}
		foreach (_friends + [_HQ])
		};
		
	_HQ setVariable ["RydHQ_CInitial",_cInitial];

	_HQ setVariable ["RydHQ_CLast",(_HQ getVariable ["RydHQ_CCurrent",0])];
	_CLast = (_HQ getVariable ["RydHQ_CCurrent",0]);
	_CCurrent = 0;
	
		{
		_CCurrent = _CCurrent + (count (units _x))
		}
	foreach (_friends + [_HQ]);
	
	_HQ setVariable ["RydHQ_CCurrent",_CCurrent];

	_Ex = [];

	if (_HQ getVariable ["RydHQ_ExInfo",false]) then 
		{
		_Ex = _excl + (_HQ getVariable ["RydHQ_ExcludedG",[]])
		};
		
	_knownE = [];
	_knownEG = [];

		{
		for [{_a = 0},{_a < count (units _x)},{_a = _a + 1}] do
			{
			_enemyU = vehicle ((units _x) select _a);
			
				{
				if ((_x knowsAbout _enemyU) >= 0.05) exitwith 
					{
					if not (_enemyU in _knownE) then 
						{
						_knownE set [(count _knownE),_enemyU];
						};

					if not ((group _enemyU) in _knownEG) then 
						{
						_already = missionnameSpace getVariable ["AlreadySpotted",[]];
						_knownEG set [(count _knownEG),(group _enemyU)];
						if not ((group _enemyU) in _already) then
							{
							_UL = (leader _x);if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_EnemySpot,"EnemySpot"] call RYD_AIChatter}};
							}
						}
					} 
				}
			foreach (_friends + [_HQ] + _Ex)
			}
		}
	foreach _enemies;
	
	_HQ setVariable ["RydHQ_KnEnemies",_knownE];
	_HQ setVariable ["RydHQ_KnEnemiesG",_knownEG];
	_HQ setVariable ["RydHQ_Ex",_Ex];

	_already = missionnameSpace getVariable ["AlreadySpotted",[]];

		{
		if not (_x in _already) then
			{
			_already set [(count _already),_x]
			}
		}
	foreach _knownEG;

	missionnameSpace setVariable ["AlreadySpotted",_already];

	_lossFinal = _cInitial - _CCurrent;
	if (_lossFinal < 0) then 
		{
		_lossFinal = 0;
		_cInitial = _CCurrent;
		_HQ setVariable ["RydHQ_CInitial",_CCurrent];
		};
		
	_morale = _HQ getVariable ["RydHQ_Morale",0];

	if not (_HQ getVariable ["RydHQ_Init",true]) then 
		{
		_lossP = _lossFinal/_cInitial;

		if ((_OLmpl == 0) and ((count _knownE) > 0)) then
			{
			_OLmpl = 0.01;
			_firstMC = _cycleC - 1
			};

		if ((_cycleCap < (50 / (1.01 - _lossP))) and ((count _knownE) == 0) and (_OLmpl == 0.01)) then
			{
			_cycleCap = _cycleCap + 1;
			if ((random 1) < _lossP) then {_firstMC = _firstMC + 1}
			}
		else
			{
			if not ((count _knownE) == 0) then
				{
				_cycleCap = 0;
				}
			};

		
		_lossPerc = _lossP * 100;
		_cycle = _cycleC - _firstMC;

		_OLF = _OLmpl * (((-(_lossPerc * _lossPerc))/(1.1^_cycle)) + ((15 + (random 5) + (random 5))/(1 + _lossP)) - (_lossP * 10) + (_cycle ^ ((10 * (1 - _lossP))/_cycle)));

		_mplLU = 1;
		_lostU = _CLast - _CCurrent;
		if (_lostU < 0) then {_lostU = - _lostU;_mplLU = -1};

		_lossL = _mplLU * ((100 * _lostU/_cInitial)^(1.55 + (random 0.05) + (random 0.05)))/10;

		_balanceF = 0.5 + (random 0.5) + (random 0.5) - _lossP - (count _knownE)/_CCurrent;
		
		_morale = _morale + (_OLF - _lossL + _balanceF);
		};

	if (_morale < -50) then {_morale = -50};
	if (_morale > 0) then {_morale = 0};
	
	_HQ setVariable ["RydHQ_Morale",_morale];
	
	if (_HQ getVariable ["RydHQ_Debug",false]) then 
		{
		_signum = _HQ getVariable ["RydHQ_CodeSign","X"];
		_mdbg = format ["Morale %5 (%2): %1 - losses: %3 percent (%4)",_morale,(_HQ getVariable ["RydHQ_Personality","OTHER"]),(round (((_lossFinal/_cInitial) * 100) * 10)/10),_lossFinal,_signum];
		diag_log _mdbg;
		(_HQ getVariable ["leaderHQ",(leader _HQ)]) globalChat _mdbg;

		_cl = "<t color='#007f00'>%4 -> M: %1 - L: %2%3</t>";

		switch (side _HQ) do
			{
			case (west) : {_cl = "<t color='#0d81c4'>%4 -> M: %1 - L: %2%3</t>"};
			case (east) : {_cl = "<t color='#ff0000'>%4 -> M: %1 - L: %2%3</t>"};
			};

		_dbgMon = parseText format [_cl,(round (_morale * 10))/10,(round (((_lossFinal/_cInitial) * 100) * 10)/10),"%",_signum];

		_HQ setVariable ["DbgMon",_dbgMon];
		};

	_HQ setVariable ["RydHQ_Init",false]; 

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

				if (((_grp == _grpD) and (_TasV in _specFor_class)) or (_tp in _specFor_class)) then {_SpecForcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _recon_class)) or (_tp in _recon_class)) then {_reconcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _FO_class)) or (_tp in _FO_class)) then {_FOcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _snipers_class)) or (_tp in _snipers_class)) then {_sniperscheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _ATinf_class)) or (_tp in _ATinf_class)) then {_ATinfcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _AAinf_class)) or (_tp in _AAinf_class)) then {_AAinfcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Inf_class)) or (_tp in _Inf_class)) then {_Infcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Art_class)) or (_tp in _Art_class)) then {_Artcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _HArmor_class)) or (_tp in _HArmor_class)) then {_HArmorcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _MArmor_class)) or (_tp in _MArmor_class)) then {_MArmorcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _LArmor_class)) or (_tp in _LArmor_class)) then {_LArmorcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _LArmorAT_class)) or (_tp in _LArmorAT_class)) then {_LArmorATcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Cars_class)) or (_tp in _Cars_class)) then {_Carscheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Air_class)) or (_tp in _Air_class)) then {_Aircheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _BAir_class)) or (_tp in _BAir_class)) then {_BAircheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _RAir_class)) or (_tp in _RAir_class)) then {_RAircheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _NCAir_class)) or (_tp in _NCAir_class)) then {_NCAircheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Naval_class)) or (_tp in _Naval_class)) then {_Navalcheck = true;_Othercheck = false};
				if (((_grp == _grpG) and (_TasV in _Static_class)) or (_tp in _Static_class)) then {_Staticcheck = true;_Othercheck = false};
				if (((_grp == _grpG) and (_TasV in _StaticAA_class)) or (_tp in _StaticAA_class)) then {_StaticAAcheck = true;_Othercheck = false};
				if (((_grp == _grpG) and (_TasV in _StaticAT_class)) or (_tp in _StaticAT_class)) then {_StaticATcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Cargo_class)) or (_tp in _Cargo_class)) then {_Cargocheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _NCCargo_class)) or (_tp in _NCCargo_class)) then {_NCCargocheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Crew_class)) or (_tp in _Crew_class)) then {_Crewcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _NCrewInf_class)) or (_tp in _NCrewInf_class)) then {_NCrewInfcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Support_class)) or (_tp in _Support_class)) then {_Supportcheck = true;_NCrewInfcheck = false;_Othercheck = false};

				if ((_TasV in _NCCargo) and (_x == (assignedDriver _asV)) and ((count (units (group _x))) == 1) and not ((_ATinfcheck) or (_AAinfcheck) or (_reconcheck) or (_FOcheck) or (_sniperscheck))) then {_NCrewInfcheck = false;_Othercheck = false};

				if (_SpecForcheck) then {if not (_vh in _SpecFor) then {_SpecFor set [(count _SpecFor),_vh]};if not (_grp in _SpecForG) then {_SpecForG set [(count _SpecForG),_grp]}};
				if (_reconcheck) then {if not (_vh in _recon) then {_recon set [(count _recon),_vh]};if not (_grp in _reconG) then {_reconG set [(count _reconG),_grp]}};
				if (_FOcheck) then {if not (_vh in _FO) then {_FO set [(count _FO),_vh]};if not (_grp in _FOG) then {_FOG set [(count _FOG),_grp]}};
				if (_sniperscheck) then {if not (_vh in _snipers) then {_snipers set [(count _snipers),_vh]};if not (_grp in _snipersG) then {_snipersG set [(count _snipersG),_grp]}};
				if (_ATinfcheck) then {if not (_vh in _ATinf) then {_ATinf set [(count _ATinf),_vh]};if not (_grp in _ATinfG) then {_ATinfG set [(count _ATinfG),_grp]}};
				if (_AAinfcheck) then {if not (_vh in _AAinf) then {_AAinf set [(count _AAinf),_vh]};if not (_grp in _AAinfG) then {_AAinfG set [(count _AAinfG),_grp]}};
				if (_Infcheck) then {if not (_vh in _Inf) then {_FValue = _FValue + 1;_Inf set [(count _Inf),_vh]};if not (_grp in _InfG) then {_InfG set [(count _InfG),_grp]}};
				if (_Artcheck) then {if not (_vh in _Art) then {_FValue = _FValue + 3;_Art set [(count _Art),_vh]};if not (_grp in _ArtG) then {_ArtG set [(count _ArtG),_grp]}};
				if (_HArmorcheck) then {if not (_vh in _HArmor) then {_FValue = _FValue + 10;_HArmor set [(count _HArmor),_vh]};if not (_grp in _HArmorG) then {_HArmorG set [(count _HArmorG),_grp]}};
				if (_MArmorcheck) then {if not (_vh in _MArmor) then {_MArmor set [(count _MArmor),_vh]};if not (_grp in _MArmorG) then {_MArmorG set [(count _MArmorG),_grp]}};
				if (_LArmorcheck) then {if not (_vh in _LArmor) then {_FValue = _FValue + 5;_LArmor set [(count _LArmor),_vh]};if not (_grp in _LArmorG) then {_LArmorG set [(count _LArmorG),_grp]}};
				if (_LArmorATcheck) then {if not (_vh in _LArmorAT) then {_LArmorAT set [(count _LArmorAT),_vh]};if not (_grp in _LArmorATG) then {_LArmorATG set [(count _LArmorATG),_grp]}};
				if (_Carscheck) then {if not (_vh in _Cars) then {_FValue = _FValue + 3;_Cars set [(count _Cars),_vh]};if not (_grp in _CarsG) then {_CarsG set [(count _CarsG),_grp]}};
				if (_Aircheck) then {if not (_vh in _Air) then {_FValue = _FValue + 15;_Air set [(count _Air),_vh]};if not (_grp in _AirG) then {_AirG set [(count _AirG),_grp]}};
				if (_BAircheck) then {if not (_vh in _BAir) then {_BAir set [(count _BAir),_vh]};if not (_grp in _BAirG) then {_BAirG set [(count _BAirG),_grp]}};				
				if (_RAircheck) then {if not (_vh in _RAir) then {_RAir set [(count _RAir),_vh]};if not (_grp in _RAirG) then {_RAirG set [(count _RAirG),_grp]}};				
				if (_NCAircheck) then {if not (_vh in _NCAir) then {_NCAir set [(count _NCAir),_vh]};if not (_grp in _NCAirG) then {_NCAirG set [(count _NCAirG),_grp]}};
				if (_Navalcheck) then {if not (_vh in _Naval) then {_Naval set [(count _Naval),_vh]};if not (_grp in _NavalG) then {_NavalG set [(count _NavalG),_grp]}};
				if (_Staticcheck) then {if not (_vh in _Static) then {_FValue = _FValue + 1;_Static set [(count _Static),_vh]};if not (_grp in _StaticG) then {_StaticG set [(count _StaticG),_grp]}};
				if (_StaticAAcheck) then {if not (_vh in _StaticAA) then {_StaticAA set [(count _StaticAA),_vh]};if not (_grp in _StaticAAG) then {_StaticAAG set [(count _StaticAAG),_grp]}};
				if (_StaticATcheck) then {if not (_vh in _StaticAT) then {_StaticAT set [(count _StaticAT),_vh]};if not (_grp in _StaticATG) then {_StaticATG set [(count _StaticATG),_grp]}};
				if (_Supportcheck) then {if not (_vh in _Support) then {_Support set [(count _Support),_vh]};if not (_grp in _SupportG) then {_SupportG set [(count _SupportG),_grp]}};
				if (_Cargocheck) then {if not (_vh in _Cargo) then {_Cargo set [(count _Cargo),_vh]};if not (_grp in _CargoG) then {_CargoG set [(count _CargoG),_grp]}};
				if (_NCCargocheck) then {if not (_vh in _NCCargo) then {_NCCargo set [(count _NCCargo),_vh]};if not (_grp in _NCCargoG) then {_NCCargoG set [(count _NCCargoG),_grp]}};
				if (_Crewcheck) then {if not (_vh in _Crew) then {_Crew set [(count _Crew),_vh]};if not (_grp in _CrewG) then {_CrewG set [(count _CrewG),_grp]}};
				if (_NCrewInfcheck) then {if not (_vh in _NCrewInf) then {_NCrewInf set [(count _NCrewInf),_vh]};if not (_grp in _NCrewInfG) then {_NCrewInfG set [(count _NCrewInfG),_grp]}};
				
			}
		foreach (units _x)
		}
	foreach _friends;
	
	_HQ setVariable ["RydHQ_FValue",_FValue];

	_HQ setVariable ["RydHQ_SpecFor",_SpecFor];
	_HQ setVariable ["RydHQ_recon",_recon];
	_HQ setVariable ["RydHQ_FO",_FO];
	_HQ setVariable ["RydHQ_snipers",_snipers];
	_HQ setVariable ["RydHQ_ATinf",_ATinf];
	_HQ setVariable ["RydHQ_AAinf",_AAinf];
	_HQ setVariable ["RydHQ_Art",_Art];
	_HQ setVariable ["RydHQ_HArmor",_HArmor];
	_HQ setVariable ["RydHQ_MArmor",_MArmor];
	_HQ setVariable ["RydHQ_LArmor",_LArmor];
	_HQ setVariable ["RydHQ_LArmorAT",_LArmorAT];
	_HQ setVariable ["RydHQ_Cars",_Cars];
	_HQ setVariable ["RydHQ_Air",_Air];
	_HQ setVariable ["RydHQ_BAir",_BAir];
	_HQ setVariable ["RydHQ_RAir",_RAir];
	_HQ setVariable ["RydHQ_NCAir",_NCAir];
	_HQ setVariable ["RydHQ_Naval",_Naval];
	_HQ setVariable ["RydHQ_Static",_Static];
	_HQ setVariable ["RydHQ_StaticAA",_StaticAA];
	_HQ setVariable ["RydHQ_StaticAT",_StaticAT];
	_HQ setVariable ["RydHQ_Support",_Support];
	_HQ setVariable ["RydHQ_Cargo",_Cargo];
	_HQ setVariable ["RydHQ_NCCargo",_NCCargo];
	_HQ setVariable ["RydHQ_Other",_Other];
	_HQ setVariable ["RydHQ_Crew",_Crew];

	_HQ setVariable ["RydHQ_SpecForG",_SpecForG];
	_HQ setVariable ["RydHQ_reconG",_reconG];
	_HQ setVariable ["RydHQ_FOG",_FOG];
	_HQ setVariable ["RydHQ_snipersG",_snipersG];
	_HQ setVariable ["RydHQ_ATinfG",_ATinfG];
	_HQ setVariable ["RydHQ_AAinfG",_AAinfG];
	_HQ setVariable ["RydHQ_ArtG",_ArtG];
	_HQ setVariable ["RydHQ_HArmorG",_HArmorG];
	_HQ setVariable ["RydHQ_MArmorG",_MArmorG];
	_HQ setVariable ["RydHQ_LArmorG",_LArmorG];
	_HQ setVariable ["RydHQ_LArmorATG",_LArmorATG];
	_HQ setVariable ["RydHQ_CarsG",_CarsG];
	_HQ setVariable ["RydHQ_AirG",_AirG];
	_HQ setVariable ["RydHQ_BAirG",_BAirG];
	_HQ setVariable ["RydHQ_RAirG",_RAirG];
	_HQ setVariable ["RydHQ_NCAirG",_NCAirG];
	_HQ setVariable ["RydHQ_NavalG",_NavalG];
	_HQ setVariable ["RydHQ_StaticG",_StaticG];
	_HQ setVariable ["RydHQ_StaticAAG",_StaticAAG];
	_HQ setVariable ["RydHQ_StaticATG",_StaticATG];
	_HQ setVariable ["RydHQ_NCCargoG",_NCCargoG];
	_HQ setVariable ["RydHQ_OtherG",_OtherG];
	_HQ setVariable ["RydHQ_CrewG",_CrewG];

	_NCrewInfG = _NCrewInfG - (_RAirG + _StaticG);
	_NCrewInf = _NCrewInf - (_RAir + _Static);
	_InfG = _InfG - (_RAirG + _StaticG);
	_Inf = _Inf - (_RAir + _Static);

	_CargoAirEx = [];
	_CargoLandEx = [];
	if (_HQ getVariable ["RydHQ_NoAirCargo",false]) then {_CargoAirEx = _AirG};
	if (_HQ getVariable ["RydHQ_NoLandCargo",false]) then {_CargoLandEx = (_CargoG - _AirG)};
	_CargoG = _CargoG - (_CargoAirEx + _CargoLandEx + (_HQ getVariable ["RydHQ_AmmoDrop",[]]));
	_HQ setVariable ["RydHQ_CargoAirEx",_CargoAirEx];
	_HQ setVariable ["RydHQ_CargoLandEx",_CargoLandEx];
	
			
		{
		if not (_x in _SupportG) then
			{
			_SupportG set [(count _SupportG),_x]
			}
		}
	foreach (_HQ getVariable ["RydHQ_AmmoDrop",[]]);
	
	_HQ setVariable ["RydHQ_NCrewInf",_NCrewInf];
	_HQ setVariable ["RydHQ_NCrewInfG",_NCrewInfG];	
	_HQ setVariable ["RydHQ_Inf",_Inf];
	_HQ setVariable ["RydHQ_InfG",_InfG];
	_HQ setVariable ["RydHQ_CargoG",_CargoG];
	_HQ setVariable ["RydHQ_SupportG",_SupportG];
		
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

				if (((_grp == _grpD) and (_TasV in _specFor_class)) or (_tp in _specFor_class)) then {_SpecForcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _recon_class)) or (_tp in _recon_class)) then {_reconcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _FO_class)) or (_tp in _FO_class)) then {_FOcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _snipers_class)) or (_tp in _snipers_class)) then {_sniperscheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _ATinf_class)) or (_tp in _ATinf_class)) then {_ATinfcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _AAinf_class)) or (_tp in _AAinf_class)) then {_AAinfcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Inf_class)) or (_tp in _Inf_class)) then {_Infcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Art_class)) or (_tp in _Art_class)) then {_Artcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _HArmor_class)) or (_tp in _HArmor_class)) then {_HArmorcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _MArmor_class)) or (_tp in _MArmor_class)) then {_MArmorcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _LArmor_class)) or (_tp in _LArmor_class)) then {_LArmorcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _LArmorAT_class)) or (_tp in _LArmorAT_class)) then {_LArmorATcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Cars_class)) or (_tp in _Cars_class)) then {_Carscheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Air_class)) or (_tp in _Air_class)) then {_Aircheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _BAir_class)) or (_tp in _BAir_class)) then {_BAircheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _RAir_class)) or (_tp in _RAir_class)) then {_RAircheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _NCAir_class)) or (_tp in _NCAir_class)) then {_NCAircheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Naval_class)) or (_tp in _Naval_class)) then {_Navalcheck = true;_Othercheck = false};
				if (((_grp == _grpG) and (_TasV in _Static_class)) or (_tp in _Static_class)) then {_Staticcheck = true;_Othercheck = false};
				if (((_grp == _grpG) and (_TasV in _StaticAA_class)) or (_tp in _StaticAA_class)) then {_StaticAAcheck = true;_Othercheck = false};
				if (((_grp == _grpG) and (_TasV in _StaticAT_class)) or (_tp in _StaticAT_class)) then {_StaticATcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Cargo_class)) or (_tp in _Cargo_class)) then {_Cargocheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _NCCargo_class)) or (_tp in _NCCargo_class)) then {_NCCargocheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Crew_class)) or (_tp in _Crew_class)) then {_Crewcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _NCrewInf_class)) or (_tp in _NCrewInf_class)) then {_NCrewInfcheck = true;_Othercheck = false};
				if (((_grp == _grpD) and (_TasV in _Support_class)) or (_tp in _Support_class)) then {_Supportcheck = true;_NCrewInfcheck = false;_Othercheck = false};

				if ((_TasV in _NCCargo) and (_x == (assignedDriver _asV)) and ((count (units (group _x))) == 1) and not ((_ATinfcheck) or (_AAinfcheck) or (_reconcheck) or (_FOcheck) or (_sniperscheck))) then {_NCrewInfcheck = false;_Othercheck = false};
				
				if (_SpecForcheck) then {if not (_vh in _EnSpecFor) then {_EnSpecFor set [(count _EnSpecFor),_vh]};if not (_grp in _EnSpecForG) then {_EnSpecForG set [(count _EnSpecForG),_grp]}};
				if (_reconcheck) then {if not (_vh in _Enrecon) then {_Enrecon set [(count _Enrecon),_vh]};if not (_grp in _EnreconG) then {_EnreconG set [(count _EnreconG),_grp]}};
				if (_FOcheck) then {if not (_vh in _EnFO) then {_EnFO set [(count _EnFO),_vh]};if not (_grp in _EnFOG) then {_EnFOG set [(count _EnFOG),_grp]}};
				if (_sniperscheck) then {if not (_vh in _Ensnipers) then {_Ensnipers set [(count _Ensnipers),_vh]};if not (_grp in _EnsnipersG) then {_EnsnipersG set [(count _EnsnipersG),_grp]}};
				if (_ATinfcheck) then {if not (_vh in _EnATinf) then {_EnATinf set [(count _EnATinf),_vh]};if not (_grp in _EnATinfG) then {_EnATinfG set [(count _EnATinfG),_grp]}};
				if (_AAinfcheck) then {if not (_vh in _EnAAinf) then {_EnAAinf set [(count _EnAAinf),_vh]};if not (_grp in _EnAAinfG) then {_EnAAinfG set [(count _EnAAinfG),_grp]}};
				if (_Infcheck) then {if not (_vh in _EnInf) then {_EValue = _EValue + 1;_EnInf set [(count _EnInf),_vh]};if not (_grp in _EnInfG) then {_EnInfG set [(count _EnInfG),_grp]}};
				if (_Artcheck) then {if not (_vh in _EnArt) then {_EValue = _EValue + 3;_EnArt set [(count _EnArt),_vh]};if not (_grp in _EnArtG) then {_EnArtG set [(count _EnArtG),_grp]}};
				if (_HArmorcheck) then {if not (_vh in _EnHArmor) then {_EValue = _EValue + 10;_EnHArmor set [(count _EnHArmor),_vh]};if not (_grp in _EnHArmorG) then {_EnHArmorG set [(count _EnHArmorG),_grp]}};
				if (_MArmorcheck) then {if not (_vh in _EnMArmor) then {_EnMArmor set [(count _EnMArmor),_vh]};if not (_grp in _EnMArmorG) then {_EnMArmorG set [(count _EnMArmorG),_grp]}};
				if (_LArmorcheck) then {if not (_vh in _EnLArmor) then {_EValue = _EValue + 5;_EnLArmor set [(count _EnLArmor),_vh]};if not (_grp in _EnLArmorG) then {_EnLArmorG set [(count _EnLArmorG),_grp]}};
				if (_LArmorATcheck) then {if not (_vh in _EnLArmorAT) then {_EnLArmorAT set [(count _EnLArmorAT),_vh]};if not (_grp in _EnLArmorATG) then {_EnLArmorATG set [(count _EnLArmorATG),_grp]}};
				if (_Carscheck) then {if not (_vh in _EnCars) then {_EValue = _EValue + 3;_EnCars set [(count _EnCars),_vh]};if not (_grp in _EnCarsG) then {_EnCarsG set [(count _EnCarsG),_grp]}};
				if (_Aircheck) then {if not (_vh in _EnAir) then {_EValue = _EValue + 15;_EnAir set [(count _EnAir),_vh]};if not (_grp in _EnAirG) then {_EnAirG set [(count _EnAirG),_grp]}};
				if (_BAircheck) then {if not (_vh in _EnBAir) then {_EnBAir set [(count _EnBAir),_vh]};if not (_grp in _EnBAirG) then {_EnBAirG set [(count _EnBAirG),_grp]}};				
				if (_RAircheck) then {if not (_vh in _EnRAir) then {_EnRAir set [(count _EnRAir),_vh]};if not (_grp in _EnRAirG) then {_EnRAirG set [(count _EnRAirG),_grp]}};
				if (_NCAircheck) then {if not (_vh in _EnNCAir) then {_EnNCAir set [(count _EnNCAir),_vh]};if not (_grp in _EnNCAirG) then {_EnNCAirG set [(count _EnNCAirG),_grp]}};
				if (_Navalcheck) then {if not (_vh in _EnNaval) then {_EnNaval set [(count _EnNaval),_vh]};if not (_grp in _EnNavalG) then {_EnNavalG set [(count _EnNavalG),_grp]}};
				if (_Staticcheck) then {if not (_vh in _EnStatic) then {_EValue = _EValue + 1;_EnStatic set [(count _EnStatic),_vh]};if not (_grp in _EnStaticG) then {_EnStaticG set [(count _EnStaticG),_grp]}};
				if (_StaticAAcheck) then {if not (_vh in _EnStaticAA) then {_EnStaticAA set [(count _EnStaticAA),_vh]};if not (_grp in _EnStaticAAG) then {_EnStaticAAG set [(count _EnStaticAAG),_grp]}};
				if (_StaticATcheck) then {if not (_vh in _EnStaticAT) then {_EnStaticAT set [(count _EnStaticAT),_vh]};if not (_grp in _EnStaticATG) then {_EnStaticATG set [(count _EnStaticATG),_grp]}};
				if (_Supportcheck) then {if not (_vh in _EnSupport) then {_EnSupport set [(count _EnSupport),_vh]};if not (_grp in _EnSupportG) then {_EnSupportG set [(count _EnSupportG),_grp]}};
				if (_Cargocheck) then {if not (_vh in _EnCargo) then {_EnCargo set [(count _EnCargo),_vh]};if not (_grp in _EnCargoG) then {_EnCargoG set [(count _EnCargoG),_grp]}};
				if (_NCCargocheck) then {if not (_vh in _EnNCCargo) then {_EnNCCargo set [(count _EnNCCargo),_vh]};if not (_grp in _EnNCCargoG) then {_EnNCCargoG set [(count _EnNCCargoG),_grp]}};
				if (_Crewcheck) then {if not (_vh in _EnCrew) then {_EnCrew set [(count _EnCrew),_vh]};if not (_grp in _EnCrewG) then {_EnCrewG set [(count _EnCrewG),_grp]}};
				if (_NCrewInfcheck) then {if not (_vh in _EnNCrewInf) then {_EnNCrewInf set [(count _EnNCrewInf),_vh]};if not (_grp in _EnNCrewInfG) then {_EnNCrewInfG set [(count _EnNCrewInfG),_grp]}};
				
			}
		foreach (units _x)
		}
	foreach _knownEG;
	
	_HQ setVariable ["RydHQ_EValue",_EValue];

	_HQ setVariable ["RydHQ_EnSpecFor",_EnSpecFor];
	_HQ setVariable ["RydHQ_Enrecon",_Enrecon];
	_HQ setVariable ["RydHQ_EnFO",_EnFO];
	_HQ setVariable ["RydHQ_Ensnipers",_Ensnipers];
	_HQ setVariable ["RydHQ_EnATinf",_EnATinf];
	_HQ setVariable ["RydHQ_EnAAinf",_EnAAinf];
	_HQ setVariable ["RydHQ_EnArt",_EnArt];
	_HQ setVariable ["RydHQ_EnHArmor",_EnHArmor];
	_HQ setVariable ["RydHQ_EnMArmor",_EnMArmor];
	_HQ setVariable ["RydHQ_EnLArmor",_EnLArmor];
	_HQ setVariable ["RydHQ_EnLArmorAT",_EnLArmorAT];
	_HQ setVariable ["RydHQ_EnCars",_EnCars];
	_HQ setVariable ["RydHQ_EnAir",_EnAir];
	_HQ setVariable ["RydHQ_EnBAir",_EnBAir];
	_HQ setVariable ["RydHQ_EnRAir",_EnRAir];
	_HQ setVariable ["RydHQ_EnNCAir",_EnNCAir];
	_HQ setVariable ["RydHQ_EnNaval",_EnNaval];
	_HQ setVariable ["RydHQ_EnStatic",_EnStatic];
	_HQ setVariable ["RydHQ_EnStaticAA",_EnStaticAA];
	_HQ setVariable ["RydHQ_EnStaticAT",_EnStaticAT];
	_HQ setVariable ["RydHQ_EnSupport",_EnSupport];
	_HQ setVariable ["RydHQ_EnCargo",_EnCargo];
	_HQ setVariable ["RydHQ_EnNCCargo",_EnNCCargo];
	_HQ setVariable ["RydHQ_EnOther",_EnOther];
	_HQ setVariable ["RydHQ_EnCrew",_EnCrew];

	_HQ setVariable ["RydHQ_EnSpecForG",_EnSpecForG];
	_HQ setVariable ["RydHQ_EnreconG",_EnreconG];
	_HQ setVariable ["RydHQ_EnFOG",_EnFOG];
	_HQ setVariable ["RydHQ_EnsnipersG",_EnsnipersG];
	_HQ setVariable ["RydHQ_EnATinfG",_EnATinfG];
	_HQ setVariable ["RydHQ_EnAAinfG",_EnAAinfG];
	_HQ setVariable ["RydHQ_EnArtG",_EnArtG];
	_HQ setVariable ["RydHQ_EnHArmorG",_EnHArmorG];
	_HQ setVariable ["RydHQ_EnMArmorG",_EnMArmorG];
	_HQ setVariable ["RydHQ_EnLArmorG",_EnLArmorG];
	_HQ setVariable ["RydHQ_EnLArmorATG",_EnLArmorATG];
	_HQ setVariable ["RydHQ_EnCarsG",_EnCarsG];
	_HQ setVariable ["RydHQ_EnAirG",_EnAirG];
	_HQ setVariable ["RydHQ_EnBAirG",_EnBAirG];
	_HQ setVariable ["RydHQ_EnRAirG",_EnRAirG];
	_HQ setVariable ["RydHQ_EnNCAirG",_EnNCAirG];
	_HQ setVariable ["RydHQ_EnNavalG",_EnNavalG];
	_HQ setVariable ["RydHQ_EnStaticG",_EnStaticG];
	_HQ setVariable ["RydHQ_EnStaticAAG",_EnStaticAAG];
	_HQ setVariable ["RydHQ_EnStaticATG",_EnStaticATG];
	_HQ setVariable ["RydHQ_EnSupportG",_EnSupportG];
	_HQ setVariable ["RydHQ_EnCargoG",_EnCargoG];
	_HQ setVariable ["RydHQ_EnNCCargoG",_EnNCCargoG];
	_HQ setVariable ["RydHQ_EnOtherG",_EnOtherG];
	_HQ setVariable ["RydHQ_EnCrewG",_EnCrewG];

	_EnNCrewInfG = _EnNCrewInfG - (_EnRAirG + _EnStaticG);
	_EnNCrewInf = _EnNCrewInf - (_EnRAir + _EnStatic);
	_EnInfG = _EnInfG - (_EnRAirG + _EnStaticG);
	_EnInf = _EnInf - (_EnRAir + _EnStatic);
	
	_HQ setVariable ["RydHQ_EnNCrewInf",_EnNCrewInf];
	_HQ setVariable ["RydHQ_EnNCrewInfG",_EnNCrewInfG];
	_HQ setVariable ["RydHQ_EnInf",_EnInf];
	_HQ setVariable ["RydHQ_EnInfG",_EnInfG];

	if (_HQ getVariable ["RydHQ_Flee",true]) then
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
		foreach _friends;

		if (_AllPanic == 0) then {_AllPanic = 1};
		_midCow = 0;
		if not ((count _friends) == 0) then {_midCow = _AllCow/(count _friends)};

			{
			_cowF = ((- _morale)/(50 + (random 25))) + (random (2 * _midCow)) - _midCow;
			_cowF = _cowF * (_HQ getVariable ["RydHQ_Muu",1]);
			if (_x in _SpecForG) then {_cowF = _cowF - 0.8};
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

			if (((random ((20 + (_morale/5))/_AllPanic)) < _cowF) and ((random 100) > (100/(_AllPanic + 1)))) then 
				{
				[_x] call RYD_WPdel;
				_x setVariable [("inPanic" + (str _x)), true];
				if (_HQ getVariable ["RydHQ_DebugII",false]) then 
					{
					_signum = _HQ getVariable ["RydHQ_CodeSign","X"];
					_i = [(getPosATL (vehicle (leader _x))),_x,"markPanic","ColorYellow","ICON","mil_dot",_signum + "!",_signum + "!",[0.5,0.5]] call RYD_Mark
					};
					
				_x setVariable [("Busy" + (str _x)), true];

				_UL = leader _x;
				if not (isPlayer _UL) then 
					{
					if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_InPanic,"InPanic"] call RYD_AIChatter}
					};

				if (_HQ getVariable ["RydHQ_Surr",false]) then
					{
					if ((random 100) > 50) then
						{
						if (_HQ getVariable ["RydHQ_DebugII",false]) then 
							{
							_signum = _HQ getVariable ["RydHQ_CodeSign","X"];
							_i setMarkerColor "ColorPink";
							_i setMarkerText (_signum + "!!!")
							};
							
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
		foreach _friends
		};

		{
		_KnEnPos set [(count _KnEnPos),getPosATL (vehicle (leader _x))];
		if ((count _KnEnPos) >= 100) then {_KnEnPos = _KnEnPos - [_KnEnPos select 0]};
		}
	foreach _knownEG;
	
	_HQ setVariable ["RydHQ_KnEnPos",_KnEnPos];

	for [{_z = 0},{_z < (count _knownE)},{_z = _z + 1}] do
		{
		_KnEnemy = _knownE select _z;
			{
			if ((_x knowsAbout _KnEnemy) > 0.01) then {_HQ reveal [_KnEnemy,2]}
			}
		foreach _friends
		};

	if (_cycleC == 1) then
		{
		if ((_HQ getVariable ["RydHQ_ArtyShells",1]) > 0) then
			{
			[_ArtG,(_HQ getVariable ["RydHQ_ArtyShells",1])] call RYD_ArtyPrep;
			};

		if ((RydBB_Active) and ((_HQ getVariable ["leaderHQ",(leader _HQ)]) in (RydBBa_HQs + RydBBb_HQs))) then 
			{
			_HQ setVariable ["RydHQ_readyForBB",true];
			_HQ setVariable ["RydHQ_Pending",false];
			if ((_HQ getVariable ["leaderHQ",(leader _HQ)]) in RydBBa_HQs) then 
				{
				waitUntil {sleep 0.1;(RydBBa_InitDone)}
				};

			if ((_HQ getVariable ["leaderHQ",(leader _HQ)]) in RydBBb_HQs) then 
				{
				waitUntil {sleep 0.1;(RydBBb_InitDone)}
				}
			}
		};

	if (((count _knownE) > 0) and ((count _ArtG) > 0) and ((_HQ getVariable ["RydHQ_ArtyShells",1]) > 0)) then {[_ArtG,_knownE,(_EnHArmor + _EnMArmor + _EnLArmor),_friends,(_HQ getVariable ["RydHQ_Debug",false]),(_HQ getVariable ["leaderHQ",(leader _HQ)])] call RYD_CFF};

	_gauss100 = (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10) + (random 10);
	_obj = _HQ getVariable "RydHQ_Obj";
	if ((((_gauss100 + (_HQ getVariable ["RydHQ_Inertia",0]) + _morale) > ((_EValue/(_FValue + 0.1)) * 60)) and not (isNil ("_obj")) and not ((_HQ getVariable ["RydHQ_Order","ATTACK"]) == "DEFEND")) or ((_HQ getVariable ["RydHQ_Berserk",false]))) then 
		{
		_lastS = _HQ getVariable ["LastStance","At"];
		if ((_lastS == "De") or (_cycleC == 1)) then
			{
			if ((random 100) < RydxHQ_AIChatDensity) then {[(_HQ getVariable ["leaderHQ",(leader _HQ)]),RydxHQ_AIC_OffStance,"OffStance"] call RYD_AIChatter};
			};

		_HQ setVariable ["LastStance","At"];
		_HQ setVariable ["RydHQ_Inertia",30 * (0.5 + (_HQ getVariable ["RydHQ_Consistency",0.5]))*(0.5 + (_HQ getVariable ["RydHQ_Activity",0.5]))];
		[_HQ] call HAL_HQOrders 
		} 
	else 
		{
		_lastS = _HQ getVariable ["LastStance","De"];
		if ((_lastS == "At") or (_cycleC == 1)) then
			{
			if ((random 100) < RydxHQ_AIChatDensity) then {[(_HQ getVariable ["leaderHQ",(leader _HQ)]),RydxHQ_AIC_DefStance,"DefStance"] call RYD_AIChatter};
			};

		_HQ setVariable ["LastStance","De"];
		_HQ setVariable ["RydHQ_Inertia", - (30  * (0.5 + (_HQ getVariable ["RydHQ_Consistency",0.5])))/(0.5 + (_HQ getVariable ["RydHQ_Activity",0.5]))];
		[_HQ] call HAL_HQOrdersDef 
		};


	if (((((_HQ getVariable ["RydHQ_Circumspection",0.5]) + (_HQ getVariable ["RydHQ_Fineness",0.5]))/2) + 0.1) > (random 1.2)) then
		{
		_SFcount = {not (_x getVariable ["Busy" + (str _x),false]) and not (_x getVariable ["Resting" + (str _x),false])} count (_SpecForG - (_HQ getVariable ["RydHQ_SFBodyGuard",[]]));

		if (_SFcount > 0) then
			{
			_isNight = [] call RYD_isNight;
			_SFTgts = [];
			_chance = 40 + (60 * (_HQ getVariable ["RydHQ_Activity",0.5]));

				{
				_HQ = group _x;
				if (_HQ in _knownEG) then
					{
					_SFTgts set [(count _SFTgts),_HQ]
					}
				}
			foreach (RydxHQ_AllLeaders - [(_HQ getVariable ["leaderHQ",(leader _HQ)])]);

			if ((count _SFTgts) == 0) then
				{
				_chance = _chance/2;
				_SFTgts = _EnArtG
				};

			if ((count _SFTgts) == 0) then
				{
				_chance = _chance/3;
				_SFTgts = _EnStaticG
				};

			if (_isNight) then
				{
				_chance = _chance + 25
				};

			if ((count _SFTgts) > 0) then
				{
				_chance = _chance + (((2 * _SFcount) - (8/(0.75 + ((_HQ getVariable ["RydHQ_Recklessness",0.5])/2)))) * 20);
				_trgG = _SFTgts select (floor (random (count _SFTgts)));
				_alreadyAttacked = {_x == _trgG} count (_HQ getVariable ["RydHQ_SFTargets",[]]);
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
								if not (_x in (_HQ getVariable ["RydHQ_SFBodyGuard",[]])) then
									{	
									_SFAv set [(count _SFAv),_x]
									}
								}
							}
						}
					foreach _SpecForG;

					_team = _SFAv select (floor (random (count _SFAv)));
					_trg = vehicle (leader _trgG);
					if (not ((typeOf _trg) in (_HArmor + _LArmor)) or ((random 100) > (90 - ((_HQ getVariable ["RydHQ_Recklessness",0.5]) * 10)))) then {[_team,_trg,_trgG,_HQ] spawn HAL_GoSFAttack}
					}
				}
			}
		};

	if ((_HQ getVariable ["RydHQ_LRelocating",false])) then
		{
		if ((abs (speed (vehicle (_HQ getVariable ["leaderHQ",(leader _HQ)])))) < 0.1) then {_HQ setVariable ["onMove",false]};
		_onMove = _HQ getVariable ["onMove",false];

		if not (_onMove) then 
			{
			if (not (isPlayer (_HQ getVariable ["leaderHQ",(leader _HQ)])) and ((_cycleC == 1) or not ((_HQ getVariable ["RydHQ_Progress",0]) == 0))) then
				{
				[_HQ] call RYD_WPdel;

				_Lpos = position (_HQ getVariable ["leaderHQ",(leader _HQ)]);
				if (_cycleC == 1) then {_HQ setVariable ["RydHQ_Fpos",_Lpos]};

				_rds = 0;

				if (_HQ getVariable ["RydHQ_LRelocating",false]) then 
					{
					_rds = 0;
					switch (_HQ getVariable ["RydHQ_NObj",1]) do
						{
						case (1) : 
							{
							_Lpos = (_HQ setVariable ["RydHQ_Fpos",_Lpos]);
							if ((_HQ getVariable ["leaderHQ",(leader _HQ)]) in (RydBBa_HQs + RydBBb_HQs)) then 
								{
								_Lpos = position (_HQ getVariable ["leaderHQ",(leader _HQ)])
								};

							_rds = 0
							};
							
						case (2) : {_Lpos = position RydHQC_Obj1};
						case (3) : {_Lpos = position RydHQC_Obj2};
						default {_Lpos = position RydHQC_Obj3};
						};
					};

				_spd = "LIMITED";
				if ((_HQ getVariable ["RydHQ_Progress",0]) == -1) then {_spd = "NORMAL"};
				_HQ setVariable ["RydHQ_Progress",0];
				_enemyN = false;

					{
					_eLdr = vehicle (leader _x);
					_eDst = _eLdr distance _Lpos;

					if (_eDst < 600) exitWith {_enemyN = true}
					}
				foreach _knownEG;

				if not (_enemyN) then 
					{
					_wp = [_HQ,_Lpos,"HOLD","AWARE","GREEN",_spd,["true",""],true,_rds,[0,0,0],"FILE"] call RYD_WPadd;
					if (isNull (assignedVehicle (_HQ getVariable ["leaderHQ",(leader _HQ)]))) then
						{
						if ((_HQ getVariable ["RydHQ_GetHQInside",false])) then {[_wp] call RYD_GoInside}
						};

					if (((_HQ getVariable ["RydHQ_LRelocating",false])) and ((_HQ getVariable ["RydHQ_NObj",1]) > 1) and (_cycleC > 1)) then 
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
								foreach _knownEG;

								if (isNull _HQ) then 
									{
									_onPlace = true
									}
								else
									{
									if not (_getBack) then
										{
										if (((vehicle (_HQ getVariable ["leaderHQ",(leader _HQ)])) distance _LPos) < 30) then {_onPlace = true}
										}
									};
								

								((_getback) or (_onPlace))
								};

							if not (_onPlace) then
								{
								_rds = 30;
								switch (true) do
									{
									case ((_HQ getVariable ["RydHQ_NObj",1]) <= 2) then {_Lpos = getPosATL (vehicle (_HQ getVariable ["leaderHQ",(leader _HQ)]));_rds = 0};
									case ((_HQ getVariable ["RydHQ_NObj",1]) == 3) then {_Lpos = position (_HQ getVariable ["RydHQ_Obj1",(leader _HQ)])};
									case ((_HQ getVariable ["RydHQ_NObj",1]) >= 4) then {_Lpos = position (_HQ getVariable ["RydHQ_Obj2",(leader _HQ)])};
									};

								_getBack = false;

									{
									_eLdr = vehicle (leader _x);
									_eDst = _eLdr distance _Lpos;

									if (_eDst < 600) exitWith {_getBack = true}
									}
								foreach _knownEG;

								if (_getBack) then {_Lpos = getPosATL (vehicle (_HQ getVariable ["leaderHQ",(leader _HQ)]));_rds = 0};

								[_HQ] call RYD_WPdel;	

								_spd = "NORMAL";
								if not (((vehicle (_HQ getVariable ["leaderHQ",(leader _HQ)])) distance _LPos) < 50) then {_spd = "FULL"};
								_wp = [_HQ,_Lpos,"HOLD","AWARE","GREEN",_spd,["true",""],true,_rds,[0,0,0],"FILE"] call RYD_WPadd;
								if (isNull (assignedVehicle (_HQ getVariable ["leaderHQ",(leader _HQ)]))) then
									{
									if (_HQ getVariable ["RydHQ_GetHQInside",false]) then {[_wp] call RYD_GoInside}
									};

								_HQ setVariable ["onMove",true];
								}
							}
						}
					}
				}
			}
		};
		
	_delay = round (((22.5 + (count _friends))/(0.5 + (_HQ getVariable ["RydHQ_Reflex",0.5]))) * (_HQ getVariable ["RydHQ_CommDelay",1]));
	_alive = true;
	_ct = time;
	_ctRev = time;
	_ctMedS = time;
	_ctFuel = time;
	_ctAmmo = time;
	_ctRep = time;
	_ctISF = time;
	_ctReloc = time;
	_ctLPos = time;
	_ctDesp = time;
	_ctEScan = time;
	_ctGarr = time;
	
	_HQ setVariable ["RydHQ_Pending",false];
	
	waitUntil
		{
		sleep 1;
		
		switch (true) do
			{
			case (isNull _HQ) : {_alive = false};
			case (({alive _x} count (units _HQ)) == 0) : {_alive = false};
			case (_HQ getVariable ["RydHQ_Surrender",false]) : {_alive = false};
			};
			
		if (_alive) then
			{
			if (((time - _ctRev) >= 20) or (((time - _ct) > _delay) and (_delay <= 20))) then
				{
				_ctRev = time;
				[_HQ] call HAL_Rev;
				};
							
			if (((count (_HQ getVariable ["RydHQ_Support",[]])) > 0) and (_cycleC > 2)) then
				{
				if (((time - _ctMedS) >= 25) or (((time - _ct) > _delay) and (_delay <= 25))) then
					{
					if (_HQ getVariable ["RydHQ_SMed",true]) then
						{
						_ctMedS = time;
						[_HQ] call HAL_SuppMed;
						}
					};
				
				if (((time - _ctFuel) >= 25) or (((time - _ct) > _delay) and (_delay <= 25))) then
					{
					if (_HQ getVariable ["RydHQ_SFuel",true]) then
						{
						_ctFuel = time;
						[_HQ] call HAL_SuppFuel;
						}
					};
				
				if (((time - _ctRep) >= 25) or (((time - _ct) > _delay) and (_delay <= 25))) then
					{
					if (_HQ getVariable ["RydHQ_SRep",true]) then
						{
						_ctRep = time;
						[_HQ] call HAL_SuppRep;
						}
					};
				};
					
			if (((count ((_HQ getVariable ["RydHQ_Support",[]]) + (_HQ getVariable ["RydHQ_AmmoDrop",[]]))) > 0) and (_cycleC > 2)) then
				{
				if (((time - _ctAmmo) >= 25) or (((time - _ct) > _delay) and (_delay <= 25))) then
					{
					if (_HQ getVariable ["RydHQ_SAmmo",true]) then
						{
						_ctAmmo = time;
						[_HQ] call HAL_SuppAmmo;
						}
					};
				};
				
			if (((time - _ctISF) >= 30) or (((time - _ct) > _delay) and (_delay <= 30))) then
				{
				_ctISF = time;
				_nPos = getPosATL (vehicle (leader _HQ));
				
				if ((_nPos distance _HQlPos) > 10) then
					{
					_HQlPos = _nPos;
					
					[_HQ] call HAL_SFIdleOrd
					}
				};
				
			if (((time - _ctReloc) >= 60) or (((time - _ct) > _delay) and (_delay <= 60))) then
				{
				_ctReloc = time;
				[_HQ] call HAL_Reloc
				};
				
				
			if (_cycleC > 2) then
				{
				if (((time - _ctLPos) >= 60) or (((time - _ct) > _delay) and (_delay <= 60))) then
					{
					_ctLPos = time;
					[_HQ] call HAL_LPos
					}
				};
				
			if (((time - _ctDesp) >= 60) or (((time - _ct) > _delay) and (_delay <= 60))) then
				{
				_ctDesp = time;
				[_HQ] call Desperado
				};
				
			if (((time - _ctEScan) >= 60) or (((time - _ct) > _delay) and (_delay <= 60))) then
				{
				_ctEScan = time;
				[_HQ] call HAL_EnemyScan
				};	

			if (((time - _ctGarr) >= 60) or (((time - _ct) > _delay) and (_delay <= 60))) then
				{
				_ctGarr = time;
				[_HQ,(_snipers + _ATinf + _AAinf)] call HAL_Garrison
				};	
			};
			
		(((time - _ct) > _delay) or not (_alive))
		};
				
	if not (_alive) exitWith {RydxHQ_AllHQ = RydxHQ_AllHQ - [_HQ]};

		{
		_HQ reveal (vehicle (leader _x))
		}
	foreach _friends;

	for [{_z = 0},{_z < (count _knownE)},{_z = _z + 1}] do
		{
		_KnEnemy = _knownE select _z;

			{
			if ((_x knowsAbout _KnEnemy) > 0.01) then {_HQ reveal [_KnEnemy,2]} 
			}
		foreach _friends
		}
	};