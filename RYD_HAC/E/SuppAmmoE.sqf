waitUntil {sleep 10;(not (isNil "RydHQE_Support") and not (isNil "RydHQE_AmmoDrop"))};
waituntil {sleep 10;(((count (RydHQE_Support + RydHQE_AmmoDrop)) > 0) and (RydHQE_Cyclecount > 2))};

if (isNil ("RHQ_Ammo")) then {RHQ_Ammo = []};
if (isNil ("RydHQE_SAmmo")) then {RydHQE_SAmmo = true};
if (isNil ("RydHQE_ExReammo")) then {RydHQE_ExReammo = []};
if (isNil ("RydHQE_AmmoPoints")) then {RydHQE_AmmoPoints = []};

_ammo = RHQ_Ammo + ["T810Reammo_Des_ACR","T810Reammo_ACR","UralReammo_TK_EP1","MtvrReammo_DES_EP1","V3S_Reammo_TK_GUE_EP1","UralReammo_INS","KamazReammo","UralReammo_CDF","MtvrReammo"] - RHQs_Ammo;

_noenemy = true;

sleep 7;
while {not (isNull RydHQE)} do
	{
	waituntil {sleep 5;RydHQE_SAmmo};
	sleep 25;
	
	RydHQE_AmmoSupport = [];
	RydHQE_AmmoSupportG = [];

		{
		if not (_x in RydHQE_AmmoSupport) then
			{
			if ((typeOf (assignedvehicle _x)) in _ammo) then 
				{
				RydHQE_AmmoSupport set [(count RydHQE_AmmoSupport),_x];

				if not ((group _x) in (RydHQE_AmmoSupportG + RydHQE_SpecForG + RydHQE_CargoOnly)) then 
					{
					RydHQE_AmmoSupportG set [(count RydHQE_AmmoSupportG),(group _x)]
					}
				}
			}
		}
	foreach RydHQE_Support;

		{
		if not (_x in RydHQE_AmmoSupportG) then
			{
			RydHQE_AmmoSupportG set [(count RydHQE_AmmoSupportG),_x]
			}
		}
	foreach RydHQE_AmmoDrop;

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
						if not ((typeOf _av) in (RydHQE_NCVeh)) then
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
				if (((_x ammo ((weapons _x) select 0)) == 0) or ((count (magazines _x)) < 2) or ((_ammoN/(((count (units (group _x))) + 0.1)) < (6/((RydHQE_Recklessness*2) + 1))))) then
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
	foreach (RydHQE_Friends - RydHQE_ExReammo);

	//_Hollow = _Hollow + _ZeroA;
	RydHQE_Hollow = _Hollow + _ZeroA;
	_MTrucks = [];
	if (isNil ("RydHQE_ASupportedG")) then {RydHQE_ASupportedG = []};

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
	foreach RydHQE_AmmoSupportG;

	_MTrucks2 = [];
	_MTrucks3 = [];

		{
		if (_x in RydHQE_AmmoDrop) then
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
					if ((_Zunit distance (assignedvehicle (leader _x))) < 400) exitwith {if not ((group _Zunit) in RydHQE_ASupportedG) then {RydHQE_ASupportedG set [(count RydHQE_ASupportedG),(group _Zunit)]}};
					}
				foreach (RydHQE_AmmoSupportG);

					{
					if ((_Zunit distance _x) < 400) exitwith {if not ((group _Zunit) in RydHQE_ASupportedG) then {RydHQE_ASupportedG set [(count RydHQE_ASupportedG),(group _Zunit)]}};
					}
				foreach (RydHQE_AmmoPoints);

				_noenemy = true;

				_halfway = [(((position _MTruck) select 0) + ((position _Zunit) select 0))/2,(((position _MTruck) select 1) + ((position _Zunit) select 1))/2];
				_distT = 500/(0.75 + (RydHQE_Recklessness/2));
				_eClose1 = [_Zunit,RydHQE_KnEnemiesG,_distT] call RYD_CloseEnemy;
				_eClose2 = [_halfway,RydHQE_KnEnemiesG,_distT] call RYD_CloseEnemy;				
				if ((_eClose1) or (_eClose2)) then {_noenemy = false};
				if not ((group _Zunit) in RydHQE_ASupportedG) then
					{
					_UL = leader (group (assignedDriver _Zunit));
					if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_SuppReq,"SuppReq"] call RYD_AIChatter}};
					};
				
				if (not ((group _Zunit) in RydHQE_ASupportedG) and ((_Zunit distance _MTruck) <= _a) and (_noenemy) and (_x in _MTrucks)) then 
					{
					if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQE,RydxHQ_AIC_SuppAss,"SuppAss"] call RYD_AIChatter};
					_MTrucks2 = _MTrucks2 - [_x];
					_Zunits = _Zunits - [_Zunit];
					RydHQE_ASupportedG set [(count RydHQE_ASupportedG),(group _Zunit)];
					[_MTruck,_Zunit,_Hollow,_soldiers,false,objNull] spawn E_GoAmmoSupp
					}
				else
					{
					if (_a == 20000) then 
						{
						if not ((group _Zunit) in RydHQE_ASupportedG) then {if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQE,RydxHQ_AIC_SuppDen,"SuppDen"] call RYD_AIChatter}};
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

	if ((count RydHQE_AmmoBoxes) > 0) then
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
						if ((_Hunit distance (assignedvehicle (leader _x))) < 250) exitwith {if not ((group _Hunit) in RydHQE_ASupportedG) then {RydHQE_ASupportedG set [(count RydHQE_ASupportedG),(group _Hunit)]}};
						}
					foreach RydHQE_AmmoSupportG;

						{
						if ((_Hunit distance _x) < 250) exitwith {if not ((group _Zunit) in RydHQE_ASupportedG) then {RydHQE_ASupportedG set [(count RydHQE_ASupportedG),(group _Hunit)]}};
						}
					foreach (RydHQE_AmmoPoints);

					_noenemy = true;
					_halfway = [(((position _MTruck) select 0) + ((position _Hunit) select 0))/2,(((position _MTruck) select 1) + ((position _Hunit) select 1))/2];
					_distT = 300/(0.75 + (RydHQE_Recklessness/2));
					_eClose1 = [_Hunit,RydHQE_KnEnemiesG,_distT] call RYD_CloseEnemy;
					_eClose2 = [_halfway,RydHQE_KnEnemiesG,_distT] call RYD_CloseEnemy;				
					if ((_eClose1) or (_eClose2)) then {_noenemy = false};

					if not ((group _Nunit) in (RydHQE_ASupportedG + RydHQE_Boxed)) then
						{
						_UL = leader (group _Hunit);
						if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_SuppReq,"SuppReq"] call RYD_AIChatter}};
						};
				
					if (not ((group _Hunit) in (RydHQE_ASupportedG + RydHQE_Boxed)) and ((_Hunit distance _MTruck) <= _a) and (_noenemy) and (_x in _MTrucks) and ((count RydHQE_AmmoBoxes) > 0)) then 
						{
						if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQE,RydxHQ_AIC_SuppAss,"SuppAss"] call RYD_AIChatter};
						_MTrucks3 = _MTrucks3 - [_x];
						_Hunits = _Hunits - [_Hunit];
						RydHQE_ASupportedG set [(count RydHQE_ASupportedG),(group _Hunit)];
						_ammoBox = RydHQE_AmmoBoxes select 0;
						RydHQE_AmmoBoxes = RydHQE_AmmoBoxes - [_ammoBox];
						[_MTruck,_Hunit,_Hollow,_soldiers,true,_ammoBox] spawn E_GoAmmoSupp; 
						}
					else
						{
						if (_a == 20000) then 
							{
							if not ((group _Hunit) in RydHQE_ASupportedG) then {if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQE,RydxHQ_AIC_SuppDen,"SuppDen"] call RYD_AIChatter}};
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