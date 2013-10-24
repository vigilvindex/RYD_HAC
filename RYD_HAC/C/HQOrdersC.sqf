
RydHQC_DefDone = false;

_distances = [];

_Trg = leaderHQC;

RydHQC_NearestE = ObjNull;

if (isNil ("RydHQC_Orderfirst")) then {RydHQC_Orderfirst = true;RydHQC_FlankReady = false};

if (RydHQC_NObj == 1) then {RydHQC_Obj = RydHQC_Obj1};
if (RydHQC_NObj == 2) then {RydHQC_Obj = RydHQC_Obj2};
if (RydHQC_NObj == 3) then {RydHQC_Obj = RydHQC_Obj3};
if (RydHQC_NObj >= 4) then {RydHQC_Obj = RydHQC_Obj4};

_Trg = RydHQC_Obj;

_landE = RydHQC_KnEnemiesG - (RydHQC_EnNavalG + RydHQC_EnAirG);
if ((count _landE) > 0) then 
	{

	for [{_a = 0},{_a < (count _landE)},{_a = _a + 1}] do
		{
		_enemy = leader (_landE select _a);
		_distance = leaderHQC distance _enemy;
		_distances = _distances + [_distance];
		};

	RydHQC_NearestE = _landE select 0;

		{
		for [{_r = 0},{_r < (count _distances)},{_r = _r + 1}] do
			{
			_distance = _distances select _r;
			if (isNil ("_distance")) then {_distance = 10000};
			if (_distance <= _x) then {RydHQC_NearestE = _landE select _r};
			if (isNull RydHQC_NearestE) then {RydHQC_NearestE = _landE select 0}
			}
		}
	foreach _distances;

	_Trg = (leader RydHQC_NearestE);
	};
_PosObj1 = position _Trg;
if (isNil ("RydHQC_ReconReserve")) then {RydHQC_ReconReserve = (0.3 * (0.5 + RydHQC_Circumspection))};

RydHQC_ReconAv = [];
_onlyL = RydHQC_LArmorG - RydHQC_MArmorG;

	{
	if not (isNull _x) then
		{
		_unitvar = str _x;
		if (RydHQC_Orderfirst) then {_x setVariable ["Nominal" + _unitvar,(count (units _x))]};
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

		if (((_Gdamage/(_current + 0.1)) > (0.4*((RydHQC_Recklessness/1.2) + 1))) or not (_effective) or not (_ammo)) then 
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
			if (not (isNull _veh) and (not (canMove _veh) or ((fuel _veh) <= 0.1) or ((damage _veh) > 0.5) or (((group _x) in ((RydHQC_AirG - (RydHQC_NCAirG + RydHQC_RAirG)) + (RydHQC_HArmorG + RydHQC_LArmorG + (RydHQC_CarsG - (RydHQC_NCCargoG + RydHQC_SupportG))))) and ((count (magazines _veh)) == 0)))) exitwith {_vehready = false};
			}
		foreach (units _x);

		if (not (_x in (RydHQC_ReconAv + RydHQC_SpecForG)) and not (_busy) and (_vehready) and ((_solready) or (_x in RydHQC_RAirG))) then {RydHQC_ReconAv set [(count RydHQC_ReconAv),_x]};
		}
	}
foreach ((RydHQC_RAirG + RydHQC_ReconG + RydHQC_FOG + RydHQC_SnipersG + RydHQC_NCrewInfG - (RydHQC_SupportG + RydHQC_NCCargoG) + _onlyL) - (RydHQC_AOnly + RydHQC_CargoOnly));

RydHQC_ReconAv = [RydHQC_ReconAv] call RYD_RandomOrd;

if (RydHQC_ReconReserve > 0) then 
	{
	_forRRes = (RydHQC_ReconAv - RydHQC_RAirG);
	for [{_b = 0},{_b < (floor ((count _forRRes)*RydHQC_ReconReserve))},{_b = _b + 1}] do
		{
		_RRp = _forRRes select _b;
		RydHQC_ReconAv = RydHQC_ReconAv - [_RRp];
		}
	};

RydHQC_AttackAv = [];
RydHQC_FlankAv = [];

if (isNil ("RydHQC_Exhausted")) then {RydHQC_Exhausted = []};
//if (isNil ("RydHQC_FlankAv")) then {RydHQC_FlankAv = []};

if (isNil ("RydHQC_AttackReserve")) then {RydHQC_AttackReserve = (0.5 * (0.5 + (RydHQC_Circumspection/1.5)))};

	{
	if not (isNull _x) then
		{
		_unitvar = str _x;
		if (RydHQC_Orderfirst) then {_x setVariable [("Nominal" + _unitvar),(count (units _x))]};
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
		if (((_Gdamage/(_current + 0.1)) > (0.4*((RydHQC_Recklessness/1.2) + 1))) or not (_effective) or not (_ammo)) then {_solready = false};
		_ammo = 0;

			{
			_veh = assignedvehicle _x;
			if (not (isNull _veh) and (not (canMove _veh) or ((fuel _veh) <= 0.1) or ((damage _veh) > 0.5) or (((group _x) in ((RydHQC_AirG - RydHQC_NCAirG) + (RydHQC_HArmorG + RydHQC_LArmorG + (RydHQC_CarsG - (RydHQC_NCCargoG + RydHQC_SupportG))))) and ((count (magazines _veh)) == 0)))) exitwith {_vehready = false};
			}
		foreach (units _x);
		
		if (not (_x in RydHQC_AttackAv) and not (_busy) and not (_x in RydHQC_FlankAv) and (_vehready) and (_solready) and not (_x in (RydHQC_StaticG + RydHQC_ArtG + RydHQC_NavalG + RydHQC_SpecForG + RydHQC_CargoOnly))) then {RydHQC_AttackAv set [(count RydHQC_AttackAv),_x]};
		if (not (_x in RydHQC_Exhausted) and (not (_vehready) or not (_solready))) then {RydHQC_Exhausted = RydHQC_Exhausted + [_x]};
	 
		if ((RydHQC_Withdraw > 0) and not (_x in (RydHQC_SpecForG + RydHQC_SnipersG))) then
			{
			_inD = _x getVariable "NearE";
			if (isNil "_inD") then {_inD = 0};
			if (not (_x in RydHQC_Exhausted) and ((random (2 + RydHQC_Recklessness)) < (_inD * RydHQC_Withdraw))) then {RydHQC_Exhausted set [(count RydHQC_Exhausted),_x]}; 
			};
		}
	}
foreach ((RydHQC_Friends - (RydHQC_reconG + RydHQC_FOG + (RydHQC_NCCargoG - RydHQC_NCrewInfG) + RydHQC_SupportG)) - RydHQC_ROnly);
RydHQC_AttackAv = [RydHQC_AttackAv] call RYD_RandomOrd;
if (RydHQC_AttackReserve > 0) then 
	{
	for [{_g = 0},{_g < floor ((count RydHQC_AttackAv)*RydHQC_AttackReserve)},{_g = _g + 1}] do
		{
		_ResC = RydHQC_AttackAv select _g;
		if not (_ResC in RydHQC_FirstToFight) then 
			{
			RydHQC_AttackAv = RydHQC_AttackAv - [_ResC];
			if not (RydHQC_FlankingDone) then {if ((random 100 > (30/(0.5 + RydHQC_Fineness))) and not (_ResC in RydHQC_FlankAv)) then {RydHQC_FlankAv set [(count RydHQC_FlankAv),_ResC]}}
			};
		}
	};

RydHQC_FlankAv = RydHQC_FlankAv - RydHQC_NoFlank;

if (not (RydHQC_FlankingInit) and not (RydHQC_Order == "DEFEND")) then {[] spawn C_Flanking};

_stages = 3;
if ([] call RYD_isNight) then {_stages = 5};

_rcheckArr = [RydHQC_Garrison,RydHQC_ReconAv,RydHQC_FlankAv,RydHQC_AOnly,RydHQC_Exhausted,RydHQC_NCCargoG,_Trg,RydHQC_NCVeh];

if ((RydHQC_NoRec * (RydHQC_Recklessness + 0.01)) < (random 100)) then 
	{
	if ((count RydHQC_KnEnemiesG) == 0) then
		{
		if (not ((count RydHQC_RAirG) == 0) and ((count RydHQC_ReconAv) > 0) and not (RydHQC_ReconDone) and not (RydHQC_ReconStage > _stages)) then
			{
			_gps = [RydHQC_RAirG,"R",_rcheckArr,20000,true] call RYD_Recon;

				{
				if (RydHQC_ReconStage > _stages) exitWith {};
				RydHQC_ReconStage = RydHQC_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQC_ReconStage] spawn C_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQC_reconG) == 0) and ((count RydHQC_ReconAv) > 0) and not (RydHQC_ReconDone) and not (RydHQC_ReconStage > _stages)) then
			{
			_gps = [RydHQC_ReconG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQC_ReconStage > _stages) exitWith {};
				RydHQC_ReconStage = RydHQC_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQC_ReconStage] spawn C_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQC_FOG) == 0) and ((count RydHQC_ReconAv) > 0) and not (RydHQC_ReconDone) and not (RydHQC_ReconStage > _stages)) then
			{
			_gps = [RydHQC_FOG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQC_ReconStage > _stages) exitWith {};
				RydHQC_ReconStage = RydHQC_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQC_ReconStage] spawn C_GoRecon;
				}
			foreach _gps
			};

		if (not ((count RydHQC_snipersG) == 0) and ((count RydHQC_ReconAv) > 0) and not (RydHQC_ReconDone) and not (RydHQC_ReconStage > _stages)) then
			{
			_gps = [RydHQC_snipersG,"R",_rcheckArr,5000,false] call RYD_Recon;

				{
				if (RydHQC_ReconStage > _stages) exitWith {};
				RydHQC_ReconStage = RydHQC_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQC_ReconStage] spawn C_GoRecon;
				}
			foreach _gps
			};

		_onlyL = RydHQC_LArmorG - RydHQC_MArmorG;
		if (not ((count _onlyL) == 0) and ((count RydHQC_ReconAv) > 0) and not (RydHQC_ReconDone) and not (RydHQC_ReconStage > _stages)) then
			{
			_gps = [_onlyL,"R",_rcheckArr,20000,false] call RYD_Recon;

				{
				if (RydHQC_ReconStage > _stages) exitWith {};
				RydHQC_ReconStage = RydHQC_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQC_ReconStage] spawn C_GoRecon;
				}
			foreach _gps
			};

		if (not ((count (RydHQC_NCrewInfG - RydHQC_SpecForG)) == 0) and ((count RydHQC_ReconAv) > 0) and not (RydHQC_ReconDone) and not (RydHQC_ReconStage > _stages)) then
			{
			_gps = [(RydHQC_NCrewInfG - RydHQC_SpecForG),"NR",_rcheckArr,10000,false] call RYD_Recon;

				{
				if (RydHQC_ReconStage > _stages) exitWith {};
				RydHQC_ReconStage = RydHQC_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQC_ReconStage] spawn C_GoRecon;
				}
			foreach _gps
			};

		_LMCUA = RydHQC_Friends - (RydHQC_NavalG + RydHQC_StaticG + RydHQC_SupportG + RydHQC_ArtG + RydHQC_AOnly + RydHQC_SpecForG + RydHQC_CargoOnly);
		if (not ((count _LMCUA) == 0) and not (RydHQC_ReconDone) and not (RydHQC_ReconStage > _stages)) then
			{
			_gps = [_LMCUA,"NR",_rcheckArr,20000,false] call RYD_Recon;

				{
				if (RydHQC_ReconStage > _stages) exitWith {};
				RydHQC_ReconStage = RydHQC_ReconStage + 1;_x setVariable ["Busy" + (str _x),true];
				[_x,_PosObj1,RydHQC_ReconStage] spawn C_GoRecon;
				}
			foreach _gps
			}
		}
	}
else
	{
	RydHQC_ReconDone = true
	};

if (isNil ("RydHQC_IdleOrd")) then {RydHQC_IdleOrd = true};

_reserve = RydHQC_Friends - (RydHQC_SpecForG + RydHQC_CargoOnly + RydHQC_AOnly + RydHQC_ROnly + RydHQC_Exhausted + RydHQC_ArtG + RydHQC_AirG + RydHQC_NavalG + RydHQC_StaticG + RydHQC_SupportG + (RydHQC_NCCargoG - (RydHQC_NCrewInfG + RydHQC_SupportG)));
if (not (RydHQC_ReconDone) and ((count RydHQC_KnEnemies) == 0)) exitwith 
	{
	if (RydHQC_Orderfirst) then 
		{
		RydHQC_Orderfirst = false
		};

		{
		_recvar = str _x;
		_resting = false;
		_resting = _x getvariable ("Resting" + _recvar);
		if (isNil ("_resting")) then {_resting = false};
		if not (_resting) then {[_x] spawn C_GoRest }
		}
	foreach (RydHQC_Exhausted - (RydHQC_AirG + RydHQC_StaticG + RydHQC_ArtG + RydHQC_NavalG));

	if (RydHQC_IdleOrd) then
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
			if (not (_busy) and ((count (waypoints _x)) <= 1) and not (_deployed) and not (_capturing) and (not (_x in RydHQC_NCCargoG) or ((count (units _x)) > 1))) then {deleteWaypoint ((waypoints _x) select 0);[_x] spawn C_GoIdle }
			}
		foreach _reserve;
		};

	RydxHQ_Done = true;
	};

RydHQC_FlankReady = true;

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

	if ((_x in RydHQC_Enrecon) and not (_GE in _reconthreat) and not (_checked)) then {_reconthreat set [(count _reconthreat),_GE]};
	if ((_x in RydHQC_EnFO) and not (_GE in _FOthreat) and not (_checked)) then {_FOthreat set [(count _FOthreat),_GE]};
	if ((_x in RydHQC_Ensnipers) and not (_GE in _snipersthreat) and not (_checked)) then {_snipersthreat set [(count _snipersthreat),_GE]};
	if ((_x in RydHQC_EnATinf) and not (_GE in _ATinfthreat) and not (_checked)) then {_ATinfthreat set [(count _ATinfthreat),_GE]};
	if ((_x in RydHQC_EnAAinf) and not (_GE in _AAinfthreat) and not (_checked)) then {_AAinfthreat set [(count _AAinfthreat),_GE]};
	if ((_x in RydHQC_EnInf) and not (_GE in _Infthreat) and not (_checked)) then {_Infthreat set [(count _Infthreat),_GE]};
	if ((_x in RydHQC_EnArt) and not (_GE in _Artthreat) and not (_checked)) then {_Artthreat set [(count _Artthreat),_GE]};
	if ((_x in RydHQC_EnHArmor) and not (_GE in _LArmorthreat) and not (_checked)) then {_LArmorthreat set [(count _LArmorthreat),_GE]};
	if ((_x in RydHQC_EnLArmor) and not (_GE in _reconthreat) and not (_checked)) then {_reconthreat set [(count _reconthreat),_GE]};
	if ((_x in RydHQC_EnLArmorAT) and not (_GE in _LArmorATthreat) and not (_checked)) then {_LArmorATthreat set [(count _LArmorATthreat),_GE]};
	if ((_x in RydHQC_EnCars) and not (_GE in _Carsthreat) and not (_checked)) then {_Carsthreat set [(count _Carsthreat),_GE]};
	if ((_x in RydHQC_EnAir) and not (_GE in _Airthreat) and not (_checked)) then {_Airthreat set [(count _Airthreat),_GE]};
	if ((_x in RydHQC_EnNaval) and not (_GE in _Navalthreat) and not (_checked)) then {_Navalthreat set [(count _Navalthreat),_GE]};
	if ((_x in RydHQC_EnStatic) and not (_GE in _Staticthreat) and not (_checked)) then {_Staticthreat set [(count _Staticthreat),_GE]};
	if ((_x in RydHQC_EnStaticAA) and not (_GE in _StaticAAthreat) and not (_checked)) then {_StaticAAthreat set [(count _StaticAAthreat),_GE]};
	if ((_x in RydHQC_EnStaticAT) and not (_GE in _StaticATthreat) and not (_checked)) then {_StaticATthreat set [(count _StaticATthreat),_GE]};
	if ((_x in RydHQC_EnSupport) and not (_GE in _Supportthreat) and not (_checked)) then {_Supportthreat set [(count _Supportthreat),_GE]};
	if ((_x in RydHQC_EnCargo) and not (_GE in _Cargothreat) and not (_checked)) then {_Cargothreat set [(count _Cargothreat),_GE]};

	if ((_x in RydHQC_EnInf) and ((vehicle _x) in RydHQC_EnCargo) and not (_x in RydHQC_EnCrew) and not (_GE in _Infthreat) and not (_checked)) then {_Infthreat set [(count _Infthreat),_GE]};

	if ((isNil ("_checked")) or not (_checked)) then {_GE setVariable [("Checked" + _GEvar), true]};
	}
foreach RydHQC_KnEnemies;

RydHQC_AAthreat = (_AAinfthreat + _StaticAAthreat);
RydHQC_ATthreat = (_ATinfthreat + _StaticATthreat + _HArmorthreat + _LArmorATthreat);
RydHQC_Airthreat = _Airthreat;
_reconthreat = _reconthreat - _Airthreat;

_FPool = 
	[
	RydHQC_snipersG,
	RydHQC_NCrewInfG - RydHQC_SpecForG,
	RydHQC_AirG - (RydHQC_NCAirG + RydHQC_NCrewInfG),
	RydHQC_LArmorG,
	RydHQC_HArmorG,
	RydHQC_CarsG - (RydHQC_ATInfG + RydHQC_AAInfG + RydHQC_SupportG + RydHQC_NCCargoG),
	RydHQC_LArmorATG,
	RydHQC_ATInfG,
	RydHQC_AAInfG,
	RydHQC_Recklessness,
	RydHQC_AttackAv,
	RydHQC_Garrison,
	RydHQC_GarrR,
	RydHQC_FlankAv,
	RydHQC_AirG,
	RydHQC_NCVeh
	];

_constant = [RydHQC_AAthreat,RydHQC_ATthreat,_HArmorthreat + _LArmorATthreat,_FPool];

if (count (_reconthreat + _FOthreat + _snipersthreat) > 0) then 
	{
	([_reconthreat + _FOthreat + _snipersthreat,"Recon","C",0,0,0] + _constant) call RYD_Dispatcher;
	};

if (count _ATinfthreat > 0) then 
	{
	([_ATinfthreat,"ATInf","C",0,0,85] + _constant) call RYD_Dispatcher;
	};

if (count _Infthreat > 0) then 
	{
	([_Infthreat,"Inf","C",75,80,85] + _constant) call RYD_Dispatcher;
	};

if (count (_LArmorthreat + _HArmorthreat) > 0) then 
	{
	([_LArmorthreat + _HArmorthreat,"Armor","C",50,0,85] + _constant) call RYD_Dispatcher;
	};

if (count _Carsthreat > 0) then 
	{
	([_Carsthreat,"Cars","C",75,80,85] + _constant) call RYD_Dispatcher;
	};

if (count _Artthreat > 0) then 
	{
	([_Artthreat,"Art","C",70,75,75] + _constant) call RYD_Dispatcher;
	};

if (count _Airthreat > 0) then 
	{
	([_Airthreat,"Air","C",0,0,75] + _constant) call RYD_Dispatcher;
	};

if (count (_Staticthreat - _Artthreat) > 0) then 
	{
	([_Staticthreat - _Artthreat,"Static","C",75,80,85] + _constant) call RYD_Dispatcher;
	};

/////////////////////////////////////////
// Capture Objective

_Trg = RydHQC_Obj;

	{
	_x setVariable [("Capturing" + (str _x)),[0,0]]
	}
foreach ([RydHQC_Obj1,RydHQC_Obj2,RydHQC_Obj3,RydHQC_Obj4] - [RydHQC_Obj]);

if (isNil ("_Trg")) then {_Trg = leaderHQC};

_isAttacked = _Trg getvariable ("Capturing" + (str _Trg));

if (isNil ("_isAttacked")) then {_isAttacked = [0,0]};

_captCount = _isAttacked select 1;
_isAttacked = _isAttacked select 0;
_captLimit = RydHQC_CaptLimit * (1 + (RydHQC_Circumspection/(2 + RydHQC_Recklessness)));
if ((_isAttacked <= 3) or (_captCount < _captLimit)) then
	{	
	if ((not (RydHQC_NObj > 4) and ((random 100) > ((count RydHQC_KnEnemies)*(5/(0.5 + (2*RydHQC_Recklessness))))) and not 
		(RydHQC_Orderfirst) and 
			((random 100) < ((((count RydHQC_Friends)*(0.5 + RydHQC_Recklessness))/(5*(0.5 + count RydHQC_KnEnemiesG)))*((RydHQC_Cyclecount - 5)*2*(1 + RydHQC_Recklessness))))) or
				(((RydHQC_RapidCapt * (RydHQC_Recklessness + 0.01)) > (random 100)) and (RydHQC_NObj <= 4))) then   
		{
		_checked = [];
		_forCapt = RydHQC_NCrewInfG - (RydHQC_SupportG + RydHQC_SpecForG + RydHQC_CargoOnly + RydHQC_Garrison);
		_forCapt = [_forCapt] call RYD_SizeOrd;
		if (not ((count _forCapt) == 0) and ((count RydHQC_AttackAv) > 0)) then
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
					if (_x in RydHQC_AttackAv) then
						{
						if (((leader _x) distance _Trg) <= _m) then
							{
							if (not (_x in RydHQC_NCCargoG) or ((count (units _x)) > 1)) then 
								{
								_ammo = [_x,RydHQC_NCVeh] call RYD_AmmoCount;
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

										[_x,_isAttacked] spawn C_GoCapture;
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

		_LMCU = RydHQC_Friends - ((RydHQC_AirG - RydHQC_NCrewInfG) + RydHQC_SpecForG + RydHQC_CargoOnly + RydHQC_NavalG + RydHQC_StaticG + RydHQC_SupportG + RydHQC_ArtG + RydHQC_Garrison + (RydHQC_NCCargoG - (RydHQC_NCrewInfG - RydHQC_SupportG)));
		_LMCU = [_LMCU] call RYD_SizeOrd;
		if (not ((count _LMCU) == 0) and ((count RydHQC_AttackAv) > 0)) then
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
					if (_x in RydHQC_AttackAv) then
						{
						if (((leader _x) distance _Trg) <= _m) then
							{
							_ammo = [_x,RydHQC_NCVeh] call RYD_AmmoCount;
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

									[_x,_isAttacked] spawn C_GoCapture;
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

if (RydHQC_IdleOrd) then
	{
	_reserve = RydHQC_Friends - (RydHQC_SpecForG + RydHQC_CargoOnly + RydHQC_AOnly + RydHQC_ROnly + RydHQC_Exhausted + RydHQC_ArtG + RydHQC_AirG + RydHQC_NavalG + RydHQC_StaticG + (RydHQC_NCCargoG - (RydHQC_NCrewInfG + RydHQC_SupportG)));
		
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
		if (not (_busy) and ((count (waypoints _x)) <= 1) and not (_deployed) and not (_capturing) and (not (_x in RydHQC_NCCargoG) or ((count (units _x)) > 1))) then {deleteWaypoint ((waypoints _x) select 0);[_x] spawn C_GoIdle};
		}
	foreach _reserve
	};

	{
	_recvar = str _x;
	_resting = false;
	_resting = _x getvariable ("Resting" + _recvar);
	if (isNil ("_resting")) then {_resting = false};
	if not (_resting) then {[_x] spawn C_GoRest }
	}
foreach (RydHQC_Exhausted - (RydHQC_AirG + RydHQC_StaticG + RydHQC_ArtG + RydHQC_NavalG));

	{
	_GE = (group _x);
	_GEvar = str _GE;
	_GE setvariable [("Checked" + _GEvar),false];
	}
foreach RydHQC_KnEnemies;

if (RydHQC_Orderfirst) then {RydHQC_Orderfirst = false};

RydxHQ_Done = true;