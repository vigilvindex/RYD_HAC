_i = "";

_unitG = _this select 0;
_Trg = _this select 1;

_PosObj1 = position _Trg;
_unitvar = str (_unitG);

_UL = leader _unitG;
_PosLand = position (vehicle _UL);

[_unitG] call RYD_WPdel;

_unitG setVariable [("Deployed" + (str _unitG)),false];_unitG setVariable [("Capt" + (str _unitG)),false];

RydHQF_AttackAv = RydHQF_AttackAv - [_unitG];

_nothing = true;

_dX = (_PosObj1 select 0) - ((getPos leaderHQF) select 0);
_dY = (_PosObj1 select 1) - ((getPos leaderHQF) select 1);

_angle = _dX atan2 _dY;

_distance = leaderHQF distance _PosObj1;
_distance2 = 0;

_dXc = _distance2 * (cos _angle);
_dYc = _distance2 * (sin _angle);

_dXb = _distance * (sin _angle);
_dYb = _distance * (cos _angle);

_posX = ((getPos leaderHQF) select 0) + _dXb;
_posY = ((getPos leaderHQF) select 1) + _dYb;

if ((isPlayer (leader _unitG)) and (RydxHQ_GPauseActive)) then {hintC "New orders from HQ!";setAccTime 1};

_UL = leader _unitG;
RydHQF_VCDone = false;
if (isPlayer _UL) then {[_UL,leaderHQF] spawn VoiceComm;sleep 3;waituntil {sleep 0.1;(RydHQF_VCDone)}} else {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdConf,"OrdConf"] call RYD_AIChatter}};

if ((RydHQF_Debug) or (isPlayer (leader _unitG))) then 
	{
	_i = [[_posX,_posY],_unitG,"markAttack","ColorRed","ICON","DOT","Air F"," - ATTACK"] call RYD_Mark
	};

_task = [(leader _unitG),["Search and destroy enemy.", "S&D", ""],[_posX,_posY]] call RYD_AddTask;

_wp = [_unitG,[_posX,_posY],"SAD","COMBAT","RED","NORMAL",["true", "deletewaypoint [(group this), 0]"],true,0.001] call RYD_WPadd;

_lasT = ObjNull;

if (_unitG in RydHQF_BAirG) then 
	{
	_eSide = side _unitG;
	_wp waypointAttachVehicle _Trg;
	_wp setWaypointType "DESTROY";
	_tgt = "LaserTargetWStatic";
	if (_eSide == east) then {_tgt = "LaserTargetEStatic"};

	_tPos = getPosATL _Trg;
	_tX = (_tPos select 0) + (random 60) - 30;
	_tY = (_tPos select 1) + (random 60) - 30;

	_lasT = createVehicle [_tgt, [_tX,_tY,0], [], 0, "CAN_COLLIDE"]; 

	[_Trg,_lasT,_unitG] spawn
		{
		_Trg = _this select 0;
		_lasT = _this select 1;
		_unitG = _this select 2;

		_VL = vehicle (leader _unitG);
		_ct = 0;

		while {(not (isNull _Trg) and not (isNull _lasT) and not (isNull _VL) and (_ct < 100))} do
			{
			if not (alive _Trg) exitWith {};
			if not (alive _VL) exitWith {};

			_tPos = getPosATL _Trg;
			_tX = (_tPos select 0) + (random 60) - 30;
			_tY = (_tPos select 1) + (random 60) - 30;

			_lasT setPos [_tX,_tY,0];

			sleep 15;
			_ct = _ct + 1
			};

		if (not (isNull _unitG) and (({alive _x} count (units _unitG)) > 0)) then 
			{
			waitUntil
				{
				sleep 10;

				_isBusy = _unitG getVariable [("Busy" + (str _unitG)),false];

				(not (_isBusy) or (({alive _x} count (units _unitG)) < 1));
				}
			};

		deleteVehicle _lasT
		}
	};

_cause = [_unitG,6,true,0,24,[],false] call RYD_Wait;
_timer = _cause select 0;
_alive = _cause select 1;

if not (_alive) exitwith 
	{
	if ((RydHQF_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markAttack" + str (_unitG))};
	if not (isNull _lasT) then {deleteVehicle _lasT};
	[_Trg,"AirAttacked"] call RYD_VarReductor
	};

if (_timer > 24) then {deleteWaypoint _wp};

if (isPlayer (leader _unitG)) then
	{
	if not (isMultiplayer) then
		{
		_task setSimpleTaskDestination _Posland;
		_task setSimpleTaskDescription ["Return to the landing site.", "Move", ""]
		}
	else
		{
		[(leader _unitG),nil, "per", rSETSIMPLETASKDESTINATION, _task,_Posland] call RE;
		[(leader _unitG),nil, "per", rSETSIMPLETASKDESCRIPTION, _task,["Return to the landing site.", "Move", ""]] call RE
		}
	};

if ((RydHQF_Debug) or (isPlayer (leader _unitG))) then {_i setMarkerColor "ColorBlue"};
if (_unitG in RydHQF_BAirG) then {deleteVehicle _lasT};

_wp = [_unitG,_Posland,"MOVE","AWARE","GREEN","NORMAL",["true", "{(vehicle _x) land 'LAND'} foreach (units (group this)); deletewaypoint [(group this), 0]"],true,0.001] call RYD_WPadd;

_cause = [_unitG,6,true,0,24,[],false] call RYD_Wait;
_timer = _cause select 0;
_alive = _cause select 1;

if not (_alive) exitwith 
	{
	if ((RydHQF_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markAttack" + str (_unitG))};
	[_Trg,"AirAttacked"] call RYD_VarReductor
	};
if (_timer > 24) then {deleteWaypoint _wp};

sleep 30;

if ((isPlayer (leader _unitG)) and not (isMultiplayer)) then {(leader _unitG) removeSimpleTask _task};

if ((RydHQF_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markAttack" + str (_unitG))};

_countAv = count RydHQF_AttackAv;
RydHQF_AttackAv = RydHQF_AttackAv + [(_unitG)];
_unitG setVariable [("Busy" + (str _unitG)),false];

[_Trg,"AirAttacked"] call RYD_VarReductor;

_UL = leader _unitG;if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdEnd,"OrdEnd"] call RYD_AIChatter}};