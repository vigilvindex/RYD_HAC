waitUntil 
	{
	sleep 1;
	(RydHQG_Cyclecount > 1)
	};

while {not (isNull RydHQG)} do
	{
	if (isNil ("RydHQG_ResetNow")) then {RydHQG_ResetNow = false};
	if (isNil ("RydHQG_ResetOnDemand")) then {RydHQG_ResetOnDemand = false};
	if (isNil ("RydHQG_ResetTime")) then {RydHQG_ResetTime = 600};
	if not (RydHQG_ResetOnDemand) then {sleep RydHQG_ResetTime} else {waituntil {sleep 1; (RydHQG_ResetNow)};RydHQG_ResetNow = false};
	_Edistance = false;
	
		{
		if ((_x distance leaderHQG) < 2000) exitwith {_Edistance = true};
		}
	foreach RydHQG_KnEnemies;
	RydHQG_ReconDone = false;
	RydHQG_ReconStage = 1;
	if (_Edistance) then
		{
			{
			_LE = (leader _x);
			_LEvar = str _LE;
			_LE setVariable [("Checked" + _LEvar), false]
			}
		foreach (RydHQG_Enemies - RydHQG_KnEnemiesG)
		};

	RydHQG_DefDone = false;

	if (not (RydHQG_Order == "DEFEND") or ((random 100) > 95)) then 
		{
			{
			_x setVariable ["Defending", false];
			_x setvariable ["SPRTD",0];
			_x setvariable ["Reinforcing",GrpNull];
			}
		foreach RydHQG_Friends
		};

	_trg = leaderHQG;
	if (RydHQG_NObj == 1) then {_trg = RydHQG_Obj};
	if (RydHQG_NObj == 2) then {_trg = RydHQG_Obj2};
	if (RydHQG_NObj == 3) then {_trg = RydHQG_Obj3};
	if (RydHQG_NObj >= 4) then {_trg = RydHQG_Obj4};

	if (isNil ("RydHQG_ObjRadius1")) then {RydHQG_ObjRadius1 = 300};
	if (isNil ("RydHQG_ObjRadius2")) then {RydHQG_ObjRadius2 = 500};

	_mLoss = 10;
	if (leaderHQG in (RydBBa_HQs + RydBBb_HQs)) then {_mLoss = 0};

	_lastObj = RydHQG_NObj;

	_lost = ObjNull;
		{
		_AllV20 = _x nearEntities [["AllVehicles"], RydHQG_ObjRadius1];
		_Civs20 = _x nearEntities [["Civilian"], RydHQG_ObjRadius1];

		_AllV2 = [];

			{
			_AllV2 = _AllV2 + (crew _x)
			}
		foreach _AllV20;

		_Civs20 = _trg nearEntities [["Civilian"],RydHQG_ObjRadius2];

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

		_NearEnemies = leaderHQG countenemy _AllV2;
		_AllV0 = _x nearEntities [["AllVehicles"], RydHQG_ObjRadius2];
		_Civs0 = _x nearEntities [["Civilian"], RydHQG_ObjRadius2];

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

		_NearAllies = leaderHQG countfriendly _AllV;

		if (_x == _trg) then
			{
			_captLimit = RydHQG_CaptLimit * (1 + (RydHQG_Circumspection/(2 + RydHQG_Recklessness)));
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
			foreach RydHQG_Friends;

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
	foreach [RydHQG_Obj1,RydHQG_Obj2,RydHQG_Obj3,RydHQG_Obj4];
	if (isNull _lost)	then {RydHQG_NObj = RydHQG_NObj} else {
		if (_lost == RydHQG_Obj1) then {RydHQG_NObj = 1;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQG_Obj1,RydHQG_Obj2,RydHQG_Obj3,RydHQG_Obj4])} else {
			if ((_lost == RydHQG_Obj2) and (RydHQG_NObj > 2)) then {RydHQG_NObj = 2;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQG_Obj2,RydHQG_Obj3,RydHQG_Obj4])} else {
				if ((_lost == RydHQG_Obj3) and (RydHQG_NObj > 3)) then {RydHQG_NObj = 3;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQG_Obj3,RydHQG_Obj4])} else {
					if ((_lost == RydHQG_Obj4) and (RydHQG_NObj >= 4)) then {RydHQG_NObj = 4;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQG_Obj4])}}}}};

	if (RydHQG_NObj < 1) then {RydHQG_NObj = 1};
	if (RydHQG_NObj > 5) then {RydHQG_NObj = 5};
	
	RydHQG_Progress = 0;
	if (_lastObj > RydHQG_NObj) then {RydHQG_Progress = -1;RydHQG_Morale = RydHQG_Morale - _mLoss};	
	if (_lastObj < RydHQG_NObj) then {RydHQG_Progress = 1};

	_reserve = RydHQG_Friends - (RydHQG_ArtG + (RydHQG_AirG - RydHQG_SupportG) + RydHQG_NavalG + RydHQG_StaticG + RydHQG_CargoOnly);

		{
		_x setVariable [("Deployed" + (str _x)),false];
		}
	foreach _reserve;

		{
		if ((random 100) > 95) then {_x setVariable [("Garrisoned" + (str _x)),false]};
		}
	foreach RydHQG_Garrison;

	if (isNil ("RydHQG_Combining")) then {RydHQG_Combining = false};
	if (RydHQG_Combining) then 
		{
		_exhausted = +RydHQG_Exhausted;
			{
			if (not (isNull _x) and ((count (units _x)) >= 1)) then 
				{
				_unitvar = str _x;
				_nominal = _x getVariable ("Nominal" + (str _x));if (isNil "_nominal") then {_x setVariable ["Nominal" + _unitvar,(count (units _x))];_nominal = _x getVariable ("Nominal" + (str _x))};
				if (isNil ("_nominal")) then {_x setVariable [("Nominal" + _unitvar),(count (units _x))];_nominal = _x getVariable ("Nominal" + (str _x))};
				_current = count (units _x);
				if (((_nominal/(_current + 0.1)) > 2) and (isNull (assignedVehicle (leader _x)))) then 
					{
					_ex = (RydHQG_Exhausted - [_x]);
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
		foreach RydHQG_Exhausted;
		RydHQG_Exhausted = _exhausted;
		};
	};