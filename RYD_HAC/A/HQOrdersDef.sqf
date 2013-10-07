_LMCU = (RydHQ_Friends - ((RydHQ_AirG - RydHQ_NCrewInfG) + RydHQ_SpecForG + RydHQ_CargoOnly + RydHQ_NavalG + RydHQ_StaticG + RydHQ_SupportG + RydHQ_ArtG + (RydHQ_NCCargoG - (RydHQ_NCrewInfG - RydHQ_SupportG)))) - RydHQ_NoDef;
_airDef = (RydHQ_AirG - (RydHQ_NCAirG + RydHQ_NCrewInfG)) - (RydHQ_NoDef + RydHQ_SpecForG + RydHQ_CargoOnly + RydHQ_AmmoDrop);
_recDef = (RydHQ_reconG + RydHQ_FOG + RydHQ_snipersG) - (RydHQ_NoDef + RydHQ_SpecForG + RydHQ_CargoOnly);

_LMCU = [_LMCU] call RYD_RandomOrd;
_airDef = [_airDef] call RYD_RandomOrd;
_recDef = [_recDef] call RYD_RandomOrd;

_allInDef = true;_goodSpots = [];

	{
	_inDef = _x getVariable "Defending";
	if (isNil "_inDef") then {_inDef = false};
	if not (_inDef) exitWith {_allInDef = false}
	}
foreach ((_LMCU + _airDef + _recDef) - ([RydHQ] + RydHQ_Garrison));

if (_allInDef) exitWith {RydxHQ_Done = true};

if ((RydHQ_DefDone) and (RydHQ_Order == "DEFEND") and not ((RydHQ_LastE == 0) and ((count RydHQ_KnEnemies) > 0) and (RydHQ_FirstEMark))) exitwith {RydxHQ_Done = true};
if (RydHQ_Order == "DEFEND") then 
	{
	RydHQ_DefDone = true
	};

if ((RydHQ_FirstEMark) and (RydHQ_LastE == 0) and ((count RydHQ_KnEnemies) > 0)) then {RydHQ_FirstEMark = false};

_default = [];
_Epos0 = [];
_Epos1 = [];

if (RydHQ_NObj == 1) then {RydHQ_Obj = RydHQ_Obj1};
if (RydHQ_NObj == 2) then {RydHQ_Obj = RydHQ_Obj2};
if (RydHQ_NObj == 3) then {RydHQ_Obj = RydHQ_Obj3};
if (RydHQ_NObj >= 4) then {RydHQ_Obj = RydHQ_Obj4};

if (isNil ("RydHQ_Obj")) then 
	{
	if not (isNull leaderHQ) then 
		{
		_default = position leaderHQ
		}
	else 
		{
		_default = position (leader (RydHQ_Friends select (random (floor (count RydHQ_Friends)))))
		}
	}
 else 
	{
	_default = position RydHQ_Obj
	};

if not ((count RydHQ_KnEnPos) == 0) then 
	{
		{
		_Epos0 = _Epos0 + [(_x select 0)];
		_Epos1 = _Epos1 + [(_x select 1)]
		}
	foreach RydHQ_KnEnPos
	}
else
	{
	if not (isNull leaderHQ) then 
		{
		_Epos0 = [(position leaderHQ) select 0];
		_Epos1 = [(position leaderHQ) select 1]
		}
	else 
		{
		_Epos0 = [(position (leader (RydHQ_Friends select (random (floor (count RydHQ_Friends)))))) select 0];
		_Epos1 = [(position (leader (RydHQ_Friends select (random (floor (count RydHQ_Friends)))))) select 1]
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

RydHQ_DefRes = [];

	{
	if ((not (_x in RydHQ_NCCargoG) or ((count (units _x)) > 1)) and ((random 100) > (70/(0.75 + (RydHQ_Fineness/4))))) then {RydHQ_DefRes = RydHQ_DefRes + [_x]};
	}
foreach _LMCU;

_defPoints = [leaderHQ];

if (RydHQ_DefendObjectives > 0) then 
	{
	switch (RydHQ_NObj) do
		{
		case (2) : {_defPoints = [leaderHQ,RydHQ_Obj1]};
		case (3) : {_defPoints = [leaderHQ,RydHQ_Obj1,RydHQ_Obj2]};
		case (4) : {_defPoints = [leaderHQ,RydHQ_Obj1,RydHQ_Obj2,RydHQ_Obj3]};
		case (5) : {_defPoints = [leaderHQ,RydHQ_Obj1,RydHQ_Obj2,RydHQ_Obj3,RydHQ_Obj4]};
		default {_defPoints = [leaderHQ]};
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
		if (_x in (RydHQ_reconG + RydHQ_FOG + RydHQ_snipersG)) then {_closest setVariable ["ClosestForRec",_clr + 1]}
		}
	foreach _LMCU;

	if (_ct == 1) then
		{
		_defPoints0 = _defPoints - [leaderHQ];

			{
			_cl = _x getVariable "ClosestFor";
			if (_cl < RydHQ_DefendObjectives) then {_defPoints = _defPoints - [_x]}
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
	RydHQ_Angle = 0;
	RydHQ_Angle = _dX atan2 _dY;

	if (RydHQ_Angle < 0) then {RydHQ_Angle = RydHQ_Angle + 360}; 

	_dXb = 400 * (sin RydHQ_Angle);
	_dYb = 400 * (cos RydHQ_Angle);
	_posX = ((getPos _defPoint) select 0) + _dXb;

	_posY = ((getPos _defPoint) select 1) + _dYb;

	switch (true) do
		{
		case ((RydHQ_Angle < 30) or (RydHQ_Angle >= 330)) : {_PrimDir = "N"};
		case ((RydHQ_Angle >= 30) and (RydHQ_Angle < 60)) : {_PrimDir = "N";_SecDir = "E"};
		case ((RydHQ_Angle >= 60) and (RydHQ_Angle < 120)) : {_PrimDir = "E"};
		case ((RydHQ_Angle >= 120) and (RydHQ_Angle < 150)) : {_PrimDir = "S";_SecDir = "E"};
		case ((RydHQ_Angle >= 150) and (RydHQ_Angle < 210)) : {_PrimDir = "S"};
		case ((RydHQ_Angle >= 210) and (RydHQ_Angle < 240)) : {_PrimDir = "S";_SecDir = "W"};
		case ((RydHQ_Angle >= 240) and (RydHQ_Angle < 300)) : {_PrimDir = "W"};
		case ((RydHQ_Angle >= 300) and (RydHQ_Angle < 330)) : {_PrimDir = "N";_SecDir = "W"};
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

	if (((RydHQ_Angle >= 45) and (RydHQ_Angle < 135)) or ((RydHQ_Angle >= 225) and (RydHQ_Angle < 315))) then 
		{
		_Lenght1 = 100 + (5*_clr);
		_Width1 = 50 * _clr;
		_Lenght2 = 100 + (5*_cl);
		_Width2 = 50 * _cl;
		};

	if (((_Center distance [_PosMid0,_PosMid1]) < 500) or ((count RydHQ_KnEnPos) == 0)) then 
		{
		_Lenght1 = 50 * _clr;
		_Width1 = 50 * _clr;
		_Lenght2 = 50 * _cl;
		_Width2 = 50 * _cl;

		_defFront = [];

		switch (_defPoint) do
			{
			case (leaderHQ) : {if not (isNil "RydHQ_DefFrontL") then {_defFront = RydHQ_DefFrontL}};
			case (RydHQ_Obj1) : {if not (isNil "RydHQ_DefFront1") then {_defFront = RydHQ_DefFront1}};
			case (RydHQ_Obj2) : {if not (isNil "RydHQ_DefFront2") then {_defFront = RydHQ_DefFront2}};
			case (RydHQ_Obj3) : {if not (isNil "RydHQ_DefFront3") then {_defFront = RydHQ_DefFront3}};
			case (RydHQ_Obj4) : {if not (isNil "RydHQ_DefFront4") then {_defFront = RydHQ_DefFront4}};
			};

		if (((count RydHQ_KnEnPos) == 0) or not ((count _defFront) == 0)) then
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
				case ((_PrimDir == "N") and (_SecDir == "")) : {RydHQ_Angle = 0};
				case ((_PrimDir == "N") and (_SecDir == "E")) : {RydHQ_Angle = 45};
				case ((_PrimDir == "E") and (_SecDir == "")) : {RydHQ_Angle = 90};
				case ((_PrimDir == "S") and (_SecDir == "E")) : {RydHQ_Angle = 135};
				case ((_PrimDir == "S") and (_SecDir == "")) : {RydHQ_Angle = 180};
				case ((_PrimDir == "S") and (_SecDir == "W")) : {RydHQ_Angle = 225};
				case ((_PrimDir == "W") and (_SecDir == "")) : {RydHQ_Angle = 270};
				case ((_PrimDir == "N") and (_SecDir == "W")) : {RydHQ_Angle = 315};
				//default {RydHQ_Angle = random 360};
				}
			}
		};

	if ((_Center distance [_PosMid0,_PosMid1]) < 500) then {_Center = position _defPoint};

	if (RydHQ_Debug) then 
		{
		_goodmark = [_Center,_defPoint,"Center","ColorGreen","ICON","DOT","Def Center","Def Center"] call RYD_Mark
		};

	//_o = [_Center,(random 1000),"markDef","ColorKhaki","RECTANGLE","Border","","",[_lng,_wdt],RydHQ_Angle] call RYD_Mark;

	_spotsN = _clr * 2;
	[_spotsN,_PrimDir,_SecDir,_FreeLOS,_Lenght1,_Width1,_Center] spawn A_Spotscan;

	waituntil {sleep 1;RydHQ_SpotsScan};

	_goodSpotsRec = RydHQ_GoodSpots;

	RydHQ_GoodSpots = [];

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
	[_spotsN,_PrimDir,_SecDir,_FreeLOS,_Lenght2,_Width2,_Center] spawn A_Spotscan;

	waituntil {sleep 1;RydHQ_SpotsScan};

	_goodSpots = RydHQ_GoodSpots;

	_angleV = RydHQ_Angle;

	_defArray set [(count _defArray),[_defPoint,_goodSpotsRec,_goodSpots,_DN,[_dXb,_dYb],_angleV]];

	RydHQ_GoodSpots = [];
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
		if not (_x in RydHQ_RecDefSpot) then 
			{
			_aa = 0;
			_Spot = _goodSpots select 0;
			for [{_a = 0},{_a < (count _goodSpots)},{_a = _a + 1}] do 
				{
				_GS = _goodSpots select _a;
				if (_a == 0) then {_Spot = _GS;_aa = 0};
				if ((_Spot distance (vehicle (leader _x))) > (_GS distance (vehicle (leader _x)))) then {_Spot = _GS;_aa = _a};
				};

			RydHQ_Roger = false;
			_goodSpots set [_aa,0]; 
			_goodSpots = _goodSpots - [0];
			_closestArr set [1,_goodSpots];
			[_x,_Spot,_angleV] spawn A_GoDefRecon;
			waituntil {sleep 0.05;RydHQ_Roger};
			RydHQ_RecDefSpot = RydHQ_RecDefSpot + [_x];
			};
		if ((count _goodSpots) == 0) exitwith {};
		};
	if ((count _goodSpots) == 0) exitwith {}
	}
foreach _recDef;


if (isNil ("RydHQ_Def")) then {RydHQ_Def = []};

switch ((random 100) >= (50/(0.5 + RydHQ_Fineness))) do
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
				if not (_x in RydHQ_DefSpot) then 
					{
					_bb = 0;
					_Spot = _goodSpots select 0;
					for [{_b = 0},{_b < (count _goodSpots)},{_b = _b + 1}] do 
						{
						_GS = _goodSpots select _b;
						if ((_Spot distance (vehicle (leader _x))) > (_GS distance (vehicle (leader _x)))) then {_Spot = _GS;_bb = _b};
						};
					sleep 0.1;
					RydHQ_Roger = false;
					_goodSpots set [_bb,0]; 
					_goodSpots = _goodSpots - [0];
					_closestArr set [2,_goodSpots];
					[_x,_Spot,_dXb,_dYb,_DN,_angleV] spawn A_GoDef;
					waituntil {sleep 0.05;RydHQ_Roger};
					RydHQ_DefSpot = RydHQ_DefSpot + [_x];
					};

				if ((count _goodSpots) == 0) exitwith {}
				};

			if ((count _goodSpots) == 0) exitwith {}
			}
		foreach ((_LMCU - (RydHQ_RecDefSpot + RydHQ_DefRes)) - RydHQ_NoDef);

		while {((count _airDef) > (count RydHQ_AirInDef))} do
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

					RydHQ_Roger = false;
					_x setVariable [("Busy" + (str _x)), false];
					[_x,_Spot] spawn A_GoDefAir;
					waituntil {sleep 0.1;RydHQ_Roger}
					}
				}
			foreach _airDef;
			};

			{
			_isDef = _x getVariable "Defending";
			if (isNil "_isDef") then {_isDef = false};

			if not (_isDef) then
				{
				if not (_x in RydHQ_Def) then 
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
						case (_x in RydHQ_InfG) : {_expression = "(1 + (2 * Houses)) * (1 + (1.5 * Forest)) * (1 + Trees) * (1 - Meadow) * (1 - (10 * sea))"};
						case (not (_x in RydHQ_InfG)) : {_expression = "(1 + (2 * Meadow)) * (1 - Forest) * (1 - (0.5 * Trees)) * (1 - (10 * sea))"};
						};
					_Spot = selectBestPlaces [_position,_radius,_expression,_precision,_sourcesCount];
					_Spot = _Spot select 0;
					_Spot = _Spot select 0;
					if ((random 100) > 70/(0.75 + (RydHQ_Fineness/2))) then 
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
					
					RydHQ_Roger = false;
					[_x,_Spot,_dXb,_dYb,_DN,_angleV] spawn A_GoDef;
					waituntil {sleep 0.1;RydHQ_Roger};
					RydHQ_Def = RydHQ_Def + [_x]
					}
				}
			}
		foreach ((_LMCU - (RydHQ_DefSpot + RydHQ_RecDefSpot + RydHQ_DefRes) + RydHQ_NCCargoG + RydHQ_SupportG) - RydHQ_NoDef);
		};
	case false : 
		{
			{
			_isDef = _x getVariable "Defending";
			if (isNil "_isDef") then {_isDef = false};

			if not (_isDef) then
				{
				if not (_x in RydHQ_Def) then 
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
						case (_x in RydHQ_InfG) : {_expression = "(1 + (2 * Houses)) * (1 + (1.5 * Forest)) * (1 + Trees) * (1 - Meadow) * (1 - (10 * sea))"};
						case (not (_x in RydHQ_InfG)) : {_expression = "(1 + (2 * Meadow)) * (1 - Forest) * (1 - (0.5 * Trees)) * (1 - (10 * sea))"};
						};
					_Spot = selectBestPlaces [_position,_radius,_expression,_precision,_sourcesCount];
					_Spot = _Spot select 0;
					_Spot = _Spot select 0;
					if ((random 100) > 70/(0.75 + (RydHQ_Fineness/2))) then 
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
					
					RydHQ_Roger = false;
					[_x,_Spot,_dXb,_dYb,_DN,_angleV] spawn A_GoDef;
					waituntil {sleep 0.1;RydHQ_Roger};
					RydHQ_Def = RydHQ_Def + [_x]
					}
				}
			}
		foreach ((_LMCU - (RydHQ_RecDefSpot + RydHQ_DefRes) + RydHQ_NCCargoG + RydHQ_SupportG) - RydHQ_NoDef);

		while {((count _airDef) > (count RydHQ_AirInDef))} do
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

					RydHQ_Roger = false;
					_x setVariable [("Busy" + (str _x)), false];
					[_x,_Spot] spawn A_GoDefAir;
					waituntil {sleep 0.1;RydHQ_Roger}
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
		if not (_x in RydHQ_Def) then 
			{
			_posX = ((position leaderHQ) select 0) + (random 400) - 200;
			_posY = ((position leaderHQ) select 1) + (random 400) - 200;
			_Spot = [_posX,_posY];
			RydHQ_Roger = false;
			[_x,_Spot] spawn A_GoDefRes;
			waituntil {sleep 0.1;RydHQ_Roger};
			RydHQ_Def = RydHQ_Def + [_x]
			}
		}
	}
foreach (RydHQ_DefRes - RydHQ_NoDef);

RydxHQ_Done = true;