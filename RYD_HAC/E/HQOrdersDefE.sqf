_LMCU = (RydHQE_Friends - ((RydHQE_AirG - RydHQE_NCrewInfG) + RydHQE_SpecForG + RydHQE_CargoOnly + RydHQE_NavalG + RydHQE_StaticG + RydHQE_SupportG + RydHQE_ArtG + (RydHQE_NCCargoG - (RydHQE_NCrewInfG - RydHQE_SupportG)))) - RydHQE_NoDef;
_airDef = (RydHQE_AirG - (RydHQE_NCAirG + RydHQE_NCrewInfG)) - (RydHQE_NoDef + RydHQE_SpecForG + RydHQE_CargoOnly + RydHQE_AmmoDrop);
_recDef = (RydHQE_reconG + RydHQE_FOG + RydHQE_snipersG) - (RydHQE_NoDef + RydHQE_SpecForG + RydHQE_CargoOnly);

_LMCU = [_LMCU] call RYD_RandomOrd;
_airDef = [_airDef] call RYD_RandomOrd;
_recDef = [_recDef] call RYD_RandomOrd;

_allInDef = true;_goodSpots = [];

	{
	_inDef = _x getVariable "Defending";
	if (isNil "_inDef") then {_inDef = false};
	if not (_inDef) exitWith {_allInDef = false}
	}
foreach ((_LMCU + _airDef + _recDef) - ([RydHQE] + RydHQE_Garrison));

if (_allInDef) exitWith {RydxHQ_Done = true};

if ((RydHQE_DefDone) and (RydHQE_Order == "DEFEND") and not ((RydHQE_LastE == 0) and ((count RydHQE_KnEnemies) > 0) and (RydHQE_FirstEMark))) exitwith {RydxHQ_Done = true};
if (RydHQE_Order == "DEFEND") then 
	{
	RydHQE_DefDone = true
	};

if ((RydHQE_FirstEMark) and (RydHQE_LastE == 0) and ((count RydHQE_KnEnemies) > 0)) then {RydHQE_FirstEMark = false};

_default = [];
_Epos0 = [];
_Epos1 = [];

if (RydHQE_NObj == 1) then {RydHQE_Obj = RydHQE_Obj1};
if (RydHQE_NObj == 2) then {RydHQE_Obj = RydHQE_Obj2};
if (RydHQE_NObj == 3) then {RydHQE_Obj = RydHQE_Obj3};
if (RydHQE_NObj >= 4) then {RydHQE_Obj = RydHQE_Obj4};

if (isNil ("RydHQE_Obj")) then 
	{
	if not (isNull leaderHQE) then 
		{
		_default = position leaderHQE
		}
	else 
		{
		_default = position (leader (RydHQE_Friends select (random (floor (count RydHQE_Friends)))))
		}
	}
 else 
	{
	_default = position RydHQE_Obj
	};

if not ((count RydHQE_KnEnPos) == 0) then 
	{
		{
		_Epos0 = _Epos0 + [(_x select 0)];
		_Epos1 = _Epos1 + [(_x select 1)]
		}
	foreach RydHQE_KnEnPos
	}
else
	{
	if not (isNull leaderHQE) then 
		{
		_Epos0 = [(position leaderHQE) select 0];
		_Epos1 = [(position leaderHQE) select 1]
		}
	else 
		{
		_Epos0 = [(position (leader (RydHQE_Friends select (random (floor (count RydHQE_Friends)))))) select 0];
		_Epos1 = [(position (leader (RydHQE_Friends select (random (floor (count RydHQE_Friends)))))) select 1]
		}
	};

_Epos0Max = _default select 0;
_Epos0Min = _default select 0;

for [{_a = 0},{_a < (count _Epos0)},{_a = _a + 1}] do 
	{
	_EposA = _Epos0 select _a;
	if (_a == 0) then {_Epos0Min = _EposA};
	if (_a == 0) then {_Epos0Max = _EposA};
	if (_Epos0Min >= _EposA) then {_Epos0Min = _EposA};
	if (_Epos0Max < _EposA) then {_Epos0Max = _EposA};
	};

_Epos1Max = _default select 1;
_Epos1Min = _default select 1;
_sel1Max = 1;
_sel1Min = 1;

for [{_b = 0},{_b < (count _Epos1)},{_b = _b + 1}] do 
	{
	_EposB = _Epos1 select _b;
	if (_b == 0) then {_Epos1Min = _EposB};
	if (_b == 0) then {_Epos1Max = _EposB};
	if (_Epos1Min >= _EposB) then {_Epos1Min = _EposB};
	if (_Epos1Max < _EposB) then {_Epos1Max = _EposB};
	};

_PosMid0 = (_Epos0Min + _Epos0Max)/2;
_PosMid1 = (_Epos1Min + _Epos1Max)/2;

RydHQE_DefRes = [];

	{
	if ((not (_x in RydHQE_NCCargoG) or ((count (units _x)) > 1)) and ((random 100) > (70/(0.75 + (RydHQE_Fineness/4))))) then {RydHQE_DefRes = RydHQE_DefRes + [_x]};
	}
foreach _LMCU;

_defPoints = [leaderHQE];

if (RydHQE_DefendObjectives > 0) then 
	{
	switch (RydHQE_NObj) do
		{
		case (2) : {_defPoints = [leaderHQE,RydHQE_Obj1]};
		case (3) : {_defPoints = [leaderHQE,RydHQE_Obj1,RydHQE_Obj2]};
		case (4) : {_defPoints = [leaderHQE,RydHQE_Obj1,RydHQE_Obj2,RydHQE_Obj3]};
		case (5) : {_defPoints = [leaderHQE,RydHQE_Obj1,RydHQE_Obj2,RydHQE_Obj3,RydHQE_Obj4]};
		default {_defPoints = [leaderHQE]};
		}
	};

_ct = 1;
_cl = 0;
_clr = 0;

while {(_ct < 3)} do
	{
		{
		_x setVariable ["ClosestFor",0];
		_x setVariable ["ClosestForRec",0];
		}
	foreach _defPoints;

		{
		_closest = _defPoints select 0;
		_friend = vehicle (leader _x);
		_dstM = _friend distance _closest;
			
			{
			_dstAct = _x distance _friend;
			if (_dstAct < _dstM) then {_dstM = _dstAct;_closest = _x}
			}
		foreach _defPoints;

		_cl = _closest getVariable "ClosestFor";
		_clr = _closest getVariable "ClosestForRec";

		_closest setVariable ["ClosestFor",_cl + 1];
		if (_x in (RydHQE_reconG + RydHQE_FOG + RydHQE_snipersG)) then {_closest setVariable ["ClosestForRec",_clr + 1]}
		}
	foreach _LMCU;

	if (_ct == 1) then
		{
		_defPoints0 = _defPoints - [leaderHQE];

			{
			_cl = _x getVariable "ClosestFor";
			if (_cl < RydHQE_DefendObjectives) then {_defPoints = _defPoints - [_x]}
			}
		foreach _defPoints0;
		};

	_ct = _ct + 1
	};

_defArray = [];
_Lenght1 = 500;
_Width1 = 500;
_Lenght2 = 500;
_Width2 = 500;
_FreeLOS = 320;

_PrimDir = "";
_SecDir = "";

_randomPrimDir = ["N","S","W","E"];
_randomSecDir = ["W","E"];

_DN = false;

	{
	_PrimDir = "";
	_SecDir = "";
	_defPoint = _x;
	_dX = (_PosMid0) - ((getPos _defPoint) select 0);
	_dY = (_Posmid1) - ((getPos _defPoint) select 1);
	RydHQE_Angle = 0;
	RydHQE_Angle = _dX atan2 _dY;

	if (RydHQE_Angle < 0) then {RydHQE_Angle = RydHQE_Angle + 360}; 

	_dXb = 400 * (sin RydHQE_Angle);
	_dYb = 400 * (cos RydHQE_Angle);
	_posX = ((getPos _defPoint) select 0) + _dXb;

	_posY = ((getPos _defPoint) select 1) + _dYb;

	switch (true) do
		{
		case ((RydHQE_Angle < 30) or (RydHQE_Angle >= 330)) : {_PrimDir = "N"};
		case ((RydHQE_Angle >= 30) and (RydHQE_Angle < 60)) : {_PrimDir = "N";_SecDir = "E"};
		case ((RydHQE_Angle >= 60) and (RydHQE_Angle < 120)) : {_PrimDir = "E"};
		case ((RydHQE_Angle >= 120) and (RydHQE_Angle < 150)) : {_PrimDir = "S";_SecDir = "E"};
		case ((RydHQE_Angle >= 150) and (RydHQE_Angle < 210)) : {_PrimDir = "S"};
		case ((RydHQE_Angle >= 210) and (RydHQE_Angle < 240)) : {_PrimDir = "S";_SecDir = "W"};
		case ((RydHQE_Angle >= 240) and (RydHQE_Angle < 300)) : {_PrimDir = "W"};
		case ((RydHQE_Angle >= 300) and (RydHQE_Angle < 330)) : {_PrimDir = "N";_SecDir = "W"};
		};

	_cl = _defPoint getVariable "ClosestFor";
	_clr = _defPoint getVariable "ClosestForRec";

	_Center = [_posX,_posY];
	_DN = false;

	_Lenght1 = 50 * _clr;
	_Width1 = 100 + (5*_clr);
	_Lenght2 = 50 * _cl;
	_Width2 = 100 + (5*_cl);

	_lng = _Lenght2;
	_wdt = _Width2;

	if (((RydHQE_Angle >= 45) and (RydHQE_Angle < 135)) or ((RydHQE_Angle >= 225) and (RydHQE_Angle < 315))) then 
		{
		_Lenght1 = 100 + (5*_clr);
		_Width1 = 50 * _clr;
		_Lenght2 = 100 + (5*_cl);
		_Width2 = 50 * _cl;
		};

	if (((_Center distance [_PosMid0,_PosMid1]) < 500) or ((count RydHQE_KnEnPos) == 0)) then 
		{
		_Lenght1 = 50 * _clr;
		_Width1 = 50 * _clr;
		_Lenght2 = 50 * _cl;
		_Width2 = 50 * _cl;

		_defFront = [];

		switch (_defPoint) do
			{
			case (leaderHQE) : {if not (isNil "RydHQE_DefFrontL") then {_defFront = RydHQE_DefFrontL}};
			case (RydHQE_Obj1) : {if not (isNil "RydHQE_DefFront1") then {_defFront = RydHQE_DefFront1}};
			case (RydHQE_Obj2) : {if not (isNil "RydHQE_DefFront2") then {_defFront = RydHQE_DefFront2}};
			case (RydHQE_Obj3) : {if not (isNil "RydHQE_DefFront3") then {_defFront = RydHQE_DefFront3}};
			case (RydHQE_Obj4) : {if not (isNil "RydHQE_DefFront4") then {_defFront = RydHQE_DefFront4}};
			};

		if (((count RydHQE_KnEnPos) == 0) or not ((count _defFront) == 0)) then
			{
			if not ((count _defFront) == 0) then 
				{
				_PrimDir = _defFront select 0;
				_SecDir = _defFront select 1
				}
			else
				{
				_PrimDir = _randomPrimDir select (floor (random (count _randomPrimDir)));
				if (((_PrimDir == "N") or (_PrimDir == "S")) and ((random 100) >= 50)) then {_SecDir = _randomSecDir select (floor (random (count _randomSecDir)))} else {_SecDir = ""};
				};

				_DN = true;

			switch (true) do
				{
				case ((_PrimDir == "N") and (_SecDir == "")) : {RydHQE_Angle = 0};
				case ((_PrimDir == "N") and (_SecDir == "E")) : {RydHQE_Angle = 45};
				case ((_PrimDir == "E") and (_SecDir == "")) : {RydHQE_Angle = 90};
				case ((_PrimDir == "S") and (_SecDir == "E")) : {RydHQE_Angle = 135};
				case ((_PrimDir == "S") and (_SecDir == "")) : {RydHQE_Angle = 180};
				case ((_PrimDir == "S") and (_SecDir == "W")) : {RydHQE_Angle = 225};
				case ((_PrimDir == "W") and (_SecDir == "")) : {RydHQE_Angle = 270};
				case ((_PrimDir == "N") and (_SecDir == "W")) : {RydHQE_Angle = 315};
				//default {RydHQE_Angle = random 360};
				}
			}
		};

	if ((_Center distance [_PosMid0,_PosMid1]) < 500) then {_Center = position _defPoint};

	if (RydHQE_Debug) then 
		{
		_goodmark = [_Center,_defPoint,"Center","ColorGreen","ICON","DOT","Def Center","Def Center"] call RYD_Mark
		};

	//_o = [_Center,(random 1000),"markDef","ColorKhaki","RECTANGLE","Border","","",[_lng,_wdt],RydHQE_Angle] call RYD_Mark;

	_spotsN = _clr * 2;
	[_spotsN,_PrimDir,_SecDir,_FreeLOS,_Lenght1,_Width1,_Center] spawn E_Spotscan;

	waituntil {sleep 1;RydHQE_SpotsScan};

	_goodSpotsRec = RydHQE_GoodSpots;

	RydHQE_GoodSpots = [];

	switch (true) do
		{
		case ((_PrimDir == "N") and (_SecDir == "")) : {_PrimDir = "S"};
		case ((_PrimDir == "N") and (_SecDir == "E")) : {_PrimDir = "S";_SecDir = "W"};
		case ((_PrimDir == "E") and (_SecDir == "")) : {_PrimDir = "W"};
		case ((_PrimDir == "S") and (_SecDir == "E")) : {_PrimDir = "N";_SecDir = "W"};
		case ((_PrimDir == "S") and (_SecDir == "")) : {_PrimDir = "N"};
		case ((_PrimDir == "S") and (_SecDir == "W")) : {_PrimDir = "N";_SecDir = "E"};
		case ((_PrimDir == "W") and (_SecDir == "")) : {_PrimDir = "E"};
		case ((_PrimDir == "N") and (_SecDir == "W")) : {_PrimDir = "S";_SecDir = "E"};
		};

	_spotsN = round (_cl * 1.5);
	[_spotsN,_PrimDir,_SecDir,_FreeLOS,_Lenght2,_Width2,_Center] spawn E_Spotscan;

	waituntil {sleep 1;RydHQE_SpotsScan};

	_goodSpots = RydHQE_GoodSpots;

	_angleV = RydHQE_Angle;

	_defArray set [(count _defArray),[_defPoint,_goodSpotsRec,_goodSpots,_DN,[_dXb,_dYb],_angleV]];

	RydHQE_GoodSpots = [];
	}
foreach _defPoints;

_Spot = [];
_GS = [];
		
	{
	_isDef = _x getVariable "Defending";
	if (isNil "_isDef") then {_isDef = false};

	if not (_isDef) then
		{
		_closestArr = _defArray select 0;
		_friend =  vehicle (leader _x);
		_dstM = _friend distance (_closestArr select 0);
			
			{
			_arrP = _x select 0;
			_dstAct = _arrP distance _friend;
			if (_dstAct < _dstM) then {_dstM = _dstAct;_closestArr = _x}
			}
		foreach _defArray;

		_goodSpots = _closestArr select 1;_angleV = _closestArr select 5;	

		if ((count _goodSpots) == 0) exitwith {};
		if not (_x in RydHQE_RecDefSpot) then 
			{
			_aa = 0;
			_Spot = _goodSpots select 0;
			for [{_a = 0},{_a < (count _goodSpots)},{_a = _a + 1}] do 
				{
				_GS = _goodSpots select _a;
				if (_a == 0) then {_Spot = _GS;_aa = 0};
				if ((_Spot distance (vehicle (leader _x))) > (_GS distance (vehicle (leader _x)))) then {_Spot = _GS;_aa = _a};
				};

			RydHQE_Roger = false;
			_goodSpots set [_aa,0]; 
			_goodSpots = _goodSpots - [0];
			_closestArr set [1,_goodSpots];
			[_x,_Spot,_angleV] spawn E_GoDefRecon;
			waituntil {sleep 0.05;RydHQE_Roger};
			RydHQE_RecDefSpot = RydHQE_RecDefSpot + [_x];
			};
		if ((count _goodSpots) == 0) exitwith {};
		};
	if ((count _goodSpots) == 0) exitwith {}
	}
foreach _recDef;


if (isNil ("RydHQE_Def")) then {RydHQE_Def = []};

switch ((random 100) >= (50/(0.5 + RydHQE_Fineness))) do
	{
	case true : 
		{			
			{
			_isDef = _x getVariable "Defending";
			if (isNil "_isDef") then {_isDef = false};

			if not (_isDef) then
				{
				_closestArr = _defArray select 0;
				_friend =  vehicle (leader _x);
				_dstM = _friend distance (_closestArr select 0);
					
					{
					_arrP = _x select 0;
					_dstAct = _arrP distance _friend;
					if (_dstAct < _dstM) then {_dstM = _dstAct;_closestArr = _x}
					}
				foreach _defArray;

				_goodSpots = _closestArr select 2;_angleV = _closestArr select 5;_dXb = (_closestArr select 4) select 0;_dYb = (_closestArr select 4) select 1;	
				_DN = _closestArr select 3;

				if ((count _goodSpots) == 0) exitwith {};
				if not (_x in RydHQE_DefSpot) then 
					{
					_bb = 0;
					_Spot = _goodSpots select 0;
					for [{_b = 0},{_b < (count _goodSpots)},{_b = _b + 1}] do 
						{
						_GS = _goodSpots select _b;
						if ((_Spot distance (vehicle (leader _x))) > (_GS distance (vehicle (leader _x)))) then {_Spot = _GS;_bb = _b};
						};
					sleep 0.1;
					RydHQE_Roger = false;
					_goodSpots set [_bb,0]; 
					_goodSpots = _goodSpots - [0];
					_closestArr set [2,_goodSpots];
					[_x,_Spot,_dXb,_dYb,_DN,_angleV] spawn E_GoDef;
					waituntil {sleep 0.05;RydHQE_Roger};
					RydHQE_DefSpot = RydHQE_DefSpot + [_x];
					};

				if ((count _goodSpots) == 0) exitwith {}
				};

			if ((count _goodSpots) == 0) exitwith {}
			}
		foreach ((_LMCU - (RydHQE_RecDefSpot + RydHQE_DefRes)) - RydHQE_NoDef);

		while {((count _airDef) > (count RydHQE_AirInDef))} do
			{
			

				{
				_isDef = _x getVariable "Defending";
				if (isNil "_isDef") then {_isDef = false};

				if not (_isDef) then
					{
					_closestArr = _defArray select 0;
					_friend =  vehicle (leader _x);
					_dstM = _friend distance (_closestArr select 0);
						
						{
						_arrP = _x select 0;
						_dstAct = _arrP distance _friend;
						if (_dstAct < _dstM) then {_dstM = _dstAct;_closestArr = _x}
						}
					foreach _defArray;

					_Spot = _closestArr select 0;	

					RydHQE_Roger = false;
					_x setVariable [("Busy" + (str _x)), false];
					[_x,_Spot] spawn E_GoDefAir;
					waituntil {sleep 0.1;RydHQE_Roger}
					}
				}
			foreach _airDef;
			};

			{
			_isDef = _x getVariable "Defending";
			if (isNil "_isDef") then {_isDef = false};

			if not (_isDef) then
				{
				if not (_x in RydHQE_Def) then 
					{
					_closestArr = _defArray select 0;
					_friend =  vehicle (leader _x);
					_dstM = _friend distance (_closestArr select 0);
						
						{
						_arrP = _x select 0;
						_dstAct = _arrP distance _friend;
						if (_dstAct < _dstM) then {_dstM = _dstAct;_closestArr = _x}
						}
					foreach _defArray;

					_SpotB = _closestArr select 0;_angleV = _closestArr select 5;

					_ct = _SpotB getVariable "ClosestFor";

					_SpotB = position _SpotB;
					_DN = _closestArr select 3;
					_dXb = (_closestArr select 4) select 0;
					_dYb = (_closestArr select 4) select 1;



					_radius = 50 + (50 * _ct);
					_position = [(_SpotB select 0) + (random (2*_radius)) - _radius,(_SpotB select 1) + (random (2*_radius)) - _radius];
					_radius = 100;
					_precision = 20;
					_sourcesCount = 1;
					_expression = "Meadow";
					switch (true) do 
						{
						case (_x in RydHQE_InfG) : {_expression = "(1 + (2 * Houses)) * (1 + (1.5 * Forest)) * (1 + Trees) * (1 - Meadow) * (1 - (10 * sea))"};
						case (not (_x in RydHQE_InfG)) : {_expression = "(1 + (2 * Meadow)) * (1 - Forest) * (1 - (0.5 * Trees)) * (1 - (10 * sea))"};
						};
					_Spot = selectBestPlaces [_position,_radius,_expression,_precision,_sourcesCount];
					_Spot = _Spot select 0;
					_Spot = _Spot select 0;
					if ((random 100) > 70/(0.75 + (RydHQE_Fineness/2))) then 
						{
						_NR = _Spot nearRoads 200;
						_cnt = 0;
						if not ((count _NR) == 0) then 
							{
							while {(true)} do
								{
								 _cnt = _cnt + 1;
								_Rpoint = _NR select (floor (random (count _NR)));
								_posX = ((position _Rpoint) select 0) + (random 100) - 50;
								_posY = ((position _Rpoint) select 1) + (random 100) - 50;
								if (not (isOnRoad [_posX,_posY]) and (([_posX,_posY] distance _Rpoint) > 10) or (_cnt > 10)) exitwith {if (_cnt <= 10) then {_Spot = [_posX,_posY]}};
								}
							};
						};
					
					RydHQE_Roger = false;
					[_x,_Spot,_dXb,_dYb,_DN,_angleV] spawn E_GoDef;
					waituntil {sleep 0.1;RydHQE_Roger};
					RydHQE_Def = RydHQE_Def + [_x]
					}
				}
			}
		foreach ((_LMCU - (RydHQE_DefSpot + RydHQE_RecDefSpot + RydHQE_DefRes) + RydHQE_NCCargoG + RydHQE_SupportG) - RydHQE_NoDef);
		};
	case false : 
		{
			{
			_isDef = _x getVariable "Defending";
			if (isNil "_isDef") then {_isDef = false};

			if not (_isDef) then
				{
				if not (_x in RydHQE_Def) then 
					{
					_closestArr = _defArray select 0;
					_friend =  vehicle (leader _x);
					_dstM = _friend distance (_closestArr select 0);
						
						{
						_arrP = _x select 0;
						_dstAct = _arrP distance _friend;
						if (_dstAct < _dstM) then {_dstM = _dstAct;_closestArr = _x}
						}
					foreach _defArray;

					_SpotB = _closestArr select 0;_angleV = _closestArr select 5;
					_ct = _SpotB getVariable "ClosestFor";
					_SpotB = position _SpotB;
					_DN = _closestArr select 3;
					_dXb = (_closestArr select 4) select 0;
					_dYb = (_closestArr select 4) select 1;

					_radius = 50 + (50 * _ct);
					_position = [(_SpotB select 0) + (random (2*_radius)) - _radius,(_SpotB select 1) + (random (2*_radius)) - _radius];
					_radius = 100;
					_precision = 20;
					_sourcesCount = 1;
					_expression = "Meadow";
					switch (true) do 
						{
						case (_x in RydHQE_InfG) : {_expression = "(1 + (2 * Houses)) * (1 + (1.5 * Forest)) * (1 + Trees) * (1 - Meadow) * (1 - (10 * sea))"};
						case (not (_x in RydHQE_InfG)) : {_expression = "(1 + (2 * Meadow)) * (1 - Forest) * (1 - (0.5 * Trees)) * (1 - (10 * sea))"};
						};
					_Spot = selectBestPlaces [_position,_radius,_expression,_precision,_sourcesCount];
					_Spot = _Spot select 0;
					_Spot = _Spot select 0;
					if ((random 100) > 70/(0.75 + (RydHQE_Fineness/2))) then 
						{
						_NR = _Spot nearRoads 200;
						_cnt = 0;
						if not ((count _NR) == 0) then 
							{
							while {(true)} do
								{
								 _cnt = _cnt + 1;
								_Rpoint = _NR select (floor (random (count _NR)));
								_posX = ((position _Rpoint) select 0) + (random 100) - 50;
								_posY = ((position _Rpoint) select 1) + (random 100) - 50;
								if (not (isOnRoad [_posX,_posY]) and (([_posX,_posY] distance _Rpoint) > 10) or (_cnt > 10)) exitwith {if (_cnt <= 10) then {_Spot = [_posX,_posY]}};
								}
							};
						};
					
					RydHQE_Roger = false;
					[_x,_Spot,_dXb,_dYb,_DN,_angleV] spawn E_GoDef;
					waituntil {sleep 0.1;RydHQE_Roger};
					RydHQE_Def = RydHQE_Def + [_x]
					}
				}
			}
		foreach ((_LMCU - (RydHQE_RecDefSpot + RydHQE_DefRes) + RydHQE_NCCargoG + RydHQE_SupportG) - RydHQE_NoDef);

		while {((count _airDef) > (count RydHQE_AirInDef))} do
			{
				{
				_isDef = _x getVariable "Defending";
				if (isNil "_isDef") then {_isDef = false};

				if not (_isDef) then
					{
					_closestArr = _defArray select 0;
					_friend =  vehicle (leader _x);
					_dstM = _friend distance (_closestArr select 0);
						
						{
						_arrP = _x select 0;
						_dstAct = _arrP distance _friend;
						if (_dstAct < _dstM) then {_dstM = _dstAct;_closestArr = _x}
						}
					foreach _defArray;

					_Spot = _closestArr select 0;	

					RydHQE_Roger = false;
					_x setVariable [("Busy" + (str _x)), false];
					[_x,_Spot] spawn E_GoDefAir;
					waituntil {sleep 0.1;RydHQE_Roger}
					}
				}
			foreach _airDef;
			};
		};
	};
	
	{
	_isDef = _x getVariable "Defending";
	if (isNil "_isDef") then {_isDef = false};

	if not (_isDef) then
		{
		if not (_x in RydHQE_Def) then 
			{
			_posX = ((position leaderHQE) select 0) + (random 400) - 200;
			_posY = ((position leaderHQE) select 1) + (random 400) - 200;
			_Spot = [_posX,_posY];
			RydHQE_Roger = false;
			[_x,_Spot] spawn E_GoDefRes;
			waituntil {sleep 0.1;RydHQE_Roger};
			RydHQE_Def = RydHQE_Def + [_x]
			}
		}
	}
foreach (RydHQE_DefRes - RydHQE_NoDef);

RydxHQ_Done = true;