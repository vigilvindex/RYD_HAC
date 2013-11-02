
_unitG = _this select 0;_Spos = _unitG getvariable ("START" + (str _unitG));if (isNil ("_Spos")) then {_unitG setVariable [("START" + (str _unitG)),(position (vehicle (leader _unitG)))];_Spos = _unitG getVariable ("START" + (str _unitG))}; 
_pos = position (leader _unitG);
_LU = leader _unitG;
_VLU = vehicle _LU;

if (_unitG in RydHQF_Garrison) exitwith {};

_unitG setVariable [("Deployed" + (str _unitG)),true];

_Xpos = ((((position leaderHQF) select 0) + ((position RydHQF_Obj) select 0))/2) + (random 100) - 50;
_Ypos = ((((position leaderHQF) select 1) + ((position RydHQF_Obj) select 1))/2) + (random 100) - 50;

_posX = _Xpos;
_posY = _Ypos;

_isDecoy = false;
_enemyMatters = true;
_roadG = false;
_patrol = false;

if (not (isNil "RydHQF_IdleDecoy") and not (_unitG in RydHQF_SupportG)) then
	{
	_isDecoy = true;

	_tRadius = (triggerArea RydHQF_IdleDecoy) select 0;

	if ((random 100) >= RydHQF_IDChance) exitWith {_isDecoy = false};

	_tPos = position RydHQF_IdleDecoy;
	_enemyMatters = (triggerArea RydHQF_IdleDecoy) select 3;

	_posX = (_tPos select 0) + (random (2 * _tRadius)) - (_tRadius);
	_posY = (_tPos select 1) + (random (2 * _tRadius)) - (_tRadius);
	};

if (not (isNil "RydHQF_SupportDecoy") and (_unitG in RydHQF_SupportG)) then
	{
	_tRadius = (triggerArea RydHQF_SupportDecoy) select 0;

	if ((random 100) >= RydHQF_SDChance) exitWith {_isDecoy = false};

	_tPos = position RydHQF_SupportDecoy;
	_enemyMatters = (triggerArea RydHQF_SupportDecoy) select 3;

	_posX = (_tPos select 0) + (random (2 * _tRadius)) - (_tRadius);
	_posY = (_tPos select 1) + (random (2 * _tRadius)) - (_tRadius);
	};

if not (_isDecoy) then 
	{
	_safedist = 1000/(0.75 + (RydHQF_Recklessness/2));
	_behind = false;
	_behind2 = false;
	if (RydHQF_Cyclecount > (4 + ((leaderHQF distance RydHQF_Obj)/1000))) then {_behind2 = true};
	_counterU = 0;

		{
		_VL = vehicle (leader _x);
		if (((_VL distance RydHQF_Obj) < ([_Xpos,_Ypos] distance RydHQF_Obj)) or (((_VL distance RydHQF_Obj) < ([_Xpos,_Ypos] distance _VL)) and ((_VL distance RydHQF_Obj) < (RydHQF_Obj distance _VLU)))) then {_counterU = _counterU + 1};
		if ((_counterU >= (round (2/(0.5 + (RydHQF_Recklessness/2))))) or (_counterU >= ((count RydHQF_Friends)/(4*(0.5 + (RydHQF_Recklessness/2)))))) exitwith {_behind = true}
		}
	foreach RydHQF_Friends;

	_Xpos2 = _Xpos;
	_Ypos2 = _Ypos;

	while {(((RydHQF_Obj distance [_Xpos,_Ypos]) > _safedist) and (_behind2) and (_behind))} do
		{
		_Xpos3 = _Xpos2;
		_Ypos3 = _Ypos2;
		_behind2 = false;
		_counterU = 0;
		_Xpos2 = (_Xpos2 + ((position RydHQF_Obj) select 0))/2;
		_Ypos2 = (_Ypos2 + ((position RydHQF_Obj) select 1))/2;
		if not ((RydHQF_Obj distance [_Xpos2,_Ypos2]) > _safedist) exitWith {_Xpos = _Xpos3;_Ypos = _Ypos3};

			{
			_VL = vehicle (leader _x);
			if (((_VL distance RydHQF_Obj) < ([_Xpos2,_Ypos2] distance RydHQF_Obj)) or (((_VL distance RydHQF_Obj) < ([_Xpos2,_Ypos2] distance _VL)) and ((_VL distance RydHQF_Obj) < (RydHQF_Obj distance _VLU)))) then {_counterU = _counterU + 1};
			if ((_counterU >= (round (2/(0.5 + (RydHQF_Recklessness/2))))) or (_counterU >= ((count RydHQF_Friends)/(4*(0.5 + (RydHQF_Recklessness/2)))))) exitwith {_behind2 = true}
			}
		foreach RydHQF_Friends;
		if not (_behind2) exitwith {_Xpos = _Xpos3;_Ypos = _Ypos3};
		if (_behind2) then {_Xpos = _Xpos2;_Ypos = _Ypos2};
		};

	_position = [_Xpos,_Ypos];
	_allowed = false;

	RydHQF_Bpoint = _position;

	if (not (_unitG in (RydHQF_SupportG + RydHQF_NCCargoG)) and ((random 100) >= 50) and ((_VLU distance [_Xpos,_Ypos]) > (_VLU distance leaderHQF))) then 
		{
		_position = [((position leaderHQF) select 0) + (random 400) - 200,((position leaderHQF) select 1) + (random 400) - 200]
		}
	else
		{
		if (not (_unitG in (RydHQF_NCCargoG - RydHQF_SupportG)) and ((_VLU distance [_Xpos,_Ypos]) < (_VLU distance RydHQF_Obj)) and (_behind)) then 
			{
			_position = [_Xpos + (random 400) - 200,_Ypos + (random 400) - 200];
			_allowed = true;
			}
		else
			{
			if not (_unitG in (RydHQF_SupportG + RydHQF_NCCargoG)) then 
				{
				_position = [((position _VLU) select 0) + (random 200) - 100,((position _VLU) select 1) + (random 200) - 100]
				};
			}
		};

	if (not (_allowed) and (_unitG in RydHQF_SupportG)) exitwith {};

	_radius = 100;
	_precision = 20;
	_sourcesCount = 1;
	_expression = "Meadow";
	switch (true) do 
		{
		case (_unitG in (RydHQF_NCrewInfG - RydHQF_SupportG)) : {_expression = "(1 + (2 * Houses)) * (1 + (1.5 * Forest)) * (1 + Trees) * (1 - Meadow) * (1 - (10 * sea))"};
		case (not (_unitG in (RydHQF_NCrewInfG - RydHQF_SupportG))) : {_expression = "(1 + (2 * Meadow)) * (1 - Forest) * (1 - (0.5 * Trees)) * (1 - (10 * sea)) * (1 - (2 * Houses))"};
		};

	_Spot = selectBestPlaces [_position,_radius,_expression,_precision,_sourcesCount];
	_Spot = _Spot select 0;
	_Spot = _Spot select 0;

	_posX = _Spot select 0;
	_posY = _Spot select 1;

	if (((_unitG in (RydHQF_NCrewInfG - RydHQF_SupportG - RydHQF_CargoG)) and ((random 100) > (20/0.5 + RydHQF_Activity))) or (((random 100) > (80/0.5 + RydHQF_Activity)) and not (_unitG in RydHQF_SupportG))) then {_patrol = true};

	_sec = false;

	if  ((not (_unitG in RydHQF_NCCargoG) or ((count (units _unitG)) > 1)) and not (_unitG in RydHQF_SupportG) and ((_VLU distance RydHQF_Obj) > (_VLU distance leaderHQF))) then 
		{
		_rnd = random 100;

		switch (true) do 
			{
			case ((_rnd > 50) and (_rnd <= 75)) : {if not (isNil ("RydHQF_Sec1")) then {_posX = ((position RydHQF_Sec1) select 0) + (random 200) - 100;_posY = ((position RydHQF_Sec1) select 1) + (random 200) - 100};_sec = true};
			case (_rnd > 75) : {if not (isNil ("RydHQF_Sec2")) then {_posX = ((position RydHQF_Sec2) select 0) + (random 200) - 100;_posY = ((position RydHQF_Sec2) select 1) + (random 200) - 100};_sec = true};
			};
		};

	_NR = _pos nearRoads 400;
	_cnt = 0;
	if (not (_patrol) and not (_sec) and not ((random 100) < (20/(0.5 + RydHQF_Fineness))) and not ((count _NR) == 0) and not (_unitG in (RydHQF_SupportG + RydHQF_NCCargoG))) then 
		{
		while {(true)} do
			 {
			 _cnt = _cnt + 1;
			_Rpoint = _NR select (floor (random (count _NR)));
			_posX = ((position _Rpoint) select 0) + (random 100) - 50;
			_posY = ((position _Rpoint) select 1) + (random 100) - 50;
			if (not (isOnRoad [_posX,_posY]) and (([_posX,_posY] distance _Rpoint) > 10) or (_cnt > 20)) exitwith {if not (_cnt > 20) then {_roadG = true}};
			}
		};
	};

_eClose = [[_posX,_posY],RydHQF_KnEnemiesG,500] call RYD_CloseEnemy;

if (((([_posX,_posY] distance _VLU) < 100) and not (_patrol) and not (_roadG)) or ((_eClose) and (_enemyMatters))) exitwith {_unitG setVariable [("Deployed" + (str _unitG)),false]};

_isWater = surfaceIsWater [_posX,_posY];

if (_isWater) exitwith {_unitG setVariable [("Deployed" + (str _unitG)),false]};

[_unitG] call RYD_WPdel;

if ((isPlayer (leader _unitG)) and (RydxHQ_GPauseActive)) then {hintC "New orders from HQ!";setAccTime 1};

_UL = leader _unitG;
RydHQF_VCDone = true;
if (isPlayer _UL) then {[_UL,leaderHQF] spawn VoiceComm;sleep 3;waituntil {sleep 0.1;(RydHQF_VCDone)}} else {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdConf,"OrdConf"] call RYD_AIChatter}};

_i = "";
if ((RydHQF_Debug) or (isPlayer (leader _unitG))) then
	{
	_pltxt = " - HOLD POSITION";
	if (_patrol) then {_pltxt = " - PATROL AREA"};
	_i = [[_posX,_posY],_unitG,"markIdle","ColorWhite","ICON","mil_dot","Res F",_pltxt,[0.5,0.5]] call RYD_Mark;
	};

_task = taskNull;
if ((isPlayer (leader _unitG)) and not (_patrol)) then
	{
	_task = [(leader _unitG),["Hold position.", "Sentry", ""],[_posX,_posY]] call RYD_AddTask
	};

_tp = "SENTRY";
if not (_patrol) then {_tp = "MOVE"};
if (_unitG in (RydHQF_NCrewInfG - RydHQF_SupportG)) then {_tp = "MOVE"};
_CM = "YELLOW";
_spd = "LIMITED";
if (_unitG in (RydHQF_SupportG)) then {_CM = "BLUE";_tp = "MOVE";_spd = "NORMAL"};
_sts = ["true","deletewaypoint [(group this), 0];"];
if (_unitG in RydHQF_AirG) then {_sts = ["true", "{(vehicle _x) land 'LAND'} foreach (units (group this)); deletewaypoint [(group this), 0]"]};

_wp = [_unitG,[_posX,_posY],_tp,"SAFE",_CM,_spd,_sts] call RYD_WPadd;

if (_patrol) then 
	{
	[_unitG] call RYD_WPdel;

	_firstpos = [_posX,_posY];
	_Nway = (ceil (random 4)) + 2;
	if (isPlayer (leader _unitG)) then {_Nway = 1};
	for [{_a = 1},{_a <= _Nway},{_a = _a + 1}] do
		{
		_posX = _posX + (random 500) - 250;
		_posY = _posY + (random 500) - 250;

		_ct = 0;
		_pos = [_posX,_posY];

		_posX2 = _posX;
		_posY2 = _posY;

		while {((surfaceIsWater _pos) and (_ct < 50))} do
			{
			_posX2 = _posX + (random 500) - 250;
			_posY2 = _posY + (random 500) - 250;
			_pos = [_posX2,_posY2];
			_ct = _ct + 1;
			};

		_posX = _posX2;
		_posY = _posY2;

		_isWater = surfaceIsWater [_posX,_posY];

		if not (_isWater) then 
			{
			_task = [(leader _unitG),["Patrol area.", "Move", ""],[_posX,_posY]] call RYD_AddTask;

			_tp = "CYCLE";
			_pos = _firstpos;
			if (not (_a == _Nway) or (isPlayer (leader _unitG))) then {_pos = [_posX,_posY];_tp = "MOVE"};
			_crr = false;
			if (_a == 1) then {_crr = true};

			_wp = [[_unitG],_pos,_tp,"SAFE","YELLOW","LIMITED",["true",""],_crr,0.01] call RYD_WPadd
			};
		}
	};

_cause = [_unitG,6,true,0,50,[],false,true,true,false,true] call RYD_Wait;
_timer = _cause select 0;
_alive = _cause select 1;
_busy = _cause select 3;

if (not (_patrol) and not (_busy) and (_alive)) then 
	{
	_UL = leader _unitG;if not (isPlayer _UL) then {if (_timer <= 24) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdFinal,"OrdFinal"] call RYD_AIChatter}}};
	_frm = formation _unitG;
	if not (isPlayer (leader _unitG)) then {_frm = "DIAMOND"};
	_wp = [_unitG,[_posX,_posY],"SENTRY","AWARE","YELLOW","NORMAL",["true","deletewaypoint [(group this), 0];"],false,0,[0,0,0],_frm] call RYD_WPadd;
	};

if ((isPlayer (leader _unitG)) and not (isMultiplayer)) then {(leader _unitG) removeSimpleTask _task};

if not (_alive) exitwith {if ((RydHQF_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markIdle" + str (_unitG))}};

if not (((vehicle _LU) == _LU) and not (isPlayer _LU) and not (isPlayer (driver (assignedvehicle (_LU))))) then {(vehicle _LU) engineOn false};

if ((RydHQF_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markIdle" + str (_unitG))};

if (_alive) then 
	{
	_cause = [_unitG,6,false,0,0,[],true,true,false,true] call RYD_Wait;
	_alive = _cause select 1;
	_busy = _cause select 3;

	if not (_alive) exitwith {};
	if not (isPlayer (leader _unitG)) then {_unitG setFormation "WEDGE"};
	};