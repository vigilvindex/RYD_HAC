waitUntil 
	{
	sleep 1;
	(RydHQE_Cyclecount > 1)
	};

while {not (isNull RydHQE)} do
	{
	if (isNil ("RydHQE_ResetNow")) then {RydHQE_ResetNow = false};
	if (isNil ("RydHQE_ResetOnDemand")) then {RydHQE_ResetOnDemand = false};
	if (isNil ("RydHQE_ResetTime")) then {RydHQE_ResetTime = 600};
	if not (RydHQE_ResetOnDemand) then {sleep RydHQE_ResetTime} else {waituntil {sleep 1; (RydHQE_ResetNow)};RydHQE_ResetNow = false};
	_Edistance = false;
	
		{
		if ((_x distance leaderHQE) < 2000) exitwith {_Edistance = true};
		}
	foreach RydHQE_KnEnemies;
	RydHQE_ReconDone = false;
	RydHQE_ReconStage = 1;
	if (_Edistance) then
		{
			{
			_LE = (leader _x);
			_LEvar = str _LE;
			_LE setVariable [("Checked" + _LEvar), false]
			}
		foreach (RydHQE_Enemies - RydHQE_KnEnemiesG)
		};

	RydHQE_DefDone = false;

	if (not (RydHQE_Order == "DEFEND") or ((random 100) > 95)) then 
		{
			{
			_x setVariable ["Defending", false];
			_x setvariable ["SPRTD",0];
			_x setvariable ["Reinforcing",GrpNull];
			}
		foreach RydHQE_Friends
		};

	_trg = leaderHQE;
	if (RydHQE_NObj == 1) then {_trg = RydHQE_Obj};
	if (RydHQE_NObj == 2) then {_trg = RydHQE_Obj2};
	if (RydHQE_NObj == 3) then {_trg = RydHQE_Obj3};
	if (RydHQE_NObj >= 4) then {_trg = RydHQE_Obj4};

	if (isNil ("RydHQE_ObjRadius1")) then {RydHQE_ObjRadius1 = 300};
	if (isNil ("RydHQE_ObjRadius2")) then {RydHQE_ObjRadius2 = 500};

	_mLoss = 10;
	if (leaderHQE in (RydBBa_HQs + RydBBb_HQs)) then {_mLoss = 0};

	_lastObj = RydHQE_NObj;

	_lost = ObjNull;
		{
		_AllV20 = _x nearEntities [["AllVehicles"], RydHQE_ObjRadius1];
		_Civs20 = _x nearEntities [["Civilian"], RydHQE_ObjRadius1];

		_AllV2 = [];

			{
			_AllV2 = _AllV2 + (crew _x)
			}
		foreach _AllV20;

		_Civs20 = _trg nearEntities [["Civilian"],RydHQE_ObjRadius2];

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

		_NearEnemies = leaderHQE countenemy _AllV2;
		_AllV0 = _x nearEntities [["AllVehicles"], RydHQE_ObjRadius2];
		_Civs0 = _x nearEntities [["Civilian"], RydHQE_ObjRadius2];

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

		_NearAllies = leaderHQE countfriendly _AllV;

		if (_x == _trg) then
			{
			_captLimit = RydHQE_CaptLimit * (1 + (RydHQE_Circumspection/(2 + RydHQE_Recklessness)));
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
			foreach RydHQE_Friends;

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
	foreach [RydHQE_Obj1,RydHQE_Obj2,RydHQE_Obj3,RydHQE_Obj4];
	if (isNull _lost)	then {RydHQE_NObj = RydHQE_NObj} else {
		if (_lost == RydHQE_Obj1) then {RydHQE_NObj = 1;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQE_Obj1,RydHQE_Obj2,RydHQE_Obj3,RydHQE_Obj4])} else {
			if ((_lost == RydHQE_Obj2) and (RydHQE_NObj > 2)) then {RydHQE_NObj = 2;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQE_Obj2,RydHQE_Obj3,RydHQE_Obj4])} else {
				if ((_lost == RydHQE_Obj3) and (RydHQE_NObj > 3)) then {RydHQE_NObj = 3;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQE_Obj3,RydHQE_Obj4])} else {
					if ((_lost == RydHQE_Obj4) and (RydHQE_NObj >= 4)) then {RydHQE_NObj = 4;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQE_Obj4])}}}}};

	if (RydHQE_NObj < 1) then {RydHQE_NObj = 1};
	if (RydHQE_NObj > 5) then {RydHQE_NObj = 5};
	
	RydHQE_Progress = 0;
	if (_lastObj > RydHQE_NObj) then {RydHQE_Progress = -1;RydHQE_Morale = RydHQE_Morale - _mLoss};	
	if (_lastObj < RydHQE_NObj) then {RydHQE_Progress = 1};

	_reserve = RydHQE_Friends - (RydHQE_ArtG + (RydHQE_AirG - RydHQE_SupportG) + RydHQE_NavalG + RydHQE_StaticG + RydHQE_CargoOnly);

		{
		_x setVariable [("Deployed" + (str _x)),false];
		}
	foreach _reserve;

		{
		if ((random 100) > 95) then {_x setVariable [("Garrisoned" + (str _x)),false]};
		}
	foreach RydHQE_Garrison;

	if (isNil ("RydHQE_Combining")) then {RydHQE_Combining = false};
	if (RydHQE_Combining) then 
		{
		_exhausted = +RydHQE_Exhausted;
			{
			if (not (isNull _x) and ((count (units _x)) >= 1)) then 
				{
				_unitvar = str _x;
				_nominal = _x getVariable ("Nominal" + (str _x));
				if (isNil ("_nominal")) then {_x setVariable [("Nominal" + _unitvar),(count (units _x)),true];_nominal = _x getVariable ("Nominal" + (str _x))};
				_current = count (units _x);
				if (((_nominal/(_current + 0.1)) > 2) and (isNull (assignedVehicle (leader _x)))) then 
					{
					_ex = (RydHQE_Exhausted - [_x]);
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
		foreach RydHQE_Exhausted;
		RydHQE_Exhausted = _exhausted;
		};
	};