
RydHQH_DefDone = false;

_distances = [];

_Trg = leaderHQH;

RydHQH_NearestE = ObjNull;

if (isNil ("RydHQH_Orderfirst")) then {RydHQH_Orderfirst = true;RydHQH_FlankReady = false};

if (RydHQH_NObj == 1) then {RydHQH_Obj = RydHQH_Obj1};
if (RydHQH_NObj == 2) then {RydHQH_Obj = RydHQH_Obj2};
if (RydHQH_NObj == 3) then {RydHQH_Obj = RydHQH_Obj3};
if (RydHQH_NObj >= 4) then {RydHQH_Obj = RydHQH_Obj4};

_Trg = RydHQH_Obj;

_landE = RydHQH_KnEnemiesG - (RydHQH_EnNavalG + RydHQH_EnAirG);
if ((count _landE) > 0) then 
	{

	for [{_a = 0},{_a < (count _landE)},{_a = _a + 1}] do
		{
		_enemy = leader (_landE select _a);
		_distance = leaderHQH distance _enemy;
		_distances = _distances + [_distance];
		};

	RydHQH_NearestE = _landE select 0;

		{
		for [{_r = 0},{_r < (count _distances)},{_r = _r + 1}] do
			{
			_distance = _distances select _r;
			if (isNil ("_distance")) then {_distance = 10000};
			if (_distance <= _x) then {RydHQH_NearestE = _landE select _r};
			if (isNull RydHQH_NearestE) then {RydHQH_NearestE = _landE select 0}
			}
		}
	foreach _distances;

	_Trg = (leader RydHQH_NearestE);
	};
_PosObj1 = position _Trg;
if (isNil ("RydHQH_ReconReserve")) then {RydHQH_ReconReserve = (0.3 * (0.5 + RydHQH_Circumspection))};

RydHQH_ReconAv = [];
_onlyL = RydHQH_LArmorG - RydHQH_MArmorG;

	{
	if not (isNull _x) then
		{
		_unitvar = str _x;
		if (RydHQH_Orderfirst) then {_x setVariable ["Nominal" + _unitvar,(count (units _x))]};
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

		if (((_Gdamage/(_current + 0.1)) > (0.4*((RydHQH_Recklessness/1.2) + 1))) or not (_effective) or not (_ammo)) then 
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
			if (not (isNull _veh) and (not (canMove _veh) or ((fuel _veh) <= 0.1) or ((damage _veh) > 0.5) or (((group _x) in ((RydHQH_AirG - (RydHQH_NCAirG + RydHQH_RAirG)) + (RydHQH_HArmorG + RydHQH_LArmorG + (RydHQH_CarsG - (RydHQH_NCCargoG + RydHQH_SupportG))))) and ((count (magazines _veh)) == 0)))) exitwith {_vehready = false};
			}
		foreach (units _x);

		if (not (_x in (RydHQH_ReconAv + RydHQH_SpecForG)) and not (_busy) and (_vehready) and ((_solready) or (_x in RydHQH_RAirG))) then {RydHQH_ReconAv set [(count RydHQH_ReconAv),_x]};
		}
	}
foreach ((RydHQH_RAirG + RydHQH_ReconG + RydHQH_FOG + RydHQH_SnipersG + RydHQH_NCrewInfG - (RydHQH_SupportG + RydHQH_NCCargoG) + _onlyL) - (RydHQH_AOnly + RydHQH_CargoOnly));

RydHQH_ReconAv = [RydHQH_ReconAv] call RYD_RandomOrd;

if (RydHQH_ReconReserve > 0) then 
	{
	_forRRes = (RydHQH_ReconAv - RydHQH_RAirG);
	for [{_b = 0},{_b < (floor ((count _forRRes)*RydHQH_ReconReserve))},{_b = _b + 1}] do
		{
		_RRp = _forRRes select _b;
		RydHQH_ReconAv = RydHQH_ReconAv - [_RRp];
		}
	};

RydHQH_AttackAv = [];
RydHQH_FlankAv = [];

if (isNil ("RydHQH_Exhausted")) then {RydHQH_Exhausted = []};
//if (isNil ("RydHQH_FlankAv")) then {RydHQH_FlankAv = []};

if (isNil ("RydHQH_AttackReserve")) then {RydHQH_AttackReserve = (0.5 * (0.5 + (RydHQH_Circumspection/1.5)))};

	{
	if not (isNull _x) then
		{
		_unitvar = str _x;
		if (RydHQH_Orderfirst) then {_x setVariable [("Nominal" + _unitvar),(count (units _x))]};
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
		if (((_Gdamage/(_current + 0.1)) > (0.4*((RydHQH_Recklessness/1.2) + 1))) or not (_effective) or not (_ammo)) then {_solready = false};
		_ammo = 0;

			{
			_veh = assignedvehicle _x;
			if (not (isNull _veh) and (not (canMove _veh) or ((fuel _veh) <= 0.1) or ((damage _veh) > 0.5) or (((group _x) in ((RydHQH_AirG - RydHQH_NCAirG) + (RydHQH_HArmorG + RydHQH_LArmorG + (RydHQH_CarsG - (RydHQH_NCCargoG + RydHQH_SupportG))))) and ((count (magazines _veh)) == 0)))) exitwith {_vehready = false};
			}
		foreach (units _x);
		
		if (not (_x in RydHQH_AttackAv) and not (_busy) and not (_x in RydHQH_FlankAv) and (_vehready) and (_solready) and not (_x in (RydHQH_StaticG + RydHQH_ArtG + RydHQH_NavalG + RydHQH_SpecForG + RydHQH_CargoOnly))) then {RydHQH_AttackAv set [(count RydHQH_AttackAv),_x]};
		if (not (_x in RydHQH_Exhausted) and (not (_vehready) or not (_solready))) then {RydHQH_Exhausted = RydHQH_Exhausted + [_x]};
	 
		if ((RydHQH_Withdraw > 0) and not (_x in (RydHQH_SpecForG + RydHQH_SnipersG))) then
			{
			_inD = _x getVariable "NearE";
			if (isNil "_inD") then {_inD = 0};
			if (not (_x in RydHQH_Exhausted) and ((random (2 + RydHQH_Recklessness)) < (_inD * RydHQH_Withdraw))) then {RydHQH_Exhausted set [(count RydHQH_Exhausted),_x]}; 
			};
		}
	}
foreach ((RydHQH_Friends - (RydHQH_reconG + RydHQH_FOG + (RydHQH_NCCargoG - RydHQH_NCrewInfG) + RydHQH_SupportG)) - RydHQH_ROnly);
RydHQH_AttackAv = [RydHQH_AttackAv] call RYD_RandomOrd;
if (RydHQH_AttackReserve > 0) then 
	{
	for [{_g = 0},{_g < floor ((count RydHQH_AttackAv)*RydHQH_AttackReserve)},{_g = _g + 1}] do
		{
		_ResC = RydHQH_AttackAv select _g;
		if not (_ResC in RydHQH_FirstToFight) then 
			{
			RydHQH_AttackAv = RydHQH_AttackAv - [_ResC];
			if not (RydHQH_FlankingDone) then {if ((random 100 > (30/(0.5 + RydHQH_Fineness))) and not (_ResC in RydHQH_FlankAv)) then {RydHQH_FlankAv set [(count RydHQH_FlankAv),_ResC]}}
			};
		}
	};

RydHQH_FlankAv = RydHQH_FlankAv - RydHQH_NoFlank;

if (not (RydHQH_FlankingInit) and not (RydHQH_Order == "DEFEND")) then {[] spawn H_Flanking};

_stages = 3;
if ([] call RYD_isNight) then {_stages = 5};

_rcheckArr = [RydHQH_Garrison,RydHQH_ReconAv,RydHQH_FlankAv,RydHQH_AOnly,RydHQH_Exhausted,RydHQH_NCCargoG,_Trg,RydHQH_NCVeh];

if ((RydHQH_NoRec * (RydHQH_Recklessness + 0.01)) < (random 100)) then 
	{
	if ((count RydHQH_KnEnemiesG) == 0) then
		{
		if (not ((count RydHQH_RAirG) == 0) and ((count RydHQH_ReconAv) > 0) and not (RydHQH_ReconDone) and not (RydHQH_ReconStage > _stages)) then
			{
			_gps = [RydHQH_RAirG,"R",_rcheckArr,20000,true] call RYD_Recon;

				{
				if (RydHQH_ReconStage > _stages) exitWith {};
				RydHQH_ReconStage = RydHQH_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQH_ReconStage] spawn H_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQH_reconG) == 0) and ((count RydHQH_ReconAv) > 0) and not (RydHQH_ReconDone) and not (RydHQH_ReconStage > _stages)) then
			{
			_gps = [RydHQH_ReconG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQH_ReconStage > _stages) exitWith {};
				RydHQH_ReconStage = RydHQH_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQH_ReconStage] spawn H_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQH_FOG) == 0) and ((count RydHQH_ReconAv) > 0) and not (RydHQH_ReconDone) and not (RydHQH_ReconStage > _stages)) then
			{
			_gps = [RydHQH_FOG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQH_ReconStage > _stages) exitWith {};
				RydHQH_ReconStage = RydHQH_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQH_ReconStage] spawn H_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQH_snipersG) == 0) and ((count RydHQH_ReconAv) > 0) and not (RydHQH_ReconDone) and not (RydHQH_ReconStage > _stages)) then
			{
			_gps = [RydHQH_snipersG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQH_ReconStage > _stages) exitWith {};
				RydHQH_ReconStage = RydHQH_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQH_ReconStage] spawn H_GoRecon;
				}
			foreach _gps
			};

		_onlyL = RydHQH_LArmorG - RydHQH_MArmorG;
		if (not ((count _onlyL) == 0) and ((count RydHQH_ReconAv) > 0) and not (RydHQH_ReconDone) and not (RydHQH_ReconStage > _stages)) then
			{
			_gps = [_onlyL,"R",_rcheckArr,20000,false] call RYD_Recon;

				{
				if (RydHQH_ReconStage > _stages) exitWith {};
				RydHQH_ReconStage = RydHQH_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQH_ReconStage] spawn H_GoRecon;
				}
			foreach _gps
			};

		if (not ((count (RydHQH_NCrewInfG - RydHQH_SpecForG)) == 0) and ((count RydHQH_ReconAv) > 0) and not (RydHQH_ReconDone) and not (RydHQH_ReconStage > _stages)) then
			{
			_gps = [(RydHQH_NCrewInfG - RydHQH_SpecForG),"NR",_rcheckArr,10000,false] call RYD_Recon;

				{
				if (RydHQH_ReconStage > _stages) exitWith {};
				RydHQH_ReconStage = RydHQH_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQH_ReconStage] spawn H_GoRecon;
				}
			foreach _gps
			};

		_LMCUA = RydHQH_Friends - (RydHQH_NavalG + RydHQH_StaticG + RydHQH_SupportG + RydHQH_ArtG + RydHQH_AOnly + RydHQH_SpecForG + RydHQH_CargoOnly);
		if (not ((count _LMCUA) == 0) and not (RydHQH_ReconDone) and not (RydHQH_ReconStage > _stages)) then
			{
			_gps = [_LMCUA,"NR",_rcheckArr,20000,false] call RYD_Recon;

				{
				if (RydHQH_ReconStage > _stages) exitWith {};
				RydHQH_ReconStage = RydHQH_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQH_ReconStage] spawn H_GoRecon;
				}
			foreach _gps
			}
		}
	}
else
	{
	RydHQH_ReconDone = true
	};

if (isNil ("RydHQH_IdleOrd")) then {RydHQH_IdleOrd = true};

_reserve = RydHQH_Friends - (RydHQH_SpecForG + RydHQH_CargoOnly + RydHQH_AOnly + RydHQH_ROnly + RydHQH_Exhausted + RydHQH_ArtG + RydHQH_AirG + RydHQH_NavalG + RydHQH_StaticG + RydHQH_SupportG + (RydHQH_NCCargoG - (RydHQH_NCrewInfG + RydHQH_SupportG)));
if (not (RydHQH_ReconDone) and ((count RydHQH_KnEnemies) == 0)) exitwith 
	{
	if (RydHQH_Orderfirst) then 
		{
		RydHQH_Orderfirst = false
		};

		{
		_recvar = str _x;
		_resting = false;
		_resting = _x getvariable ("Resting" + _recvar);
		if (isNil ("_resting")) then {_resting = false};
		if not (_resting) then {[_x] spawn H_GoRest }
		}
	foreach (RydHQH_Exhausted - (RydHQH_AirG + RydHQH_StaticG + RydHQH_ArtG + RydHQH_NavalG));

	if (RydHQH_IdleOrd) then
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
			if (not (_busy) and ((count (waypoints _x)) <= 1) and not (_deployed) and not (_capturing) and (not (_x in RydHQH_NCCargoG) or ((count (units _x)) > 1))) then {deleteWaypoint ((waypoints _x) select 0);[_x] spawn H_GoIdle }
			}
		foreach _reserve;
		};

	RydxHQ_Done = true;
	};

RydHQH_FlankReady = true;

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

	if ((_x in RydHQH_Enrecon) and not (_GE in _reconthreat) and not (_checked)) then {_reconthreat set [(count _reconthreat),_GE]};
	if ((_x in RydHQH_EnFO) and not (_GE in _FOthreat) and not (_checked)) then {_FOthreat set [(count _FOthreat),_GE]};
	if ((_x in RydHQH_Ensnipers) and not (_GE in _snipersthreat) and not (_checked)) then {_snipersthreat set [(count _snipersthreat),_GE]};
	if ((_x in RydHQH_EnATinf) and not (_GE in _ATinfthreat) and not (_checked)) then {_ATinfthreat set [(count _ATinfthreat),_GE]};
	if ((_x in RydHQH_EnAAinf) and not (_GE in _AAinfthreat) and not (_checked)) then {_AAinfthreat set [(count _AAinfthreat),_GE]};
	if ((_x in RydHQH_EnInf) and not (_GE in _Infthreat) and not (_checked)) then {_Infthreat set [(count _Infthreat),_GE]};
	if ((_x in RydHQH_EnArt) and not (_GE in _Artthreat) and not (_checked)) then {_Artthreat set [(count _Artthreat),_GE]};
	if ((_x in RydHQH_EnHArmor) and not (_GE in _LArmorthreat) and not (_checked)) then {_LArmorthreat set [(count _LArmorthreat),_GE]};
	if ((_x in RydHQH_EnLArmor) and not (_GE in _reconthreat) and not (_checked)) then {_reconthreat set [(count _reconthreat),_GE]};
	if ((_x in RydHQH_EnLArmorAT) and not (_GE in _LArmorATthreat) and not (_checked)) then {_LArmorATthreat set [(count _LArmorATthreat),_GE]};
	if ((_x in RydHQH_EnCars) and not (_GE in _Carsthreat) and not (_checked)) then {_Carsthreat set [(count _Carsthreat),_GE]};
	if ((_x in RydHQH_EnAir) and not (_GE in _Airthreat) and not (_checked)) then {_Airthreat set [(count _Airthreat),_GE]};
	if ((_x in RydHQH_EnNaval) and not (_GE in _Navalthreat) and not (_checked)) then {_Navalthreat set [(count _Navalthreat),_GE]};
	if ((_x in RydHQH_EnStatic) and not (_GE in _Staticthreat) and not (_checked)) then {_Staticthreat set [(count _Staticthreat),_GE]};
	if ((_x in RydHQH_EnStaticAA) and not (_GE in _StaticAAthreat) and not (_checked)) then {_StaticAAthreat set [(count _StaticAAthreat),_GE]};
	if ((_x in RydHQH_EnStaticAT) and not (_GE in _StaticATthreat) and not (_checked)) then {_StaticATthreat set [(count _StaticATthreat),_GE]};
	if ((_x in RydHQH_EnSupport) and not (_GE in _Supportthreat) and not (_checked)) then {_Supportthreat set [(count _Supportthreat),_GE]};
	if ((_x in RydHQH_EnCargo) and not (_GE in _Cargothreat) and not (_checked)) then {_Cargothreat set [(count _Cargothreat),_GE]};

	if ((_x in RydHQH_EnInf) and ((vehicle _x) in RydHQH_EnCargo) and not (_x in RydHQH_EnCrew) and not (_GE in _Infthreat) and not (_checked)) then {_Infthreat set [(count _Infthreat),_GE]};

	if ((isNil ("_checked")) or not (_checked)) then {_GE setVariable [("Checked" + _GEvar), true]};
	}
foreach RydHQH_KnEnemies;

RydHQH_AAthreat = (_AAinfthreat + _StaticAAthreat);
RydHQH_ATthreat = (_ATinfthreat + _StaticATthreat + _HArmorthreat + _LArmorATthreat);
RydHQH_Airthreat = _Airthreat;
_reconthreat = _reconthreat - _Airthreat;

_FPool = 
	[
	RydHQH_snipersG,
	RydHQH_NCrewInfG - RydHQH_SpecForG,
	RydHQH_AirG - (RydHQH_NCAirG + RydHQH_NCrewInfG),
	RydHQH_LArmorG,
	RydHQH_HArmorG,
	RydHQH_CarsG - (RydHQH_ATInfG + RydHQH_AAInfG + RydHQH_SupportG + RydHQH_NCCargoG),
	RydHQH_LArmorATG,
	RydHQH_ATInfG,
	RydHQH_AAInfG,
	RydHQH_Recklessness,
	RydHQH_AttackAv,
	RydHQH_Garrison,
	RydHQH_GarrR,
	RydHQH_FlankAv,
	RydHQH_AirG,
	RydHQH_NCVeh
	];

_constant = [RydHQH_AAthreat,RydHQH_ATthreat,_HArmorthreat + _LArmorATthreat,_FPool];

if (count (_reconthreat + _FOthreat + _snipersthreat) > 0) then 
	{
	([_reconthreat + _FOthreat + _snipersthreat,"Recon","H",0,0,0] + _constant) call RYD_Dispatcher;
	};

if (count _ATinfthreat > 0) then 
	{
	([_ATinfthreat,"ATInf","H",0,0,85] + _constant) call RYD_Dispatcher;
	};

if (count _Infthreat > 0) then 
	{
	([_Infthreat,"Inf","H",75,80,85] + _constant) call RYD_Dispatcher;
	};

if (count (_LArmorthreat + _HArmorthreat) > 0) then 
	{
	([_LArmorthreat + _HArmorthreat,"Armor","H",50,0,85] + _constant) call RYD_Dispatcher;
	};

if (count _Carsthreat > 0) then 
	{
	([_Carsthreat,"Cars","H",75,80,85] + _constant) call RYD_Dispatcher;
	};

if (count _Artthreat > 0) then 
	{
	([_Artthreat,"Art","H",70,75,75] + _constant) call RYD_Dispatcher;
	};

if (count _Airthreat > 0) then 
	{
	([_Airthreat,"Air","H",0,0,75] + _constant) call RYD_Dispatcher;
	};

if (count (_Staticthreat - _Artthreat) > 0) then 
	{
	([_Staticthreat - _Artthreat,"Static","H",75,80,85] + _constant) call RYD_Dispatcher;
	};

/////////////////////////////////////////
// Capture Objective

_Trg = RydHQH_Obj;

	{
	_x setVariable [("Capturing" + (str _x)),[0,0]]
	}
foreach ([RydHQH_Obj1,RydHQH_Obj2,RydHQH_Obj3,RydHQH_Obj4] - [RydHQH_Obj]);

if (isNil ("_Trg")) then {_Trg = leaderHQH};

_isAttacked = _Trg getvariable ("Capturing" + (str _Trg));

if (isNil ("_isAttacked")) then {_isAttacked = [0,0]};

_captCount = _isAttacked select 1;
_isAttacked = _isAttacked select 0;
_captLimit = RydHQH_CaptLimit * (1 + (RydHQH_Circumspection/(2 + RydHQH_Recklessness)));
if ((_isAttacked <= 3) or (_captCount < _captLimit)) then
	{	
	if ((not (RydHQH_NObj > 4) and ((random 100) > ((count RydHQH_KnEnemies)*(5/(0.5 + (2*RydHQH_Recklessness))))) and not 
		(RydHQH_Orderfirst) and 
			((random 100) < ((((count RydHQH_Friends)*(0.5 + RydHQH_Recklessness))/(5*(0.5 + count RydHQH_KnEnemiesG)))*((RydHQH_Cyclecount - 5)*2*(1 + RydHQH_Recklessness))))) or
				(((RydHQH_RapidCapt * (RydHQH_Recklessness + 0.01)) > (random 100)) and (RydHQH_NObj <= 4))) then   
		{
		_checked = [];
		_forCapt = RydHQH_NCrewInfG - (RydHQH_SupportG + RydHQH_SpecForG + RydHQH_CargoOnly + RydHQH_Garrison);
		_forCapt = [_forCapt] call RYD_SizeOrd;
		if (not ((count _forCapt) == 0) and ((count RydHQH_AttackAv) > 0)) then
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
					if (_x in RydHQH_AttackAv) then
						{
						if (((leader _x) distance _Trg) <= _m) then
							{
							if (not (_x in RydHQH_NCCargoG) or ((count (units _x)) > 1)) then 
								{
								_ammo = [_x,RydHQH_NCVeh] call RYD_AmmoCount;
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

										[_x,_isAttacked] spawn H_GoCapture;
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

		_LMCU = RydHQH_Friends - ((RydHQH_AirG - RydHQH_NCrewInfG) + RydHQH_SpecForG + RydHQH_CargoOnly + RydHQH_NavalG + RydHQH_StaticG + RydHQH_SupportG + RydHQH_ArtG + RydHQH_Garrison + (RydHQH_NCCargoG - (RydHQH_NCrewInfG - RydHQH_SupportG)));
		_LMCU = [_LMCU] call RYD_SizeOrd;
		if (not ((count _LMCU) == 0) and ((count RydHQH_AttackAv) > 0)) then
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
					if (_x in RydHQH_AttackAv) then
						{
						if (((leader _x) distance _Trg) <= _m) then
							{
							_ammo = [_x,RydHQH_NCVeh] call RYD_AmmoCount;
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

									[_x,_isAttacked] spawn H_GoCapture;
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

if (RydHQH_IdleOrd) then
	{
	_reserve = RydHQH_Friends - (RydHQH_SpecForG + RydHQH_CargoOnly + RydHQH_AOnly + RydHQH_ROnly + RydHQH_Exhausted + RydHQH_ArtG + RydHQH_AirG + RydHQH_NavalG + RydHQH_StaticG + (RydHQH_NCCargoG - (RydHQH_NCrewInfG + RydHQH_SupportG)));
		
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
		if (not (_busy) and ((count (waypoints _x)) <= 1) and not (_deployed) and not (_capturing) and (not (_x in RydHQH_NCCargoG) or ((count (units _x)) > 1))) then {deleteWaypoint ((waypoints _x) select 0);[_x] spawn H_GoIdle};
		}
	foreach _reserve
	};

	{
	_recvar = str _x;
	_resting = false;
	_resting = _x getvariable ("Resting" + _recvar);
	if (isNil ("_resting")) then {_resting = false};
	if not (_resting) then {[_x] spawn H_GoRest }
	}
foreach (RydHQH_Exhausted - (RydHQH_AirG + RydHQH_StaticG + RydHQH_ArtG + RydHQH_NavalG));

	{
	_GE = (group _x);
	_GEvar = str _GE;
	_GE setvariable [("Checked" + _GEvar),false];
	}
foreach RydHQH_KnEnemies;

if (RydHQH_Orderfirst) then {RydHQH_Orderfirst = false};

RydxHQ_Done = true;