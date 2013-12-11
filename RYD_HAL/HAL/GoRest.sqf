_unitG = _this select 0;_Spos = _unitG getvariable ("START" + (str _unitG));if (isNil ("_Spos")) then {_unitG setVariable [("START" + (str _unitG)),(getPosATL (vehicle (leader _unitG)))];_Spos = _unitG getVariable ("START" + (str _unitG))}; 
_pos = getPosATL (leader _unitG);
_UL = leader _unitG;
_VLU = vehicle _UL;
_HQ = _this select 1;

_AV = assignedVehicle _UL;

if not (isNull _AV) then
	{
	_GDV = group (assignedDriver _AV);
	if not (_GDV == _unitG) then
		{
		if not (_GDV in (_HQ getVariable ["RydHQ_Exhausted",[]])) then
			{
			(units _unitG) orderGetIn false;
			{unassignVehicle _x} foreach (units _unitG);
			}
		}
	else
		{
			{
			if not ((group _x) == _unitG) then 
				{
				if not ((group _x) in (_HQ getVariable ["RydHQ_Exhausted",[]])) then
					{
					[_x] ordergetIn false;
					unassignVehicle _x
					}
				} 
			}
		foreach (crew _AV);

		_ac = assignedCargo _AV;
		if ((count _ac) > 0) then
			{
				{
				if not ((group _x) == _unitG) then 
					{
					if not ((group _x) in (_HQ getVariable ["RydHQ_Exhausted",[]])) then
						{
						[_x] ordergetIn false;
						unassignVehicle _x
						}
					}
				}
			foreach _ac
			}
		}
	};

[_unitG] call RYD_WPdel;

_attackAllowed = attackEnabled _unitG;
_unitG enableAttack false; 

_unitG setVariable [("Resting" + (str _unitG)),true];
_unitG setVariable [("Busy" + (str _unitG)), true];
_unitG setVariable [("Deployed" + (str _unitG)),false];
_unitG setVariable [("Capt" + (str _unitG)),false];

_nE = _UL findnearestenemy _UL;

if not (isNull _nE) then
	{
	if ((_HQ getVariable ["RydHQ_Smoke",true]) and ((_nE distance (vehicle _UL)) <= 500) and not (isPlayer _UL)) then
		{
		_posSL = getPosASL _UL;
		_posSL2 = getPosASL _nE;

		_angle = [_posSL,_posSL2,15] call RYD_AngTowards;

		_dstB = _posSL distance _posSL2;
		_pos = [_posSL,_angle,_dstB/4 + (random 100) - 50] call RYD_PosTowards2D;

		_CFF = false;

		if ((_HQ getVariable ["RydHQ_ArtyShells",1]) > 0) then 
			{
			_CFF = ([_pos,(_HQ getVariable ["RydHQ_ArtG",[]]),"SMOKE",9,_UL] call RYD_ArtyMission) select 0;
			if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_SmokeReq,"SmokeReq"] call RYD_AIChatter}};
			};

		if (_CFF) then 
			{
			if ((_HQ getVariable ["RydHQ_ArtyShells",1]) > 0) then {if ((random 100) < RydxHQ_AIChatDensity) then {[(leader _HQ),RydxHQ_AIC_ArtAss,"ArtAss"] call RYD_AIChatter}};
			sleep 60
			}
		else
			{
			if ((_HQ getVariable ["RydHQ_ArtyShells",1]) > 0) then {if ((random 100) < RydxHQ_AIChatDensity) then {[(leader _HQ),RydxHQ_AIC_ArtDen,"ArtDen"] call RYD_AIChatter}};
			[_unitG] call RYD_Smoke;
			sleep 10;
			if ((vehicle _UL) == _UL) then {sleep 20}
			}
		}
	};

_Xpos = ((getPosATL (leader _HQ)) select 0) + (random 500) - 250;
_Ypos = ((getPosATL (leader _HQ)) select 1) + (random 500) - 250;

_posX = _Xpos;
_posY = _Ypos;

_isDecoy = false;
_enemyMatters = true;

if not (isNull (_HQ getVariable ["RydHQ_RestDecoy",objNull])) then
	{
	_isDecoy = true;

	_tRadius = (triggerArea (_HQ getVariable ["RydHQ_RestDecoy",objNull])) select 0;

	if ((random 100) >= (_HQ getVariable ["RydHQ_RDChance",100])) exitWith {_isDecoy = false};

	_tPos = getPosATL (_HQ getVariable ["RydHQ_RestDecoy",objNull]);
	_enemyMatters = (triggerArea (_HQ getVariable ["RydHQ_RestDecoy",objNull])) select 3;

	_posX = (_tPos select 0) + (random (2 * _tRadius)) - (_tRadius);
	_posY = (_tPos select 1) + (random (2 * _tRadius)) - (_tRadius);
	};

if not (_isDecoy) then 
	{
	_safedist = 1000/(0.75 + ((_HQ getVariable ["RydHQ_Recklessness",0.5])/2));
	_behind = false;
	_behind2 = false;
	if ((_HQ getVariable ["RydHQ_Cyclecount",1]) > (4 + (((leader _HQ) distance (_HQ getVariable ["RydHQ_Obj",(leader _HQ)]))/1000))) then {_behind2 = true};
	_counterU = 0;

		{
		_VL = vehicle (leader _x);
		if (((_VL distance (_HQ getVariable ["RydHQ_Obj",(leader _HQ)])) < ([_Xpos,_Ypos] distance (_HQ getVariable ["RydHQ_Obj",(leader _HQ)]))) or (((_VL distance (_HQ getVariable ["RydHQ_Obj",(leader _HQ)])) < ([_Xpos,_Ypos] distance _VL)) and ((_VL distance (_HQ getVariable ["RydHQ_Obj",(leader _HQ)])) < ((_HQ getVariable ["RydHQ_Obj",(leader _HQ)]) distance _VLU)))) then {_counterU = _counterU + 1};
		if ((_counterU >= (round (2/(0.5 + ((_HQ getVariable ["RydHQ_Recklessness",0.5])/2))))) or (_counterU >= ((count (_HQ getVariable ["RydHQ_Friends",[]]))/(4*(0.5 + ((_HQ getVariable ["RydHQ_Recklessness",0.5])/2)))))) exitwith {_behind = true}
		}
	foreach (_HQ getVariable ["RydHQ_Friends",[]]);

	_Xpos2 = _Xpos;
	_Ypos2 = _Ypos;

	while {((((_HQ getVariable ["RydHQ_Obj",(leader _HQ)]) distance [_Xpos,_Ypos]) > _safedist) and (_behind2) and (_behind))} do
		{
		_Xpos3 = _Xpos2;
		_Ypos3 = _Ypos2;
		_behind2 = false;
		_counterU = 0;
		_Xpos2 = (_Xpos2 + ((getPosATL (_HQ getVariable ["RydHQ_Obj",(leader _HQ)])) select 0))/2;
		_Ypos2 = (_Ypos2 + ((getPosATL (_HQ getVariable ["RydHQ_Obj",(leader _HQ)])) select 1))/2;
		if not (((_HQ getVariable ["RydHQ_Obj",(leader _HQ)]) distance [_Xpos2,_Ypos2]) > _safedist) exitWith {_Xpos = _Xpos3;_Ypos = _Ypos3};

			{
			_VL = vehicle (leader _x);
			if (((_VL distance (_HQ getVariable ["RydHQ_Obj",(leader _HQ)])) < ([_Xpos2,_Ypos2] distance (_HQ getVariable ["RydHQ_Obj",(leader _HQ)]))) or (((_VL distance (_HQ getVariable ["RydHQ_Obj",(leader _HQ)])) < ([_Xpos2,_Ypos2] distance _VL)) and ((_VL distance (_HQ getVariable ["RydHQ_Obj",(leader _HQ)])) < ((_HQ getVariable ["RydHQ_Obj",(leader _HQ)]) distance _VLU)))) then {_counterU = _counterU + 1};
			if ((_counterU >= (round (2/(0.5 + ((_HQ getVariable ["RydHQ_Recklessness",0.5])/2))))) or (_counterU >= ((count (_HQ getVariable ["RydHQ_Friends",[]]))/(4*(0.5 + ((_HQ getVariable ["RydHQ_Recklessness",0.5])/2)))))) exitwith {_behind2 = true}
			}
		foreach (_HQ getVariable ["RydHQ_Friends",[]]);
		if not (_behind2) exitwith {_Xpos = _Xpos3;_Ypos = _Ypos3};
		if (_behind2) then {_Xpos = _Xpos2;_Ypos = _Ypos2};
		};

	_posX = _Xpos;
	_posY = _Ypos;
	};

_isWater = true;
_counter = 0;

waituntil
	{
	_counter = _counter + 1;
	_isWater = surfaceIsWater [_posX,_posY];
	if (_iswater) then 
		{
		_posX = _posX + (random 500) - 250;
		_posY = _posY + (random 500) - 250;
		};

	(not (_isWater) and ((isNull ((leader _HQ) FindNearestEnemy [_posX,_posY])) or ((((leader _HQ) FindNearestEnemy [_posX,_posY]) distance [_posX,_posY]) >= 500) or not (_enemyMatters)) or (_counter > 30))
	};

if ((_counter > 30) or (not (isNull ((leader _HQ) FindNearestEnemy [_posX,_posY])) and ((((leader _HQ) FindNearestEnemy [_posX,_posY]) distance [_posX,_posY]) < 500) and (_enemyMatters))) then {_posX = ((getPosATL (leader _HQ)) select 0) + (random 500) - 250;_posY = ((getPosATL (leader _HQ)) select 1) + (random 500) - 250};

_isWater = surfaceIsWater [_posX,_posY];
if ((_isWater) or (not (isNull ((leader _HQ) FindNearestEnemy [_posX,_posY])) and ((((leader _HQ) FindNearestEnemy [_posX,_posY]) distance [_posX,_posY]) < 500) and (_enemyMatters))) exitwith 
	{
	_unitG setVariable [("Resting" + (str _unitG)),false,true];
	_unitG setVariable [("Busy" + (str _unitG)), false, true];
	_exh = (_HQ getVariable ["RydHQ_Exhausted",[]]);
	_exh = _exh - [_unitG];
	_HQ setVariable ["RydHQ_Exhausted",_exh];
	};

sleep 10;
if (_VLU == _UL) then {sleep 20};

if ((isPlayer (leader _unitG)) and (RydxHQ_GPauseActive)) then {hintC "New orders from HQ!";setAccTime 1};

_UL = leader _unitG;
 
if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdConf,"OrdConf"] call RYD_AIChatter}};

if ((_HQ getVariable ["RydHQ_Debug",false]) or (isPlayer (leader _unitG))) then
	{
	_signum = _HQ getVariable ["RydHQ_CodeSign","X"];
	_i = [[_posX,_posY],_unitG,"markRest","Default","ICON","mil_triangle",_signum," - REST & REGROUP",[0.5,0.5]] call RYD_Mark
	};

_task = [(leader _unitG),["Take a rest, take care of wounded, replenish ammo and wait for orders.", "Move", ""],[_posX,_posY]] call RYD_AddTask;

_lackAmmo = _unitG getVariable ["LackAmmo",false];
_counts = 6;
if (_lackAmmo) then 
	{
	_counts = 6.1
	};

_wp = [_unitG,[_posX,_posY],"MOVE","AWARE","GREEN","FULL",["true","deletewaypoint [(group this), 0]"]] call RYD_WPadd;

_cause = [_unitG,_counts,true,0,60,[],false] call RYD_Wait;
_timer = _cause select 0;
_alive = _cause select 1;

if not (_alive) exitwith 
	{
	if ((_HQ getVariable ["RydHQ_Debug",false]) or (isPlayer (leader _unitG))) then 
		{
		deleteMarker ("markRest" + str (_unitG))
		};
		
	_exh = (_HQ getVariable ["RydHQ_Exhausted",[]]);
	_exh = _exh - [_unitG];
	_HQ setVariable ["RydHQ_Exhausted",_exh];
	};
	
if (_timer > 60) then {[_unitG, (currentWaypoint _unitG)] setWaypointPosition [getPosATL (vehicle _UL), 0]};

_UL = leader _unitG;if not (isPlayer _UL) then {if (_timer <= 60) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdFinal,"OrdFinal"] call RYD_AIChatter}}};

waituntil 
	{
	sleep 60;
	
	_vehready = true;
	_solready = true;
	_effective = true;
	_ammo = true;
	_Gdamage = 0;
	_alive = true;
	
	if not (isNull _unitG) then
		{
		if (({alive _x} count (units _unitG)) > 0) then
			{
	
				{
				_Gdamage = _Gdamage + (damage _x);
				if ((count (magazines _x)) == 0) exitWith {_ammo = false};
				if (((damage _x) > 0.5) or not (canStand _x)) exitWith {_effective = false};
				}
			foreach (units _unitG);

			_nominal = _unitG getVariable [("Nominal" + (str _unitG)),count (units _unitG)];
			_current = count (units _unitG);
			_Gdamage = _Gdamage + (_nominal - _current);
			if (((_Gdamage/(_current + 0.1)) > (0.4*(((_HQ getVariable ["RydHQ_Recklessness",0.5])/1.2) + 1))) or not (_effective) or not (_ammo)) then {_solready = false};

				{
				_veh = assignedvehicle _x;
				if (not (isNull _veh) and (not (canMove _veh) or ((fuel _veh) <= 0.1) or ((damage _veh) > 0.5) or (((group _x) in (((_HQ getVariable ["RydHQ_AirG",[]]) - (_HQ getVariable ["RydHQ_NCAirG",[]])) + ((_HQ getVariable ["RydHQ_HArmorG",[]]) + (_HQ getVariable ["RydHQ_LArmorG",[]]) + ((_HQ getVariable ["RydHQ_CarsG",[]]) - ((_HQ getVariable ["RydHQ_NCCargoG",[]]) + (_HQ getVariable ["RydHQ_SupportG",[]])))))) and ((count (magazines _veh)) == 0)) and not ((group _x) in (_HQ getVariable ["RydHQ_RAirG",[]])))) exitwith {_vehready = false};
				}
			foreach (units _unitG);
			}
		else
			{
			_alive = false
			}
		}
	else
		{
		_alive = false
		};
		
	(((_vehready) and (_solready)) or not (_alive))
	};

_exh = (_HQ getVariable ["RydHQ_Exhausted",[]]);

if not (_alive) exitWith 
	{
	if ((_HQ getVariable ["RydHQ_Debug",false]) or (isPlayer (leader _unitG))) then 
		{
		deleteMarker ("markRest" + str (_unitG))
		};
	
	_exh = _exh - [_unitG];
	_HQ setVariable ["RydHQ_Exhausted",_exh]
	};
	
if ((isPlayer (leader _unitG)) and not (isMultiplayer)) then {(leader _unitG) removeSimpleTask _task};

if ((_HQ getVariable ["RydHQ_Debug",false]) or (isPlayer (leader _unitG))) then {deleteMarker ("markRest" + str (_unitG))};

_exh = _exh - [_unitG];
_HQ setVariable ["RydHQ_Exhausted",_exh];

if (_attackAllowed) then {_unitG enableAttack true}; 

_unitG setVariable [("Resting" + (str _unitG)),false];
_unitG setVariable [("Busy" + (str _unitG)), false];
_unitG setVariable ["LackAmmo",false];

_UL = leader _unitG;if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdEnd,"OrdEnd"] call RYD_AIChatter}};