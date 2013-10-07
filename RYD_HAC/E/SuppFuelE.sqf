waituntil {sleep 10;(not (isNil ("RydHQE_Support")) and ((count RydHQE_Support) > 0) and (RydHQE_Cyclecount > 2))};

if (isNil ("RHQ_Fuel")) then {RHQ_Fuel = []};
if (isNil ("RydHQE_SFuel")) then {RydHQE_SFuel = true};
if (isNil ("RydHQE_ExRefuel")) then {RydHQE_ExRefuel = []};
if (isNil ("RydHQE_FuelPoints")) then {RydHQE_FuelPoints = []};

_fuel = RHQ_Fuel + ["T810Refuel_Des_ACR","T810Refuel_ACR","UralRefuel_TK_EP1","MtvrRefuel_DES_EP1","V3S_Refuel_TK_GUE_EP1","UralRefuel_INS","KamazRefuel","UralRefuel_CDF","MtvrRefuel"] - RHQs_Fuel;
_noenemy = true;
sleep 3;
while {not (isNull RydHQE)} do
	{
	waituntil {sleep 5;RydHQE_SFuel};
	sleep 25;
	
	RydHQE_FuelSupport = [];
	RydHQE_FuelSupportG = [];

		{
		if not (_x in RydHQE_FuelSupport) then
			{
			if ((typeOf (assignedvehicle _x)) in _fuel) then 
				{
				RydHQE_FuelSupport set [(count RydHQE_FuelSupport),_x];
				if not ((group _x) in (RydHQE_FuelSupportG + RydHQE_SpecForG + RydHQE_CargoOnly)) then 
					{
					RydHQE_FuelSupportG set [(count RydHQE_FuelSupportG),(group _x)]
					}
				}
			}
		}
	foreach RydHQE_Support;

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
	foreach (RydHQE_Friends - RydHQE_ExRefuel);

	RydHQE_Dried = _dried;
	_cisterns = [];
	if (isNil ("RydHQE_FSupportedG")) then {RydHQE_FSupportedG = []};

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
	foreach RydHQE_FuelSupportG;

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
					if ((_Zunit distance (assignedvehicle (leader _x))) < 300) exitwith {if not ((group _Zunit) in RydHQE_FSupportedG) then {RydHQE_FSupportedG set [(count RydHQE_FSupportedG),(group _Zunit)]}};
					}
				foreach RydHQE_FuelSupportG;

					{
					if ((_Zunit distance _x) < 300) exitwith {if not ((group _Zunit) in RydHQE_FSupportedG) then {RydHQE_FSupportedG set [(count RydHQE_FSupportedG),(group _Zunit)]}};
					}
				foreach RydHQE_FuelPoints;

				_noenemy = true;
				_halfway = [(((position _cistern) select 0) + ((position _Zunit) select 0))/2,(((position _cistern) select 1) + ((position _Zunit) select 1))/2];
				_distT = 500/(0.75 + (RydHQE_Recklessness/2));
				_eClose1 = [_Zunit,RydHQE_KnEnemiesG,_distT] call RYD_CloseEnemy;
				_eClose2 = [_halfway,RydHQE_KnEnemiesG,_distT] call RYD_CloseEnemy;				
				if ((_eClose1) or (_eClose2)) then {_noenemy = false};
				
				if not ((group _Dunit) in RydHQE_FSupportedG) then
					{
					_UL = leader (group (assignedDriver _Zunit));
					if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_SuppReq,"SuppReq"] call RYD_AIChatter}};
					};

				if (not ((group _Zunit) in RydHQE_FSupportedG) and ((_Zunit distance _cistern) <= _a) and (_noenemy) and (_x in _cisterns)) then 
					{
					if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQE,RydxHQ_AIC_SuppAss,"SuppAss"] call RYD_AIChatter};
					_cisterns = _cisterns - [_x];
					_Zunits = _Zunits - [_Zunit];
					RydHQE_FSupportedG set [(count RydHQE_FSupportedG),(group _Zunit)];
					[_cistern,_Zunit,_dried] spawn E_GoFuelSupp; 
					}
				else
					{
					if (_a == 20000) then 
						{
						if not ((group _Zunit) in RydHQE_FSupportedG) then {if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQE,RydxHQ_AIC_SuppDen,"SuppDen"] call RYD_AIChatter}};
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
					if ((_Dunit distance (assignedvehicle (leader _x))) < 400) exitwith {if not ((group _Dunit) in RydHQE_FSupportedG) then {RydHQE_FSupportedG set [(count RydHQE_FSupportedG),(group _Dunit)]}};
					}
				foreach RydHQE_FuelSupportG;

					{
					if ((_Dunit distance _x) < 400) exitwith {if not ((group _Dunit) in RydHQE_FSupportedG) then {RydHQE_FSupportedG set [(count RydHQE_FSupportedG),(group _Dunit)]}};
					}
				foreach RydHQE_FuelPoints;

				_noenemy = true;
				_halfway = [(((position _cistern) select 0) + ((position _Dunit) select 0))/2,(((position _cistern) select 1) + ((position _Dunit) select 1))/2];
				_distT = 600/(0.75 + (RydHQE_Recklessness/2));
				_eClose1 = [_Dunit,RydHQE_KnEnemiesG,_distT] call RYD_CloseEnemy;
				_eClose2 = [_halfway,RydHQE_KnEnemiesG,_distT] call RYD_CloseEnemy;				
				if ((_eClose1) or (_eClose2)) then {_noenemy = false};

				if not ((group _Dunit) in RydHQE_FSupportedG) then
					{
					_UL = leader (group (assignedDriver _Dunit));
					if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_SuppReq,"SuppReq"] call RYD_AIChatter}};
					};
				
				if (not ((group _Dunit) in RydHQE_FSupportedG) and ((_Dunit distance _cistern) <= _a) and (_noenemy) and (_x in _cisterns)) then 
					{
					if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQE,RydxHQ_AIC_SuppAss,"SuppAss"] call RYD_AIChatter};
					_cisterns = _cisterns - [_x];
					_Dunits = _Dunits - [_Dunit];
					RydHQE_FSupportedG set [(count RydHQE_FSupportedG),(group _Dunit)];
					[_cistern,_Dunit,_dried] spawn E_GoFuelSupp; 
					}
				else
					{
					if (_a == 10000) then 
						{
						if not ((group _Dunit) in RydHQE_FSupportedG) then {if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQE,RydxHQ_AIC_SuppDen,"SuppDen"] call RYD_AIChatter}};
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