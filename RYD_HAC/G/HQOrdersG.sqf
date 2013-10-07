
RydHQG_DefDone = false;

_distances = [];

_Trg = leaderHQG;

RydHQG_NearestE = ObjNull;

if (isNil ("RydHQG_Orderfirst")) then {RydHQG_Orderfirst = true;RydHQG_FlankReady = false};

if (RydHQG_NObj == 1) then {RydHQG_Obj = RydHQG_Obj1};
if (RydHQG_NObj == 2) then {RydHQG_Obj = RydHQG_Obj2};
if (RydHQG_NObj == 3) then {RydHQG_Obj = RydHQG_Obj3};
if (RydHQG_NObj >= 4) then {RydHQG_Obj = RydHQG_Obj4};

_Trg = RydHQG_Obj;

_landE = RydHQG_KnEnemiesG - (RydHQG_EnNavalG + RydHQG_EnAirG);
if ((count _landE) > 0) then 
	{

	for [{_a = 0},{_a < (count _landE)},{_a = _a + 1}] do
		{
		_enemy = leader (_landE select _a);
		_distance = leaderHQG distance _enemy;
		_distances = _distances + [_distance];
		};

	RydHQG_NearestE = _landE select 0;

		{
		for [{_r = 0},{_r < (count _distances)},{_r = _r + 1}] do
			{
			_distance = _distances select _r;
			if (isNil ("_distance")) then {_distance = 10000};
			if (_distance <= _x) then {RydHQG_NearestE = _landE select _r};
			if (isNull RydHQG_NearestE) then {RydHQG_NearestE = _landE select 0}
			}
		}
	foreach _distances;

	_Trg = (leader RydHQG_NearestE);
	};
_PosObj1 = position _Trg;
if (isNil ("RydHQG_ReconReserve")) then {RydHQG_ReconReserve = (0.3 * (0.5 + RydHQG_Circumspection))};

RydHQG_ReconAv = [];
_onlyL = RydHQG_LArmorG - RydHQG_MArmorG;

	{
	_unitvar = str _x;
	if (RydHQG_Orderfirst) then {_x setVariable ["Nominal" + _unitvar,(count (units _x))]};
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

	if (((_Gdamage/(_current + 0.1)) > (0.4*((RydHQG_Recklessness/1.2) + 1))) or not (_effective) or not (_ammo)) then 
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
		if (not (isNull _veh) and (not (canMove _veh) or ((fuel _veh) <= 0.1) or ((damage _veh) > 0.5) or (((group _x) in ((RydHQG_AirG - (RydHQG_NCAirG + RydHQG_RAirG)) + (RydHQG_HArmorG + RydHQG_LArmorG + (RydHQG_CarsG - (RydHQG_NCCargoG + RydHQG_SupportG))))) and ((count (magazines _veh)) == 0)))) exitwith {_vehready = false};
		}
	foreach (units _x);

	if (not (_x in (RydHQG_ReconAv + RydHQG_SpecForG)) and not (_busy) and (_vehready) and ((_solready) or (_x in RydHQG_RAirG))) then {RydHQG_ReconAv set [(count RydHQG_ReconAv),_x]};
	}
foreach ((RydHQG_RAirG + RydHQG_ReconG + RydHQG_FOG + RydHQG_SnipersG + RydHQG_NCrewInfG - (RydHQG_SupportG + RydHQG_NCCargoG) + _onlyL) - (RydHQG_AOnly + RydHQG_CargoOnly));

RydHQG_ReconAv = [RydHQG_ReconAv] call RYD_RandomOrd;

if (RydHQG_ReconReserve > 0) then 
	{
	_forRRes = (RydHQG_ReconAv - RydHQG_RAirG);
	for [{_b = 0},{_b < (floor ((count _forRRes)*RydHQG_ReconReserve))},{_b = _b + 1}] do
		{
		_RRp = _forRRes select _b;
		RydHQG_ReconAv = RydHQG_ReconAv - [_RRp];
		}
	};

RydHQG_AttackAv = [];
RydHQG_FlankAv = [];

if (isNil ("RydHQG_Exhausted")) then {RydHQG_Exhausted = []};
//if (isNil ("RydHQG_FlankAv")) then {RydHQG_FlankAv = []};

if (isNil ("RydHQG_AttackReserve")) then {RydHQG_AttackReserve = (0.5 * (0.5 + (RydHQG_Circumspection/1.5)))};

	{
	_unitvar = str _x;
	if (RydHQG_Orderfirst) then {_x setVariable [("Nominal" + _unitvar),(count (units _x))]};
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
	if (((_Gdamage/(_current + 0.1)) > (0.4*((RydHQG_Recklessness/1.2) + 1))) or not (_effective) or not (_ammo)) then {_solready = false};
	_ammo = 0;

		{
		_veh = assignedvehicle _x;
		if (not (isNull _veh) and (not (canMove _veh) or ((fuel _veh) <= 0.1) or ((damage _veh) > 0.5) or (((group _x) in ((RydHQG_AirG - RydHQG_NCAirG) + (RydHQG_HArmorG + RydHQG_LArmorG + (RydHQG_CarsG - (RydHQG_NCCargoG + RydHQG_SupportG))))) and ((count (magazines _veh)) == 0)))) exitwith {_vehready = false};
		}
	foreach (units _x);
	
	if (not (_x in RydHQG_AttackAv) and not (_busy) and not (_x in RydHQG_FlankAv) and (_vehready) and (_solready) and not (_x in (RydHQG_StaticG + RydHQG_ArtG + RydHQG_NavalG + RydHQG_SpecForG + RydHQG_CargoOnly))) then {RydHQG_AttackAv set [(count RydHQG_AttackAv),_x]};
	if (not (_x in RydHQG_Exhausted) and (not (_vehready) or not (_solready))) then {RydHQG_Exhausted = RydHQG_Exhausted + [_x]};
 
	if ((RydHQG_Withdraw > 0) and not (_x in (RydHQG_SpecForG + RydHQG_SnipersG))) then
		{
		_inD = _x getVariable "NearE";
		if (isNil "_inD") then {_inD = 0};
		if (not (_x in RydHQG_Exhausted) and ((random (2 + RydHQG_Recklessness)) < (_inD * RydHQG_Withdraw))) then {RydHQG_Exhausted set [(count RydHQG_Exhausted),_x]}; 
		};
	}
foreach ((RydHQG_Friends - (RydHQG_reconG + RydHQG_FOG + (RydHQG_NCCargoG - RydHQG_NCrewInfG) + RydHQG_SupportG)) - RydHQG_ROnly);
RydHQG_AttackAv = [RydHQG_AttackAv] call RYD_RandomOrd;
if (RydHQG_AttackReserve > 0) then 
	{
	for [{_g = 0},{_g < floor ((count RydHQG_AttackAv)*RydHQG_AttackReserve)},{_g = _g + 1}] do
		{
		_ResC = RydHQG_AttackAv select _g;
		if not (_ResC in RydHQG_FirstToFight) then 
			{
			RydHQG_AttackAv = RydHQG_AttackAv - [_ResC];
			if not (RydHQG_FlankingDone) then {if ((random 100 > (30/(0.5 + RydHQG_Fineness))) and not (_ResC in RydHQG_FlankAv)) then {RydHQG_FlankAv set [(count RydHQG_FlankAv),_ResC]}}
			};
		}
	};

RydHQG_FlankAv = RydHQG_FlankAv - RydHQG_NoFlank;

if (not (RydHQG_FlankingInit) and not (RydHQG_Order == "DEFEND")) then {[] spawn G_Flanking};

_stages = 3;
if ([] call RYD_isNight) then {_stages = 5};

_rcheckArr = [RydHQG_Garrison,RydHQG_ReconAv,RydHQG_FlankAv,RydHQG_AOnly,RydHQG_Exhausted,RydHQG_NCCargoG,_Trg,RydHQG_NCVeh];

if ((RydHQG_NoRec * (RydHQG_Recklessness + 0.01)) < (random 100)) then 
	{
	if ((count RydHQG_KnEnemiesG) == 0) then
		{
		if (not ((count RydHQG_RAirG) == 0) and ((count RydHQG_ReconAv) > 0) and not (RydHQG_ReconDone) and not (RydHQG_ReconStage > _stages)) then
			{
			_gps = [RydHQG_RAirG,"R",_rcheckArr,20000,true] call RYD_Recon;

				{
				if (RydHQG_ReconStage > _stages) exitWith {};
				RydHQG_ReconStage = RydHQG_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQG_ReconStage] spawn G_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQG_reconG) == 0) and ((count RydHQG_ReconAv) > 0) and not (RydHQG_ReconDone) and not (RydHQG_ReconStage > _stages)) then
			{
			_gps = [RydHQG_ReconG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQG_ReconStage > _stages) exitWith {};
				RydHQG_ReconStage = RydHQG_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQG_ReconStage] spawn G_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQG_FOG) == 0) and ((count RydHQG_ReconAv) > 0) and not (RydHQG_ReconDone) and not (RydHQG_ReconStage > _stages)) then
			{
			_gps = [RydHQG_FOG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQG_ReconStage > _stages) exitWith {};
				RydHQG_ReconStage = RydHQG_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQG_ReconStage] spawn G_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQG_snipersG) == 0) and ((count RydHQG_ReconAv) > 0) and not (RydHQG_ReconDone) and not (RydHQG_ReconStage > _stages)) then
			{
			_gps = [RydHQG_snipersG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQG_ReconStage > _stages) exitWith {};
				RydHQG_ReconStage = RydHQG_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQG_ReconStage] spawn G_GoRecon;
				}
			foreach _gps
			};

		_onlyL = RydHQG_LArmorG - RydHQG_MArmorG;
		if (not ((count _onlyL) == 0) and ((count RydHQG_ReconAv) > 0) and not (RydHQG_ReconDone) and not (RydHQG_ReconStage > _stages)) then
			{
			_gps = [_onlyL,"R",_rcheckArr,20000,false] call RYD_Recon;

				{
				if (RydHQG_ReconStage > _stages) exitWith {};
				RydHQG_ReconStage = RydHQG_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQG_ReconStage] spawn G_GoRecon;
				}
			foreach _gps
			};

		if (not ((count (RydHQG_NCrewInfG - RydHQG_SpecForG)) == 0) and ((count RydHQG_ReconAv) > 0) and not (RydHQG_ReconDone) and not (RydHQG_ReconStage > _stages)) then
			{
			_gps = [(RydHQG_NCrewInfG - RydHQG_SpecForG),"NR",_rcheckArr,10000,false] call RYD_Recon;

				{
				if (RydHQG_ReconStage > _stages) exitWith {};
				RydHQG_ReconStage = RydHQG_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQG_ReconStage] spawn G_GoRecon;
				}
			foreach _gps
			};

		_LMCUA = RydHQG_Friends - (RydHQG_NavalG + RydHQG_StaticG + RydHQG_SupportG + RydHQG_ArtG + RydHQG_AOnly + RydHQG_SpecForG + RydHQG_CargoOnly);
		if (not ((count _LMCUA) == 0) and not (RydHQG_ReconDone) and not (RydHQG_ReconStage > _stages)) then
			{
			_gps = [_LMCUA,"NR",_rcheckArr,20000,false] call RYD_Recon;

				{
				if (RydHQG_ReconStage > _stages) exitWith {};
				RydHQG_ReconStage = RydHQG_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQG_ReconStage] spawn G_GoRecon;
				}
			foreach _gps
			}
		}
	}
else
	{
	RydHQG_ReconDone = true
	};

if (isNil ("RydHQG_IdleOrd")) then {RydHQG_IdleOrd = true};

_reserve = RydHQG_Friends - (RydHQG_SpecForG + RydHQG_CargoOnly + RydHQG_AOnly + RydHQG_ROnly + RydHQG_Exhausted + RydHQG_ArtG + RydHQG_AirG + RydHQG_NavalG + RydHQG_StaticG + RydHQG_SupportG + (RydHQG_NCCargoG - (RydHQG_NCrewInfG + RydHQG_SupportG)));
if (not (RydHQG_ReconDone) and ((count RydHQG_KnEnemies) == 0)) exitwith 
	{
	if (RydHQG_Orderfirst) then 
		{
		RydHQG_Orderfirst = false
		};

		{
		_recvar = str _x;
		_resting = false;
		_resting = _x getvariable ("Resting" + _recvar);
		if (isNil ("_resting")) then {_resting = false};
		if not (_resting) then {[_x] spawn G_GoRest }
		}
	foreach (RydHQG_Exhausted - (RydHQG_AirG + RydHQG_StaticG + RydHQG_ArtG + RydHQG_NavalG));

	if (RydHQG_IdleOrd) then
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
			if (not (_busy) and ((count (waypoints _x)) <= 1) and not (_deployed) and not (_capturing) and (not (_x in RydHQG_NCCargoG) or ((count (units _x)) > 1))) then {deleteWaypoint ((waypoints _x) select 0);[_x] spawn G_GoIdle }
			}
		foreach _reserve;
		};

	RydxHQ_Done = true;
	};

RydHQG_FlankReady = true;

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

	if ((_x in RydHQG_Enrecon) and not (_GE in _reconthreat) and not (_checked)) then {_reconthreat set [(count _reconthreat),_GE]};
	if ((_x in RydHQG_EnFO) and not (_GE in _FOthreat) and not (_checked)) then {_FOthreat set [(count _FOthreat),_GE]};
	if ((_x in RydHQG_Ensnipers) and not (_GE in _snipersthreat) and not (_checked)) then {_snipersthreat set [(count _snipersthreat),_GE]};
	if ((_x in RydHQG_EnATinf) and not (_GE in _ATinfthreat) and not (_checked)) then {_ATinfthreat set [(count _ATinfthreat),_GE]};
	if ((_x in RydHQG_EnAAinf) and not (_GE in _AAinfthreat) and not (_checked)) then {_AAinfthreat set [(count _AAinfthreat),_GE]};
	if ((_x in RydHQG_EnInf) and not (_GE in _Infthreat) and not (_checked)) then {_Infthreat set [(count _Infthreat),_GE]};
	if ((_x in RydHQG_EnArt) and not (_GE in _Artthreat) and not (_checked)) then {_Artthreat set [(count _Artthreat),_GE]};
	if ((_x in RydHQG_EnHArmor) and not (_GE in _LArmorthreat) and not (_checked)) then {_LArmorthreat set [(count _LArmorthreat),_GE]};
	if ((_x in RydHQG_EnLArmor) and not (_GE in _reconthreat) and not (_checked)) then {_reconthreat set [(count _reconthreat),_GE]};
	if ((_x in RydHQG_EnLArmorAT) and not (_GE in _LArmorATthreat) and not (_checked)) then {_LArmorATthreat set [(count _LArmorATthreat),_GE]};
	if ((_x in RydHQG_EnCars) and not (_GE in _Carsthreat) and not (_checked)) then {_Carsthreat set [(count _Carsthreat),_GE]};
	if ((_x in RydHQG_EnAir) and not (_GE in _Airthreat) and not (_checked)) then {_Airthreat set [(count _Airthreat),_GE]};
	if ((_x in RydHQG_EnNaval) and not (_GE in _Navalthreat) and not (_checked)) then {_Navalthreat set [(count _Navalthreat),_GE]};
	if ((_x in RydHQG_EnStatic) and not (_GE in _Staticthreat) and not (_checked)) then {_Staticthreat set [(count _Staticthreat),_GE]};
	if ((_x in RydHQG_EnStaticAA) and not (_GE in _StaticAAthreat) and not (_checked)) then {_StaticAAthreat set [(count _StaticAAthreat),_GE]};
	if ((_x in RydHQG_EnStaticAT) and not (_GE in _StaticATthreat) and not (_checked)) then {_StaticATthreat set [(count _StaticATthreat),_GE]};
	if ((_x in RydHQG_EnSupport) and not (_GE in _Supportthreat) and not (_checked)) then {_Supportthreat set [(count _Supportthreat),_GE]};
	if ((_x in RydHQG_EnCargo) and not (_GE in _Cargothreat) and not (_checked)) then {_Cargothreat set [(count _Cargothreat),_GE]};

	if ((_x in RydHQG_EnInf) and ((vehicle _x) in RydHQG_EnCargo) and not (_x in RydHQG_EnCrew) and not (_GE in _Infthreat) and not (_checked)) then {_Infthreat set [(count _Infthreat),_GE]};

	if ((isNil ("_checked")) or not (_checked)) then {_GE setVariable [("Checked" + _GEvar), true]};
	}
foreach RydHQG_KnEnemies;

RydHQG_AAthreat = (_AAinfthreat + _StaticAAthreat);
RydHQG_ATthreat = (_ATinfthreat + _StaticATthreat + _HArmorthreat + _LArmorATthreat);
RydHQG_Airthreat = _Airthreat;
_reconthreat = _reconthreat - _Airthreat;

_FPool = 
	[
	RydHQG_snipersG,
	RydHQG_NCrewInfG - RydHQG_SpecForG,
	RydHQG_AirG - (RydHQG_NCAirG + RydHQG_NCrewInfG),
	RydHQG_LArmorG,
	RydHQG_HArmorG,
	RydHQG_CarsG - (RydHQG_ATInfG + RydHQG_AAInfG + RydHQG_SupportG + RydHQG_NCCargoG),
	RydHQG_LArmorATG,
	RydHQG_ATInfG,
	RydHQG_AAInfG,
	RydHQG_Recklessness,
	RydHQG_AttackAv,
	RydHQG_Garrison,
	RydHQG_GarrR,
	RydHQG_FlankAv,
	RydHQG_AirG,
	RydHQG_NCVeh
	];

_constant = [RydHQG_AAthreat,RydHQG_ATthreat,_HArmorthreat + _LArmorATthreat,_FPool];

if (count (_reconthreat + _FOthreat + _snipersthreat) > 0) then 
	{
	([_reconthreat + _FOthreat + _snipersthreat,"Recon","G",0,0,0] + _constant) call RYD_Dispatcher;
	};

if (count _ATinfthreat > 0) then 
	{
	([_ATinfthreat,"ATInf","G",0,0,85] + _constant) call RYD_Dispatcher;
	};

if (count _Infthreat > 0) then 
	{
	([_Infthreat,"Inf","G",75,80,85] + _constant) call RYD_Dispatcher;
	};

if (count (_LArmorthreat + _HArmorthreat) > 0) then 
	{
	([_LArmorthreat + _HArmorthreat,"Armor","G",50,0,85] + _constant) call RYD_Dispatcher;
	};

if (count _Carsthreat > 0) then 
	{
	([_Carsthreat,"Cars","G",75,80,85] + _constant) call RYD_Dispatcher;
	};

if (count _Artthreat > 0) then 
	{
	([_Artthreat,"Art","G",70,75,75] + _constant) call RYD_Dispatcher;
	};

if (count _Airthreat > 0) then 
	{
	([_Airthreat,"Air","G",0,0,75] + _constant) call RYD_Dispatcher;
	};

if (count (_Staticthreat - _Artthreat) > 0) then 
	{
	([_Staticthreat - _Artthreat,"Static","G",75,80,85] + _constant) call RYD_Dispatcher;
	};

/////////////////////////////////////////
// Capture Objective

_Trg = RydHQG_Obj;

	{
	_x setVariable [("Capturing" + (str _x)),[0,0]]
	}
foreach ([RydHQG_Obj1,RydHQG_Obj2,RydHQG_Obj3,RydHQG_Obj4] - [RydHQG_Obj]);

if (isNil ("_Trg")) then {_Trg = leaderHQG};

_isAttacked = _Trg getvariable ("Capturing" + (str _Trg));

if (isNil ("_isAttacked")) then {_isAttacked = [0,0]};

_captCount = _isAttacked select 1;
_isAttacked = _isAttacked select 0;
_captLimit = RydHQG_CaptLimit * (1 + (RydHQG_Circumspection/(2 + RydHQG_Recklessness)));
if ((_isAttacked <= 3) or (_captCount < _captLimit)) then
	{	
	if ((not (RydHQG_NObj > 4) and ((random 100) > ((count RydHQG_KnEnemies)*(5/(0.5 + (2*RydHQG_Recklessness))))) and not 
		(RydHQG_Orderfirst) and 
			((random 100) < ((((count RydHQG_Friends)*(0.5 + RydHQG_Recklessness))/(5*(0.5 + count RydHQG_KnEnemiesG)))*((RydHQG_Cyclecount - 5)*2*(1 + RydHQG_Recklessness))))) or
				(((RydHQG_RapidCapt * (RydHQG_Recklessness + 0.01)) > (random 100)) and (RydHQG_NObj <= 4))) then   
		{
		_checked = [];
		_forCapt = RydHQG_NCrewInfG - (RydHQG_SupportG + RydHQG_SpecForG + RydHQG_CargoOnly + RydHQG_Garrison);
		_forCapt = [_forCapt] call RYD_SizeOrd;
		if (not ((count _forCapt) == 0) and ((count RydHQG_AttackAv) > 0)) then
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
					if (_x in RydHQG_AttackAv) then
						{
						if (((leader _x) distance _Trg) <= _m) then
							{
							if (not (_x in RydHQG_NCCargoG) or ((count (units _x)) > 1)) then 
								{
								_ammo = [_x,RydHQG_NCVeh] call RYD_AmmoCount;
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

										[_x,_isAttacked] spawn G_GoCapture;
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

		_LMCU = RydHQG_Friends - ((RydHQG_AirG - RydHQG_NCrewInfG) + RydHQG_SpecForG + RydHQG_CargoOnly + RydHQG_NavalG + RydHQG_StaticG + RydHQG_SupportG + RydHQG_ArtG + RydHQG_Garrison + (RydHQG_NCCargoG - (RydHQG_NCrewInfG - RydHQG_SupportG)));
		_LMCU = [_LMCU] call RYD_SizeOrd;
		if (not ((count _LMCU) == 0) and ((count RydHQG_AttackAv) > 0)) then
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
					if (_x in RydHQG_AttackAv) then
						{
						if (((leader _x) distance _Trg) <= _m) then
							{
							_ammo = [_x,RydHQG_NCVeh] call RYD_AmmoCount;
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

									[_x,_isAttacked] spawn G_GoCapture;
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

if (RydHQG_IdleOrd) then
	{
	_reserve = RydHQG_Friends - (RydHQG_SpecForG + RydHQG_CargoOnly + RydHQG_AOnly + RydHQG_ROnly + RydHQG_Exhausted + RydHQG_ArtG + RydHQG_AirG + RydHQG_NavalG + RydHQG_StaticG + (RydHQG_NCCargoG - (RydHQG_NCrewInfG + RydHQG_SupportG)));
		
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
		if (not (_busy) and ((count (waypoints _x)) <= 1) and not (_deployed) and not (_capturing) and (not (_x in RydHQG_NCCargoG) or ((count (units _x)) > 1))) then {deleteWaypoint ((waypoints _x) select 0);[_x] spawn G_GoIdle};
		}
	foreach _reserve
	};

	{
	_recvar = str _x;
	_resting = false;
	_resting = _x getvariable ("Resting" + _recvar);
	if (isNil ("_resting")) then {_resting = false};
	if not (_resting) then {[_x] spawn G_GoRest }
	}
foreach (RydHQG_Exhausted - (RydHQG_AirG + RydHQG_StaticG + RydHQG_ArtG + RydHQG_NavalG));

	{
	_GE = (group _x);
	_GEvar = str _GE;
	_GE setvariable [("Checked" + _GEvar),false];
	}
foreach RydHQG_KnEnemies;

if (RydHQG_Orderfirst) then {RydHQG_Orderfirst = false};

RydxHQ_Done = true;