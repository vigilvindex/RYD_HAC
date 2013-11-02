_i = "";


_unitG = _this select 0;_Spos = _unitG getvariable ("START" + (str _unitG));if (isNil ("_Spos")) then {_unitG setVariable [("START" + (str _unitG)),(position (vehicle (leader _unitG)))]}; 
_DefPos = _this select 1;

if (_unitG in RydHQG_Garrison) exitwith {RydHQG_DefSpot = RydHQG_DefSpot - [_unitG];RydHQG_GoodSpots = RydHQG_GoodSpots + [_DefPos];RydHQG_Roger = true};

_dX = _this select 2;
_dY = _this select 3;
_DN = _this select 4;
_angleV = _this select 5;

//_dX = (((position leaderHQG) select 0) - (_Center select 0));
//_dY = (((position leaderHQG) select 1) - (_Center select 1));


if ((_unitG in (RydHQG_NCCargoG - RydHQG_AirG)) and ((count (units _unitG)) <= 1) or (_unitG in (RydHQG_SupportG - RydHQG_AirG))) then 
	{
	_Xpos = ((position leaderHQG) select 0) + (random 300) - 150 - (_dX/1.25);
	_Ypos = ((position leaderHQG) select 1) + (random 300) - 150 - (_dY/1.25);
	_Defpos = [_Xpos,_Ypos];
	};

_ammo = [_unitG,RydHQG_NCVeh] call RYD_AmmoCount;

if (_ammo == 0) exitwith {RydHQG_DefSpot = RydHQG_DefSpot - [_unitG];RydHQG_GoodSpots = RydHQG_GoodSpots + [_DefPos];RydHQG_Roger = true};

_unitvar = str _unitG;
_busy = false;
_busy = _unitG getvariable ("Busy" + _unitvar);

if (isNil ("_busy")) then {_busy = false};

if ((_busy) and ((_unitG in RydHQG_DefSpot) or (_unitG in RydHQG_Def))) exitwith {RydHQG_Roger = true};

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

while {((_isWater) and (leaderHQG distance _DefPos >= 10))} do
	{
	_PosX = ((_DefPos select 0) + ((position leaderHQG) select 0))/2; 
	_PosY = ((_DefPos select 1) + ((position leaderHQG) select 1))/2;
	_DefPos = [_posX,_posY]
	};

_isWater = surfaceIsWater _DefPos;

if (_isWater) exitwith {RydHQG_DefSpot = RydHQG_DefSpot - [_unitG];RydHQG_Roger = true;_unitG setVariable [("Busy" + (str _unitG)),false]};

if ((isPlayer (leader _unitG)) and (RydxHQ_GPauseActive)) then {hintC "New orders from HQ!";setAccTime 1};

_UL = leader _unitG;

RydHQG_Roger = true;

_nE = _UL findnearestenemy _UL;

if not (isNull _nE) then
	{
	if ((RydHQG_Smoke) and ((_nE distance (vehicle _UL)) <= 500) and not (isPlayer _UL)) then
		{
		_posSL = getPosASL _UL;
		_posSL2 = getPosASL _nE;

		_angle = [_posSL,_posSL2,15] call RYD_AngTowards;

		_dstB = _posSL distance _posSL2;
		_pos = [_posSL,_angle,_dstB/4 + (random 100) - 50] call RYD_PosTowards2D;

		_CFF = false;

		if (RydHQG_ArtyShells > 0) then 
			{
			_CFF = ([_pos,RydHQG_ArtG,"SMOKE",9,_UL] call RYD_ArtyMission) select 0;
			if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_SmokeReq,"SmokeReq"] call RYD_AIChatter}};
			};

		if (_CFF) then 
			{
			if (RydHQG_ArtyShells > 0) then {if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQG,RydxHQ_AIC_ArtAss,"ArtAss"] call RYD_AIChatter}};
			sleep 60
			}
		else
			{
			if (RydHQG_ArtyShells > 0) then {if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQG,RydxHQ_AIC_ArtDen,"ArtDen"] call RYD_AIChatter}};
			[_unitG] call RYD_Smoke;
			sleep 10;
			if ((vehicle _UL) == _UL) then {sleep 20}
			}
		}
	};

RydHQG_VCDone = true;
if (isPlayer _UL) then {[_UL,leaderHQG] spawn VoiceComm;sleep 3;waituntil {sleep 0.1;(RydHQG_VCDone)}} else {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdConf,"OrdConf"] call RYD_AIChatter}};

if ((RydHQG_Debug) or (isPlayer (leader _unitG))) then 
	{
	_clr = "ColorBrown";
	_txt = "LMCU G";
	if (_unitG in (RydHQG_SupportG - RydHQG_AirG)) then {_clr = "ColorKhaki";_txt = "DSupp G"};
	_pltxt = " - DEFEND POSITION";
	if (_unitG in (RydHQG_SupportG - RydHQG_AirG)) then {_pltxt = " - SUPPORT"};

	_i = [_DefPos,_unitG,"markDef",_clr,"ICON","mil_dot",_txt,_pltxt] call RYD_Mark
	};

_AV = assignedVehicle _UL;

_task = [(leader _unitG),["Take a defensive position as fast as possible.", "Sentry", ""],_DefPos] call RYD_AddTask;

_tp = "MOVE";
//if ((_unitG in (RydHQG_CargoG)) or (not (isNull _AV) and not (_unitG == (group (assigneddriver _AV))))) then {_tp = "UNLOAD"}; 

_frm = formation _unitG;
if not (isPlayer (leader _unitG)) then {_frm = "FILE"};

_wp = [_unitG,_DefPos,_tp,"AWARE","GREEN","FULL",["true","deletewaypoint [(group this), 0];"],true,0.001,[0,0,0],_frm] call RYD_WPadd;

if not (RydHQG_Order == "DEFEND") then {_unitG setVariable [("Busy" + _unitvar), false]};

_cause = [_unitG,6,true,0,24,[],false] call RYD_Wait;
_alive = _cause select 1;

if not (_alive) exitwith {if ((RydHQG_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markDef" + str (_unitG))};RydHQG_DefSpot = RydHQG_DefSpot - [_unitG]};

if ((_unitG in (RydHQG_CargoG - (RydHQG_HArmorG + RydHQG_LArmorG + RydHQG_SupportG + (RydHQG_CarsG - RydHQG_NCCargoG)))) or (not (isNull _AV) and not (_unitG == (group (assigneddriver _AV))))) then {(units _unitG) orderGetIn false};

//if (_unitG in RydHQG_CargoG) then {(assignedCargo _AV) orderGetIn false};

_frm = formation _unitG;
if ((_DN) and not (isPlayer (leader _unitG))) then {_frm = "WEDGE"};

_wp = [_unitG,_DefPos,"SENTRY","COMBAT","YELLOW","NORMAL",["true","deletewaypoint [(group this), 0];"],true,0.001,[0,0,0],_frm] call RYD_WPadd;

_TED = position leaderHQG;

_dX = 2000 * (sin _angleV);
_dY = 2000 * (cos _angleV);

_posX = ((getPos leaderHQG) select 0) + _dX + (random 2000) - 1000;
_posY = ((getPos leaderHQG) select 1) + _dY + (random 2000) - 1000;

_TED = [_posX,_posY];

if ((RydHQG_Debug) or (isPlayer (leader _unitG))) then 
	{
	_i = [_TED,_unitG,"markWatch","Default","ICON","mil_dot","G","G",[0.2,0.2]] call RYD_Mark
	};

_dir = [(getPosATL (vehicle (leader _unitG))),_TED,10] call RYD_AngTowards;
if (_dir < 0) then {_dir = _dir + 360};

_unitG setFormDir _dir;

(units _unitG) doWatch _TED;

_UL = leader _unitG;if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdFinal,"OrdFinal"] call RYD_AIChatter}};

[_unitG,RydHQG_Flare,RydHQG_ArtG,RydHQG_ArtyShells,leaderHQG] spawn RYD_Flares;

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
	if ((RydHQG_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markDef" + _unitVar);deleteMarker ("markWatch" + _unitVar)};
	RydHQG_DefSpot = RydHQG_DefSpot - [_unitG];
	RydHQG_Def = RydHQG_Def - [_unitG]
	};

if ((isPlayer (leader _unitG)) and not (isMultiplayer)) then {(leader _unitG) removeSimpleTask _task};
if ((RydHQG_Debug) or (isPlayer (leader _unitG))) then {deleteMarker ("markDef" + (str _unitG));deleteMarker ("markWatch" + (str _unitG))};

(units _unitG) doWatch ObjNull;
(units _unitG) orderGetIn true;
if (_attackAllowed) then {_unitG enableAttack true};

RydHQG_DefSpot = RydHQG_DefSpot - [_unitG];
RydHQG_Def = RydHQG_Def - [_unitG];

if ((_DN) and not (isPlayer (leader _unitG))) then {_unitG setFormation "WEDGE"};

_unitG setVariable [("Busy" + _unitvar), false];

_UL = leader _unitG;if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_OrdEnd,"OrdEnd"] call RYD_AIChatter}};