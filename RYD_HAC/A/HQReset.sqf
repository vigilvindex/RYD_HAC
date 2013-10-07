waitUntil 
	{
	sleep 1;
	(RydHQ_Cyclecount > 1)
	};

while {not (isNull RydHQ)} do
	{
	if (isNil ("RydHQ_ResetNow")) then {RydHQ_ResetNow = false};
	if (isNil ("RydHQ_ResetOnDemand")) then {RydHQ_ResetOnDemand = false};
	if (isNil ("RydHQ_ResetTime")) then {RydHQ_ResetTime = 600};
	if not (RydHQ_ResetOnDemand) then {sleep RydHQ_ResetTime} else {waituntil {sleep 1; (RydHQ_ResetNow)};RydHQ_ResetNow = false};
	_Edistance = false;
	
		{
		if ((_x distance leaderHQ) < 2000) exitwith {_Edistance = true};
		}
	foreach RydHQ_KnEnemies;
	RydHQ_ReconDone = false;
	RydHQ_ReconStage = 1;
	if (_Edistance) then
		{
			{
			_LE = (leader _x);
			_LEvar = str _LE;
			_LE setVariable [("Checked" + _LEvar), false]
			}
		foreach (RydHQ_Enemies - RydHQ_KnEnemiesG)
		};

	RydHQ_DefDone = false;

	if (not (RydHQ_Order == "DEFEND") or ((random 100) > 95)) then 
		{
			{
			_x setVariable ["Defending", false];
			_x setvariable ["SPRTD",0];
			_x setvariable ["Reinforcing",GrpNull];
			}
		foreach RydHQ_Friends
		};

	_trg = leaderHQ;
	if (RydHQ_NObj == 1) then {_trg = RydHQ_Obj};
	if (RydHQ_NObj == 2) then {_trg = RydHQ_Obj2};
	if (RydHQ_NObj == 3) then {_trg = RydHQ_Obj3};
	if (RydHQ_NObj >= 4) then {_trg = RydHQ_Obj4};

	if (isNil ("RydHQ_ObjRadius1")) then {RydHQ_ObjRadius1 = 300};
	if (isNil ("RydHQ_ObjRadius2")) then {RydHQ_ObjRadius2 = 500};

	_mLoss = 10;
	if (leaderHQ in (RydBBa_HQs + RydBBb_HQs)) then {_mLoss = 0};

	_lastObj = RydHQ_NObj;

	_lost = ObjNull;
		{
		_AllV20 = _x nearEntities [["AllVehicles"], RydHQ_ObjRadius1];
		_Civs20 = _x nearEntities [["Civilian"], RydHQ_ObjRadius1];

		_AllV2 = [];

			{
			_AllV2 = _AllV2 + (crew _x)
			}
		foreach _AllV20;

		_Civs20 = _trg nearEntities [["Civilian"],RydHQ_ObjRadius2];

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

		_NearEnemies = leaderHQ countenemy _AllV2;
		_AllV0 = _x nearEntities [["AllVehicles"], RydHQ_ObjRadius2];
		_Civs0 = _x nearEntities [["Civilian"], RydHQ_ObjRadius2];

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

		_NearAllies = leaderHQ countfriendly _AllV;

		if (_x == _trg) then
			{
			_captLimit = RydHQ_CaptLimit * (1 + (RydHQ_Circumspection/(2 + RydHQ_Recklessness)));
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
			foreach RydHQ_Friends;

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
	foreach [RydHQ_Obj1,RydHQ_Obj2,RydHQ_Obj3,RydHQ_Obj4];
	if (isNull _lost)	then {RydHQ_NObj = RydHQ_NObj} else {
		if (_lost == RydHQ_Obj1) then {RydHQ_NObj = 1;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQ_Obj1,RydHQ_Obj2,RydHQ_Obj3,RydHQ_Obj4])} else {
			if ((_lost == RydHQ_Obj2) and (RydHQ_NObj > 2)) then {RydHQ_NObj = 2;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQ_Obj2,RydHQ_Obj3,RydHQ_Obj4])} else {
				if ((_lost == RydHQ_Obj3) and (RydHQ_NObj > 3)) then {RydHQ_NObj = 3;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQ_Obj3,RydHQ_Obj4])} else {
					if ((_lost == RydHQ_Obj4) and (RydHQ_NObj >= 4)) then {RydHQ_NObj = 4;{_x setVariable [("Capturing" + (str _x)),[0,0]]}foreach ([RydHQ_Obj4])}}}}};

	if (RydHQ_NObj < 1) then {RydHQ_NObj = 1};
	if (RydHQ_NObj > 5) then {RydHQ_NObj = 5};
	
	RydHQ_Progress = 0;
	if (_lastObj > RydHQ_NObj) then {RydHQ_Progress = -1;RydHQ_Morale = RydHQ_Morale - _mLoss};	
	if (_lastObj < RydHQ_NObj) then {RydHQ_Progress = 1};

	_reserve = RydHQ_Friends - (RydHQ_ArtG + (RydHQ_AirG - RydHQ_SupportG) + RydHQ_NavalG + RydHQ_StaticG + RydHQ_CargoOnly);

		{
		_x setVariable [("Deployed" + (str _x)),false];
		}
	foreach _reserve;

		{
		if ((random 100) > 95) then {_x setVariable [("Garrisoned" + (str _x)),false]};
		}
	foreach RydHQ_Garrison;

	if (isNil ("RydHQ_Combining")) then {RydHQ_Combining = false};
	if (RydHQ_Combining) then 
		{
		_exhausted = +RydHQ_Exhausted;
			{
			if (not (isNull _x) and ((count (units _x)) >= 1)) then 
				{
				_unitvar = str _x;
				_nominal = _x getVariable ("Nominal" + (str _x));if (isNil "_nominal") then {_x setVariable ["Nominal" + _unitvar,(count (units _x))];_nominal = _x getVariable ("Nominal" + (str _x))};
				if (isNil ("_nominal")) then {_x setVariable [("Nominal" + _unitvar),(count (units _x))];_nominal = _x getVariable ("Nominal" + (str _x))};
				_current = count (units _x);
				if (((_nominal/(_current + 0.1)) > 2) and (isNull (assignedVehicle (leader _x)))) then 
					{
					_ex = (RydHQ_Exhausted - [_x]);
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
		foreach RydHQ_Exhausted;
		RydHQ_Exhausted = _exhausted;
		};
	};