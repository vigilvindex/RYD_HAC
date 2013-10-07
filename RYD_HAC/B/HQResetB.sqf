waitUntil 
	{
	sleep 1;
	(RydHQB_Cyclecount > 1)
	};

while {not (isNull RydHQB)} do
	{
	if (isNil ("RydHQB_ResetNow")) then {RydHQB_ResetNow = false};
	if (isNil ("RydHQB_ResetOnDemand")) then {RydHQB_ResetOnDemand = false};
	if (isNil ("RydHQB_ResetTime")) then {RydHQB_ResetTime = 600};
	if not (RydHQB_ResetOnDemand) then {sleep RydHQB_ResetTime} else {waituntil {sleep 1; (RydHQB_ResetNow)};RydHQB_ResetNow = false};
	_Edistance = false;
	
		{
		if ((_x distance leaderHQB) < 2000) exitwith {_Edistance = true};
		}
	foreach RydHQB_KnEnemies;
	RydHQB_ReconDone = false;
	RydHQB_ReconStage = 1;
	if (_Edistance) then
		{
			{
			_LE = (leader _x);
			_LEvar = str _LE;
			_LE setVariable [("Checked" + _LEvar), false]
			}
		foreach (RydHQB_Enemies - RydHQB_KnEnemiesG)
		};

	RydHQB_DefDone = false;

	if (not (RydHQB_Order == "DEFEND") or ((random 100) > 95)) then 
		{
			{
			_x setVariable ["Defending", false];
			_x setvariable ["SPRTD",0];
			_x setvariable ["Reinforcing",GrpNull];
			}
		foreach RydHQB_Friends
		};

	_trg = leaderHQB;
	if (RydHQB_NObj == 1) then {_trg = RydHQB_Obj};
	if (RydHQB_NObj == 2) then {_trg = RydHQB_Obj2};
	if (RydHQB_NObj == 3) then {_trg = RydHQB_Obj3};
	if (RydHQB_NObj >= 4) then {_trg = RydHQB_Obj4};

	if (isNil ("RydHQB_ObjRadius1")) then {RydHQB_ObjRadius1 = 300};
	if (isNil ("RydHQB_ObjRadius2")) then {RydHQB_ObjRadius2 = 500};

	_mLoss = 10;
	if (leaderHQB in (RydBBa_HQs + RydBBb_HQs)) then {_mLoss = 0};

	_lastObj = RydHQB_NObj;

	_lost = ObjNull;
		{
		_AllV20 = _x nearEntities [["AllVehicles"], RydHQB_ObjRadius1];
		_Civs20 = _x nearEntities [["Civilian"], RydHQB_ObjRadius1];

		_AllV2 = [];

			{
			_AllV2 = _AllV2 + (crew _x)
			}
		foreach _AllV20;

		_Civs20 = _trg nearEntities [["Civilian"],RydHQB_ObjRadius2];

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

		_NearEnemies = leaderHQB countenemy _AllV2;
		_AllV0 = _x nearEntities [["AllVehicles"], RydHQB_ObjRadius2];
		_Civs0 = _x nearEntities [["Civilian"], RydHQB_ObjRadius2];

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

		_NearAllies = leaderHQB countfriendly _AllV;

		if (_x == _trg) then
			{
			_captLimit = RydHQB_CaptLimit * (1 + (RydHQB_Circumspection/(2 + RydHQB_Recklessness)));
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
			foreach RydHQB_Friends;

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
	foreach [RydHQB_Obj1,RydHQB_Obj2,RydHQB_Obj3,RydHQB_Obj4];
	if (isNull _lost)	then {RydHQB_NObj = RydHQB_NObj} else {
		if (_lost == RydHQB_Obj1) then {RydHQB_NObj = 1;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQB_Obj1,RydHQB_Obj2,RydHQB_Obj3,RydHQB_Obj4])} else {
			if ((_lost == RydHQB_Obj2) and (RydHQB_NObj > 2)) then {RydHQB_NObj = 2;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQB_Obj2,RydHQB_Obj3,RydHQB_Obj4])} else {
				if ((_lost == RydHQB_Obj3) and (RydHQB_NObj > 3)) then {RydHQB_NObj = 3;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQB_Obj3,RydHQB_Obj4])} else {
					if ((_lost == RydHQB_Obj4) and (RydHQB_NObj >= 4)) then {RydHQB_NObj = 4;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQB_Obj4])}}}}};

	if (RydHQB_NObj < 1) then {RydHQB_NObj = 1};
	if (RydHQB_NObj > 5) then {RydHQB_NObj = 5};
	
	RydHQB_Progress = 0;
	if (_lastObj > RydHQB_NObj) then {RydHQB_Progress = -1;RydHQB_Morale = RydHQB_Morale - _mLoss};	
	if (_lastObj < RydHQB_NObj) then {RydHQB_Progress = 1};

	_reserve = RydHQB_Friends - (RydHQB_ArtG + (RydHQB_AirG - RydHQB_SupportG) + RydHQB_NavalG + RydHQB_StaticG + RydHQB_CargoOnly);

		{
		_x setVariable [("Deployed" + (str _x)),false];
		}
	foreach _reserve;

		{
		if ((random 100) > 95) then {_x setVariable [("Garrisoned" + (str _x)),false]};
		}
	foreach RydHQB_Garrison;

	if (isNil ("RydHQB_Combining")) then {RydHQB_Combining = false};
	if (RydHQB_Combining) then 
		{
		_exhausted = +RydHQB_Exhausted;
			{
			if (not (isNull _x) and ((count (units _x)) >= 1)) then 
				{
				_unitvar = str _x;
				_nominal = _x getVariable ("Nominal" + (str _x));if (isNil "_nominal") then {_x setVariable ["Nominal" + _unitvar,(count (units _x))];_nominal = _x getVariable ("Nominal" + (str _x))};
				if (isNil ("_nominal")) then {_x setVariable [("Nominal" + _unitvar),(count (units _x))];_nominal = _x getVariable ("Nominal" + (str _x))};
				_current = count (units _x);
				if (((_nominal/(_current + 0.1)) > 2) and (isNull (assignedVehicle (leader _x)))) then 
					{
					_ex = (RydHQB_Exhausted - [_x]);
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
		foreach RydHQB_Exhausted;
		RydHQB_Exhausted = _exhausted;
		};
	};