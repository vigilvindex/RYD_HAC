_i = "";

_unitG = _this select 0;
_Spot = _this select 1;
_StartPos = position (vehicle (leader _unitG));

_ammo = [_unitG,RydHQC_NCVeh] call RYD_AmmoCount;

if (_ammo == 0) exitwith {RydHQC_Roger = true};

_unitvar = str _unitG;
_busy = false;
_busy = _unitG getvariable ("Busy" + _unitvar);

if (isNil ("_busy")) then {_busy = false};

if ((_busy) and (_unitG in RydHQC_AirInDef)) exitwith {RydHQC_Roger = true};

[_unitG] call RYD_WPdel;

_unitG setVariable [("Deployed" + (str _unitG)),false];_unitG setVariable [("Capt" + (str _unitG)),false];
_unitG setVariable [("Busy" + _unitvar), true];
_unitG setVariable ["Defending", true];

RydHQC_AirInDef = RydHQC_AirInDef + [_unitG];

RydHQC_Roger = true;

if ((isPlayer (leader _unitG)) and (RydxHQ_GPauseActive)) then {hintC "New orders from HQ!";setAccTime 1};

_UL = leader _unitG;
RydHQC_VCDone = false;
if (isPlayer _UL) then {[_UL,leaderHQC] spawn VoiceComm;sleep 3;waituntil {sleep 0.1;(RydHQC_VCDone)}} else {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdConf,"OrdConf"] call RYD_AIChatter}};

_endThis = false;
_alive = true;

while {not (_endThis)} do
	{
	_DefPos = [((position _Spot) select 0) + (random 1000) - 500,((position _Spot) select 1) + (random 1000) - 500];
	if ((RydHQC_Debug) or (isPlayer (leader _unitG))) then 
		{
		_i = [_DefPos,_unitG,"markDef","ColorBrown","ICON","DOT","Air C"," - DEFEND AREA"] call RYD_Mark
		};

	_task = [(leader _unitG),["Provide air cover.", "S&D", ""],_DefPos] call RYD_AddTask;

	_wp = [_unitG,_DefPos,"SAD","AWARE","YELLOW","NORMAL"] call RYD_WPadd;

	if (_unitG in RydHQC_BAirG) then 
		{
		_chosen = GrpNull;
		_dstM = 5000;

		_chosen = ([_Spot,RydHQC_KnEnemiesG,0] call RYD_CloseEnemyB) select 2;

		if not (isNull _chosen) then
			{
			_Trg = vehicle (leader _chosen);
			_eSide = side _unitG;
			_wp waypointAttachVehicle _Trg;_wp setWaypointType "DESTROY";
			_tgt = "LaserTargetWStatic";
			if (_eSide == east) then {_tgt = "LaserTargetEStatic"};

			_tPos = getPosATL _Trg;
			_tX = (_tPos select 0) + (random 60) - 30;
			_tY = (_tPos select 1) + (random 60) - 30;
			_tZ = (_tPos select 2) + (random 10) - 5;
			_lasT = createVehicle [_tgt, [_tX,_tY,_tZ], [], 0, "NONE"]; 

			[_Trg,_lasT,_tX,_tY,_tZ] spawn
				{
				_Trg = _this select 0;
				_lasT = _this select 1;

				_tX = _this select 2;
				_tY = _this select 3;
				_tZ = _this select 4;

				_ct = 0;

				while {(not (isNull _Trg) and (_ct < 20))} do
					{
					_tX = _tX + (random 60) - 30;
					_tY = _tY + (random 60) - 30;
					_tZ = _tZ + (random 10) - 5;

					_lasT setPos [_tX,_tY,_tZ];
					sleep 15;
					_ct = _ct + 1
					};

				deleteVehicle _lasT
				}
			}
		};

	_cause = [_unitG,6,true,0,24,[],false] call RYD_Wait;

	if ((isPlayer (leader _unitG)) and not (isMultiplayer)) then {(leader _unitG) removeSimpleTask _task};

	if not (_unitG getVariable "Defending") then {_endThis = true};
	if ((isNull _unitG) or (isNull RydHQC)) then {_endThis = true;_alive = false};
	if not (alive (leader _unitG)) then {_endThis = true;_alive = false};
	};

if not (_alive) exitWith 
	{
	if ((RydHQC_Debug) or (isPlayer (leader _unitG))) then 
		{
		deleteMarker ("markDef" + _unitVar);
		deleteMarker ("markWatch" + _unitVar);
		};

	RydHQC_AirInDef = RydHQC_AirInDef - [_unitG]
	};

_task = [(leader _unitG),["Return to the landing site.", "Move", ""],_StartPos] call RYD_AddTask;

_wp = [_unitG,_StartPos,"MOVE","AWARE","GREEN","NORMAL",["true", "{(vehicle _x) land 'LAND'} foreach (units (group this)); deletewaypoint [(group this), 0]"]] call RYD_WPadd;

_cause = [_unitG,6,true,0,24,[],false] call RYD_Wait;
_alive = _cause select 1;

if not (_alive) exitwith {if ((RydHQC_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markDef" + (str _unitG))};RydHQC_AirInDef = RydHQC_AirInDef - [_unitG]};

if ((isPlayer (leader _unitG)) and not (isMultiplayer)) then {(leader _unitG) removeSimpleTask _task};

sleep 30;

if ((RydHQC_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markDef" + (str _unitG))};

RydHQC_AirInDef = RydHQC_AirInDef - [_unitG];
_unitG setVariable [("Busy" + _unitvar), false];

_UL = leader _unitG;if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdEnd,"OrdEnd"] call RYD_AIChatter}};