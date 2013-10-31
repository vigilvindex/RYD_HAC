waituntil {sleep 10;(not (isNil ("RydHQC_Support")) and ((count RydHQC_Support) > 0) and (RydHQC_Cyclecount > 2))};

if (isNil ("RHQ_Med")) then {RHQ_Med = []};
if (isNil ("RydHQC_SMed")) then {RydHQC_SMed = true};
if (isNil ("RydHQC_ExMedic")) then {RydHQC_ExMedic = []};
if (isNil ("RydHQC_MedPoints")) then {RydHQC_MedPoints = []};

_med = RHQ_Med + ["I_Truck_02_medical_F","O_Truck_02_medical_F","B_Truck_01_medical_F"] - RHQs_Med;
_noenemy = true;

while {not (isNull RydHQC)} do
	{
	waituntil {sleep 5;RydHQC_SMed};
	sleep 25;
	
	RydHQC_MedSupport = [];
	RydHQC_MedSupportG = [];
	RydHQC_MedSupportAirG = [];

		{
		if not (_x in RydHQC_MedSupport) then
			{
			if ((typeOf (assignedvehicle _x)) in _med) then 
				{
				RydHQC_MedSupport set [(count RydHQC_MedSupport),_x];
				if not ((group _x) in RydHQC_MedSupportG) then 
					{
					RydHQC_MedSupport set [(count RydHQC_MedSupport),_x]
					};

				if not ((group _x) in (RydHQC_MedSupportAirG + RydHQC_SpecForG + RydHQC_CargoOnly)) then
					{
					if (_x in RydHQC_AirG) then 
						{
						RydHQC_MedSupportAirG set [(count RydHQC_MedSupportAirG),(group _x)]
						}
				}
			}
		}
	foreach RydHQC_Support;

	_airMedAv = [];
	_landMedAv = [];

		{
		_busy = _x getVariable ("Busy" + (str _x));
		if (isNil "_busy") then {_busy = false};
		if not (_busy) then {_airMedAv set [(count _airMedAv),_x]}
		}
	foreach RydHQC_MedSupportAirG;

		{
		_busy = _x getVariable ("Busy" + (str _x));
		if (isNil "_busy") then {_busy = false};
		if not (_busy) then {_landMedAv set [(count _landMedAv),_x]}
		}
	foreach (RydHQC_MedSupportG - RydHQC_MedSupportAirG);

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
	foreach (RydHQC_Friends - RydHQC_ExMedic);

	_Lwounded = _wounded - _Swounded;
	RydHQC_Wounded = _wounded;
	_ambulances = [];
	if (isNil ("RydHQC_SupportedG")) then {RydHQC_SupportedG = []};

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
	foreach RydHQC_MedSupportG;

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
					if ((_SWunit distance (assignedvehicle (leader _x))) < 125) exitwith {if not ((group _SWunit) in RydHQC_SupportedG) then {RydHQC_SupportedG set [(count RydHQC_SupportedG),(group _SWunit)]}};
					}
				foreach RydHQC_MedSupportG;

					{
					if ((_SWunit distance _x) < 125) exitwith {if not ((group _SWunit) in RydHQC_SupportedG) then {RydHQC_SupportedG set [(count RydHQC_SupportedG),(group _SWunit)]}};
					}
				foreach RydHQC_MedPoints;

				_noenemy = true;
				_halfway = [(((position _ambulance) select 0) + ((position _SWunit) select 0))/2,(((position _ambulance) select 1) + ((position _SWunit) select 1))/2];
				_distT = 500/(0.75 + (RydHQC_Recklessness/2));
				_eClose1 = [_SWunit,RydHQC_KnEnemiesG,_distT] call RYD_CloseEnemy;
				_eClose2 = [_halfway,RydHQC_KnEnemiesG,_distT] call RYD_CloseEnemy;				
				if ((_eClose1) or (_eClose2)) then {_noenemy = false};

				if not ((group _SWunit) in RydHQC_SupportedG) then
					{
					_UL = leader (group _SWunit);
					if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_MedReq,"MedReq"] call RYD_AIChatter}};
					};				

				if (not ((group _SWunit) in RydHQC_SupportedG) and ((_SWunit distance _ambulance) <= _a) and (_noenemy) and (_x in _ambulances)) then 
					{
					if ((_a > 1500) and ((count _airMedAv) > 0) and not (_x in _airMedAv)) exitwith {};
					if ((_a <= 1500) and ((count _landMedAv) > 0) and not (_x in _landMedAv)) exitwith {};
					if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQC,RydxHQ_AIC_SuppAss,"SuppAss"] call RYD_AIChatter};
					if (_x in _airMedAv) then {_airMedAv = _airMedAv - [_x]} else {_landMedAv = _landMedAv - [_x]};
					_ambulances = _ambulances - [_x];
					_SWunits = _SWunits - [_SWunit];
					RydHQC_SupportedG set [(count RydHQC_SupportedG),(group _SWunit)];
					[_ambulance,_SWunit,_wounded] spawn C_GoMedSupp; 
					}
				else
					{
					if (_a == 20000) then 
						{
						if not ((group _SWunit) in RydHQC_SupportedG) then {if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQC,RydxHQ_AIC_SuppDen,"SuppDen"] call RYD_AIChatter}};
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
					if ((_Wunit distance (assignedvehicle (leader _x))) < 250) exitwith {if not ((group _Wunit) in RydHQC_SupportedG) then {RydHQC_SupportedG set [(count RydHQC_SupportedG),(group _Wunit)]}};
					}
				foreach RydHQC_MedSupportG;

					{
					if ((_Wunit distance _x) < 250) exitwith {if not ((group _Wunit) in RydHQC_SupportedG) then {RydHQC_SupportedG set [(count RydHQC_SupportedG),(group _Wunit)]}};
					}
				foreach RydHQC_MedPoints;

				_noenemy = true;
				_halfway = [(((position _ambulance) select 0) + ((position _Wunit) select 0))/2,(((position _ambulance) select 1) + ((position _Wunit) select 1))/2];
				_distT = 600/(0.75 + (RydHQC_Recklessness/2));
				_eClose1 = [_Wunit,RydHQC_KnEnemiesG,_distT] call RYD_CloseEnemy;
				_eClose2 = [_halfway,RydHQC_KnEnemiesG,_distT] call RYD_CloseEnemy;				
				if ((_eClose1) or (_eClose2)) then {_noenemy = false};

				if not ((group _Wunit) in RydHQC_SupportedG) then
					{
					_UL = leader (group _Wunit);
					if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_MedReq,"MedReq"] call RYD_AIChatter}};	
					};
				
				if (not ((group _Wunit) in RydHQC_SupportedG) and ((_Wunit distance _ambulance) <= _a) and (_noenemy) and (_x in _ambulances)) then 
					{
					if ((_a > 2500) and ((count _airMedAv) > 0) and not (_x in _airMedAv)) exitwith {};
					if ((_a <= 2500) and ((count _landMedAv) > 0) and not (_x in _landMedAv)) exitwith {};
					if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQC,RydxHQ_AIC_SuppAss,"SuppAss"] call RYD_AIChatter};
					if (_x in _airMedAv) then {_airMedAv = _airMedAv - [_x]} else {_landMedAv = _landMedAv - [_x]};
					_ambulances = _ambulances - [_x];
					_Wunits = _Wunits - [_Wunit];
					RydHQC_SupportedG set [(count RydHQC_SupportedG),(group _Wunit)];
					[_ambulance,_Wunit,_wounded] spawn C_GoMedSupp; 
					}
				else
					{
					if (_a == 10000) then 
						{
						if not ((group _Wunit) in RydHQC_SupportedG) then {if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQC,RydxHQ_AIC_SuppDen,"SuppDen"] call RYD_AIChatter}};
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