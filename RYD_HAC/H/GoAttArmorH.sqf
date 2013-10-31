_i = "";

_unitG = _this select 0;_Spos = _unitG getvariable ("START" + (str _unitG));if (isNil ("_Spos")) then {_unitG setVariable [("START" + (str _unitG)),(position (vehicle (leader _unitG)))];_Spos = _unitG getVariable ("START" + (str _unitG))}; 
_Trg = _this select 1;
_isAttacked = (group _Trg) getvariable ("ArmorAttacked" + (str (group _Trg)));
if (isNil ("_isAttacked")) then {_isAttacked = 0};

_PosObj1 = position _Trg;
_unitvar = str (_unitG);
_busy = false;

//if (_isAttacked > 1) exitwith {};

[_unitG] call RYD_WPdel;

_unitG setVariable [("Deployed" + (str _unitG)),false];_unitG setVariable [("Capt" + (str _unitG)),false];

_unitG setVariable [("Busy" + _unitvar), true];
RydHQH_AttackAv = RydHQH_AttackAv - [_unitG];

_UL = leader _unitG;
_nothing = true;

_dX = (_PosObj1 select 0) - ((getPos leaderHQH) select 0);
_dY = (_PosObj1 select 1) - ((getPos leaderHQH) select 1);

_angle = _dX atan2 _dY;

_distance = leaderHQH distance _PosObj1;
_distance2 = 500;

_dXc = _distance2 * (cos _angle);
_dYc = _distance2 * (sin _angle);

if (_isAttacked == 1) then {(group _Trg) setvariable [("ArmorAttacked" + (str (group _Trg))),2,true];_dYc = - _dYc};
if (_isAttacked < 1) then {(group _Trg) setvariable [("ArmorAttacked" + (str (group _Trg))),1,true];_dXc = - _dXc};
if (_isAttacked > 1) then {_distance = _distance - _distance2;_dXc = 0;_dYc = 0};

_dXb = _distance * (sin _angle);
_dYb = _distance * (cos _angle);

_posX = ((getPos leaderHQH) select 0) + _dXb + _dXc + (random 200) - 100;
_posY = ((getPos leaderHQH) select 1) + _dYb + _dYc + (random 200) - 100;

_isWater = surfaceIsWater [_posX,_posY];

while {((_isWater) and (([_posX,_posY] distance _PosObj1) >= 50))} do
	{
	_posX = _posX - _dXc/20;
	_posY = _posY - _dYc/20;
	_isWater = surfaceIsWater [_posX,_posY];
	};

_isWater = surfaceIsWater [_posX,_posY];

if (_isWater) exitwith 
	{
	RydHQH_AttackAv = RydHQH_AttackAv + [(_unitG)];
	_unitG setVariable [("Busy" + (str _unitG)),false];
	[_Trg,"ArmorAttacked"] call RYD_VarReductor
	};

if ((isPlayer (leader _unitG)) and (RydxHQ_GPauseActive)) then {hintC "New orders from HQ!";setAccTime 1};

_UL = leader _unitG;
RydHQH_VCDone = false;
if (isPlayer _UL) then {[_UL,leaderHQH] spawn VoiceComm;sleep 3;waituntil {sleep 0.1;(RydHQH_VCDone)}} else {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdConf,"OrdConf"] call RYD_AIChatter}};

if ((RydHQH_Debug) or (isPlayer (leader _unitG))) then
	{
	_i = [[_posX,_posY],_unitG,"markAttack","ColorRed","ICON","mil_dot","Arm H"," - ATTACK"] call RYD_Mark;
	};

_task = [(leader _unitG),["Search and destroy enemy.", "S&D", ""],[_posX,_posY]] call RYD_AddTask;

_wp = [_unitG,[_posX,_posY],"MOVE","AWARE","RED","NORMAL"] call RYD_WPadd;

if (RydxHQ_SynchroAttack) then
	{
	[_wp,_Trg] call RYD_WPSync;
	 
	 
	};

_cause = [_unitG,6,true,0,24,[],false] call RYD_Wait;
_timer = _cause select 0;
_alive = _cause select 1;

if not (_alive) exitwith 
	{
	if ((RydHQH_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markAttack" + str (_unitG))};
	[_Trg,"ArmorAttacked"] call RYD_VarReductor
	};

if (_timer > 24) then {deleteWaypoint _wp};

if (isPlayer (leader _unitG)) then
	{
	if not (isMultiplayer) then
		{
		_task setSimpleTaskDestination (position _Trg)
		}
	else
		{
		[_task,(leader _unitG),["Search and destroy enemy.", "S&D", ""],(position _Trg),"ASSIGNED",0,false,true] call BIS_fnc_SetTask;
		}
	};

_cur = true;
if (RydxHQ_SynchroAttack) then {_cur = false};
_frm = formation _unitG;
if not (isPlayer (leader _unitG)) then {_frm = "WEDGE"};

_UL = leader _unitG;if not (isPlayer _UL) then {if (_timer <= 24) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdFinal,"OrdFinal"] call RYD_AIChatter}}};

_tPos = getPosATL _Trg;
_tPosX = _tPos select 0;
_tPosY = _tPos select 1;

_tPosX = (_tPosX + _posX)/2;
_tPosY = (_tPosY + _posY)/2;

_wp = [_unitG,[_tPosX,_tPosY],"SAD","AWARE","RED","NORMAL",["true","deletewaypoint [(group this), 0];"],_cur,0,[0,0,0],_frm] call RYD_WPadd;

_cause = [_unitG,6,true,0,24,[],false] call RYD_Wait;
_timer = _cause select 0;
_alive = _cause select 1;

if not (_alive) exitwith 
	{
	if ((RydHQH_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markAttack" + str (_unitG))};
	[_Trg,"ArmorAttacked"] call RYD_VarReductor
	};

if (_timer > 24) then {deleteWaypoint _wp};

if ((RydHQH_Debug) or (isPlayer (leader _unitG))) then {_i setMarkerColor "ColorBlue"};

	if (isPlayer (leader _unitG)) then
		{
		if not (isMultiplayer) then
			{
			_task setSimpleTaskDescription ["Return.", "Move", ""];
			_task setSimpleTaskDestination _Spos
			}
		else
			{
			[_task,(leader _unitG),["Return.", "Move", ""],_Spos,"ASSIGNED",0,false,true] call BIS_fnc_SetTask;
			 
			}
		};

if (_unitG in RydHQH_Garrison) then
	{
	if (isPlayer (leader _unitG)) then
		{
		if not (isMultiplayer) then
			{
			_task setSimpleTaskDescription ["Return.", "Move", ""];
			_task setSimpleTaskDestination _Spos
			}
		else
			{
			[_task,(leader _unitG),["Return.", "Move", ""],_Spos,"ASSIGNED",0,false,true] call BIS_fnc_SetTask;
			 
			}
		};
	_wp = [_unitG,_Spos,"MOVE","SAFE","YELLOW","NORMAL",["true","deletewaypoint [(group this), 0];"],true,5] call RYD_WPadd;

	_cause = [_unitG,6,true,0,30,[],false] call RYD_Wait;
	_timer = _cause select 0;
	_alive = _cause select 1;

	if not (_alive) exitwith {if ((RydHQH_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markAttack" + str (_unitG))}};
	if (_timer > 30) then {[_unitG, (currentWaypoint _unitG)] setWaypointPosition [position (vehicle _UL), 0]};
	_unitG setVariable ["Garrisoned" + (str _unitG),false];
	};

sleep 60;

if ((isPlayer (leader _unitG)) and not (isMultiplayer)) then {(leader _unitG) removeSimpleTask _task};

if ((RydHQH_Debug) or (isPlayer (leader _unitG))) then {deleteMarker _i};

_countAv = count RydHQH_AttackAv;
RydHQH_AttackAv = RydHQH_AttackAv + [(_unitG)];
_unitG setVariable [("Busy" + (str _unitG)),false];

[_Trg,"ArmorAttacked"] call RYD_VarReductor;

_UL = leader _unitG;if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdEnd,"OrdEnd"] call RYD_AIChatter}};