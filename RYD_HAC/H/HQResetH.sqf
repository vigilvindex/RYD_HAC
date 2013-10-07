waitUntil 
	{
	sleep 1;
	(RydHQH_Cyclecount > 1)
	};

while {not (isNull RydHQH)} do
	{
	if (isNil ("RydHQH_ResetNow")) then {RydHQH_ResetNow = false};
	if (isNil ("RydHQH_ResetOnDemand")) then {RydHQH_ResetOnDemand = false};
	if (isNil ("RydHQH_ResetTime")) then {RydHQH_ResetTime = 600};
	if not (RydHQH_ResetOnDemand) then {sleep RydHQH_ResetTime} else {waituntil {sleep 1; (RydHQH_ResetNow)};RydHQH_ResetNow = false};
	_Edistance = false;
	
		{
		if ((_x distance leaderHQH) < 2000) exitwith {_Edistance = true};
		}
	foreach RydHQH_KnEnemies;
	RydHQH_ReconDone = false;
	RydHQH_ReconStage = 1;
	if (_Edistance) then
		{
			{
			_LE = (leader _x);
			_LEvar = str _LE;
			_LE setVariable [("Checked" + _LEvar), false]
			}
		foreach (RydHQH_Enemies - RydHQH_KnEnemiesG)
		};

	RydHQH_DefDone = false;

	if (not (RydHQH_Order == "DEFEND") or ((random 100) > 95)) then 
		{
			{
			_x setVariable ["Defending", false];
			_x setvariable ["SPRTD",0];
			_x setvariable ["Reinforcing",GrpNull];
			}
		foreach RydHQH_Friends
		};

	_trg = leaderHQH;
	if (RydHQH_NObj == 1) then {_trg = RydHQH_Obj};
	if (RydHQH_NObj == 2) then {_trg = RydHQH_Obj2};
	if (RydHQH_NObj == 3) then {_trg = RydHQH_Obj3};
	if (RydHQH_NObj >= 4) then {_trg = RydHQH_Obj4};

	if (isNil ("RydHQH_ObjRadius1")) then {RydHQH_ObjRadius1 = 300};
	if (isNil ("RydHQH_ObjRadius2")) then {RydHQH_ObjRadius2 = 500};

	_mLoss = 10;
	if (leaderHQH in (RydBBa_HQs + RydBBb_HQs)) then {_mLoss = 0};

	_lastObj = RydHQH_NObj;

	_lost = ObjNull;
		{
		_AllV20 = _x nearEntities [["AllVehicles"], RydHQH_ObjRadius1];
		_Civs20 = _x nearEntities [["Civilian"], RydHQH_ObjRadius1];

		_AllV2 = [];

			{
			_AllV2 = _AllV2 + (crew _x)
			}
		foreach _AllV20;

		_Civs20 = _trg nearEntities [["Civilian"],RydHQH_ObjRadius2];

		_Civs2 = [];

			{
			_Civs2 = _Civs2 + (crew _x)
			}
		foreach _Civs20;

		_AllV2 = _AllV2 - _Civs2;

		_AllV20 = +_AllV2;

			{
			if not (_x isKindOf "Man") then
				{
				if ((count (crew _x)) == 0) then {_AllV2 = _AllV2 - [_x]}
				}
			}
		foreach _AllV20;

		_NearEnemies = leaderHQH countenemy _AllV2;
		_AllV0 = _x nearEntities [["AllVehicles"], RydHQH_ObjRadius2];
		_Civs0 = _x nearEntities [["Civilian"], RydHQH_ObjRadius2];

		_AllV = [];

			{
			_AllV = _AllV + (crew _x)
			}
		foreach _AllV0;

		_Civs = [];

			{
			_Civs = _Civs + (crew _x)
			}
		foreach _Civs0;

		_AllV = _AllV - _Civs;
		_AllV0 = +_AllV;

			{
			if not (_x isKindOf "Man") then
				{
				if ((count (crew _x)) == 0) then {_AllV = _AllV - [_x]}
				}
			}
		foreach _AllV0;

		_NearAllies = leaderHQH countfriendly _AllV;

		if (_x == _trg) then
			{
			_captLimit = RydHQH_CaptLimit * (1 + (RydHQH_Circumspection/(2 + RydHQH_Recklessness)));
			_enRoute = 0;

				{
				if not (isNull _x) then
					{
					if (_x getVariable [("Capt" + (str _x)),false]) then
						{
						_enRoute = _enRoute + (count (units _x))
						}
					}
				}
			foreach RydHQH_Friends;

			_captDiff = _captLimit - _enRoute;

			if (_captDiff > 0) then
				{	
				_isC = _trg getVariable ("Capturing" + (str _trg));if (isNil "_isC") then {_isC = [0,0]};

				_amountC = _isC select 1;
				_isC = _isC select 0;
				if (_isC > 3) then {_isC = 3};
				_trg setVariable [("Capturing" + (str _trg)),[_isC,_amountC - _captDiff]];
				}
			};

		if (_NearEnemies > _NearAllies) exitwith {_lost = _x};
		}
	foreach [RydHQH_Obj1,RydHQH_Obj2,RydHQH_Obj3,RydHQH_Obj4];
	if (isNull _lost)	then {RydHQH_NObj = RydHQH_NObj} else {
		if (_lost == RydHQH_Obj1) then {RydHQH_NObj = 1;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQH_Obj1,RydHQH_Obj2,RydHQH_Obj3,RydHQH_Obj4])} else {
			if ((_lost == RydHQH_Obj2) and (RydHQH_NObj > 2)) then {RydHQH_NObj = 2;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQH_Obj2,RydHQH_Obj3,RydHQH_Obj4])} else {
				if ((_lost == RydHQH_Obj3) and (RydHQH_NObj > 3)) then {RydHQH_NObj = 3;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQH_Obj3,RydHQH_Obj4])} else {
					if ((_lost == RydHQH_Obj4) and (RydHQH_NObj >= 4)) then {RydHQH_NObj = 4;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQH_Obj4])}}}}};

	if (RydHQH_NObj < 1) then {RydHQH_NObj = 1};
	if (RydHQH_NObj > 5) then {RydHQH_NObj = 5};
	
	RydHQH_Progress = 0;
	if (_lastObj > RydHQH_NObj) then {RydHQH_Progress = -1;RydHQH_Morale = RydHQH_Morale - _mLoss};	
	if (_lastObj < RydHQH_NObj) then {RydHQH_Progress = 1};

	_reserve = RydHQH_Friends - (RydHQH_ArtG + (RydHQH_AirG - RydHQH_SupportG) + RydHQH_NavalG + RydHQH_StaticG + RydHQH_CargoOnly);

		{
		_x setVariable [("Deployed" + (str _x)),false];
		}
	foreach _reserve;

		{
		if ((random 100) > 95) then {_x setVariable [("Garrisoned" + (str _x)),false]};
		}
	foreach RydHQH_Garrison;

	if (isNil ("RydHQH_Combining")) then {RydHQH_Combining = false};
	if (RydHQH_Combining) then 
		{
		_exhausted = +RydHQH_Exhausted;
			{
			if (not (isNull _x) and ((count (units _x)) >= 1)) then 
				{
				_unitvar = str _x;
				_nominal = _x getVariable ("Nominal" + (str _x));if (isNil "_nominal") then {_x setVariable ["Nominal" + _unitvar,(count (units _x))];_nominal = _x getVariable ("Nominal" + (str _x))};
				if (isNil ("_nominal")) then {_x setVariable [("Nominal" + _unitvar),(count (units _x))];_nominal = _x getVariable ("Nominal" + (str _x))};
				_current = count (units _x);
				if (((_nominal/(_current + 0.1)) > 2) and (isNull (assignedVehicle (leader _x)))) then 
					{
					_ex = (RydHQH_Exhausted - [_x]);
					for [{_a = 0},{(_a < (count _ex))},{_a = _a + 1}] do
						{
						_Aex = _ex select _a;
						_unitvarA = str _Aex;
						_nominalA = _Aex getVariable ("Nominal" + (str _Aex));
						if (isNil ("_nominal")) then {_Aex setVariable [("Nominal" + _unitvarA),(count (units _Aex)),true];_nominalA = _Aex getVariable ("Nominal" + (str _Aex))};
						_currentA = count (units _Aex);
						if (((_nominalA/(_currentA + 0.1)) > 2) and (isNull (assignedVehicle (leader _Aex))) and (((vehicle (leader _x)) distance (vehicle (leader _Aex))) < 200)) then 
							{
							(units _x) joinsilent _Aex;
							sleep 0.05;
							_Aex setVariable [("Nominal" + (str _Aex)),(count (units _Aex)),true];
							};
						};
					};
				}
			else
				{
				_exhausted = _exhausted - [_x]
				};
			}
		foreach RydHQH_Exhausted;
		RydHQH_Exhausted = _exhausted;
		};
	};