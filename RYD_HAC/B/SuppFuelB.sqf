waituntil {sleep 10;(not (isNil ("RydHQB_Support")) and ((count RydHQB_Support) > 0) and (RydHQB_Cyclecount > 2))};

if (isNil ("RHQ_Fuel")) then {RHQ_Fuel = []};
if (isNil ("RydHQB_SFuel")) then {RydHQB_SFuel = true};
if (isNil ("RydHQB_ExRefuel")) then {RydHQB_ExRefuel = []};
if (isNil ("RydHQB_FuelPoints")) then {RydHQB_FuelPoints = []};

_fuel = RHQ_Fuel + ["I_Truck_02_fuel_F","O_Truck_02_fuel_F","B_G_Van_01_fuel_F","B_APC_Tracked_01_CRV_F","B_Truck_01_fuel_F"] - RHQs_Fuel;
_noenemy = true;
sleep 3;
while {not (isNull RydHQB)} do
	{
	waituntil {sleep 5;RydHQB_SFuel};
	sleep 25;
	
	RydHQB_FuelSupport = [];
	RydHQB_FuelSupportG = [];

		{
		if not (_x in RydHQB_FuelSupport) then
			{
			if ((typeOf (assignedvehicle _x)) in _fuel) then 
				{
				RydHQB_FuelSupport set [(count RydHQB_FuelSupport),_x];
				if not ((group _x) in (RydHQB_FuelSupportG + RydHQB_SpecForG + RydHQB_CargoOnly)) then 
					{
					RydHQB_FuelSupportG set [(count RydHQB_FuelSupportG),(group _x)]
					}
				}
			}
		}
	foreach RydHQB_Support;

	_dried = [];
	_ZeroF = [];

		{
			{
			_av = assignedvehicle _x;
			if not (isNull _av) then
				{
				if ((fuel _av) <= 0.1) then
					{
					if not (_av in _dried) then
						{
						if (((getposATL _x) select 2) < 5) then 
							{
							_dried set [(count _dried),(assignedvehicle _x)]
							}
						}
					}
				};

			if not (isNull _av) then
				{
				if ((fuel _av) == 0) then
					{
					if not (_av in _ZeroF) then
						{
						if (((getposATL _x) select 2) < 5) then 
							{
							_ZeroF set [(count _ZeroF),(assignedvehicle _x)]
							}
						}
					}
				}
			}
		foreach (units _x)
		}
	foreach (RydHQB_Friends - RydHQB_ExRefuel);

	RydHQB_Dried = _dried;
	_cisterns = [];
	if (isNil ("RydHQB_FSupportedG")) then {RydHQB_FSupportedG = []};

		{
		_cis = assignedVehicle (leader _x);

		if not (isNull _cis) then
			{
			if (canMove _cis) then
				{
				if ((fuel _cis) > 0.2) then
					{
					_unitvar = str (_x);
					_busy = false;
					_busy = _x getvariable ("Busy" + _unitvar);
					if (isNil ("_busy")) then {_busy = false};

					if not (_busy) then
						{
						if not (_x in _cisterns) then 
							{
							_cisterns set [(count _cisterns),_x]
							}
						}
					}
				}
			}
		}
	foreach RydHQB_FuelSupportG;

	_cisterns2 = +_cisterns;
	_Zunits = +_ZeroF;
	_a = 0;
	for [{_a = 500},{_a <= 20000},{_a = _a + 500}] do
		{
			{
			_cistern = assignedvehicle (leader _x);
			if (isNil ("_busy")) then {_busy = false};

			for [{_b = 0},{_b < (count _ZeroF)},{_b = _b + 1}] do 
				{
				_Zunit = _ZeroF select _b;

					{
					if ((_Zunit distance (assignedvehicle (leader _x))) < 300) exitwith {if not ((group _Zunit) in RydHQB_FSupportedG) then {RydHQB_FSupportedG set [(count RydHQB_FSupportedG),(group _Zunit)]}};
					}
				foreach RydHQB_FuelSupportG;

					{
					if ((_Zunit distance _x) < 300) exitwith {if not ((group _Zunit) in RydHQB_FSupportedG) then {RydHQB_FSupportedG set [(count RydHQB_FSupportedG),(group _Zunit)]}};
					}
				foreach RydHQB_FuelPoints;

				_noenemy = true;
				_halfway = [(((position _cistern) select 0) + ((position _Zunit) select 0))/2,(((position _cistern) select 1) + ((position _Zunit) select 1))/2];
				_distT = 500/(0.75 + (RydHQB_Recklessness/2));
				_eClose1 = [_Zunit,RydHQB_KnEnemiesG,_distT] call RYD_CloseEnemy;
				_eClose2 = [_halfway,RydHQB_KnEnemiesG,_distT] call RYD_CloseEnemy;				
				if ((_eClose1) or (_eClose2)) then {_noenemy = false};
				
				if not ((group _Dunit) in RydHQB_FSupportedG) then
					{
					_UL = leader (group (assignedDriver _Zunit));
					if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_SuppReq,"SuppReq"] call RYD_AIChatter}};
					};

				if (not ((group _Zunit) in RydHQB_FSupportedG) and ((_Zunit distance _cistern) <= _a) and (_noenemy) and (_x in _cisterns)) then 
					{
					if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQB,RydxHQ_AIC_SuppAss,"SuppAss"] call RYD_AIChatter};
					_cisterns = _cisterns - [_x];
					_Zunits = _Zunits - [_Zunit];
					RydHQB_FSupportedG set [(count RydHQB_FSupportedG),(group _Zunit)];
					[_cistern,_Zunit,_dried] spawn B_GoFuelSupp; 
					}
				else
					{
					if (_a == 20000) then 
						{
						if not ((group _Zunit) in RydHQB_FSupportedG) then {if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQB,RydxHQ_AIC_SuppDen,"SuppDen"] call RYD_AIChatter}};
						_Zunits = _Zunits - [_Zunit]
						};
					};
				
				if (((count _cisterns) == 0) or ((count _Zunits) == 0)) exitwith {};
				};
			if (((count _cisterns) == 0) or ((count _Zunits) == 0)) exitwith {};
			sleep 0.1;
			}
		foreach _cisterns2;
		};

	_Dunits = +_dried;

	for [{_a = 500},{_a < 10000},{_a = _a + 500}] do
		{
			{
			_cistern = assignedvehicle (leader _x);
			for [{_b = 0},{_b < (count _dried)},{_b = _b + 1}] do 
				{
				_Dunit = _dried select _b;

					{
					if ((_Dunit distance (assignedvehicle (leader _x))) < 400) exitwith {if not ((group _Dunit) in RydHQB_FSupportedG) then {RydHQB_FSupportedG set [(count RydHQB_FSupportedG),(group _Dunit)]}};
					}
				foreach RydHQB_FuelSupportG;

					{
					if ((_Dunit distance _x) < 400) exitwith {if not ((group _Dunit) in RydHQB_FSupportedG) then {RydHQB_FSupportedG set [(count RydHQB_FSupportedG),(group _Dunit)]}};
					}
				foreach RydHQB_FuelPoints;

				_noenemy = true;
				_halfway = [(((position _cistern) select 0) + ((position _Dunit) select 0))/2,(((position _cistern) select 1) + ((position _Dunit) select 1))/2];
				_distT = 600/(0.75 + (RydHQB_Recklessness/2));
				_eClose1 = [_Dunit,RydHQB_KnEnemiesG,_distT] call RYD_CloseEnemy;
				_eClose2 = [_halfway,RydHQB_KnEnemiesG,_distT] call RYD_CloseEnemy;				
				if ((_eClose1) or (_eClose2)) then {_noenemy = false};

				if not ((group _Dunit) in RydHQB_FSupportedG) then
					{
					_UL = leader (group (assignedDriver _Dunit));
					if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_SuppReq,"SuppReq"] call RYD_AIChatter}};
					};
				
				if (not ((group _Dunit) in RydHQB_FSupportedG) and ((_Dunit distance _cistern) <= _a) and (_noenemy) and (_x in _cisterns)) then 
					{
					if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQB,RydxHQ_AIC_SuppAss,"SuppAss"] call RYD_AIChatter};
					_cisterns = _cisterns - [_x];
					_Dunits = _Dunits - [_Dunit];
					RydHQB_FSupportedG set [(count RydHQB_FSupportedG),(group _Dunit)];
					[_cistern,_Dunit,_dried] spawn B_GoFuelSupp; 
					}
				else
					{
					if (_a == 10000) then 
						{
						if not ((group _Dunit) in RydHQB_FSupportedG) then {if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQB,RydxHQ_AIC_SuppDen,"SuppDen"] call RYD_AIChatter}};
						_Dunits = _Dunits - [_Dunit]
						};
					};
				
				if (((count _cisterns) == 0) or ((count _Dunits) == 0)) exitwith {};
				};
			if (((count _cisterns) == 0) or ((count _Dunits) == 0)) exitwith {};
			sleep 0.1;
			}
		foreach _cisterns2;
		};


	};