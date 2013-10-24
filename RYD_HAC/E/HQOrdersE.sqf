
RydHQE_DefDone = false;

_distances = [];

_Trg = leaderHQE;

RydHQE_NearestE = ObjNull;

if (isNil ("RydHQE_Orderfirst")) then {RydHQE_Orderfirst = true;RydHQE_FlankReady = false};

if (RydHQE_NObj == 1) then {RydHQE_Obj = RydHQE_Obj1};
if (RydHQE_NObj == 2) then {RydHQE_Obj = RydHQE_Obj2};
if (RydHQE_NObj == 3) then {RydHQE_Obj = RydHQE_Obj3};
if (RydHQE_NObj >= 4) then {RydHQE_Obj = RydHQE_Obj4};

_Trg = RydHQE_Obj;

_landE = RydHQE_KnEnemiesG - (RydHQE_EnNavalG + RydHQE_EnAirG);
if ((count _landE) > 0) then 
	{

	for [{_a = 0},{_a < (count _landE)},{_a = _a + 1}] do
		{
		_enemy = leader (_landE select _a);
		_distance = leaderHQE distance _enemy;
		_distances = _distances + [_distance];
		};

	RydHQE_NearestE = _landE select 0;

		{
		for [{_r = 0},{_r < (count _distances)},{_r = _r + 1}] do
			{
			_distance = _distances select _r;
			if (isNil ("_distance")) then {_distance = 10000};
			if (_distance <= _x) then {RydHQE_NearestE = _landE select _r};
			if (isNull RydHQE_NearestE) then {RydHQE_NearestE = _landE select 0}
			}
		}
	foreach _distances;

	_Trg = (leader RydHQE_NearestE);
	};
_PosObj1 = position _Trg;
if (isNil ("RydHQE_ReconReserve")) then {RydHQE_ReconReserve = (0.3 * (0.5 + RydHQE_Circumspection))};

RydHQE_ReconAv = [];
_onlyL = RydHQE_LArmorG - RydHQE_MArmorG;

	{
	if not (isNull _x) then
		{
		_unitvar = str _x;
		if (RydHQE_Orderfirst) then {_x setVariable ["Nominal" + _unitvar,(count (units _x))]};
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

		if (((_Gdamage/(_current + 0.1)) > (0.4*((RydHQE_Recklessness/1.2) + 1))) or not (_effective) or not (_ammo)) then 
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
			if (not (isNull _veh) and (not (canMove _veh) or ((fuel _veh) <= 0.1) or ((damage _veh) > 0.5) or (((group _x) in ((RydHQE_AirG - (RydHQE_NCAirG + RydHQE_RAirG)) + (RydHQE_HArmorG + RydHQE_LArmorG + (RydHQE_CarsG - (RydHQE_NCCargoG + RydHQE_SupportG))))) and ((count (magazines _veh)) == 0)))) exitwith {_vehready = false};
			}
		foreach (units _x);

		if (not (_x in (RydHQE_ReconAv + RydHQE_SpecForG)) and not (_busy) and (_vehready) and ((_solready) or (_x in RydHQE_RAirG))) then {RydHQE_ReconAv set [(count RydHQE_ReconAv),_x]};
		}
	}
foreach ((RydHQE_RAirG + RydHQE_ReconG + RydHQE_FOG + RydHQE_SnipersG + RydHQE_NCrewInfG - (RydHQE_SupportG + RydHQE_NCCargoG) + _onlyL) - (RydHQE_AOnly + RydHQE_CargoOnly));

RydHQE_ReconAv = [RydHQE_ReconAv] call RYD_RandomOrd;

if (RydHQE_ReconReserve > 0) then 
	{
	_forRRes = (RydHQE_ReconAv - RydHQE_RAirG);
	for [{_b = 0},{_b < (floor ((count _forRRes)*RydHQE_ReconReserve))},{_b = _b + 1}] do
		{
		_RRp = _forRRes select _b;
		RydHQE_ReconAv = RydHQE_ReconAv - [_RRp];
		}
	};

RydHQE_AttackAv = [];
RydHQE_FlankAv = [];

if (isNil ("RydHQE_Exhausted")) then {RydHQE_Exhausted = []};
//if (isNil ("RydHQE_FlankAv")) then {RydHQE_FlankAv = []};

if (isNil ("RydHQE_AttackReserve")) then {RydHQE_AttackReserve = (0.5 * (0.5 + (RydHQE_Circumspection/1.5)))};

	{
	if not (isNull _x) then
		{
		_unitvar = str _x;
		if (RydHQE_Orderfirst) then {_x setVariable [("Nominal" + _unitvar),(count (units _x))]};
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
		if (((_Gdamage/(_current + 0.1)) > (0.4*((RydHQE_Recklessness/1.2) + 1))) or not (_effective) or not (_ammo)) then {_solready = false};
		_ammo = 0;

			{
			_veh = assignedvehicle _x;
			if (not (isNull _veh) and (not (canMove _veh) or ((fuel _veh) <= 0.1) or ((damage _veh) > 0.5) or (((group _x) in ((RydHQE_AirG - RydHQE_NCAirG) + (RydHQE_HArmorG + RydHQE_LArmorG + (RydHQE_CarsG - (RydHQE_NCCargoG + RydHQE_SupportG))))) and ((count (magazines _veh)) == 0)))) exitwith {_vehready = false};
			}
		foreach (units _x);
		
		if (not (_x in RydHQE_AttackAv) and not (_busy) and not (_x in RydHQE_FlankAv) and (_vehready) and (_solready) and not (_x in (RydHQE_StaticG + RydHQE_ArtG + RydHQE_NavalG + RydHQE_SpecForG + RydHQE_CargoOnly))) then {RydHQE_AttackAv set [(count RydHQE_AttackAv),_x]};
		if (not (_x in RydHQE_Exhausted) and (not (_vehready) or not (_solready))) then {RydHQE_Exhausted = RydHQE_Exhausted + [_x]};
	 
		if ((RydHQE_Withdraw > 0) and not (_x in (RydHQE_SpecForG + RydHQE_SnipersG))) then
			{
			_inD = _x getVariable "NearE";
			if (isNil "_inD") then {_inD = 0};
			if (not (_x in RydHQE_Exhausted) and ((random (2 + RydHQE_Recklessness)) < (_inD * RydHQE_Withdraw))) then {RydHQE_Exhausted set [(count RydHQE_Exhausted),_x]}; 
			};
		}
	}
foreach ((RydHQE_Friends - (RydHQE_reconG + RydHQE_FOG + (RydHQE_NCCargoG - RydHQE_NCrewInfG) + RydHQE_SupportG)) - RydHQE_ROnly);
RydHQE_AttackAv = [RydHQE_AttackAv] call RYD_RandomOrd;
if (RydHQE_AttackReserve > 0) then 
	{
	for [{_g = 0},{_g < floor ((count RydHQE_AttackAv)*RydHQE_AttackReserve)},{_g = _g + 1}] do
		{
		_ResC = RydHQE_AttackAv select _g;
		if not (_ResC in RydHQE_FirstToFight) then 
			{
			RydHQE_AttackAv = RydHQE_AttackAv - [_ResC];
			if not (RydHQE_FlankingDone) then {if ((random 100 > (30/(0.5 + RydHQE_Fineness))) and not (_ResC in RydHQE_FlankAv)) then {RydHQE_FlankAv set [(count RydHQE_FlankAv),_ResC]}}
			};
		}
	};

RydHQE_FlankAv = RydHQE_FlankAv - RydHQE_NoFlank;

if (not (RydHQE_FlankingInit) and not (RydHQE_Order == "DEFEND")) then {[] spawn E_Flanking};

_stages = 3;
if ([] call RYD_isNight) then {_stages = 5};

_rcheckArr = [RydHQE_Garrison,RydHQE_ReconAv,RydHQE_FlankAv,RydHQE_AOnly,RydHQE_Exhausted,RydHQE_NCCargoG,_Trg,RydHQE_NCVeh];

if ((RydHQE_NoRec * (RydHQE_Recklessness + 0.01)) < (random 100)) then 
	{
	if ((count RydHQE_KnEnemiesG) == 0) then
		{
		if (not ((count RydHQE_RAirG) == 0) and ((count RydHQE_ReconAv) > 0) and not (RydHQE_ReconDone) and not (RydHQE_ReconStage > _stages)) then
			{
			_gps = [RydHQE_RAirG,"R",_rcheckArr,20000,true] call RYD_Recon;

				{
				if (RydHQE_ReconStage > _stages) exitWith {};
				RydHQE_ReconStage = RydHQE_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQE_ReconStage] spawn E_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQE_reconG) == 0) and ((count RydHQE_ReconAv) > 0) and not (RydHQE_ReconDone) and not (RydHQE_ReconStage > _stages)) then
			{
			_gps = [RydHQE_ReconG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQE_ReconStage > _stages) exitWith {};
				RydHQE_ReconStage = RydHQE_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQE_ReconStage] spawn E_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQE_FOG) == 0) and ((count RydHQE_ReconAv) > 0) and not (RydHQE_ReconDone) and not (RydHQE_ReconStage > _stages)) then
			{
			_gps = [RydHQE_FOG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQE_ReconStage > _stages) exitWith {};
				RydHQE_ReconStage = RydHQE_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQE_ReconStage] spawn E_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQE_snipersG) == 0) and ((count RydHQE_ReconAv) > 0) and not (RydHQE_ReconDone) and not (RydHQE_ReconStage > _stages)) then
			{
			_gps = [RydHQE_snipersG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQE_ReconStage > _stages) exitWith {};
				RydHQE_ReconStage = RydHQE_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQE_ReconStage] spawn E_GoRecon;
				}
			foreach _gps
			};

		_onlyL = RydHQE_LArmorG - RydHQE_MArmorG;
		if (not ((count _onlyL) == 0) and ((count RydHQE_ReconAv) > 0) and not (RydHQE_ReconDone) and not (RydHQE_ReconStage > _stages)) then
			{
			_gps = [_onlyL,"R",_rcheckArr,20000,false] call RYD_Recon;

				{
				if (RydHQE_ReconStage > _stages) exitWith {};
				RydHQE_ReconStage = RydHQE_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQE_ReconStage] spawn E_GoRecon;
				}
			foreach _gps
			};

		if (not ((count (RydHQE_NCrewInfG - RydHQE_SpecForG)) == 0) and ((count RydHQE_ReconAv) > 0) and not (RydHQE_ReconDone) and not (RydHQE_ReconStage > _stages)) then
			{
			_gps = [(RydHQE_NCrewInfG - RydHQE_SpecForG),"NR",_rcheckArr,10000,false] call RYD_Recon;

				{
				if (RydHQE_ReconStage > _stages) exitWith {};
				RydHQE_ReconStage = RydHQE_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQE_ReconStage] spawn E_GoRecon;
				}
			foreach _gps
			};

		_LMCUA = RydHQE_Friends - (RydHQE_NavalG + RydHQE_StaticG + RydHQE_SupportG + RydHQE_ArtG + RydHQE_AOnly + RydHQE_SpecForG + RydHQE_CargoOnly);
		if (not ((count _LMCUA) == 0) and not (RydHQE_ReconDone) and not (RydHQE_ReconStage > _stages)) then
			{
			_gps = [_LMCUA,"NR",_rcheckArr,20000,false] call RYD_Recon;

				{
				if (RydHQE_ReconStage > _stages) exitWith {};
				RydHQE_ReconStage = RydHQE_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQE_ReconStage] spawn E_GoRecon;
				}
			foreach _gps
			}
		}
	}
else
	{
	RydHQE_ReconDone = true
	};

if (isNil ("RydHQE_IdleOrd")) then {RydHQE_IdleOrd = true};

_reserve = RydHQE_Friends - (RydHQE_SpecForG + RydHQE_CargoOnly + RydHQE_AOnly + RydHQE_ROnly + RydHQE_Exhausted + RydHQE_ArtG + RydHQE_AirG + RydHQE_NavalG + RydHQE_StaticG + RydHQE_SupportG + (RydHQE_NCCargoG - (RydHQE_NCrewInfG + RydHQE_SupportG)));
if (not (RydHQE_ReconDone) and ((count RydHQE_KnEnemies) == 0)) exitwith 
	{
	if (RydHQE_Orderfirst) then 
		{
		RydHQE_Orderfirst = false
		};

		{
		_recvar = str _x;
		_resting = false;
		_resting = _x getvariable ("Resting" + _recvar);
		if (isNil ("_resting")) then {_resting = false};
		if not (_resting) then {[_x] spawn E_GoRest }
		}
	foreach (RydHQE_Exhausted - (RydHQE_AirG + RydHQE_StaticG + RydHQE_ArtG + RydHQE_NavalG));

	if (RydHQE_IdleOrd) then
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
			if (not (_busy) and ((count (waypoints _x)) <= 1) and not (_deployed) and not (_capturing) and (not (_x in RydHQE_NCCargoG) or ((count (units _x)) > 1))) then {deleteWaypoint ((waypoints _x) select 0);[_x] spawn E_GoIdle }
			}
		foreach _reserve;
		};

	RydxHQ_Done = true;
	};

RydHQE_FlankReady = true;

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

	if ((_x in RydHQE_Enrecon) and not (_GE in _reconthreat) and not (_checked)) then {_reconthreat set [(count _reconthreat),_GE]};
	if ((_x in RydHQE_EnFO) and not (_GE in _FOthreat) and not (_checked)) then {_FOthreat set [(count _FOthreat),_GE]};
	if ((_x in RydHQE_Ensnipers) and not (_GE in _snipersthreat) and not (_checked)) then {_snipersthreat set [(count _snipersthreat),_GE]};
	if ((_x in RydHQE_EnATinf) and not (_GE in _ATinfthreat) and not (_checked)) then {_ATinfthreat set [(count _ATinfthreat),_GE]};
	if ((_x in RydHQE_EnAAinf) and not (_GE in _AAinfthreat) and not (_checked)) then {_AAinfthreat set [(count _AAinfthreat),_GE]};
	if ((_x in RydHQE_EnInf) and not (_GE in _Infthreat) and not (_checked)) then {_Infthreat set [(count _Infthreat),_GE]};
	if ((_x in RydHQE_EnArt) and not (_GE in _Artthreat) and not (_checked)) then {_Artthreat set [(count _Artthreat),_GE]};
	if ((_x in RydHQE_EnHArmor) and not (_GE in _LArmorthreat) and not (_checked)) then {_LArmorthreat set [(count _LArmorthreat),_GE]};
	if ((_x in RydHQE_EnLArmor) and not (_GE in _reconthreat) and not (_checked)) then {_reconthreat set [(count _reconthreat),_GE]};
	if ((_x in RydHQE_EnLArmorAT) and not (_GE in _LArmorATthreat) and not (_checked)) then {_LArmorATthreat set [(count _LArmorATthreat),_GE]};
	if ((_x in RydHQE_EnCars) and not (_GE in _Carsthreat) and not (_checked)) then {_Carsthreat set [(count _Carsthreat),_GE]};
	if ((_x in RydHQE_EnAir) and not (_GE in _Airthreat) and not (_checked)) then {_Airthreat set [(count _Airthreat),_GE]};
	if ((_x in RydHQE_EnNaval) and not (_GE in _Navalthreat) and not (_checked)) then {_Navalthreat set [(count _Navalthreat),_GE]};
	if ((_x in RydHQE_EnStatic) and not (_GE in _Staticthreat) and not (_checked)) then {_Staticthreat set [(count _Staticthreat),_GE]};
	if ((_x in RydHQE_EnStaticAA) and not (_GE in _StaticAAthreat) and not (_checked)) then {_StaticAAthreat set [(count _StaticAAthreat),_GE]};
	if ((_x in RydHQE_EnStaticAT) and not (_GE in _StaticATthreat) and not (_checked)) then {_StaticATthreat set [(count _StaticATthreat),_GE]};
	if ((_x in RydHQE_EnSupport) and not (_GE in _Supportthreat) and not (_checked)) then {_Supportthreat set [(count _Supportthreat),_GE]};
	if ((_x in RydHQE_EnCargo) and not (_GE in _Cargothreat) and not (_checked)) then {_Cargothreat set [(count _Cargothreat),_GE]};

	if ((_x in RydHQE_EnInf) and ((vehicle _x) in RydHQE_EnCargo) and not (_x in RydHQE_EnCrew) and not (_GE in _Infthreat) and not (_checked)) then {_Infthreat set [(count _Infthreat),_GE]};

	if ((isNil ("_checked")) or not (_checked)) then {_GE setVariable [("Checked" + _GEvar), true]};
	}
foreach RydHQE_KnEnemies;

RydHQE_AAthreat = (_AAinfthreat + _StaticAAthreat);
RydHQE_ATthreat = (_ATinfthreat + _StaticATthreat + _HArmorthreat + _LArmorATthreat);
RydHQE_Airthreat = _Airthreat;
_reconthreat = _reconthreat - _Airthreat;

_FPool = 
	[
	RydHQE_snipersG,
	RydHQE_NCrewInfG - RydHQE_SpecForG,
	RydHQE_AirG - (RydHQE_NCAirG + RydHQE_NCrewInfG),
	RydHQE_LArmorG,
	RydHQE_HArmorG,
	RydHQE_CarsG - (RydHQE_ATInfG + RydHQE_AAInfG + RydHQE_SupportG + RydHQE_NCCargoG),
	RydHQE_LArmorATG,
	RydHQE_ATInfG,
	RydHQE_AAInfG,
	RydHQE_Recklessness,
	RydHQE_AttackAv,
	RydHQE_Garrison,
	RydHQE_GarrR,
	RydHQE_FlankAv,
	RydHQE_AirG,
	RydHQE_NCVeh
	];

_constant = [RydHQE_AAthreat,RydHQE_ATthreat,_HArmorthreat + _LArmorATthreat,_FPool];

if (count (_reconthreat + _FOthreat + _snipersthreat) > 0) then 
	{
	([_reconthreat + _FOthreat + _snipersthreat,"Recon","E",0,0,0] + _constant) call RYD_Dispatcher;
	};

if (count _ATinfthreat > 0) then 
	{
	([_ATinfthreat,"ATInf","E",0,0,85] + _constant) call RYD_Dispatcher;
	};

if (count _Infthreat > 0) then 
	{
	([_Infthreat,"Inf","E",75,80,85] + _constant) call RYD_Dispatcher;
	};

if (count (_LArmorthreat + _HArmorthreat) > 0) then 
	{
	([_LArmorthreat + _HArmorthreat,"Armor","E",50,0,85] + _constant) call RYD_Dispatcher;
	};

if (count _Carsthreat > 0) then 
	{
	([_Carsthreat,"Cars","E",75,80,85] + _constant) call RYD_Dispatcher;
	};

if (count _Artthreat > 0) then 
	{
	([_Artthreat,"Art","E",70,75,75] + _constant) call RYD_Dispatcher;
	};

if (count _Airthreat > 0) then 
	{
	([_Airthreat,"Air","E",0,0,75] + _constant) call RYD_Dispatcher;
	};

if (count (_Staticthreat - _Artthreat) > 0) then 
	{
	([_Staticthreat - _Artthreat,"Static","E",75,80,85] + _constant) call RYD_Dispatcher;
	};

/////////////////////////////////////////
// Capture Objective

_Trg = RydHQE_Obj;

	{
	_x setVariable [("Capturing" + (str _x)),[0,0]]
	}
foreach ([RydHQE_Obj1,RydHQE_Obj2,RydHQE_Obj3,RydHQE_Obj4] - [RydHQE_Obj]);

if (isNil ("_Trg")) then {_Trg = leaderHQE};

_isAttacked = _Trg getvariable ("Capturing" + (str _Trg));

if (isNil ("_isAttacked")) then {_isAttacked = [0,0]};

_captCount = _isAttacked select 1;
_isAttacked = _isAttacked select 0;
_captLimit = RydHQE_CaptLimit * (1 + (RydHQE_Circumspection/(2 + RydHQE_Recklessness)));
if ((_isAttacked <= 3) or (_captCount < _captLimit)) then
	{	
	if ((not (RydHQE_NObj > 4) and ((random 100) > ((count RydHQE_KnEnemies)*(5/(0.5 + (2*RydHQE_Recklessness))))) and not 
		(RydHQE_Orderfirst) and 
			((random 100) < ((((count RydHQE_Friends)*(0.5 + RydHQE_Recklessness))/(5*(0.5 + count RydHQE_KnEnemiesG)))*((RydHQE_Cyclecount - 5)*2*(1 + RydHQE_Recklessness))))) or
				(((RydHQE_RapidCapt * (RydHQE_Recklessness + 0.01)) > (random 100)) and (RydHQE_NObj <= 4))) then   
		{
		_checked = [];
		_forCapt = RydHQE_NCrewInfG - (RydHQE_SupportG + RydHQE_SpecForG + RydHQE_CargoOnly + RydHQE_Garrison);
		_forCapt = [_forCapt] call RYD_SizeOrd;
		if (not ((count _forCapt) == 0) and ((count RydHQE_AttackAv) > 0)) then
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
					if (_x in RydHQE_AttackAv) then
						{
						if (((leader _x) distance _Trg) <= _m) then
							{
							if (not (_x in RydHQE_NCCargoG) or ((count (units _x)) > 1)) then 
								{
								_ammo = [_x,RydHQE_NCVeh] call RYD_AmmoCount;
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

										[_x,_isAttacked] spawn E_GoCapture;
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

		_LMCU = RydHQE_Friends - ((RydHQE_AirG - RydHQE_NCrewInfG) + RydHQE_SpecForG + RydHQE_CargoOnly + RydHQE_NavalG + RydHQE_StaticG + RydHQE_SupportG + RydHQE_ArtG + RydHQE_Garrison + (RydHQE_NCCargoG - (RydHQE_NCrewInfG - RydHQE_SupportG)));
		_LMCU = [_LMCU] call RYD_SizeOrd;
		if (not ((count _LMCU) == 0) and ((count RydHQE_AttackAv) > 0)) then
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
					if (_x in RydHQE_AttackAv) then
						{
						if (((leader _x) distance _Trg) <= _m) then
							{
							_ammo = [_x,RydHQE_NCVeh] call RYD_AmmoCount;
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

									[_x,_isAttacked] spawn E_GoCapture;
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

if (RydHQE_IdleOrd) then
	{
	_reserve = RydHQE_Friends - (RydHQE_SpecForG + RydHQE_CargoOnly + RydHQE_AOnly + RydHQE_ROnly + RydHQE_Exhausted + RydHQE_ArtG + RydHQE_AirG + RydHQE_NavalG + RydHQE_StaticG + (RydHQE_NCCargoG - (RydHQE_NCrewInfG + RydHQE_SupportG)));
		
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
		if (not (_busy) and ((count (waypoints _x)) <= 1) and not (_deployed) and not (_capturing) and (not (_x in RydHQE_NCCargoG) or ((count (units _x)) > 1))) then {deleteWaypoint ((waypoints _x) select 0);[_x] spawn E_GoIdle};
		}
	foreach _reserve
	};

	{
	_recvar = str _x;
	_resting = false;
	_resting = _x getvariable ("Resting" + _recvar);
	if (isNil ("_resting")) then {_resting = false};
	if not (_resting) then {[_x] spawn E_GoRest }
	}
foreach (RydHQE_Exhausted - (RydHQE_AirG + RydHQE_StaticG + RydHQE_ArtG + RydHQE_NavalG));

	{
	_GE = (group _x);
	_GEvar = str _GE;
	_GE setvariable [("Checked" + _GEvar),false];
	}
foreach RydHQE_KnEnemies;

if (RydHQE_Orderfirst) then {RydHQE_Orderfirst = false};

RydxHQ_Done = true;