_i = "";

_unitG = _this select 0;_Spos = _unitG getvariable ("START" + (str _unitG));if (isNil ("_Spos")) then {_unitG setVariable [("START" + (str _unitG)),(position (vehicle (leader _unitG)))];_Spos = _unitG getVariable ("START" + (str _unitG))}; 
_DefPos = _this select 1;if (_unitG in RydHQB_Garrison) exitwith {RydHQB_RecDefSpot = RydHQB_RecDefSpot - [_unitG];RydHQB_GoodSpots = RydHQB_GoodSpots + [_DefPos];RydHQB_Roger = true};
_angleV = _this select 2;


_ammo = [_unitG,RydHQB_NCVeh] call RYD_AmmoCount;

if (_ammo == 0) exitwith {RydHQB_RecDefSpot = RydHQB_RecDefSpot - [_unitG];RydHQB_GoodSpots = RydHQB_GoodSpots + [_DefPos];RydHQB_Roger = true};

_unitvar = str _unitG;
_busy = false;
_busy = _unitG getvariable ("Busy" + _unitvar);

if (isNil ("_busy")) then {_busy = false};

if ((_busy) and (_unitG in RydHQB_RecDefSpot)) exitwith {RydHQB_Roger = true};

[_unitG] call RYD_WPdel;

_attackAllowed = attackEnabled _unitG;
_unitG enableAttack false; 

_unitG setVariable [("Deployed" + (str _unitG)),false];_unitG setVariable [("Capt" + (str _unitG)),false];
_unitG setVariable [("Busy" + _unitvar), true];
_unitG setVariable ["Defending", true];

_posX = (_DefPos select 0) + (random 40) - 20;
_posY = (_DefPos select 1) + (random 40) - 20;
_DefPos = [_posX,_posY];

_isWater = surfaceIsWater _DefPos;

while {((_isWater) and (leaderHQB distance _DefPos >= 10))} do
	{
	_PosX = ((_DefPos select 0) + ((position leaderHQB) select 0))/2; 
	_PosY = ((_DefPos select 1) + ((position leaderHQB) select 1))/2;
	_DefPos = [_posX,_posY]
	};

_isWater = surfaceIsWater _DefPos;

if (_isWater) exitwith {RydHQB_RecDefSpot = RydHQB_RecDefSpot - [_unitG];RydHQB_Roger = true;_unitG setVariable [("Busy" + (str _unitG)),false]};

if ((isPlayer (leader _unitG)) and (RydxHQ_GPauseActive)) then {hintC "New orders from HQ!";setAccTime 1};

_UL = leader _unitG;

RydHQB_Roger = true;

_nE = _UL findnearestenemy _UL;

if not (isNull _nE) then
	{
	if ((RydHQB_Smoke) and ((_nE distance (vehicle _UL)) <= 500) and not (isPlayer _UL)) then
		{
		_posSL = getPosASL _UL;
		_posSL2 = getPosASL _nE;

		_angle = [_posSL,_posSL2,15] call RYD_AngTowards;

		_dstB = _posSL distance _posSL2;
		_pos = [_posSL,_angle,_dstB/4 + (random 100) - 50] call RYD_PosTowards2D;

		_CFF = false;

		if (RydHQB_ArtyShells > 0) then 
			{
			_CFF = ([_pos,RydHQB_ArtG,"SMOKE",9,_UL] call RYD_ArtyMission) select 0;
			if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_SmokeReq,"SmokeReq"] call RYD_AIChatter}};
			};

		if (_CFF) then 
			{
			if (RydHQB_ArtyShells > 0) then {if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQB,RydxHQ_AIC_ArtAss,"ArtAss"] call RYD_AIChatter}};
			sleep 60
			}
		else
			{
			if (RydHQB_ArtyShells > 0) then {if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQB,RydxHQ_AIC_ArtDen,"ArtDen"] call RYD_AIChatter}};
			[_unitG] call RYD_Smoke;
			sleep 10;
			if ((vehicle _UL) == _UL) then {sleep 20}
			}
		}
	};

_UL = leader _unitG;
RydHQB_VCDone = false;
if (isPlayer _UL) then {[_UL,leaderHQB] spawn VoiceComm;sleep 3;waituntil {sleep 0.1;(RydHQB_VCDone)}} else {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdConf,"OrdConf"] call RYD_AIChatter}};

if ((RydHQB_Debug) or (isPlayer (leader _unitG))) then 
	{
	_i = [_DefPos,_unitG,"markDef","ColorBrown","ICON","mil_dot","Rec B"," - WATCH FOREGROUND"] call RYD_Mark
	};

_task = [(leader _unitG),["Take a defensive, elevated position as fast, as possible. Then observe foreground and search for enemy targets.", "Sentry", ""],_DefPos] call RYD_AddTask;

_frm = formation _unitG;
if not (isPlayer (leader _unitG)) then {_frm = "FILE"};_tp = "MOVE";

_wp = [_unitG,_DefPos,_tp,"AWARE","GREEN","FULL",["true","deletewaypoint [(group this), 0];"],true,0.001,[0,0,0],_frm] call RYD_WPadd;

_cause = [_unitG,6,true,0,24,[],false] call RYD_Wait;
_alive = _cause select 1;

if not (_alive) exitwith {if ((RydHQB_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markDef" + str (_unitG))};RydHQB_RecDefSpot = RydHQB_RecDefSpot - [_unitG]};

_frm = formation _unitG;
if not (isPlayer (leader _unitG)) then {_frm = "WEDGE"};

_wp = [_unitG,_DefPos,"SENTRY","STEALTH","YELLOW","FULL",["true","deletewaypoint [(group this), 0];"],true,0.001,[0,0,0],_frm] call RYD_WPadd;

_TED = position leaderHQB;

_dX = 2000 * (sin _angleV);
_dY = 2000 * (cos _angleV);

_posX = ((getPos leaderHQB) select 0) + _dX + (random 2000) - 1000;
_posY = ((getPos leaderHQB) select 1) + _dY + (random 2000) - 1000;

_TED = [_posX,_posY];

if ((RydHQB_Debug) or (isPlayer (leader _unitG))) then 
	{
	_i = [_TED,_unitG,"markWatch","Default","ICON","mil_dot","B","B",[0.2,0.2]] call RYD_Mark
	};

_dir = [(getPosATL (vehicle (leader _unitG))),_TED,10] call RYD_AngTowards;
if (_dir < 0) then {_dir = _dir + 360};

_unitG setFormDir _dir;
(units _unitG) doWatch _TED;

_UL = leader _unitG;if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdFinal,"OrdFinal"] call RYD_AIChatter}};

[_unitG,RydHQB_Flare,RydHQB_ArtG,RydHQB_ArtyShells,leaderHQB] spawn RYD_Flares;

_alive = true;

waituntil 
	{
	sleep 10;
	_endThis = false;
	if not (_unitG getVariable "Defending") then {_endThis = true};
	if (isNull _unitG) then {_endThis = true;_alive = false};
	if not (alive (leader _unitG)) then {_endThis = true;_alive = false};
	(_endThis)
	};

if not (_alive) exitWith 
	{
	if ((RydHQB_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markDef" + _unitVar);deleteMarker ("markWatch" + _unitVar)};
	RydHQB_RecDefSpot = RydHQB_RecDefSpot - [_unitG]
	};

if ((isPlayer (leader _unitG)) and not (isMultiplayer)) then {(leader _unitG) removeSimpleTask _task};

if ((RydHQB_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markDef" + (str _unitG));deleteMarker ("markWatch" + (str _unitG))};

(units _unitG) doWatch ObjNull;

if (_attackAllowed) then {_unitG enableAttack true};

RydHQB_RecDefSpot = RydHQB_RecDefSpot - [_unitG];

_unitG setVariable [("Busy" + _unitvar), false];

_UL = leader _unitG;if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdEnd,"OrdEnd"] call RYD_AIChatter}};