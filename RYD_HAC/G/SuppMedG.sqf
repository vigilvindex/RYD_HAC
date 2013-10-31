waituntil {sleep 10;(not (isNil ("RydHQG_Support")) and ((count RydHQG_Support) > 0) and (RydHQG_Cyclecount > 2))};

if (isNil ("RHQ_Med")) then {RHQ_Med = []};
if (isNil ("RydHQG_SMed")) then {RydHQG_SMed = true};
if (isNil ("RydHQG_ExMedic")) then {RydHQG_ExMedic = []};
if (isNil ("RydHQG_MedPoints")) then {RydHQG_MedPoints = []};

_med = RHQ_Med + ["I_Truck_02_medical_F","O_Truck_02_medical_F","B_Truck_01_medical_F"] - RHQs_Med;
_noenemy = true;

while {not (isNull RydHQG)} do
	{
	waituntil {sleep 5;RydHQG_SMed};
	sleep 25;
	
	RydHQG_MedSupport = [];
	RydHQG_MedSupportG = [];
	RydHQG_MedSupportAirG = [];

		{
		if not (_x in RydHQG_MedSupport) then
			{
			if ((typeOf (assignedvehicle _x)) in _med) then 
				{
				RydHQG_MedSupport set [(count RydHQG_MedSupport),_x];
				if not ((group _x) in RydHQG_MedSupportG) then 
					{
					RydHQG_MedSupport set [(count RydHQG_MedSupport),_x]
					};

				if not ((group _x) in (RydHQG_MedSupportAirG + RydHQG_SpecForG + RydHQG_CargoOnly)) then
					{
					if (_x in RydHQG_AirG) then 
						{
						RydHQG_MedSupportAirG set [(count RydHQG_MedSupportAirG),(group _x)]
						}
				}
			}
		}
	foreach RydHQG_Support;

	_airMedAv = [];
	_landMedAv = [];

		{
		_busy = _x getVariable ("Busy" + (str _x));
		if (isNil "_busy") then {_busy = false};
		if not (_busy) then {_airMedAv set [(count _airMedAv),_x]}
		}
	foreach RydHQG_MedSupportAirG;

		{
		_busy = _x getVariable ("Busy" + (str _x));
		if (isNil "_busy") then {_busy = false};
		if not (_busy) then {_landMedAv set [(count _landMedAv),_x]}
		}
	foreach (RydHQG_MedSupportG - RydHQG_MedSupportAirG);

	_wounded = [];
	_Swounded = [];
	_Lwounded = [];

		{
			{
			if ((vehicle _x) == _x) then
				{
				if ((damage _x) > 0.5) then
					{
					if ((damage _x) < 0.9) then 
						{
						_wounded set [(count _wounded),_x]
						};

					if (alive _x) then
						{
						if (((damage _x) > 0.75) or not (canStand _x)) then
							{
							_Swounded set [(count _Swounded),_x]
							}
						}
					}
				}
			}
		foreach (units _x)
		}
	foreach (RydHQG_Friends - RydHQG_ExMedic);

	_Lwounded = _wounded - _Swounded;
	RydHQG_Wounded = _wounded;
	_ambulances = [];
	if (isNil ("RydHQG_SupportedG")) then {RydHQG_SupportedG = []};

		{
		_amb = assignedVehicle (leader _x);

		if not (isNull _amb) then
			{
			if (canMove _amb) then
				{
				if ((fuel _amb) > 0.2) then
					{
					_unitvar = str (_x);
					_busy = false;
					_busy = _x getvariable ("Busy" + _unitvar);
					if (isNil ("_busy")) then {_busy = false};

					if not (_busy) then
						{
						if not (_x in _ambulances) then 
							{
							_ambulances set [(count _ambulances),_x]
							}
						}
					}
				}
			}
		}
	foreach RydHQG_MedSupportG;

	_ambulances2 = +_ambulances;
	_SWunits = +_Swounded;
	_a = 0;
	for [{_a = 500},{_a <= 20000},{_a = _a + 500}] do
		{
			{
			_ambulance = assignedvehicle (leader _x);
			if (isNil ("_busy")) then {_busy = false};

			for [{_b = 0},{_b < (count _Swounded)},{_b = _b + 1}] do 
				{
				_SWunit = _Swounded select _b;

					{
					if ((_SWunit distance (assignedvehicle (leader _x))) < 125) exitwith {if not ((group _SWunit) in RydHQG_SupportedG) then {RydHQG_SupportedG set [(count RydHQG_SupportedG),(group _SWunit)]}};
					}
				foreach RydHQG_MedSupportG;

					{
					if ((_SWunit distance _x) < 125) exitwith {if not ((group _SWunit) in RydHQG_SupportedG) then {RydHQG_SupportedG set [(count RydHQG_SupportedG),(group _SWunit)]}};
					}
				foreach RydHQG_MedPoints;

				_noenemy = true;
				_halfway = [(((position _ambulance) select 0) + ((position _SWunit) select 0))/2,(((position _ambulance) select 1) + ((position _SWunit) select 1))/2];
				_distT = 500/(0.75 + (RydHQG_Recklessness/2));
				_eClose1 = [_SWunit,RydHQG_KnEnemiesG,_distT] call RYD_CloseEnemy;
				_eClose2 = [_halfway,RydHQG_KnEnemiesG,_distT] call RYD_CloseEnemy;				
				if ((_eClose1) or (_eClose2)) then {_noenemy = false};

				if not ((group _SWunit) in RydHQG_SupportedG) then
					{
					_UL = leader (group _SWunit);
					if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_MedReq,"MedReq"] call RYD_AIChatter}};
					};				

				if (not ((group _SWunit) in RydHQG_SupportedG) and ((_SWunit distance _ambulance) <= _a) and (_noenemy) and (_x in _ambulances)) then 
					{
					if ((_a > 1500) and ((count _airMedAv) > 0) and not (_x in _airMedAv)) exitwith {};
					if ((_a <= 1500) and ((count _landMedAv) > 0) and not (_x in _landMedAv)) exitwith {};
					if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQG,RydxHQ_AIC_SuppAss,"SuppAss"] call RYD_AIChatter};
					if (_x in _airMedAv) then {_airMedAv = _airMedAv - [_x]} else {_landMedAv = _landMedAv - [_x]};
					_ambulances = _ambulances - [_x];
					_SWunits = _SWunits - [_SWunit];
					RydHQG_SupportedG set [(count RydHQG_SupportedG),(group _SWunit)];
					[_ambulance,_SWunit,_wounded] spawn G_GoMedSupp; 
					}
				else
					{
					if (_a == 20000) then 
						{
						if not ((group _SWunit) in RydHQG_SupportedG) then {if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQG,RydxHQ_AIC_SuppDen,"SuppDen"] call RYD_AIChatter}};
						_SWunits = _SWunits - [_SWunit]
						};
					};
				
				if (((count _ambulances) == 0) or ((count _SWunits) == 0)) exitwith {};
				};
			if (((count _ambulances) == 0) or ((count _SWunits) == 0)) exitwith {};
			sleep 0.1;
			}
		foreach _ambulances2;
		};

	_Wunits = +_wounded;

	for [{_a = 500},{_a < 10000},{_a = _a + 500}] do
		{
			{
			_ambulance = assignedvehicle (leader _x);
			for [{_b = 0},{_b < (count _wounded)},{_b = _b + 1}] do 
				{
				_Wunit = _wounded select _b;

					{
					if ((_Wunit distance (assignedvehicle (leader _x))) < 250) exitwith {if not ((group _Wunit) in RydHQG_SupportedG) then {RydHQG_SupportedG set [(count RydHQG_SupportedG),(group _Wunit)]}};
					}
				foreach RydHQG_MedSupportG;

					{
					if ((_Wunit distance _x) < 250) exitwith {if not ((group _Wunit) in RydHQG_SupportedG) then {RydHQG_SupportedG set [(count RydHQG_SupportedG),(group _Wunit)]}};
					}
				foreach RydHQG_MedPoints;

				_noenemy = true;
				_halfway = [(((position _ambulance) select 0) + ((position _Wunit) select 0))/2,(((position _ambulance) select 1) + ((position _Wunit) select 1))/2];
				_distT = 600/(0.75 + (RydHQG_Recklessness/2));
				_eClose1 = [_Wunit,RydHQG_KnEnemiesG,_distT] call RYD_CloseEnemy;
				_eClose2 = [_halfway,RydHQG_KnEnemiesG,_distT] call RYD_CloseEnemy;				
				if ((_eClose1) or (_eClose2)) then {_noenemy = false};

				if not ((group _Wunit) in RydHQG_SupportedG) then
					{
					_UL = leader (group _Wunit);
					if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_MedReq,"MedReq"] call RYD_AIChatter}};	
					};
				
				if (not ((group _Wunit) in RydHQG_SupportedG) and ((_Wunit distance _ambulance) <= _a) and (_noenemy) and (_x in _ambulances)) then 
					{
					if ((_a > 2500) and ((count _airMedAv) > 0) and not (_x in _airMedAv)) exitwith {};
					if ((_a <= 2500) and ((count _landMedAv) > 0) and not (_x in _landMedAv)) exitwith {};
					if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQG,RydxHQ_AIC_SuppAss,"SuppAss"] call RYD_AIChatter};
					if (_x in _airMedAv) then {_airMedAv = _airMedAv - [_x]} else {_landMedAv = _landMedAv - [_x]};
					_ambulances = _ambulances - [_x];
					_Wunits = _Wunits - [_Wunit];
					RydHQG_SupportedG set [(count RydHQG_SupportedG),(group _Wunit)];
					[_ambulance,_Wunit,_wounded] spawn G_GoMedSupp; 
					}
				else
					{
					if (_a == 10000) then 
						{
						if not ((group _Wunit) in RydHQG_SupportedG) then {if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQG,RydxHQ_AIC_SuppDen,"SuppDen"] call RYD_AIChatter}};
						_Wunits = _Wunits - [_Wunit]
						};
					};
				
				if (((count _ambulances) == 0) or ((count _Wunits) == 0)) exitwith {};
				};
			if (((count _ambulances) == 0) or ((count _Wunits) == 0)) exitwith {};
			sleep 0.1;
			}
		foreach _ambulances2;
		};


	};