_i = "";

_unitG = _this select 0;_Spos = _unitG getvariable ("START" + (str _unitG));if (isNil ("_Spos")) then {_unitG setVariable [("START" + (str _unitG)),(position (vehicle (leader _unitG)))];_Spos = _unitG getVariable ("START" + (str _unitG))}; 
_Trg = objNull;
_isAttacked = _this select 1;

_amountG = count (units _unitG);

if (isNil ("RydHQG_Obj")) then {_trg = leaderHQG} else {_Trg = RydHQG_Obj};

_PosObj1 = position _Trg;
_unitvar = str _unitG;

[_unitG] call RYD_WPdel;

_currentObj = RydHQG_NObj;
_BBProg = RydHQG getVariable ["BBProgress",0];

_unitG setVariable [("Capt" + (str _unitG)),true];
RydHQG_AttackAv = RydHQG_AttackAv - [_unitG];

_UL = leader _unitG;
_nothing = true;

_dX = (_PosObj1 select 0) - ((getPos leaderHQG) select 0);
_dY = (_PosObj1 select 1) - ((getPos leaderHQG) select 1);

_angle = _dX atan2 _dY;

_distance = leaderHQG distance _PosObj1;
_distance2 = 100;

_dXc = _distance2 * (cos _angle);
_dYc = _distance2 * (sin _angle);

switch (_isAttacked) do
	{
	case (3) : {_dYc = - _dYc};
	case (2) : {_dXc = - _dXc};
	case (1) : {_distance = _distance - _distance2;_dXc = 0;_dYc = 0};
	default {_dXc = 0;_dYc = 0};
	};

_dXb = _distance * (sin _angle);
_dYb = _distance * (cos _angle);

_posX = ((getPos leaderHQG) select 0) + _dXb + _dXc + (random 200) -  100;
_posY = ((getPos leaderHQG) select 1) + _dYb + _dYc + (random 200) -  100;

_isWater = surfaceIsWater [_posX,_posY];

while {((_isWater) and (([_posX,_posY] distance _PosObj1) >= 10))} do
	{
	_posX = _posX - _dXc/20;
	_posY = _posY - _dYc/20;
	_isWater = surfaceIsWater [_posX,_posY];
	};

_isWater = surfaceIsWater [_posX,_posY];

if (_isWater) exitwith 
	{
	_unitG setVariable [("Capt" + (str _unitG)),false];
	_isAttacked = _Trg getVariable ("Capturing" + (str _Trg));
	_amountC = _isAttacked select 1;
	_amountC = _amountC - _amountG;
	_isAttacked = _isAttacked select 0;
	_isAttacked = _isAttacked - 1;
	_Trg setVariable [("Capturing" + (str _Trg)),[_isAttacked,_amountC]];
	RydHQG_AttackAv = RydHQG_AttackAv + [(_unitG)];
	_unitG setVariable [("Busy" + (str _unitG)),false]
	};

if ((isPlayer (leader _unitG)) and (RydxHQ_GPauseActive)) then {hintC "New orders from HQ!";setAccTime 1};

_UL = leader _unitG;
RydHQG_VCDone = true;
if (isPlayer _UL) then {[_UL,leaderHQG] spawn VoiceComm;sleep 3;waituntil {sleep 0.1;(RydHQG_VCDone)}} else {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdConf,"OrdConf"] call RYD_AIChatter}};

if ((RydHQG_Debug) or (isPlayer (leader _unitG))) then 
	{
	_i = [[_posX,_posY],_unitG,"markCapture","ColorRed","ICON","mil_dot","Cap G"," - SECURE AREA"] call RYD_Mark
	};

_CargoCheck = _unitG getvariable ("CC" + _unitvar);
if (isNil ("_CargoCheck")) then {_unitG setVariable [("CC" + _unitvar), false]};
_AV = assignedVehicle _UL;
if ((RydHQG_CargoFind > 0) and (isNull _AV) and (([_posX,_posY] distance (vehicle _UL)) > 1000)) then {[_unitG] spawn G_SCargo } else {_unitG setVariable [("CC" + _unitvar), true]};
if (RydHQG_CargoFind > 0) then 
	{
	waituntil {sleep 0.05;(_unitG getvariable ("CC" + _unitvar))};
	_unitG setVariable [("CC" + _unitvar), false];
	};

_AV = assignedVehicle _UL;
_DAV = assigneddriver _AV;
_GDV = group _DAV;
_alive = false;
_timer = 0;
_task = taskNull;

if (not (isNull _AV) and (RydHQG_CargoFind > 0)) then
	{
	_wp = [_unitG,_AV,"GETIN"] call RYD_WPadd;
	_wp waypointAttachVehicle _AV;

	_cause = [_unitG,1,false,0,900,[],true,false,true,false,false,false] call RYD_Wait;
	if (RydHQG_LZ) then {deleteVehicle (_AV getVariable ["TempLZ",objNull])};
	_timer = _cause select 0
	};

if ((isNull (leader (_this select 0))) or (_timer > 900)) exitwith 
	{
	if not (isNull (leader (_this select 0))) then {_unitG setVariable [("Capt" + (str _unitG)),false]};
	_isAttacked = _Trg getVariable ("Capturing" + (str _Trg));
	_amountC = _isAttacked select 1;
	_amountC = _amountC - _amountG;
	_isAttacked = _isAttacked select 0;
	_isAttacked = _isAttacked - 1;
	_Trg setVariable [("Capturing" + (str _Trg)),[_isAttacked,_amountC]];
	if ((RydHQG_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markCapture" + str (_unitG))};
	if not (isNull _GDV) then 
		{
		[_GDV, (currentWaypoint _GDV)] setWaypointPosition [position (vehicle (leader _GDV)), 0];
		_GDV setVariable [("Busy" + _unitvar), false];
		}
	};

_AV = assignedVehicle _UL;
_DAV = assigneddriver _AV;
_GDV = group _DAV;
_wp0 = [];_wp = [];
_nW = 1;

_LX1 = _posX;
_LY1 = _posY;
_EnNearTrg = false;
_NeNMode = false;
_halfway = false;
_mpl = 1;

_eClose1 = [[_posX,_posY],RydHQG_KnEnemiesG,300] call RYD_CloseEnemyB;

_tooC1 = _eClose1 select 0;
_dstEM1 = _eClose1 select 1;
_NeN = _eClose1 select 2;

if not (isNull _NeN) then
	{
	_eClose2 = [_UL,RydHQG_KnEnemiesG,300] call RYD_CloseEnemyB;
	_tooC2 = _eClose2 select 0;
	_dstEM2 = _eClose2 select 1;
	_eClose3 = [leaderHQG,RydHQG_KnEnemiesG,300] call RYD_CloseEnemyB;
	_tooC3 = _eClose3 select 0;

	if ((_tooC1) or (_tooC2) or (_tooC3) or (((_UL distance [_posX,_posY]) - _dstEM2) > _dstEM1)) then {_EnNearTrg = true}
	};

if (_EnNearTrg) then {_NeNMode = true};
if (not (isNull _GDV) and (_GDV in (RydHQG_NCCargoG + RydHQG_AirG)) and (_NeNMode) and not (isPlayer (leader _GDV))) then {_LX1 = (position _UL) select 0;_LY1 = (position _UL) select 1;_halfway = true};

if ((isNull _AV) and (([_posX,_posY] distance _UL) > 1500) and not (isPlayer (leader _unitG))) then
	{
	_LX = (position _UL) select 0;
	_LY = (position _UL) select 1;

	_spd = "LIMITED";
	_TO = [0,0,0];
	if (_NeNMode) then {_spd = "NORMAL";_TO = [40, 45, 50]};

	_wp0 = [_unitG,[(_posX + _LX)/2,(_posY + _LY)/2],"MOVE","SAFE","YELLOW",_spd,["true","deletewaypoint [(group this), 0];"],true,0,_TO] call RYD_WPadd;
	
	_nW = 2;
	};

_task = [(leader _unitG),["Reach Area.", "Move", ""],[_posX,_posY]] call RYD_AddTask;

_Ctask = taskNull;
if ((isPlayer (leader _GDV)) and not ((leader _GDV) == (leader _unitG))) then
	{
	_Ctask = [(leader _GDV),["Disembark group at designated position.", "Move", ""],[(_posX + _LX1)/2,(_posY + _LY1)/2]] call RYD_AddTask
	};

_gp = _unitG;
if not (isNull _AV) then {_gp = _GDV;_posX = (_posX + _LX1)/2;_posY = (_posY + _LY1)/2};
_pos = [_posX,_posY];
_tp = "MOVE";

_beh = "SAFE";
_lz = objNull;
if (not (isNull _AV) and (_GDV in RydHQG_AirG)) then 
	{
	_beh = "CARELESS";
	if (RydHQG_LZ) then
		{
		_lz = [[_posX,_posY]] call RYD_LZ;
		if not (isNull _lz) then
			{
			_pos = getPosATL _lz;
			_posX = _pos select 0;
			_posY = _pos select 1
			}
		}
	};

_spd = "NORMAL";
if ((isNull _AV) and (([_posX,_posY] distance _UL) > 1000) and not (_NeNMode)) then {_spd = "LIMITED"};
_TO = [0,0,0];
if ((isNull _AV) and (([_posX,_posY] distance _UL) <= 1000) or ((_NeNMode) and (isNull _AV))) then {_TO = [40, 45, 50]};
_crr = false;
if ((_nW == 1) and (isNull _AV)) then {_crr = true};
if not (isNull _AV) then {_crr = true};
_sts = ["true","deletewaypoint [(group this), 0];"];
if (((group (assigneddriver _AV)) in RydHQG_AirG) and (_unitG in RydHQG_NCrewInfG)) then {_sts = ["true","(vehicle this) land 'GET OUT';deletewaypoint [(group this), 0]"]};

_wp = [_gp,_pos,_tp,_beh,"YELLOW",_spd,_sts,_crr,0,_TO] call RYD_WPadd;

_DAV = assigneddriver _AV;
_alive = false;
_timer = 0;
_OtherGroup = false;
_GDV = group _DAV;
_enemy = false;

//_lz = objNull;

if not (((group _DAV) == (group _UL)) or (isNull (group _DAV))) then 
	{
	//if (_AV isKindOf "Air") then {_lz = [_pos] call RYD_LZ};

	_OtherGroup = true;

	_cause = [_GDV,6,true,400,30,[RydHQG_AirG,RydHQG_KnEnemiesG],false] call RYD_Wait;
	_timer = _cause select 0;
	_alive = _cause select 1;
	_enemy = _cause select 2
	}
else 
	{
	_cause = [_unitG,6,true,400,30,[RydHQG_AirG,RydHQG_KnEnemiesG],false] call RYD_Wait;
	_timer = _cause select 0;
	_alive = _cause select 1;
	_enemy = _cause select 2
	};

_DAV = assigneddriver _AV;
if (((_timer > 30) or (_enemy)) and (_OtherGroup)) then {if not (isNull _GDV) then {[_GDV, (currentWaypoint _GDV)] setWaypointPosition [position (vehicle (leader _GDV)), 0]}};
if (((_timer > 30) or (_enemy)) and not (_OtherGroup)) then {[_unitG, (currentWaypoint _unitG)] setWaypointPosition [position (vehicle _UL), 0]};
if (not (_alive) and not (_OtherGroup)) exitwith 
	{
	_isAttacked = _Trg getVariable ("Capturing" + (str _Trg));
	_amountC = _isAttacked select 1;
	_amountC = _amountC - _amountG;
	_isAttacked = _isAttacked select 0;
	_isAttacked = _isAttacked - 1;
	_Trg setVariable [("Capturing" + (str _Trg)),[_isAttacked,_amountC]];
	if ((RydHQG_Debug) or (isPlayer (leader _unitG))) then 
		{
		deleteMarker ("markCapture" + str (_unitG))
		}
	};

if (isNull (leader (_this select 0))) exitwith 
	{
	_isAttacked = _Trg getVariable ("Capturing" + (str _Trg));
	_amountC = _isAttacked select 1;
	_amountC = _amountC - _amountG;
	_isAttacked = _isAttacked select 0;
	_isAttacked = _isAttacked - 1;
	_Trg setVariable [("Capturing" + (str _Trg)),[_isAttacked,_amountC]];
	if ((RydHQG_Debug) or (isPlayer (leader _unitG))) then 
		{
		deleteMarker ("markCapture" + str (_unitG))
		};

	if not (isNull _GDV) then 
		{
		[_GDV, (currentWaypoint _GDV)] setWaypointPosition [position (vehicle (leader _GDV)), 0];
		_GDV setVariable [("Busy" + _unitvar), false];
		}
	};

_UL = leader _unitG;if not (isPlayer _UL) then {if (not (_halfway) and (_timer <= 30) and not (_enemy)) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdFinal,"OrdFinal"] call RYD_AIChatter}}};

_AV = assignedVehicle _UL;
_pass = assignedCargo _AV;
_allowed = true;
if not ((_GDV == _unitG) or (isNull _GDV)) then 
	{
	//{unassignVehicle _x} foreach (units _unitG);
	_pass orderGetIn false;
	_allowed = false;
	(units _unitG) allowGetIn false
	}
else
	{
	if (_unitG in RydHQG_NCrewInfG) then {_pass orderGetIn false};
	};

//if not (isNull _lz) then {deleteVehicle _lz};

_DAV = assigneddriver _AV;
_GDV = group _DAV;

if (not (isNull _AV) and (RydHQG_CargoFind > 0) and (_unitG in RydHQG_NCrewInfG)) then
	{
	_cause = [_unitG,1,false,0,240,[],true,true,false,false,false,false] call RYD_Wait;
	_timer = _cause select 0
	};

if not ((_GDV == _unitG) or (isNull _GDV)) then 
	{
	{unassignVehicle _x} foreach (units _unitG);
	};

if not (_allowed) then {(units _unitG) allowGetIn true};
if (RydHQG_LZ) then {deleteVehicle _lz};

if ((isPlayer (leader _GDV)) and not (isMultiplayer)) then {(leader _GDV) removeSimpleTask _Ctask};

if ((isNull (leader (_this select 0))) or (_timer > 240)) exitwith 
	{
	if not (isNull (leader (_this select 0))) then {_unitG setVariable [("Capt" + (str _unitG)),false]};
	_isAttacked = _Trg getVariable ("Capturing" + (str _Trg));
	_amountC = _isAttacked select 1;
	_amountC = _amountC - _amountG;
	_isAttacked = _isAttacked select 0;
	_isAttacked = _isAttacked - 1;
	_Trg setVariable [("Capturing" + (str _Trg)),[_isAttacked,_amountC]];
	if ((RydHQG_Debug) or (isPlayer (leader _unitG))) then 
		{
		deleteMarker ("markCapture" + str (_unitG))
		};

	if not (isNull _GDV) then 
		{
		[_GDV, (currentWaypoint _GDV)] setWaypointPosition [position (vehicle (leader _GDV)), 0];
		_GDV setVariable [("Busy" + _unitvar), false];
		_pass orderGetIn true;
		}
	};

_unitvar = str _GDV;
_timer = 0;
if (not (isNull _GDV) and (_GDV in RydHQG_AirG) and not (isPlayer (leader _GDV))) then
	{
	_wp = [_GDV,[((position _AV) select 0) + (random 200) - 100,((position _AV) select 1) + (random 200) - 100,1000],"MOVE","CARELESS","YELLOW","NORMAL"] call RYD_WPadd;
	
	_cause = [_GDV,3,true,0,8,[],false] call RYD_Wait;
	_timer = _cause select 0;

	if (_timer > 8) then {[_GDV, (currentWaypoint _GDV)] setWaypointPosition [position (vehicle (leader _GDV)), 0]};
	};

_GDV setVariable [("CargoM" + (str _GDV)), false];

_BBProgN = RydHQG getVariable ["BBProgress",0];
if (_BBProgN > _BBProg) exitWith 
	{
	_unitG setVariable [("Capt" + (str _unitG)),false];
	if ((RydHQG_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markCapture" + str (_unitG))};
	_pass orderGetIn true;
	RydHQG_AttackAv = RydHQG_AttackAv + [(_unitG)];
	_unitG setVariable [("Busy" + (str _unitG)),false];
	//_Trg setvariable [("Capturing" + (str  _Trg)),[0,0]]
	};

_alive = true;
if (_halfway) then
	{
	_frm = formation _unitG;
	if not (isPlayer (leader _unitG)) then {_frm = "STAG COLUMN"};

	_wp = [_unitG,[_posX,_posY],"MOVE","AWARE","YELLOW","NORMAL",["true","deletewaypoint [(group this), 0];"],true,0,[0,0,0],_frm] call RYD_WPadd;

	_cause = [_unitG,6,true,0,30,[],false] call RYD_Wait;
	_timer = _cause select 0;
	_alive = _cause select 1;
	_enemy = _cause select 2;

	if not (_alive) exitwith 
		{
		_isAttacked = _Trg getVariable ("Capturing" + (str _Trg));
		_amountC = _isAttacked select 1;
		_amountC = _amountC - _amountG;
		_isAttacked = _isAttacked select 0;
		_isAttacked = _isAttacked - 1;
		_Trg setVariable [("Capturing" + (str _Trg)),[_isAttacked,_amountC]];
		if ((RydHQG_Debug) or (isPlayer (leader _unitG))) then 
			{
			deleteMarker ("markCapture" + str (_unitG))
			}
		};

	if (_timer > 30) then {[_unitG, (currentWaypoint _unitG)] setWaypointPosition [position (vehicle _UL), 0]};

	_BBProgN = RydHQG getVariable ["BBProgress",0];
	if (_BBProgN > _BBProg) exitWith 
		{
		if ((RydHQG_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markCapture" + str (_unitG))};
		_pass orderGetIn true;
		RydHQG_AttackAv = RydHQG_AttackAv + [(_unitG)];
		_unitG setVariable [("Busy" + (str _unitG)),false];
		//_Trg setvariable [("Capturing" + (str  _Trg)),[0,0]]
		}
	};

if (not (_alive) or (_BBProgN > _BBProg)) exitWith
	{
	if (_alive) then {_unitG setVariable [("Capt" + (str _unitG)),false]};
	_isAttacked = _Trg getVariable ("Capturing" + (str _Trg));
	_amountC = _isAttacked select 1;
	_amountC = _amountC - _amountG;
	_isAttacked = _isAttacked select 0;
	_isAttacked = _isAttacked - 1;
	_Trg setVariable [("Capturing" + (str _Trg)),[_isAttacked,_amountC]];
	if ((RydHQG_Debug) or (isPlayer (leader _unitG))) then 
		{
		deleteMarker ("markCapture" + str (_unitG))
		}
	};

_UL = leader _unitG;if not (isPlayer _UL) then {if ((_halfway) and (_timer <= 30)) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdFinal,"OrdFinal"] call RYD_AIChatter}}};

if (isPlayer (leader _unitG)) then
	{
	if not (isMultiplayer) then
		{
		_task setSimpleTaskDescription ["Secure Area.", "S&D", ""];
		_task setSimpleTaskDestination (position _Trg)
		}
	else
		{
		 
		[_task,(leader _unitG),["Secure Area.", "S&D", ""],(position _Trg),"ASSIGNED",0,false,true] call BIS_fnc_SetTask;
		}
	};

_beh = "AWARE";
_spd = "NORMAL";
if ((_enemy) and not (_halfway) and (((vehicle (leader _unitG)) distance _Trg) > 1000) and not (_NeNMode)) then {_spd = "LIMITED";_beh = "SAFE"};
_frm = formation _unitG;
if not (isPlayer (leader _unitG)) then {_frm = "WEDGE"};

_wp = [_unitG,_Trg,"SAD",_beh,"RED",_spd,["true","deletewaypoint [(group this), 0];"],true,100,[0,0,0],_frm] call RYD_WPadd;

_cause = [_unitG,6,true,0,30,[],false] call RYD_Wait;
_timer = _cause select 0;
_alive = _cause select 1;

if not (_alive) exitwith 
	{
	_isAttacked = _Trg getVariable ("Capturing" + (str _Trg));
	_amountC = _isAttacked select 1;
	_amountC = _amountC - _amountG;
	_isAttacked = _isAttacked select 0;
	_isAttacked = _isAttacked - 1;
	_Trg setVariable [("Capturing" + (str _Trg)),[_isAttacked,_amountC]];
	if ((RydHQG_Debug) or (isPlayer (leader _unitG))) then 
		{
		deleteMarker ("markCapture" + str (_unitG))
		}
	};

if (_timer > 30) then {[_unitG, (currentWaypoint _unitG)] setWaypointPosition [position (vehicle _UL), 0]};

if ((RydHQG_Debug) or (isPlayer (leader _unitG))) then {_i setMarkerColor "ColorBlue"};

_isTaken = false;
_waitTime = RydHQG_ObjHoldTime;

_trg = leaderHQG;
if (RydHQG_NObj == 1) then {_trg = RydHQG_Obj};
if (RydHQG_NObj == 2) then {_trg = RydHQG_Obj2};
if (RydHQG_NObj == 3) then {_trg = RydHQG_Obj3};
if (RydHQG_NObj >= 4) then {_trg = RydHQG_Obj4};

if (isNil ("RydHQG_ObjRadius1")) then {RydHQG_ObjRadius1 = 300};
if (isNil ("RydHQG_ObjRadius2")) then {RydHQG_ObjRadius2 = 500};

_mGain = 20;

if (leaderHQG in (RydBBa_HQs + RydBBb_HQs)) then {_mGain = 0};

_lastObj = RydHQG_NObj;

waitUntil
	{
	sleep 60;
	_BBProgN = RydHQG getVariable "BBProgress";
	if (isNil "_BBProgN") then {_BBProgN = 0};

	if ((RydHQG_NObj == _currentObj) and not (_BBProgN > _BBProg)) then
		{
		_waitTime = _waitTime - 60;

		_AllV0 = _trg nearEntities [["AllVehicles"],RydHQG_ObjRadius1];

		_AllV = [];

			{
			_AllV = _AllV + (crew _x)
			}
		foreach _AllV0;

		_Civs0 = _trg nearEntities [["Civilian"],RydHQG_ObjRadius1];

		_Civs = [];

			{
			_Civs = _Civs + (crew _x)
			}
		foreach _Civs0;

		_AllV20 = _trg nearEntities [["AllVehicles"],RydHQG_ObjRadius2];

		_AllV2 = [];

			{
			_AllV2 = _AllV2 + (crew _x)
			}
		foreach _AllV20;

		_Civs20 = _trg nearEntities [["Civilian"],RydHQG_ObjRadius2];

		_Civs2 = [];

			{
			_Civs2 = _Civs2 + (crew _x)
			}
		foreach _Civs20;

		_AllV = _AllV - _Civs;
		_AllV2 = _AllV2 - _Civs2;

		_AllV0 = +_AllV;
		_AllV20 = +_AllV2;

			{
			if not (_x isKindOf "Man") then
				{
				if ((count (crew _x)) == 0) then {_AllV = _AllV - [_x]}
				}
			}
		foreach _AllV0;

			{
			if not (_x isKindOf "Man") then
				{
				if ((count (crew _x)) == 0) then {_AllV2 = _AllV2 - [_x]}
				}
			}
		foreach _AllV20;

		_NearAllies = leaderHQG countfriendly _AllV;
		_NearEnemies = leaderHQG countenemy _AllV2;

		if (not (RydHQG_UnlimitedCapt) and (_NearAllies >= RydHQG_CaptLimit) and (_NearEnemies <= (0 + ((RydHQG_Recklessness/(0.5 + RydHQG_Consistency))*10)))) then 
			{
			RydHQG_NObj = RydHQG_NObj + 1;
			if ((random 100) < (15*RydHQG_NObj)) then 
				{
				RydHQG_FlankingDone = false;
				RydHQG_FlankingInit = false
				};
			RydHQG_Morale = RydHQG_Morale + _mGain;
			_isTaken = true
			};

		if (RydHQG_NObj < 1) then {RydHQG_NObj = 1};
		if (RydHQG_NObj > 5) then {RydHQG_NObj = 5};

		RydHQG_Progress = 0;
		if (_lastObj > RydHQG_NObj) then {RydHQG_Progress = -1};	
		if (_lastObj < RydHQG_NObj) then {RydHQG_Progress = 1}
		}
	else
		{
		if (not (RydHQG_NObj < _currentObj) or (RydBB_Active)) then
			{
			_isTaken = true
			}
		else
			{
			_waitTime == 0
			}
		};

	((_isTaken) or (_waitTime <= 0))
	};

if ((RydHQG_UnlimitedCapt) or not (_isTaken)) then {_Trg setvariable [("Capturing" + str _Trg),[0,0]]};

if ((isPlayer (leader _unitG)) and not (isMultiplayer)) then {(leader _unitG) removeSimpleTask _task};

if ((RydHQG_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markCapture" + str (_unitG))};

_all = true;

	{
	if ((_x in RydHQG_AttackAv) and not (_x getVariable ("Busy" + str (_x)))) exitwith {_all = false};
	}
foreach RydHQG_Friends - ((RydHQG_AirG - RydHQG_NCrewInfG) + RydHQG_NavalG + RydHQG_StaticG + RydHQG_SupportG + RydHQG_ArtG + (RydHQG_NCCargoG - (RydHQG_NCrewInfG - RydHQG_SupportG)));

_pass orderGetIn true;
RydHQG_AttackAv = RydHQG_AttackAv + [(_unitG)];
_unitG setVariable [("Busy" + (str _unitG)),false];
_unitG setVariable [("Capt" + (str _unitG)),false];
//if ((((_Trg getvariable ("Capturing" + (str  _Trg))) select 0) > 3)  or (_all)) then {_Trg setvariable [("Capturing" + (str  _Trg)),[0,0]]};

_UL = leader _unitG;if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdEnd,"OrdEnd"] call RYD_AIChatter}};