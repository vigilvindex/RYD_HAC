
RydHQ_DefDone = false;

_distances = [];

_Trg = leaderHQ;

RydHQ_NearestE = ObjNull;

if (isNil ("RydHQ_Orderfirst")) then {RydHQ_Orderfirst = true;RydHQ_FlankReady = false};

if (RydHQ_NObj == 1) then {RydHQ_Obj = RydHQ_Obj1};
if (RydHQ_NObj == 2) then {RydHQ_Obj = RydHQ_Obj2};
if (RydHQ_NObj == 3) then {RydHQ_Obj = RydHQ_Obj3};
if (RydHQ_NObj >= 4) then {RydHQ_Obj = RydHQ_Obj4};

_Trg = RydHQ_Obj;

_landE = RydHQ_KnEnemiesG - (RydHQ_EnNavalG + RydHQ_EnAirG);
if ((count _landE) > 0) then 
	{

	for [{_a = 0},{_a < (count _landE)},{_a = _a + 1}] do
		{
		_enemy = leader (_landE select _a);
		_distance = leaderHQ distance _enemy;
		_distances = _distances + [_distance];
		};

	RydHQ_NearestE = _landE select 0;

		{
		for [{_r = 0},{_r < (count _distances)},{_r = _r + 1}] do
			{
			_distance = _distances select _r;
			if (isNil ("_distance")) then {_distance = 10000};
			if (_distance <= _x) then {RydHQ_NearestE = _landE select _r};
			if (isNull RydHQ_NearestE) then {RydHQ_NearestE = _landE select 0}
			}
		}
	foreach _distances;

	_Trg = (leader RydHQ_NearestE);
	};
_PosObj1 = position _Trg;
if (isNil ("RydHQ_ReconReserve")) then {RydHQ_ReconReserve = (0.3 * (0.5 + RydHQ_Circumspection))};

RydHQ_ReconAv = [];
_onlyL = RydHQ_LArmorG - RydHQ_MArmorG;

	{
	_unitvar = str _x;
	if (RydHQ_Orderfirst) then {_x setVariable ["Nominal" + _unitvar,(count (units _x)),true]};
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
	_nominal = _x getVariable ("Nominal" + (str _x));
	_current = count (units _x);
	_Gdamage = _Gdamage + (_nominal - _current);

	if (((_Gdamage/(_current + 0.1)) > (0.4*((RydHQ_Recklessness/1.2) + 1))) or not (_effective) or not (_ammo)) then 
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
		if (not (isNull _veh) and (not (canMove _veh) or ((fuel _veh) <= 0.1) or ((damage _veh) > 0.5) or (((group _x) in ((RydHQ_AirG - (RydHQ_NCAirG + RydHQ_RAirG)) + (RydHQ_HArmorG + RydHQ_LArmorG + (RydHQ_CarsG - (RydHQ_NCCargoG + RydHQ_SupportG))))) and ((count (magazines _veh)) == 0)))) exitwith {_vehready = false};
		}
	foreach (units _x);

	if (not (_x in (RydHQ_ReconAv + RydHQ_SpecForG)) and not (_busy) and (_vehready) and ((_solready) or (_x in RydHQ_RAirG))) then {RydHQ_ReconAv set [(count RydHQ_ReconAv),_x]};
	}
foreach ((RydHQ_RAirG + RydHQ_ReconG + RydHQ_FOG + RydHQ_SnipersG + RydHQ_NCrewInfG - (RydHQ_SupportG + RydHQ_NCCargoG) + _onlyL) - (RydHQ_AOnly + RydHQ_CargoOnly));

RydHQ_ReconAv = [RydHQ_ReconAv] call RYD_RandomOrd;

if (RydHQ_ReconReserve > 0) then 
	{
	_forRRes = (RydHQ_ReconAv - RydHQ_RAirG);
	for [{_b = 0},{_b < (floor ((count _forRRes)*RydHQ_ReconReserve))},{_b = _b + 1}] do
		{
		_RRp = _forRRes select _b;
		RydHQ_ReconAv = RydHQ_ReconAv - [_RRp];
		}
	};

RydHQ_AttackAv = [];
RydHQ_FlankAv = [];

if (isNil ("RydHQ_Exhausted")) then {RydHQ_Exhausted = []};
//if (isNil ("RydHQ_FlankAv")) then {RydHQ_FlankAv = []};

if (isNil ("RydHQ_AttackReserve")) then {RydHQ_AttackReserve = (0.5 * (0.5 + (RydHQ_Circumspection/1.5)))};

	{
	_unitvar = str _x;
	if (RydHQ_Orderfirst) then {_x setVariable [("Nominal" + _unitvar),(count (units _x)),true]};
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
	_nominal = _x getVariable ("Nominal" + (str _x));
	_current = count (units _x);
	_Gdamage = _Gdamage + (_nominal - _current);
	if (((_Gdamage/(_current + 0.1)) > (0.4*((RydHQ_Recklessness/1.2) + 1))) or not (_effective) or not (_ammo)) then {_solready = false};
	_ammo = 0;

		{
		_veh = assignedvehicle _x;
		if (not (isNull _veh) and (not (canMove _veh) or ((fuel _veh) <= 0.1) or ((damage _veh) > 0.5) or (((group _x) in ((RydHQ_AirG - RydHQ_NCAirG) + (RydHQ_HArmorG + RydHQ_LArmorG + (RydHQ_CarsG - (RydHQ_NCCargoG + RydHQ_SupportG))))) and ((count (magazines _veh)) == 0)))) exitwith {_vehready = false};
		}
	foreach (units _x);
	
	if (not (_x in RydHQ_AttackAv) and not (_busy) and not (_x in RydHQ_FlankAv) and (_vehready) and (_solready) and not (_x in (RydHQ_StaticG + RydHQ_ArtG + RydHQ_NavalG + RydHQ_SpecForG + RydHQ_CargoOnly))) then {RydHQ_AttackAv set [(count RydHQ_AttackAv),_x]};
	if (not (_x in RydHQ_Exhausted) and (not (_vehready) or not (_solready))) then {RydHQ_Exhausted = RydHQ_Exhausted + [_x]};
 
	if ((RydHQ_Withdraw > 0) and not (_x in (RydHQ_SpecForG + RydHQ_SnipersG))) then
		{
		_inD = _x getVariable "NearE";
		if (isNil "_inD") then {_inD = 0};
		if (not (_x in RydHQ_Exhausted) and ((random (2 + RydHQ_Recklessness)) < (_inD * RydHQ_Withdraw))) then {RydHQ_Exhausted set [(count RydHQ_Exhausted),_x]}; 
		};
	}
foreach ((RydHQ_Friends - (RydHQ_reconG + RydHQ_FOG + (RydHQ_NCCargoG - RydHQ_NCrewInfG) + RydHQ_SupportG)) - RydHQ_ROnly);
RydHQ_AttackAv = [RydHQ_AttackAv] call RYD_RandomOrd;
if (RydHQ_AttackReserve > 0) then 
	{
	for [{_g = 0},{_g < floor ((count RydHQ_AttackAv)*RydHQ_AttackReserve)},{_g = _g + 1}] do
		{
		_ResC = RydHQ_AttackAv select _g;
		if not (_ResC in RydHQ_FirstToFight) then 
			{
			RydHQ_AttackAv = RydHQ_AttackAv - [_ResC];
			if not (RydHQ_FlankingDone) then {if ((random 100 > (30/(0.5 + RydHQ_Fineness))) and not (_ResC in RydHQ_FlankAv)) then {RydHQ_FlankAv set [(count RydHQ_FlankAv),_ResC]}}
			};
		}
	};

RydHQ_FlankAv = RydHQ_FlankAv - RydHQ_NoFlank;

if (not (RydHQ_FlankingInit) and not (RydHQ_Order == "DEFEND")) then {[] spawn A_Flanking};

_stages = 3;
if ([] call RYD_isNight) then {_stages = 5};

_rcheckArr = [RydHQ_Garrison,RydHQ_ReconAv,RydHQ_FlankAv,RydHQ_AOnly,RydHQ_Exhausted,RydHQ_NCCargoG,_Trg,RydHQ_NCVeh];

if ((RydHQ_NoRec * (RydHQ_Recklessness + 0.01)) < (random 100)) then 
	{
	if ((count RydHQ_KnEnemiesG) == 0) then
		{
		if (not ((count RydHQ_RAirG) == 0) and ((count RydHQ_ReconAv) > 0) and not (RydHQ_ReconDone) and not (RydHQ_ReconStage > _stages)) then
			{
			_gps = [RydHQ_RAirG,"R",_rcheckArr,20000,true] call RYD_Recon;

				{
				if (RydHQ_ReconStage > _stages) exitWith {};
				RydHQ_ReconStage = RydHQ_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQ_ReconStage] spawn A_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQ_reconG) == 0) and ((count RydHQ_ReconAv) > 0) and not (RydHQ_ReconDone) and not (RydHQ_ReconStage > _stages)) then
			{
			_gps = [RydHQ_ReconG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQ_ReconStage > _stages) exitWith {};
				RydHQ_ReconStage = RydHQ_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQ_ReconStage] spawn A_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQ_FOG) == 0) and ((count RydHQ_ReconAv) > 0) and not (RydHQ_ReconDone) and not (RydHQ_ReconStage > _stages)) then
			{
			_gps = [RydHQ_FOG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQ_ReconStage > _stages) exitWith {};
				RydHQ_ReconStage = RydHQ_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQ_ReconStage] spawn A_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQ_snipersG) == 0) and ((count RydHQ_ReconAv) > 0) and not (RydHQ_ReconDone) and not (RydHQ_ReconStage > _stages)) then
			{
			_gps = [RydHQ_snipersG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQ_ReconStage > _stages) exitWith {};
				RydHQ_ReconStage = RydHQ_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQ_ReconStage] spawn A_GoRecon;
				}
			foreach _gps
			};

		_onlyL = RydHQ_LArmorG - RydHQ_MArmorG;
		if (not ((count _onlyL) == 0) and ((count RydHQ_ReconAv) > 0) and not (RydHQ_ReconDone) and not (RydHQ_ReconStage > _stages)) then
			{
			_gps = [_onlyL,"R",_rcheckArr,20000,false] call RYD_Recon;

				{
				if (RydHQ_ReconStage > _stages) exitWith {};
				RydHQ_ReconStage = RydHQ_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQ_ReconStage] spawn A_GoRecon;
				}
			foreach _gps
			};

		if (not ((count (RydHQ_NCrewInfG - RydHQ_SpecForG)) == 0) and ((count RydHQ_ReconAv) > 0) and not (RydHQ_ReconDone) and not (RydHQ_ReconStage > _stages)) then
			{
			_gps = [(RydHQ_NCrewInfG - RydHQ_SpecForG),"NR",_rcheckArr,10000,false] call RYD_Recon;

				{
				if (RydHQ_ReconStage > _stages) exitWith {};
				RydHQ_ReconStage = RydHQ_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQ_ReconStage] spawn A_GoRecon;
				}
			foreach _gps
			};

		_LMCUA = RydHQ_Friends - (RydHQ_NavalG + RydHQ_StaticG + RydHQ_SupportG + RydHQ_ArtG + RydHQ_AOnly + RydHQ_SpecForG + RydHQ_CargoOnly);
		if (not ((count _LMCUA) == 0) and not (RydHQ_ReconDone) and not (RydHQ_ReconStage > _stages)) then
			{
			_gps = [_LMCUA,"NR",_rcheckArr,20000,false] call RYD_Recon;

				{
				if (RydHQ_ReconStage > _stages) exitWith {};
				RydHQ_ReconStage = RydHQ_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQ_ReconStage] spawn A_GoRecon;
				}
			foreach _gps
			}
		}
	}
else
	{
	RydHQ_ReconDone = true
	};

if (isNil ("RydHQ_IdleOrd")) then {RydHQ_IdleOrd = true};

_reserve = RydHQ_Friends - (RydHQ_SpecForG + RydHQ_CargoOnly + RydHQ_AOnly + RydHQ_ROnly + RydHQ_Exhausted + RydHQ_ArtG + RydHQ_AirG + RydHQ_NavalG + RydHQ_StaticG + RydHQ_SupportG + (RydHQ_NCCargoG - (RydHQ_NCrewInfG + RydHQ_SupportG)));
if (not (RydHQ_ReconDone) and ((count RydHQ_KnEnemies) == 0)) exitwith 
	{
	if (RydHQ_Orderfirst) then 
		{
		RydHQ_Orderfirst = false
		};

		{
		_recvar = str _x;
		_resting = false;
		_resting = _x getvariable ("Resting" + _recvar);
		if (isNil ("_resting")) then {_resting = false};
		if not (_resting) then {[_x] spawn A_GoRest }
		}
	foreach (RydHQ_Exhausted - (RydHQ_AirG + RydHQ_StaticG + RydHQ_ArtG + RydHQ_NavalG));

	if (RydHQ_IdleOrd) then
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
			if (not (_busy) and ((count (waypoints _x)) <= 1) and not (_deployed) and not (_capturing) and (not (_x in RydHQ_NCCargoG) or ((count (units _x)) > 1))) then {deleteWaypoint ((waypoints _x) select 0);[_x] spawn A_GoIdle }
			}
		foreach _reserve;
		};

	RydxHQ_Done = true;
	};

RydHQ_FlankReady = true;

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

	if ((_x in RydHQ_Enrecon) and not (_GE in _reconthreat) and not (_checked)) then {_reconthreat set [(count _reconthreat),_GE]};
	if ((_x in RydHQ_EnFO) and not (_GE in _FOthreat) and not (_checked)) then {_FOthreat set [(count _FOthreat),_GE]};
	if ((_x in RydHQ_Ensnipers) and not (_GE in _snipersthreat) and not (_checked)) then {_snipersthreat set [(count _snipersthreat),_GE]};
	if ((_x in RydHQ_EnATinf) and not (_GE in _ATinfthreat) and not (_checked)) then {_ATinfthreat set [(count _ATinfthreat),_GE]};
	if ((_x in RydHQ_EnAAinf) and not (_GE in _AAinfthreat) and not (_checked)) then {_AAinfthreat set [(count _AAinfthreat),_GE]};
	if ((_x in RydHQ_EnInf) and not (_GE in _Infthreat) and not (_checked)) then {_Infthreat set [(count _Infthreat),_GE]};
	if ((_x in RydHQ_EnArt) and not (_GE in _Artthreat) and not (_checked)) then {_Artthreat set [(count _Artthreat),_GE]};
	if ((_x in RydHQ_EnHArmor) and not (_GE in _LArmorthreat) and not (_checked)) then {_LArmorthreat set [(count _LArmorthreat),_GE]};
	if ((_x in RydHQ_EnLArmor) and not (_GE in _reconthreat) and not (_checked)) then {_reconthreat set [(count _reconthreat),_GE]};
	if ((_x in RydHQ_EnLArmorAT) and not (_GE in _LArmorATthreat) and not (_checked)) then {_LArmorATthreat set [(count _LArmorATthreat),_GE]};
	if ((_x in RydHQ_EnCars) and not (_GE in _Carsthreat) and not (_checked)) then {_Carsthreat set [(count _Carsthreat),_GE]};
	if ((_x in RydHQ_EnAir) and not (_GE in _Airthreat) and not (_checked)) then {_Airthreat set [(count _Airthreat),_GE]};
	if ((_x in RydHQ_EnNaval) and not (_GE in _Navalthreat) and not (_checked)) then {_Navalthreat set [(count _Navalthreat),_GE]};
	if ((_x in RydHQ_EnStatic) and not (_GE in _Staticthreat) and not (_checked)) then {_Staticthreat set [(count _Staticthreat),_GE]};
	if ((_x in RydHQ_EnStaticAA) and not (_GE in _StaticAAthreat) and not (_checked)) then {_StaticAAthreat set [(count _StaticAAthreat),_GE]};
	if ((_x in RydHQ_EnStaticAT) and not (_GE in _StaticATthreat) and not (_checked)) then {_StaticATthreat set [(count _StaticATthreat),_GE]};
	if ((_x in RydHQ_EnSupport) and not (_GE in _Supportthreat) and not (_checked)) then {_Supportthreat set [(count _Supportthreat),_GE]};
	if ((_x in RydHQ_EnCargo) and not (_GE in _Cargothreat) and not (_checked)) then {_Cargothreat set [(count _Cargothreat),_GE]};

	if ((_x in RydHQ_EnInf) and ((vehicle _x) in RydHQ_EnCargo) and not (_x in RydHQ_EnCrew) and not (_GE in _Infthreat) and not (_checked)) then {_Infthreat set [(count _Infthreat),_GE]};

	if ((isNil ("_checked")) or not (_checked)) then {_GE setVariable [("Checked" + _GEvar), true]};
	}
foreach RydHQ_KnEnemies;

RydHQ_AAthreat = (_AAinfthreat + _StaticAAthreat);
RydHQ_ATthreat = (_ATinfthreat + _StaticATthreat + _HArmorthreat + _LArmorATthreat);
RydHQ_Airthreat = _Airthreat;
_reconthreat = _reconthreat - _Airthreat;

_FPool = 
	[
	RydHQ_snipersG,
	RydHQ_NCrewInfG - RydHQ_SpecForG,
	RydHQ_AirG - (RydHQ_NCAirG + RydHQ_NCrewInfG),
	RydHQ_LArmorG,
	RydHQ_HArmorG,
	RydHQ_CarsG - (RydHQ_ATInfG + RydHQ_AAInfG + RydHQ_SupportG + RydHQ_NCCargoG),
	RydHQ_LArmorATG,
	RydHQ_ATInfG,
	RydHQ_AAInfG,
	RydHQ_Recklessness,
	RydHQ_AttackAv,
	RydHQ_Garrison,
	RydHQ_GarrR,
	RydHQ_FlankAv,
	RydHQ_AirG,
	RydHQ_NCVeh
	];

_constant = [RydHQ_AAthreat,RydHQ_ATthreat,_HArmorthreat + _LArmorATthreat,_FPool];

if (count (_reconthreat + _FOthreat + _snipersthreat) > 0) then 
	{
	([_reconthreat + _FOthreat + _snipersthreat,"Recon","A",0,0,0] + _constant) call RYD_Dispatcher;
	};

if (count _ATinfthreat > 0) then 
	{
	([_ATinfthreat,"ATInf","A",0,0,85] + _constant) call RYD_Dispatcher;
	};

if (count _Infthreat > 0) then 
	{
	([_Infthreat,"Inf","A",75,80,85] + _constant) call RYD_Dispatcher;
	};

if (count (_LArmorthreat + _HArmorthreat) > 0) then 
	{
	([_LArmorthreat + _HArmorthreat,"Armor","A",50,0,85] + _constant) call RYD_Dispatcher;
	};

if (count _Carsthreat > 0) then 
	{
	([_Carsthreat,"Cars","A",75,80,85] + _constant) call RYD_Dispatcher;
	};

if (count _Artthreat > 0) then 
	{
	([_Artthreat,"Art","A",70,75,75] + _constant) call RYD_Dispatcher;
	};

if (count _Airthreat > 0) then 
	{
	([_Airthreat,"Air","A",0,0,75] + _constant) call RYD_Dispatcher;
	};

if (count (_Staticthreat - _Artthreat) > 0) then 
	{
	([_Staticthreat - _Artthreat,"Static","A",75,80,85] + _constant) call RYD_Dispatcher;
	};

/////////////////////////////////////////
// Capture Objective

_Trg = RydHQ_Obj;

	{
	_x setVariable [("Capturing" + (str _x)),[0,0]]
	}
foreach ([RydHQ_Obj1,RydHQ_Obj2,RydHQ_Obj3,RydHQ_Obj4] - [RydHQ_Obj]);

if (isNil ("_Trg")) then {_Trg = leaderHQ};

_isAttacked = _Trg getvariable ("Capturing" + (str _Trg));

if (isNil ("_isAttacked")) then {_isAttacked = [0,0]};

_captCount = _isAttacked select 1;
_isAttacked = _isAttacked select 0;
_captLimit = RydHQ_CaptLimit * (1 + (RydHQ_Circumspection/(2 + RydHQ_Recklessness)));
if ((_isAttacked <= 3) or (_captCount < _captLimit)) then
	{	
	if ((not (RydHQ_NObj > 4) and ((random 100) > ((count RydHQ_KnEnemies)*(5/(0.5 + (2*RydHQ_Recklessness))))) and not 
		(RydHQ_Orderfirst) and 
			((random 100) < ((((count RydHQ_Friends)*(0.5 + RydHQ_Recklessness))/(5*(0.5 + count RydHQ_KnEnemiesG)))*((RydHQ_Cyclecount - 5)*2*(1 + RydHQ_Recklessness))))) or
				(((RydHQ_RapidCapt * (RydHQ_Recklessness + 0.01)) > (random 100)) and (RydHQ_NObj <= 4))) then   
		{
		_checked = [];
		_forCapt = RydHQ_NCrewInfG - (RydHQ_SupportG + RydHQ_SpecForG + RydHQ_CargoOnly + RydHQ_Garrison);
		_forCapt = [_forCapt] call RYD_SizeOrd;
		if (not ((count _forCapt) == 0) and ((count RydHQ_AttackAv) > 0)) then
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
					if (_x in RydHQ_AttackAv) then
						{
						if (((leader _x) distance _Trg) <= _m) then
							{
							if (not (_x in RydHQ_NCCargoG) or ((count (units _x)) > 1)) then 
								{
								_ammo = [_x,RydHQ_NCVeh] call RYD_AmmoCount;
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

										[_x,_isAttacked] spawn A_GoCapture;
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

		_LMCU = RydHQ_Friends - ((RydHQ_AirG - RydHQ_NCrewInfG) + RydHQ_SpecForG + RydHQ_CargoOnly + RydHQ_NavalG + RydHQ_StaticG + RydHQ_SupportG + RydHQ_ArtG + RydHQ_Garrison + (RydHQ_NCCargoG - (RydHQ_NCrewInfG - RydHQ_SupportG)));
		_LMCU = [_LMCU] call RYD_SizeOrd;
		if (not ((count _LMCU) == 0) and ((count RydHQ_AttackAv) > 0)) then
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
					if (_x in RydHQ_AttackAv) then
						{
						if (((leader _x) distance _Trg) <= _m) then
							{
							_ammo = [_x,RydHQ_NCVeh] call RYD_AmmoCount;
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

									[_x,_isAttacked] spawn A_GoCapture;
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

if (RydHQ_IdleOrd) then
	{
	_reserve = RydHQ_Friends - (RydHQ_SpecForG + RydHQ_CargoOnly + RydHQ_AOnly + RydHQ_ROnly + RydHQ_Exhausted + RydHQ_ArtG + RydHQ_AirG + RydHQ_NavalG + RydHQ_StaticG + (RydHQ_NCCargoG - (RydHQ_NCrewInfG + RydHQ_SupportG)));
		
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
		if (not (_busy) and ((count (waypoints _x)) <= 1) and not (_deployed) and not (_capturing) and (not (_x in RydHQ_NCCargoG) or ((count (units _x)) > 1))) then {deleteWaypoint ((waypoints _x) select 0);[_x] spawn A_GoIdle};
		}
	foreach _reserve
	};

	{
	_recvar = str _x;
	_resting = false;
	_resting = _x getvariable ("Resting" + _recvar);
	if (isNil ("_resting")) then {_resting = false};
	if not (_resting) then {[_x] spawn A_GoRest }
	}
foreach (RydHQ_Exhausted - (RydHQ_AirG + RydHQ_StaticG + RydHQ_ArtG + RydHQ_NavalG));

	{
	_GE = (group _x);
	_GEvar = str _GE;
	_GE setvariable [("Checked" + _GEvar),false];
	}
foreach RydHQ_KnEnemies;

if (RydHQ_Orderfirst) then {RydHQ_Orderfirst = false};

RydxHQ_Done = true;