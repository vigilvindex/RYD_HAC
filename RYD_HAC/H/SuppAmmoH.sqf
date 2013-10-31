waitUntil {sleep 10;(not (isNil "RydHQH_Support") and not (isNil "RydHQH_AmmoDrop"))};
waituntil {sleep 10;(((count (RydHQH_Support + RydHQH_AmmoDrop)) > 0) and (RydHQH_Cyclecount > 2))};

if (isNil ("RHQ_Ammo")) then {RHQ_Ammo = []};
if (isNil ("RydHQH_SAmmo")) then {RydHQH_SAmmo = true};
if (isNil ("RydHQH_ExReammo")) then {RydHQH_ExReammo = []};
if (isNil ("RydHQH_AmmoPoints")) then {RydHQH_AmmoPoints = []};

_ammo = RHQ_Ammo + ["I_Truck_02_ammo_F","O_Truck_02_ammo_F","B_APC_Tracked_01_CRV_F","B_Truck_01_ammo_F"] - RHQs_Ammo;

_noenemy = true;

sleep 7;
while {not (isNull RydHQH)} do
	{
	waituntil {sleep 5;RydHQH_SAmmo};
	sleep 25;
	
	RydHQH_AmmoSupport = [];
	RydHQH_AmmoSupportG = [];

		{
		if not (_x in RydHQH_AmmoSupport) then
			{
			if ((typeOf (assignedvehicle _x)) in _ammo) then 
				{
				RydHQH_AmmoSupport set [(count RydHQH_AmmoSupport),_x];

				if not ((group _x) in (RydHQH_AmmoSupportG + RydHQH_SpecForG + RydHQH_CargoOnly)) then 
					{
					RydHQH_AmmoSupportG set [(count RydHQH_AmmoSupportG),(group _x)]
					}
				}
			}
		}
	foreach RydHQH_Support;

		{
		if not (_x in RydHQH_AmmoSupportG) then
			{
			RydHQH_AmmoSupportG set [(count RydHQH_AmmoSupportG),_x]
			}
		}
	foreach RydHQH_AmmoDrop;

	_Hollow = [];
	_soldiers = [];
	_ZeroA = [];

		{
		_ammoN = 0;

			{
			_ammoN = _ammoN + (count (magazines _x))
			}
		foreach (units _x);

			{
			_av = assignedvehicle _x;

			if not (isNull _av) then
				{
				if ((_av ammo ((weapons _av) select 0)) == 0) then
					{
					if not (_av in _ZeroA) then
						{
						if not ((typeOf _av) in (RydHQH_NCVeh)) then
							{
							if (((getposATL _x) select 2) < 5) then 
								{
								_ZeroA set [(count _ZeroA),_av]
								}
							}
						}
					}
				};

			if ((vehicle _x) == _x) then
				{
				if (((_x ammo ((weapons _x) select 0)) == 0) or ((count (magazines _x)) < 2) or ((_ammoN/(((count (units (group _x))) + 0.1)) < (6/((RydHQH_Recklessness*2) + 1))))) then
					{
					if not (_x in _Hollow) then 
						{
						_Hollow set [(count _Hollow),_x]; 
						if not (_x in _soldiers) then 
							{
							_soldiers set [(count _soldiers),_x]
							}
						}
					}
				}
			}
		foreach (units _x)
		}
	foreach (RydHQH_Friends - RydHQH_ExReammo);

	//_Hollow = _Hollow + _ZeroA;
	RydHQH_Hollow = _Hollow + _ZeroA;
	_MTrucks = [];
	if (isNil ("RydHQH_ASupportedG")) then {RydHQH_ASupportedG = []};

		{
		_mtr = assignedVehicle (leader _x);

		if not (isNull _mtr) then
			{
			if (canMove _mtr) then
				{
				if ((fuel _mtr) > 0.2) then
					{
					_unitvar = str (_x);
					_busy = false;
					_busy = _x getvariable ("Busy" + _unitvar);
					if (isNil ("_busy")) then {_busy = false};

					if not (_busy) then
						{
						if not (_x in _MTrucks) then 
							{
							_MTrucks set [(count _MTrucks),_x]
							}
						}
					}
				}
			}
		}
	foreach RydHQH_AmmoSupportG;

	_MTrucks2 = [];
	_MTrucks3 = [];

		{
		if (_x in RydHQH_AmmoDrop) then
			{
			_MTrucks3 set [(count _MTrucks3),_x]
			}
		else
			{
			_MTrucks2 set [(count _MTrucks2),_x]
			}
		}
	foreach _MTrucks;

	_MTrucks2a = +_MTrucks2;
	_MTrucks3a = +_MTrucks3;

	_Zunits = +_ZeroA;
	_a = 0;
	for [{_a = 500},{_a <= 20000},{_a = _a + 500}] do
		{
			{
			_MTruck = assignedvehicle (leader _x);
			if (isNil ("_busy")) then {_busy = false};

			for [{_b = 0},{_b < (count _ZeroA)},{_b = _b + 1}] do 
				{
				_Zunit = _ZeroA select _b;

					{
					if ((_Zunit distance (assignedvehicle (leader _x))) < 400) exitwith {if not ((group _Zunit) in RydHQH_ASupportedG) then {RydHQH_ASupportedG set [(count RydHQH_ASupportedG),(group _Zunit)]}};
					}
				foreach (RydHQH_AmmoSupportG);

					{
					if ((_Zunit distance _x) < 400) exitwith {if not ((group _Zunit) in RydHQH_ASupportedG) then {RydHQH_ASupportedG set [(count RydHQH_ASupportedG),(group _Zunit)]}};
					}
				foreach (RydHQH_AmmoPoints);

				_noenemy = true;

				_halfway = [(((position _MTruck) select 0) + ((position _Zunit) select 0))/2,(((position _MTruck) select 1) + ((position _Zunit) select 1))/2];
				_distT = 500/(0.75 + (RydHQH_Recklessness/2));
				_eClose1 = [_Zunit,RydHQH_KnEnemiesG,_distT] call RYD_CloseEnemy;
				_eClose2 = [_halfway,RydHQH_KnEnemiesG,_distT] call RYD_CloseEnemy;				
				if ((_eClose1) or (_eClose2)) then {_noenemy = false};
				if not ((group _Zunit) in RydHQH_ASupportedG) then
					{
					_UL = leader (group (assignedDriver _Zunit));
					if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_SuppReq,"SuppReq"] call RYD_AIChatter}};
					};
				
				if (not ((group _Zunit) in RydHQH_ASupportedG) and ((_Zunit distance _MTruck) <= _a) and (_noenemy) and (_x in _MTrucks)) then 
					{
					if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQH,RydxHQ_AIC_SuppAss,"SuppAss"] call RYD_AIChatter};
					_MTrucks2 = _MTrucks2 - [_x];
					_Zunits = _Zunits - [_Zunit];
					RydHQH_ASupportedG set [(count RydHQH_ASupportedG),(group _Zunit)];
					[_MTruck,_Zunit,_Hollow,_soldiers,false,objNull] spawn H_GoAmmoSupp
					}
				else
					{
					if (_a == 20000) then 
						{
						if not ((group _Zunit) in RydHQH_ASupportedG) then {if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQH,RydxHQ_AIC_SuppDen,"SuppDen"] call RYD_AIChatter}};
						_Zunits = _Zunits - [_Zunit]
						};
					};
				
				if (((count _MTrucks2) == 0) or ((count _Zunits) == 0)) exitwith {};
				};
			if (((count _MTrucks2) == 0) or ((count _Zunits) == 0)) exitwith {};
			sleep 0.1;
			}
		foreach _MTrucks2a;
		};

	if ((count RydHQH_AmmoBoxes) > 0) then
		{
		_Hunits = +_Hollow;

		for [{_a = 500},{_a < 20000},{_a = _a + 500}] do
			{
				{
				_MTruck = assignedvehicle (leader _x);
				for [{_b = 0},{_b < (count _Hollow)},{_b = _b + 1}] do 
					{
					_Hunit = _Hollow select _b;

						{
						if ((_Hunit distance (assignedvehicle (leader _x))) < 250) exitwith {if not ((group _Hunit) in RydHQH_ASupportedG) then {RydHQH_ASupportedG set [(count RydHQH_ASupportedG),(group _Hunit)]}};
						}
					foreach RydHQH_AmmoSupportG;

						{
						if ((_Hunit distance _x) < 250) exitwith {if not ((group _Zunit) in RydHQH_ASupportedG) then {RydHQH_ASupportedG set [(count RydHQH_ASupportedG),(group _Hunit)]}};
						}
					foreach (RydHQH_AmmoPoints);

					_noenemy = true;
					_halfway = [(((position _MTruck) select 0) + ((position _Hunit) select 0))/2,(((position _MTruck) select 1) + ((position _Hunit) select 1))/2];
					_distT = 300/(0.75 + (RydHQH_Recklessness/2));
					_eClose1 = [_Hunit,RydHQH_KnEnemiesG,_distT] call RYD_CloseEnemy;
					_eClose2 = [_halfway,RydHQH_KnEnemiesG,_distT] call RYD_CloseEnemy;				
					if ((_eClose1) or (_eClose2)) then {_noenemy = false};

					if not ((group _Hunit) in (RydHQH_ASupportedG + RydHQH_Boxed)) then
						{
						_UL = leader (group _Hunit);
						if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_SuppReq,"SuppReq"] call RYD_AIChatter}};
						};
				
					if (not ((group _Hunit) in (RydHQH_ASupportedG + RydHQH_Boxed)) and ((_Hunit distance _MTruck) <= _a) and (_noenemy) and (_x in _MTrucks) and ((count RydHQH_AmmoBoxes) > 0)) then 
						{
						if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQH,RydxHQ_AIC_SuppAss,"SuppAss"] call RYD_AIChatter};
						_MTrucks3 = _MTrucks3 - [_x];
						_Hunits = _Hunits - [_Hunit];
						RydHQH_ASupportedG set [(count RydHQH_ASupportedG),(group _Hunit)];
						_ammoBox = RydHQH_AmmoBoxes select 0;
						RydHQH_AmmoBoxes = RydHQH_AmmoBoxes - [_ammoBox];
						[_MTruck,_Hunit,_Hollow,_soldiers,true,_ammoBox] spawn H_GoAmmoSupp; 
						}
					else
						{
						if (_a == 20000) then 
							{
							if not ((group _Hunit) in RydHQH_ASupportedG) then {if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQH,RydxHQ_AIC_SuppDen,"SuppDen"] call RYD_AIChatter}};
							_Hunits = _Hunits - [_Hunit]
							};
						};				
					if (((count _MTrucks3) == 0) or ((count _Hunits) == 0)) exitwith {};
					};
				if (((count _MTrucks3) == 0) or ((count _Hunits) == 0)) exitwith {};
				sleep 0.1
				}
			foreach _MTrucks3a
			}
		}
	};