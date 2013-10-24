
RydHQB_DefDone = false;

_distances = [];

_Trg = leaderHQB;

RydHQB_NearestE = ObjNull;

if (isNil ("RydHQB_Orderfirst")) then {RydHQB_Orderfirst = true;RydHQB_FlankReady = false};

if (RydHQB_NObj == 1) then {RydHQB_Obj = RydHQB_Obj1};
if (RydHQB_NObj == 2) then {RydHQB_Obj = RydHQB_Obj2};
if (RydHQB_NObj == 3) then {RydHQB_Obj = RydHQB_Obj3};
if (RydHQB_NObj >= 4) then {RydHQB_Obj = RydHQB_Obj4};

_Trg = RydHQB_Obj;

_landE = RydHQB_KnEnemiesG - (RydHQB_EnNavalG + RydHQB_EnAirG);
if ((count _landE) > 0) then 
	{

	for [{_a = 0},{_a < (count _landE)},{_a = _a + 1}] do
		{
		_enemy = leader (_landE select _a);
		_distance = leaderHQB distance _enemy;
		_distances = _distances + [_distance];
		};

	RydHQB_NearestE = _landE select 0;

		{
		for [{_r = 0},{_r < (count _distances)},{_r = _r + 1}] do
			{
			_distance = _distances select _r;
			if (isNil ("_distance")) then {_distance = 10000};
			if (_distance <= _x) then {RydHQB_NearestE = _landE select _r};
			if (isNull RydHQB_NearestE) then {RydHQB_NearestE = _landE select 0}
			}
		}
	foreach _distances;

	_Trg = (leader RydHQB_NearestE);
	};
_PosObj1 = position _Trg;
if (isNil ("RydHQB_ReconReserve")) then {RydHQB_ReconReserve = (0.3 * (0.5 + RydHQB_Circumspection))};

RydHQB_ReconAv = [];
_onlyL = RydHQB_LArmorG - RydHQB_MArmorG;

	{
	if not (isNull _x) then
		{
		_unitvar = str _x;
		if (RydHQB_Orderfirst) then {_x setVariable ["Nominal" + _unitvar,(count (units _x))]};
		_busy = false;
		_busy = _x getvariable ("Busy" + _unitvar);
		if (isNil ("_busy")) then {_busy = false};
		_vehready = true;
		_solready = true;
		_effective = true;
		_ammo = true;
		_Gdamage = 0;
			{
			_Gdamage = _Gdamage + (damage _x);
			 if ((count (magazines _x)) == 0) exitWith {_ammo = false};
			//_ammo = _ammo + (count (magazines _x));
			if (((damage _x) > 0.5) or not (canStand _x)) exitWith {_effective = false};
			}
		foreach (units _x);
		_nominal = _x getVariable ("Nominal" + (str _x));if (isNil "_nominal") then {_x setVariable ["Nominal" + _unitvar,(count (units _x))];_nominal = _x getVariable ("Nominal" + (str _x))};
		_current = count (units _x);
		_Gdamage = _Gdamage + (_nominal - _current);

		if (((_Gdamage/(_current + 0.1)) > (0.4*((RydHQB_Recklessness/1.2) + 1))) or not (_effective) or not (_ammo)) then 
			{
			_solready = false;
			if not (_ammo) then
				{
				_x setVariable ["LackAmmo",true]
				}
			};

		_ammo = 0;
		_veh = ObjNull;

			{
			_veh = assignedvehicle _x;
			if (not (isNull _veh) and (not (canMove _veh) or ((fuel _veh) <= 0.1) or ((damage _veh) > 0.5) or (((group _x) in ((RydHQB_AirG - (RydHQB_NCAirG + RydHQB_RAirG)) + (RydHQB_HArmorG + RydHQB_LArmorG + (RydHQB_CarsG - (RydHQB_NCCargoG + RydHQB_SupportG))))) and ((count (magazines _veh)) == 0)))) exitwith {_vehready = false};
			}
		foreach (units _x);

		if (not (_x in (RydHQB_ReconAv + RydHQB_SpecForG)) and not (_busy) and (_vehready) and ((_solready) or (_x in RydHQB_RAirG))) then {RydHQB_ReconAv set [(count RydHQB_ReconAv),_x]};
		}
	}
foreach ((RydHQB_RAirG + RydHQB_ReconG + RydHQB_FOG + RydHQB_SnipersG + RydHQB_NCrewInfG - (RydHQB_SupportG + RydHQB_NCCargoG) + _onlyL) - (RydHQB_AOnly + RydHQB_CargoOnly));

RydHQB_ReconAv = [RydHQB_ReconAv] call RYD_RandomOrd;

if (RydHQB_ReconReserve > 0) then 
	{
	_forRRes = (RydHQB_ReconAv - RydHQB_RAirG);
	for [{_b = 0},{_b < (floor ((count _forRRes)*RydHQB_ReconReserve))},{_b = _b + 1}] do
		{
		_RRp = _forRRes select _b;
		RydHQB_ReconAv = RydHQB_ReconAv - [_RRp];
		}
	};

RydHQB_AttackAv = [];
RydHQB_FlankAv = [];

if (isNil ("RydHQB_Exhausted")) then {RydHQB_Exhausted = []};
//if (isNil ("RydHQB_FlankAv")) then {RydHQB_FlankAv = []};

if (isNil ("RydHQB_AttackReserve")) then {RydHQB_AttackReserve = (0.5 * (0.5 + (RydHQB_Circumspection/1.5)))};

	{
	if not (isNull _x) then
		{
		_unitvar = str _x;
		if (RydHQB_Orderfirst) then {_x setVariable [("Nominal" + _unitvar),(count (units _x))]};
		_busy = false;
		_busy = _x getvariable ("Busy" + _unitvar);
		if (isNil ("_busy")) then {_busy = false};
		_vehready = true;
		_solready = true;
		_effective = true;
		_ammo = true;
		_Gdamage = 0;
			{
			_Gdamage = _Gdamage + (damage _x);
			if ((count (magazines _x)) == 0) exitWith {_ammo = false};
			if (((damage _x) > 0.5) or not (canStand _x)) exitWith {_effective = false};
			}
		foreach (units _x);
		_nominal = _x getVariable ("Nominal" + (str _x));if (isNil "_nominal") then {_x setVariable ["Nominal" + _unitvar,(count (units _x))];_nominal = _x getVariable ("Nominal" + (str _x))};
		_current = count (units _x);
		_Gdamage = _Gdamage + (_nominal - _current);
		if (((_Gdamage/(_current + 0.1)) > (0.4*((RydHQB_Recklessness/1.2) + 1))) or not (_effective) or not (_ammo)) then {_solready = false};
		_ammo = 0;

			{
			_veh = assignedvehicle _x;
			if (not (isNull _veh) and (not (canMove _veh) or ((fuel _veh) <= 0.1) or ((damage _veh) > 0.5) or (((group _x) in ((RydHQB_AirG - RydHQB_NCAirG) + (RydHQB_HArmorG + RydHQB_LArmorG + (RydHQB_CarsG - (RydHQB_NCCargoG + RydHQB_SupportG))))) and ((count (magazines _veh)) == 0)))) exitwith {_vehready = false};
			}
		foreach (units _x);
		
		if (not (_x in RydHQB_AttackAv) and not (_busy) and not (_x in RydHQB_FlankAv) and (_vehready) and (_solready) and not (_x in (RydHQB_StaticG + RydHQB_ArtG + RydHQB_NavalG + RydHQB_SpecForG + RydHQB_CargoOnly))) then {RydHQB_AttackAv set [(count RydHQB_AttackAv),_x]};
		if (not (_x in RydHQB_Exhausted) and (not (_vehready) or not (_solready))) then {RydHQB_Exhausted = RydHQB_Exhausted + [_x]};
	 
		if ((RydHQB_Withdraw > 0) and not (_x in (RydHQB_SpecForG + RydHQB_SnipersG))) then
			{
			_inD = _x getVariable "NearE";
			if (isNil "_inD") then {_inD = 0};
			if (not (_x in RydHQB_Exhausted) and ((random (2 + RydHQB_Recklessness)) < (_inD * RydHQB_Withdraw))) then {RydHQB_Exhausted set [(count RydHQB_Exhausted),_x]}; 
			};
		}
	}
foreach ((RydHQB_Friends - (RydHQB_reconG + RydHQB_FOG + (RydHQB_NCCargoG - RydHQB_NCrewInfG) + RydHQB_SupportG)) - RydHQB_ROnly);
RydHQB_AttackAv = [RydHQB_AttackAv] call RYD_RandomOrd;
if (RydHQB_AttackReserve > 0) then 
	{
	for [{_g = 0},{_g < floor ((count RydHQB_AttackAv)*RydHQB_AttackReserve)},{_g = _g + 1}] do
		{
		_ResC = RydHQB_AttackAv select _g;
		if not (_ResC in RydHQB_FirstToFight) then 
			{
			RydHQB_AttackAv = RydHQB_AttackAv - [_ResC];
			if not (RydHQB_FlankingDone) then {if ((random 100 > (30/(0.5 + RydHQB_Fineness))) and not (_ResC in RydHQB_FlankAv)) then {RydHQB_FlankAv set [(count RydHQB_FlankAv),_ResC]}}
			};
		}
	};

RydHQB_FlankAv = RydHQB_FlankAv - RydHQB_NoFlank;

if (not (RydHQB_FlankingInit) and not (RydHQB_Order == "DEFEND")) then {[] spawn B_Flanking};

_stages = 3;
if ([] call RYD_isNight) then {_stages = 5};

_rcheckArr = [RydHQB_Garrison,RydHQB_ReconAv,RydHQB_FlankAv,RydHQB_AOnly,RydHQB_Exhausted,RydHQB_NCCargoG,_Trg,RydHQB_NCVeh];

if ((RydHQB_NoRec * (RydHQB_Recklessness + 0.01)) < (random 100)) then 
	{
	if ((count RydHQB_KnEnemiesG) == 0) then
		{
		if (not ((count RydHQB_RAirG) == 0) and ((count RydHQB_ReconAv) > 0) and not (RydHQB_ReconDone) and not (RydHQB_ReconStage > _stages)) then
			{
			_gps = [RydHQB_RAirG,"R",_rcheckArr,20000,true] call RYD_Recon;

				{
				if (RydHQB_ReconStage > _stages) exitWith {};
				RydHQB_ReconStage = RydHQB_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQB_ReconStage] spawn B_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQB_reconG) == 0) and ((count RydHQB_ReconAv) > 0) and not (RydHQB_ReconDone) and not (RydHQB_ReconStage > _stages)) then
			{
			_gps = [RydHQB_ReconG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQB_ReconStage > _stages) exitWith {};
				RydHQB_ReconStage = RydHQB_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQB_ReconStage] spawn B_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQB_FOG) == 0) and ((count RydHQB_ReconAv) > 0) and not (RydHQB_ReconDone) and not (RydHQB_ReconStage > _stages)) then
			{
			_gps = [RydHQB_FOG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQB_ReconStage > _stages) exitWith {};
				RydHQB_ReconStage = RydHQB_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQB_ReconStage] spawn B_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQB_snipersG) == 0) and ((count RydHQB_ReconAv) > 0) and not (RydHQB_ReconDone) and not (RydHQB_ReconStage > _stages)) then
			{
			_gps = [RydHQB_snipersG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQB_ReconStage > _stages) exitWith {};
				RydHQB_ReconStage = RydHQB_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQB_ReconStage] spawn B_GoRecon;
				}
			foreach _gps
			};

		_onlyL = RydHQB_LArmorG - RydHQB_MArmorG;
		if (not ((count _onlyL) == 0) and ((count RydHQB_ReconAv) > 0) and not (RydHQB_ReconDone) and not (RydHQB_ReconStage > _stages)) then
			{
			_gps = [_onlyL,"R",_rcheckArr,20000,false] call RYD_Recon;

				{
				if (RydHQB_ReconStage > _stages) exitWith {};
				RydHQB_ReconStage = RydHQB_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQB_ReconStage] spawn B_GoRecon;
				}
			foreach _gps
			};

		if (not ((count (RydHQB_NCrewInfG - RydHQB_SpecForG)) == 0) and ((count RydHQB_ReconAv) > 0) and not (RydHQB_ReconDone) and not (RydHQB_ReconStage > _stages)) then
			{
			_gps = [(RydHQB_NCrewInfG - RydHQB_SpecForG),"NR",_rcheckArr,10000,false] call RYD_Recon;

				{
				if (RydHQB_ReconStage > _stages) exitWith {};
				RydHQB_ReconStage = RydHQB_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQB_ReconStage] spawn B_GoRecon;
				}
			foreach _gps
			};

		_LMCUA = RydHQB_Friends - (RydHQB_NavalG + RydHQB_StaticG + RydHQB_SupportG + RydHQB_ArtG + RydHQB_AOnly + RydHQB_SpecForG + RydHQB_CargoOnly);
		if (not ((count _LMCUA) == 0) and not (RydHQB_ReconDone) and not (RydHQB_ReconStage > _stages)) then
			{
			_gps = [_LMCUA,"NR",_rcheckArr,20000,false] call RYD_Recon;

				{
				if (RydHQB_ReconStage > _stages) exitWith {};
				RydHQB_ReconStage = RydHQB_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQB_ReconStage] spawn B_GoRecon;
				}
			foreach _gps
			}
		}
	}
else
	{
	RydHQB_ReconDone = true
	};

if (isNil ("RydHQB_IdleOrd")) then {RydHQB_IdleOrd = true};

_reserve = RydHQB_Friends - (RydHQB_SpecForG + RydHQB_CargoOnly + RydHQB_AOnly + RydHQB_ROnly + RydHQB_Exhausted + RydHQB_ArtG + RydHQB_AirG + RydHQB_NavalG + RydHQB_StaticG + RydHQB_SupportG + (RydHQB_NCCargoG - (RydHQB_NCrewInfG + RydHQB_SupportG)));
if (not (RydHQB_ReconDone) and ((count RydHQB_KnEnemies) == 0)) exitwith 
	{
	if (RydHQB_Orderfirst) then 
		{
		RydHQB_Orderfirst = false
		};

		{
		_recvar = str _x;
		_resting = false;
		_resting = _x getvariable ("Resting" + _recvar);
		if (isNil ("_resting")) then {_resting = false};
		if not (_resting) then {[_x] spawn B_GoRest }
		}
	foreach (RydHQB_Exhausted - (RydHQB_AirG + RydHQB_StaticG + RydHQB_ArtG + RydHQB_NavalG));

	if (RydHQB_IdleOrd) then
		{
			{
			_recvar = str _x;
			_busy = false;
			_deployed = false;
			_capturing = false;
			_capturing = _x getVariable ("Capt" + _recvar);
			if (isNil ("_capturing")) then {_capturing = false};
			_deployed = _x getvariable ("Deployed" + _recvar);
			_busy = _x getvariable ("Busy" + _recvar);
			if (isNil ("_busy")) then {_busy = false};
			if (isNil ("_deployed")) then {_deployed = false};
			if (not (_busy) and ((count (waypoints _x)) <= 1) and not (_deployed) and not (_capturing) and (not (_x in RydHQB_NCCargoG) or ((count (units _x)) > 1))) then {deleteWaypoint ((waypoints _x) select 0);[_x] spawn B_GoIdle }
			}
		foreach _reserve;
		};

	RydxHQ_Done = true;
	};

RydHQB_FlankReady = true;

_reconthreat = [];
_FOthreat = [];
_snipersthreat = [];
_ATinfthreat = [];
_AAinfthreat = [];
_Infthreat = [];
_Artthreat = [];
_HArmorthreat = [];
_LArmorthreat = [];
_LArmorATthreat = [];
_Carsthreat = [];
_Airthreat = [];
_Navalthreat = [];
_Staticthreat = [];
_StaticAAthreat = [];
_StaticATthreat = [];
_Supportthreat = [];
_Cargothreat = [];
_Otherthreat = [];


	{
	_GE = (group _x);
	_GEvar = str _GE;
	_checked = _GE getvariable ("Checked" + _GEvar);
	if (isNil ("_checked")) then {_GE setvariable [("Checked" + _GEvar),false]};
	_checked = false;

	if ((_x in RydHQB_Enrecon) and not (_GE in _reconthreat) and not (_checked)) then {_reconthreat set [(count _reconthreat),_GE]};
	if ((_x in RydHQB_EnFO) and not (_GE in _FOthreat) and not (_checked)) then {_FOthreat set [(count _FOthreat),_GE]};
	if ((_x in RydHQB_Ensnipers) and not (_GE in _snipersthreat) and not (_checked)) then {_snipersthreat set [(count _snipersthreat),_GE]};
	if ((_x in RydHQB_EnATinf) and not (_GE in _ATinfthreat) and not (_checked)) then {_ATinfthreat set [(count _ATinfthreat),_GE]};
	if ((_x in RydHQB_EnAAinf) and not (_GE in _AAinfthreat) and not (_checked)) then {_AAinfthreat set [(count _AAinfthreat),_GE]};
	if ((_x in RydHQB_EnInf) and not (_GE in _Infthreat) and not (_checked)) then {_Infthreat set [(count _Infthreat),_GE]};
	if ((_x in RydHQB_EnArt) and not (_GE in _Artthreat) and not (_checked)) then {_Artthreat set [(count _Artthreat),_GE]};
	if ((_x in RydHQB_EnHArmor) and not (_GE in _LArmorthreat) and not (_checked)) then {_LArmorthreat set [(count _LArmorthreat),_GE]};
	if ((_x in RydHQB_EnLArmor) and not (_GE in _reconthreat) and not (_checked)) then {_reconthreat set [(count _reconthreat),_GE]};
	if ((_x in RydHQB_EnLArmorAT) and not (_GE in _LArmorATthreat) and not (_checked)) then {_LArmorATthreat set [(count _LArmorATthreat),_GE]};
	if ((_x in RydHQB_EnCars) and not (_GE in _Carsthreat) and not (_checked)) then {_Carsthreat set [(count _Carsthreat),_GE]};
	if ((_x in RydHQB_EnAir) and not (_GE in _Airthreat) and not (_checked)) then {_Airthreat set [(count _Airthreat),_GE]};
	if ((_x in RydHQB_EnNaval) and not (_GE in _Navalthreat) and not (_checked)) then {_Navalthreat set [(count _Navalthreat),_GE]};
	if ((_x in RydHQB_EnStatic) and not (_GE in _Staticthreat) and not (_checked)) then {_Staticthreat set [(count _Staticthreat),_GE]};
	if ((_x in RydHQB_EnStaticAA) and not (_GE in _StaticAAthreat) and not (_checked)) then {_StaticAAthreat set [(count _StaticAAthreat),_GE]};
	if ((_x in RydHQB_EnStaticAT) and not (_GE in _StaticATthreat) and not (_checked)) then {_StaticATthreat set [(count _StaticATthreat),_GE]};
	if ((_x in RydHQB_EnSupport) and not (_GE in _Supportthreat) and not (_checked)) then {_Supportthreat set [(count _Supportthreat),_GE]};
	if ((_x in RydHQB_EnCargo) and not (_GE in _Cargothreat) and not (_checked)) then {_Cargothreat set [(count _Cargothreat),_GE]};

	if ((_x in RydHQB_EnInf) and ((vehicle _x) in RydHQB_EnCargo) and not (_x in RydHQB_EnCrew) and not (_GE in _Infthreat) and not (_checked)) then {_Infthreat set [(count _Infthreat),_GE]};

	if ((isNil ("_checked")) or not (_checked)) then {_GE setVariable [("Checked" + _GEvar), true]};
	}
foreach RydHQB_KnEnemies;

RydHQB_AAthreat = (_AAinfthreat + _StaticAAthreat);
RydHQB_ATthreat = (_ATinfthreat + _StaticATthreat + _HArmorthreat + _LArmorATthreat);
RydHQB_Airthreat = _Airthreat;
_reconthreat = _reconthreat - _Airthreat;

_FPool = 
	[
	RydHQB_snipersG,
	RydHQB_NCrewInfG - RydHQB_SpecForG,
	RydHQB_AirG - (RydHQB_NCAirG + RydHQB_NCrewInfG),
	RydHQB_LArmorG,
	RydHQB_HArmorG,
	RydHQB_CarsG - (RydHQB_ATInfG + RydHQB_AAInfG + RydHQB_SupportG + RydHQB_NCCargoG),
	RydHQB_LArmorATG,
	RydHQB_ATInfG,
	RydHQB_AAInfG,
	RydHQB_Recklessness,
	RydHQB_AttackAv,
	RydHQB_Garrison,
	RydHQB_GarrR,
	RydHQB_FlankAv,
	RydHQB_AirG,
	RydHQB_NCVeh
	];

_constant = [RydHQB_AAthreat,RydHQB_ATthreat,_HArmorthreat + _LArmorATthreat,_FPool];

if (count (_reconthreat + _FOthreat + _snipersthreat) > 0) then 
	{
	([_reconthreat + _FOthreat + _snipersthreat,"Recon","B",0,0,0] + _constant) call RYD_Dispatcher;
	};

if (count _ATinfthreat > 0) then 
	{
	([_ATinfthreat,"ATInf","B",0,0,85] + _constant) call RYD_Dispatcher;
	};

if (count _Infthreat > 0) then 
	{
	([_Infthreat,"Inf","B",75,80,85] + _constant) call RYD_Dispatcher;
	};

if (count (_LArmorthreat + _HArmorthreat) > 0) then 
	{
	([_LArmorthreat + _HArmorthreat,"Armor","B",50,0,85] + _constant) call RYD_Dispatcher;
	};

if (count _Carsthreat > 0) then 
	{
	([_Carsthreat,"Cars","B",75,80,85] + _constant) call RYD_Dispatcher;
	};

if (count _Artthreat > 0) then 
	{
	([_Artthreat,"Art","B",70,75,75] + _constant) call RYD_Dispatcher;
	};

if (count _Airthreat > 0) then 
	{
	([_Airthreat,"Air","B",0,0,75] + _constant) call RYD_Dispatcher;
	};

if (count (_Staticthreat - _Artthreat) > 0) then 
	{
	([_Staticthreat - _Artthreat,"Static","B",75,80,85] + _constant) call RYD_Dispatcher;
	};

/////////////////////////////////////////
// Capture Objective

_Trg = RydHQB_Obj;

	{
	_x setVariable [("Capturing" + (str _x)),[0,0]]
	}
foreach ([RydHQB_Obj1,RydHQB_Obj2,RydHQB_Obj3,RydHQB_Obj4] - [RydHQB_Obj]);

if (isNil ("_Trg")) then {_Trg = leaderHQB};

_isAttacked = _Trg getvariable ("Capturing" + (str _Trg));

if (isNil ("_isAttacked")) then {_isAttacked = [0,0]};

_captCount = _isAttacked select 1;
_isAttacked = _isAttacked select 0;
_captLimit = RydHQB_CaptLimit * (1 + (RydHQB_Circumspection/(2 + RydHQB_Recklessness)));
if ((_isAttacked <= 3) or (_captCount < _captLimit)) then
	{	
	if ((not (RydHQB_NObj > 4) and ((random 100) > ((count RydHQB_KnEnemies)*(5/(0.5 + (2*RydHQB_Recklessness))))) and not 
		(RydHQB_Orderfirst) and 
			((random 100) < ((((count RydHQB_Friends)*(0.5 + RydHQB_Recklessness))/(5*(0.5 + count RydHQB_KnEnemiesG)))*((RydHQB_Cyclecount - 5)*2*(1 + RydHQB_Recklessness))))) or
				(((RydHQB_RapidCapt * (RydHQB_Recklessness + 0.01)) > (random 100)) and (RydHQB_NObj <= 4))) then   
		{
		_checked = [];
		_forCapt = RydHQB_NCrewInfG - (RydHQB_SupportG + RydHQB_SpecForG + RydHQB_CargoOnly + RydHQB_Garrison);
		_forCapt = [_forCapt] call RYD_SizeOrd;
		if (not ((count _forCapt) == 0) and ((count RydHQB_AttackAv) > 0)) then
			{
			for [{_m = 500},{_m <= 5000},{_m = _m + 500}] do
				{
				_isAttacked = _Trg getvariable ("Capturing" + (str _Trg));
				if (isNil ("_isAttacked")) then {_isAttacked = [1,0]};
				_captCount = _isAttacked select 1;
				_isAttacked = _isAttacked select 0;
				if ((_isAttacked > 3) and (_captCount >= _captLimit)) exitwith {};

					{
					_isAttacked = _Trg getvariable ("Capturing" + (str _Trg));
					if (isNil ("_isAttacked")) then {_isAttacked = [1,0]};
					_captCount = _isAttacked select 1;
					_isAttacked = _isAttacked select 0;

					if ((_isAttacked > 3) and (_captCount >= _captLimit)) exitwith {};
					if (_x in RydHQB_AttackAv) then
						{
						if (((leader _x) distance _Trg) <= _m) then
							{
							if (not (_x in RydHQB_NCCargoG) or ((count (units _x)) > 1)) then 
								{
								_ammo = [_x,RydHQB_NCVeh] call RYD_AmmoCount;
								if (_ammo > 0) then
									{
									_busy = _x getvariable [("Busy" + (str _x)),false];
									if not (_busy) then
										{
										_x setVariable [("Busy" + (str _x)),true];
										_checked set [(count _checked),_x];
										_groupCount = count (units _x);

										switch (_isAttacked) do
											{
											case (4) : {_Trg setvariable [("Capturing" + (str  _Trg)),[5,_captCount + _groupCount]]};
											case (3) : {_Trg setvariable [("Capturing" + (str  _Trg)),[4,_captCount + _groupCount]]};
											case (2) : {_Trg setvariable [("Capturing" + (str  _Trg)),[3,_captCount + _groupCount]]};
											case (1) : {_Trg setvariable [("Capturing" + (str  _Trg)),[2,_captCount + _groupCount]]};
											case (0) : {_Trg setVariable [("Capturing" + (str  _Trg)),[1,_captCount + _groupCount]]};
											};

										[_x,_isAttacked] spawn B_GoCapture;
										}
									}
								}
							}
						}
					}
				foreach _forCapt;
				_forCapt = _forCapt - _checked
				}
			};

		if ((_isAttacked > 3) and (_captCount >= _captLimit)) exitwith {};

		_LMCU = RydHQB_Friends - ((RydHQB_AirG - RydHQB_NCrewInfG) + RydHQB_SpecForG + RydHQB_CargoOnly + RydHQB_NavalG + RydHQB_StaticG + RydHQB_SupportG + RydHQB_ArtG + RydHQB_Garrison + (RydHQB_NCCargoG - (RydHQB_NCrewInfG - RydHQB_SupportG)));
		_LMCU = [_LMCU] call RYD_SizeOrd;
		if (not ((count _LMCU) == 0) and ((count RydHQB_AttackAv) > 0)) then
			{
			for [{_m = 1000},{_m <= 20000},{_m = _m + 1000}] do
				{
				_isAttacked = _Trg getvariable ("Capturing" + (str _Trg));
				if (isNil ("_isAttacked")) then {_isAttacked = [1,0]};
				_captCount = _isAttacked select 1;
				_isAttacked = _isAttacked select 0;
				if ((_isAttacked > 3) and (_captCount >= _captLimit)) exitwith {};

					{
					_isAttacked = _Trg getvariable ("Capturing" + (str _Trg));
					if (isNil ("_isAttacked")) then {_isAttacked = [1,0]};
					_captCount = _isAttacked select 1;
					_isAttacked = _isAttacked select 0;

					if ((_isAttacked > 3) and (_captCount >= _captLimit)) exitwith {};
					if (_x in RydHQB_AttackAv) then
						{
						if (((leader _x) distance _Trg) <= _m) then
							{
							_ammo = [_x,RydHQB_NCVeh] call RYD_AmmoCount;
							if (_ammo > 0) then
								{
								_busy = _x getvariable [("Busy" + (str _x)),false];
								if not (_busy) then
									{
									_x setVariable [("Busy" + (str _x)),true];
									_checked set [(count _checked),_x];
									_groupCount = count (units _x);

									switch (_isAttacked) do
										{
										case (4) : {_Trg setvariable [("Capturing" + (str  _Trg)),[5,_captCount + _groupCount]]};
										case (3) : {_Trg setvariable [("Capturing" + (str  _Trg)),[4,_captCount + _groupCount]]};
										case (2) : {_Trg setvariable [("Capturing" + (str  _Trg)),[3,_captCount + _groupCount]]};
										case (1) : {_Trg setvariable [("Capturing" + (str  _Trg)),[2,_captCount + _groupCount]]};
										case (0) : {_Trg setVariable [("Capturing" + (str  _Trg)),[1,_captCount + _groupCount]]};
										};

									[_x,_isAttacked] spawn B_GoCapture;
									}
								}
							}
						}
					}
				foreach _LMCU;
				_LMCU = _LMCU - _checked
				}
			}
		}
	};

if (RydHQB_IdleOrd) then
	{
	_reserve = RydHQB_Friends - (RydHQB_SpecForG + RydHQB_CargoOnly + RydHQB_AOnly + RydHQB_ROnly + RydHQB_Exhausted + RydHQB_ArtG + RydHQB_AirG + RydHQB_NavalG + RydHQB_StaticG + (RydHQB_NCCargoG - (RydHQB_NCrewInfG + RydHQB_SupportG)));
		
		{
		_recvar = str _x;
		_busy = false;
		_deployed = false;
		_capturing = false;
		_capturing = _x getVariable ("Capt" + _recvar);
		if (isNil ("_capturing")) then {_capturing = false};
		_deployed = _x getvariable ("Deployed" + _recvar);
		_busy = _x getvariable ("Busy" + _recvar);
		if (isNil ("_busy")) then {_busy = false};
		if (isNil ("_deployed")) then {_deployed = false};
		if (not (_busy) and ((count (waypoints _x)) <= 1) and not (_deployed) and not (_capturing) and (not (_x in RydHQB_NCCargoG) or ((count (units _x)) > 1))) then {deleteWaypoint ((waypoints _x) select 0);[_x] spawn B_GoIdle};
		}
	foreach _reserve
	};

	{
	_recvar = str _x;
	_resting = false;
	_resting = _x getvariable ("Resting" + _recvar);
	if (isNil ("_resting")) then {_resting = false};
	if not (_resting) then {[_x] spawn B_GoRest }
	}
foreach (RydHQB_Exhausted - (RydHQB_AirG + RydHQB_StaticG + RydHQB_ArtG + RydHQB_NavalG));

	{
	_GE = (group _x);
	_GEvar = str _GE;
	_GE setvariable [("Checked" + _GEvar),false];
	}
foreach RydHQB_KnEnemies;

if (RydHQB_Orderfirst) then {RydHQB_Orderfirst = false};

RydxHQ_Done = true;