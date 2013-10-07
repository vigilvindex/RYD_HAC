
RydHQD_DefDone = false;

_distances = [];

_Trg = leaderHQD;

RydHQD_NearestE = ObjNull;

if (isNil ("RydHQD_Orderfirst")) then {RydHQD_Orderfirst = true;RydHQD_FlankReady = false};

if (RydHQD_NObj == 1) then {RydHQD_Obj = RydHQD_Obj1};
if (RydHQD_NObj == 2) then {RydHQD_Obj = RydHQD_Obj2};
if (RydHQD_NObj == 3) then {RydHQD_Obj = RydHQD_Obj3};
if (RydHQD_NObj >= 4) then {RydHQD_Obj = RydHQD_Obj4};

_Trg = RydHQD_Obj;

_landE = RydHQD_KnEnemiesG - (RydHQD_EnNavalG + RydHQD_EnAirG);
if ((count _landE) > 0) then 
	{

	for [{_a = 0},{_a < (count _landE)},{_a = _a + 1}] do
		{
		_enemy = leader (_landE select _a);
		_distance = leaderHQD distance _enemy;
		_distances = _distances + [_distance];
		};

	RydHQD_NearestE = _landE select 0;

		{
		for [{_r = 0},{_r < (count _distances)},{_r = _r + 1}] do
			{
			_distance = _distances select _r;
			if (isNil ("_distance")) then {_distance = 10000};
			if (_distance <= _x) then {RydHQD_NearestE = _landE select _r};
			if (isNull RydHQD_NearestE) then {RydHQD_NearestE = _landE select 0}
			}
		}
	foreach _distances;

	_Trg = (leader RydHQD_NearestE);
	};
_PosObj1 = position _Trg;
if (isNil ("RydHQD_ReconReserve")) then {RydHQD_ReconReserve = (0.3 * (0.5 + RydHQD_Circumspection))};

RydHQD_ReconAv = [];
_onlyL = RydHQD_LArmorG - RydHQD_MArmorG;

	{
	_unitvar = str _x;
	if (RydHQD_Orderfirst) then {_x setVariable ["Nominal" + _unitvar,(count (units _x))]};
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

	if (((_Gdamage/(_current + 0.1)) > (0.4*((RydHQD_Recklessness/1.2) + 1))) or not (_effective) or not (_ammo)) then 
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
		if (not (isNull _veh) and (not (canMove _veh) or ((fuel _veh) <= 0.1) or ((damage _veh) > 0.5) or (((group _x) in ((RydHQD_AirG - (RydHQD_NCAirG + RydHQD_RAirG)) + (RydHQD_HArmorG + RydHQD_LArmorG + (RydHQD_CarsG - (RydHQD_NCCargoG + RydHQD_SupportG))))) and ((count (magazines _veh)) == 0)))) exitwith {_vehready = false};
		}
	foreach (units _x);

	if (not (_x in (RydHQD_ReconAv + RydHQD_SpecForG)) and not (_busy) and (_vehready) and ((_solready) or (_x in RydHQD_RAirG))) then {RydHQD_ReconAv set [(count RydHQD_ReconAv),_x]};
	}
foreach ((RydHQD_RAirG + RydHQD_ReconG + RydHQD_FOG + RydHQD_SnipersG + RydHQD_NCrewInfG - (RydHQD_SupportG + RydHQD_NCCargoG) + _onlyL) - (RydHQD_AOnly + RydHQD_CargoOnly));

RydHQD_ReconAv = [RydHQD_ReconAv] call RYD_RandomOrd;

if (RydHQD_ReconReserve > 0) then 
	{
	_forRRes = (RydHQD_ReconAv - RydHQD_RAirG);
	for [{_b = 0},{_b < (floor ((count _forRRes)*RydHQD_ReconReserve))},{_b = _b + 1}] do
		{
		_RRp = _forRRes select _b;
		RydHQD_ReconAv = RydHQD_ReconAv - [_RRp];
		}
	};

RydHQD_AttackAv = [];
RydHQD_FlankAv = [];

if (isNil ("RydHQD_Exhausted")) then {RydHQD_Exhausted = []};
//if (isNil ("RydHQD_FlankAv")) then {RydHQD_FlankAv = []};

if (isNil ("RydHQD_AttackReserve")) then {RydHQD_AttackReserve = (0.5 * (0.5 + (RydHQD_Circumspection/1.5)))};

	{
	_unitvar = str _x;
	if (RydHQD_Orderfirst) then {_x setVariable [("Nominal" + _unitvar),(count (units _x))]};
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
	if (((_Gdamage/(_current + 0.1)) > (0.4*((RydHQD_Recklessness/1.2) + 1))) or not (_effective) or not (_ammo)) then {_solready = false};
	_ammo = 0;

		{
		_veh = assignedvehicle _x;
		if (not (isNull _veh) and (not (canMove _veh) or ((fuel _veh) <= 0.1) or ((damage _veh) > 0.5) or (((group _x) in ((RydHQD_AirG - RydHQD_NCAirG) + (RydHQD_HArmorG + RydHQD_LArmorG + (RydHQD_CarsG - (RydHQD_NCCargoG + RydHQD_SupportG))))) and ((count (magazines _veh)) == 0)))) exitwith {_vehready = false};
		}
	foreach (units _x);
	
	if (not (_x in RydHQD_AttackAv) and not (_busy) and not (_x in RydHQD_FlankAv) and (_vehready) and (_solready) and not (_x in (RydHQD_StaticG + RydHQD_ArtG + RydHQD_NavalG + RydHQD_SpecForG + RydHQD_CargoOnly))) then {RydHQD_AttackAv set [(count RydHQD_AttackAv),_x]};
	if (not (_x in RydHQD_Exhausted) and (not (_vehready) or not (_solready))) then {RydHQD_Exhausted = RydHQD_Exhausted + [_x]};
 
	if ((RydHQD_Withdraw > 0) and not (_x in (RydHQD_SpecForG + RydHQD_SnipersG))) then
		{
		_inD = _x getVariable "NearE";
		if (isNil "_inD") then {_inD = 0};
		if (not (_x in RydHQD_Exhausted) and ((random (2 + RydHQD_Recklessness)) < (_inD * RydHQD_Withdraw))) then {RydHQD_Exhausted set [(count RydHQD_Exhausted),_x]}; 
		};
	}
foreach ((RydHQD_Friends - (RydHQD_reconG + RydHQD_FOG + (RydHQD_NCCargoG - RydHQD_NCrewInfG) + RydHQD_SupportG)) - RydHQD_ROnly);
RydHQD_AttackAv = [RydHQD_AttackAv] call RYD_RandomOrd;
if (RydHQD_AttackReserve > 0) then 
	{
	for [{_g = 0},{_g < floor ((count RydHQD_AttackAv)*RydHQD_AttackReserve)},{_g = _g + 1}] do
		{
		_ResC = RydHQD_AttackAv select _g;
		if not (_ResC in RydHQD_FirstToFight) then 
			{
			RydHQD_AttackAv = RydHQD_AttackAv - [_ResC];
			if not (RydHQD_FlankingDone) then {if ((random 100 > (30/(0.5 + RydHQD_Fineness))) and not (_ResC in RydHQD_FlankAv)) then {RydHQD_FlankAv set [(count RydHQD_FlankAv),_ResC]}}
			};
		}
	};

RydHQD_FlankAv = RydHQD_FlankAv - RydHQD_NoFlank;

if (not (RydHQD_FlankingInit) and not (RydHQD_Order == "DEFEND")) then {[] spawn D_Flanking};

_stages = 3;
if ([] call RYD_isNight) then {_stages = 5};

_rcheckArr = [RydHQD_Garrison,RydHQD_ReconAv,RydHQD_FlankAv,RydHQD_AOnly,RydHQD_Exhausted,RydHQD_NCCargoG,_Trg,RydHQD_NCVeh];

if ((RydHQD_NoRec * (RydHQD_Recklessness + 0.01)) < (random 100)) then 
	{
	if ((count RydHQD_KnEnemiesG) == 0) then
		{
		if (not ((count RydHQD_RAirG) == 0) and ((count RydHQD_ReconAv) > 0) and not (RydHQD_ReconDone) and not (RydHQD_ReconStage > _stages)) then
			{
			_gps = [RydHQD_RAirG,"R",_rcheckArr,20000,true] call RYD_Recon;

				{
				if (RydHQD_ReconStage > _stages) exitWith {};
				RydHQD_ReconStage = RydHQD_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQD_ReconStage] spawn D_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQD_reconG) == 0) and ((count RydHQD_ReconAv) > 0) and not (RydHQD_ReconDone) and not (RydHQD_ReconStage > _stages)) then
			{
			_gps = [RydHQD_ReconG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQD_ReconStage > _stages) exitWith {};
				RydHQD_ReconStage = RydHQD_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQD_ReconStage] spawn D_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQD_FOG) == 0) and ((count RydHQD_ReconAv) > 0) and not (RydHQD_ReconDone) and not (RydHQD_ReconStage > _stages)) then
			{
			_gps = [RydHQD_FOG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQD_ReconStage > _stages) exitWith {};
				RydHQD_ReconStage = RydHQD_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQD_ReconStage] spawn D_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQD_snipersG) == 0) and ((count RydHQD_ReconAv) > 0) and not (RydHQD_ReconDone) and not (RydHQD_ReconStage > _stages)) then
			{
			_gps = [RydHQD_snipersG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQD_ReconStage > _stages) exitWith {};
				RydHQD_ReconStage = RydHQD_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQD_ReconStage] spawn D_GoRecon;
				}
			foreach _gps
			};

		_onlyL = RydHQD_LArmorG - RydHQD_MArmorG;
		if (not ((count _onlyL) == 0) and ((count RydHQD_ReconAv) > 0) and not (RydHQD_ReconDone) and not (RydHQD_ReconStage > _stages)) then
			{
			_gps = [_onlyL,"R",_rcheckArr,20000,false] call RYD_Recon;

				{
				if (RydHQD_ReconStage > _stages) exitWith {};
				RydHQD_ReconStage = RydHQD_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQD_ReconStage] spawn D_GoRecon;
				}
			foreach _gps
			};

		if (not ((count (RydHQD_NCrewInfG - RydHQD_SpecForG)) == 0) and ((count RydHQD_ReconAv) > 0) and not (RydHQD_ReconDone) and not (RydHQD_ReconStage > _stages)) then
			{
			_gps = [(RydHQD_NCrewInfG - RydHQD_SpecForG),"NR",_rcheckArr,10000,false] call RYD_Recon;

				{
				if (RydHQD_ReconStage > _stages) exitWith {};
				RydHQD_ReconStage = RydHQD_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQD_ReconStage] spawn D_GoRecon;
				}
			foreach _gps
			};

		_LMCUA = RydHQD_Friends - (RydHQD_NavalG + RydHQD_StaticG + RydHQD_SupportG + RydHQD_ArtG + RydHQD_AOnly + RydHQD_SpecForG + RydHQD_CargoOnly);
		if (not ((count _LMCUA) == 0) and not (RydHQD_ReconDone) and not (RydHQD_ReconStage > _stages)) then
			{
			_gps = [_LMCUA,"NR",_rcheckArr,20000,false] call RYD_Recon;

				{
				if (RydHQD_ReconStage > _stages) exitWith {};
				RydHQD_ReconStage = RydHQD_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQD_ReconStage] spawn D_GoRecon;
				}
			foreach _gps
			}
		}
	}
else
	{
	RydHQD_ReconDone = true
	};

if (isNil ("RydHQD_IdleOrd")) then {RydHQD_IdleOrd = true};

_reserve = RydHQD_Friends - (RydHQD_SpecForG + RydHQD_CargoOnly + RydHQD_AOnly + RydHQD_ROnly + RydHQD_Exhausted + RydHQD_ArtG + RydHQD_AirG + RydHQD_NavalG + RydHQD_StaticG + RydHQD_SupportG + (RydHQD_NCCargoG - (RydHQD_NCrewInfG + RydHQD_SupportG)));
if (not (RydHQD_ReconDone) and ((count RydHQD_KnEnemies) == 0)) exitwith 
	{
	if (RydHQD_Orderfirst) then 
		{
		RydHQD_Orderfirst = false
		};

		{
		_recvar = str _x;
		_resting = false;
		_resting = _x getvariable ("Resting" + _recvar);
		if (isNil ("_resting")) then {_resting = false};
		if not (_resting) then {[_x] spawn D_GoRest }
		}
	foreach (RydHQD_Exhausted - (RydHQD_AirG + RydHQD_StaticG + RydHQD_ArtG + RydHQD_NavalG));

	if (RydHQD_IdleOrd) then
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
			if (not (_busy) and ((count (waypoints _x)) <= 1) and not (_deployed) and not (_capturing) and (not (_x in RydHQD_NCCargoG) or ((count (units _x)) > 1))) then {deleteWaypoint ((waypoints _x) select 0);[_x] spawn D_GoIdle }
			}
		foreach _reserve;
		};

	RydxHQ_Done = true;
	};

RydHQD_FlankReady = true;

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

	if ((_x in RydHQD_Enrecon) and not (_GE in _reconthreat) and not (_checked)) then {_reconthreat set [(count _reconthreat),_GE]};
	if ((_x in RydHQD_EnFO) and not (_GE in _FOthreat) and not (_checked)) then {_FOthreat set [(count _FOthreat),_GE]};
	if ((_x in RydHQD_Ensnipers) and not (_GE in _snipersthreat) and not (_checked)) then {_snipersthreat set [(count _snipersthreat),_GE]};
	if ((_x in RydHQD_EnATinf) and not (_GE in _ATinfthreat) and not (_checked)) then {_ATinfthreat set [(count _ATinfthreat),_GE]};
	if ((_x in RydHQD_EnAAinf) and not (_GE in _AAinfthreat) and not (_checked)) then {_AAinfthreat set [(count _AAinfthreat),_GE]};
	if ((_x in RydHQD_EnInf) and not (_GE in _Infthreat) and not (_checked)) then {_Infthreat set [(count _Infthreat),_GE]};
	if ((_x in RydHQD_EnArt) and not (_GE in _Artthreat) and not (_checked)) then {_Artthreat set [(count _Artthreat),_GE]};
	if ((_x in RydHQD_EnHArmor) and not (_GE in _LArmorthreat) and not (_checked)) then {_LArmorthreat set [(count _LArmorthreat),_GE]};
	if ((_x in RydHQD_EnLArmor) and not (_GE in _reconthreat) and not (_checked)) then {_reconthreat set [(count _reconthreat),_GE]};
	if ((_x in RydHQD_EnLArmorAT) and not (_GE in _LArmorATthreat) and not (_checked)) then {_LArmorATthreat set [(count _LArmorATthreat),_GE]};
	if ((_x in RydHQD_EnCars) and not (_GE in _Carsthreat) and not (_checked)) then {_Carsthreat set [(count _Carsthreat),_GE]};
	if ((_x in RydHQD_EnAir) and not (_GE in _Airthreat) and not (_checked)) then {_Airthreat set [(count _Airthreat),_GE]};
	if ((_x in RydHQD_EnNaval) and not (_GE in _Navalthreat) and not (_checked)) then {_Navalthreat set [(count _Navalthreat),_GE]};
	if ((_x in RydHQD_EnStatic) and not (_GE in _Staticthreat) and not (_checked)) then {_Staticthreat set [(count _Staticthreat),_GE]};
	if ((_x in RydHQD_EnStaticAA) and not (_GE in _StaticAAthreat) and not (_checked)) then {_StaticAAthreat set [(count _StaticAAthreat),_GE]};
	if ((_x in RydHQD_EnStaticAT) and not (_GE in _StaticATthreat) and not (_checked)) then {_StaticATthreat set [(count _StaticATthreat),_GE]};
	if ((_x in RydHQD_EnSupport) and not (_GE in _Supportthreat) and not (_checked)) then {_Supportthreat set [(count _Supportthreat),_GE]};
	if ((_x in RydHQD_EnCargo) and not (_GE in _Cargothreat) and not (_checked)) then {_Cargothreat set [(count _Cargothreat),_GE]};

	if ((_x in RydHQD_EnInf) and ((vehicle _x) in RydHQD_EnCargo) and not (_x in RydHQD_EnCrew) and not (_GE in _Infthreat) and not (_checked)) then {_Infthreat set [(count _Infthreat),_GE]};

	if ((isNil ("_checked")) or not (_checked)) then {_GE setVariable [("Checked" + _GEvar), true]};
	}
foreach RydHQD_KnEnemies;

RydHQD_AAthreat = (_AAinfthreat + _StaticAAthreat);
RydHQD_ATthreat = (_ATinfthreat + _StaticATthreat + _HArmorthreat + _LArmorATthreat);
RydHQD_Airthreat = _Airthreat;
_reconthreat = _reconthreat - _Airthreat;

_FPool = 
	[
	RydHQD_snipersG,
	RydHQD_NCrewInfG - RydHQD_SpecForG,
	RydHQD_AirG - (RydHQD_NCAirG + RydHQD_NCrewInfG),
	RydHQD_LArmorG,
	RydHQD_HArmorG,
	RydHQD_CarsG - (RydHQD_ATInfG + RydHQD_AAInfG + RydHQD_SupportG + RydHQD_NCCargoG),
	RydHQD_LArmorATG,
	RydHQD_ATInfG,
	RydHQD_AAInfG,
	RydHQD_Recklessness,
	RydHQD_AttackAv,
	RydHQD_Garrison,
	RydHQD_GarrR,
	RydHQD_FlankAv,
	RydHQD_AirG,
	RydHQD_NCVeh
	];

_constant = [RydHQD_AAthreat,RydHQD_ATthreat,_HArmorthreat + _LArmorATthreat,_FPool];

if (count (_reconthreat + _FOthreat + _snipersthreat) > 0) then 
	{
	([_reconthreat + _FOthreat + _snipersthreat,"Recon","D",0,0,0] + _constant) call RYD_Dispatcher;
	};

if (count _ATinfthreat > 0) then 
	{
	([_ATinfthreat,"ATInf","D",0,0,85] + _constant) call RYD_Dispatcher;
	};

if (count _Infthreat > 0) then 
	{
	([_Infthreat,"Inf","D",75,80,85] + _constant) call RYD_Dispatcher;
	};

if (count (_LArmorthreat + _HArmorthreat) > 0) then 
	{
	([_LArmorthreat + _HArmorthreat,"Armor","D",50,0,85] + _constant) call RYD_Dispatcher;
	};

if (count _Carsthreat > 0) then 
	{
	([_Carsthreat,"Cars","D",75,80,85] + _constant) call RYD_Dispatcher;
	};

if (count _Artthreat > 0) then 
	{
	([_Artthreat,"Art","D",70,75,75] + _constant) call RYD_Dispatcher;
	};

if (count _Airthreat > 0) then 
	{
	([_Airthreat,"Air","D",0,0,75] + _constant) call RYD_Dispatcher;
	};

if (count (_Staticthreat - _Artthreat) > 0) then 
	{
	([_Staticthreat - _Artthreat,"Static","D",75,80,85] + _constant) call RYD_Dispatcher;
	};

/////////////////////////////////////////
// Capture Objective

_Trg = RydHQD_Obj;

	{
	_x setVariable [("Capturing" + (str _x)),[0,0]]
	}
foreach ([RydHQD_Obj1,RydHQD_Obj2,RydHQD_Obj3,RydHQD_Obj4] - [RydHQD_Obj]);

if (isNil ("_Trg")) then {_Trg = leaderHQD};

_isAttacked = _Trg getvariable ("Capturing" + (str _Trg));

if (isNil ("_isAttacked")) then {_isAttacked = [0,0]};

_captCount = _isAttacked select 1;
_isAttacked = _isAttacked select 0;
_captLimit = RydHQD_CaptLimit * (1 + (RydHQD_Circumspection/(2 + RydHQD_Recklessness)));
if ((_isAttacked <= 3) or (_captCount < _captLimit)) then
	{	
	if ((not (RydHQD_NObj > 4) and ((random 100) > ((count RydHQD_KnEnemies)*(5/(0.5 + (2*RydHQD_Recklessness))))) and not 
		(RydHQD_Orderfirst) and 
			((random 100) < ((((count RydHQD_Friends)*(0.5 + RydHQD_Recklessness))/(5*(0.5 + count RydHQD_KnEnemiesG)))*((RydHQD_Cyclecount - 5)*2*(1 + RydHQD_Recklessness))))) or
				(((RydHQD_RapidCapt * (RydHQD_Recklessness + 0.01)) > (random 100)) and (RydHQD_NObj <= 4))) then   
		{
		_checked = [];
		_forCapt = RydHQD_NCrewInfG - (RydHQD_SupportG + RydHQD_SpecForG + RydHQD_CargoOnly + RydHQD_Garrison);
		_forCapt = [_forCapt] call RYD_SizeOrd;
		if (not ((count _forCapt) == 0) and ((count RydHQD_AttackAv) > 0)) then
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
					if (_x in RydHQD_AttackAv) then
						{
						if (((leader _x) distance _Trg) <= _m) then
							{
							if (not (_x in RydHQD_NCCargoG) or ((count (units _x)) > 1)) then 
								{
								_ammo = [_x,RydHQD_NCVeh] call RYD_AmmoCount;
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

										[_x,_isAttacked] spawn D_GoCapture;
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

		_LMCU = RydHQD_Friends - ((RydHQD_AirG - RydHQD_NCrewInfG) + RydHQD_SpecForG + RydHQD_CargoOnly + RydHQD_NavalG + RydHQD_StaticG + RydHQD_SupportG + RydHQD_ArtG + RydHQD_Garrison + (RydHQD_NCCargoG - (RydHQD_NCrewInfG - RydHQD_SupportG)));
		_LMCU = [_LMCU] call RYD_SizeOrd;
		if (not ((count _LMCU) == 0) and ((count RydHQD_AttackAv) > 0)) then
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
					if (_x in RydHQD_AttackAv) then
						{
						if (((leader _x) distance _Trg) <= _m) then
							{
							_ammo = [_x,RydHQD_NCVeh] call RYD_AmmoCount;
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

									[_x,_isAttacked] spawn D_GoCapture;
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

if (RydHQD_IdleOrd) then
	{
	_reserve = RydHQD_Friends - (RydHQD_SpecForG + RydHQD_CargoOnly + RydHQD_AOnly + RydHQD_ROnly + RydHQD_Exhausted + RydHQD_ArtG + RydHQD_AirG + RydHQD_NavalG + RydHQD_StaticG + (RydHQD_NCCargoG - (RydHQD_NCrewInfG + RydHQD_SupportG)));
		
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
		if (not (_busy) and ((count (waypoints _x)) <= 1) and not (_deployed) and not (_capturing) and (not (_x in RydHQD_NCCargoG) or ((count (units _x)) > 1))) then {deleteWaypoint ((waypoints _x) select 0);[_x] spawn D_GoIdle};
		}
	foreach _reserve
	};

	{
	_recvar = str _x;
	_resting = false;
	_resting = _x getvariable ("Resting" + _recvar);
	if (isNil ("_resting")) then {_resting = false};
	if not (_resting) then {[_x] spawn D_GoRest }
	}
foreach (RydHQD_Exhausted - (RydHQD_AirG + RydHQD_StaticG + RydHQD_ArtG + RydHQD_NavalG));

	{
	_GE = (group _x);
	_GEvar = str _GE;
	_GE setvariable [("Checked" + _GEvar),false];
	}
foreach RydHQD_KnEnemies;

if (RydHQD_Orderfirst) then {RydHQD_Orderfirst = false};

RydxHQ_Done = true;