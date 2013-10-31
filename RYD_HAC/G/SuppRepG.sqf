waituntil {sleep 10;(not (isNil ("RydHQG_Support")) and ((count RydHQG_Support) > 0) and (RydHQG_Cyclecount > 2))};

if (isNil ("RHQ_Rep")) then {RHQ_Rep = []};
if (isNil ("RydHQG_SRep")) then {RydHQG_SRep = true};
if (isNil ("RydHQG_ExRepair")) then {RydHQG_ExRepair = []};
if (isNil ("RydHQG_RepPoints")) then {RydHQG_RepPoints = []};

_rep = RHQ_Rep + ["I_Truck_02_box_F","O_Truck_02_box_F","B_APC_Tracked_01_CRV_F","B_Truck_01_Repair_F"] - RHQs_Rep;
_noenemy = true;
sleep 5;
while {not (isNull RydHQG)} do
	{
	waituntil {sleep 5;RydHQG_SRep};
	sleep 25;
	
	RydHQG_RepSupport = [];
	RydHQG_RepSupportG = [];

		{
		if not (_x in RydHQG_RepSupport) then
			{
			if ((typeOf (assignedvehicle _x)) in _rep) then 
				{
				RydHQG_RepSupport set [(count RydHQG_RepSupport),_x];
				if not ((group _x) in (RydHQG_RepSupportG + RydHQG_SpecForG + RydHQG_CargoOnly)) then 
					{
					RydHQG_RepSupportG set [(count RydHQG_RepSupportG),(group _x)]
					}
				}
			}
		}
	foreach RydHQG_Support;

	_damaged = [];
	_Sdamaged = [];
	_Ldamaged = [];

		{
			{
			_av = assignedvehicle _x;
			if not (isNull _av) then
				{
				if ((damage _av) > 0.1) then
					{
					if ((damage _av) < 0.9) then
						{
						if (((getposATL _x) select 2) < 5) then 
							{
							_damaged set [(count _damaged),_av];
							if (((damage _av) > 0.5) or not (canMove _av)) then
								{
								_Sdamaged set [(count _Sdamaged),_av]
								}
							}
						}
					}
				}
			}
		foreach (units _x)
		}
	foreach (RydHQG_Friends - RydHQG_ExRepair);

	_Ldamaged = _damaged - _Sdamaged;
	RydHQG_damaged = _damaged;
	_rtrs = [];
	if (isNil ("RydHQG_RSupportedG")) then {RydHQG_RSupportedG = []};

		{
		_rt = assignedVehicle (leader _x);

		if not (isNull _rt) then
			{
			if (canMove _rt) then
				{
				if ((fuel _rt) > 0.2) then
					{
					_unitvar = str (_x);
					_busy = false;
					_busy = _x getvariable ("Busy" + _unitvar);
					if (isNil ("_busy")) then {_busy = false};

					if not (_busy) then
						{
						if not (_x in _rtrs) then 
							{
							_rtrs set [(count _rtrs),_x]
							}
						}
					}
				}
			}
		}
	foreach RydHQG_RepSupportG;

	_rtrs2 = +_rtrs;
	_SDunits = +_Sdamaged;
	_a = 0;
	for [{_a = 500},{_a <= 20000},{_a = _a + 500}] do
		{
			{
			_rtr = assignedvehicle (leader _x);
			if (isNil ("_busy")) then {_busy = false};

			for [{_b = 0},{_b < (count _Sdamaged)},{_b = _b + 1}] do 
				{
				_SDunit = _Sdamaged select _b;

					{
					if ((_SDunit distance (assignedvehicle (leader _x))) < 300) exitwith {if not ((group _SDunit) in RydHQG_RSupportedG) then {RydHQG_RSupportedG set [(count RydHQG_RSupportedG),(group _SDunit)]}};
					}
				foreach RydHQG_RepSupportG;

					{
					if ((_SDunit distance _x) < 300) exitwith {if not ((group _SDunit) in RydHQG_RSupportedG) then {RydHQG_RSupportedG set [(count RydHQG_RSupportedG),(group _SDunit)]}};
					}
				foreach RydHQG_RepPoints;

				_noenemy = true;
				_halfway = [(((position _rtr) select 0) + ((position _SDunit) select 0))/2,(((position _rtr) select 1) + ((position _SDunit) select 1))/2];
				_distT = 500/(0.75 + (RydHQG_Recklessness/2));
				_eClose1 = [_SDunit,RydHQG_KnEnemiesG,_distT] call RYD_CloseEnemy;
				_eClose2 = [_halfway,RydHQG_KnEnemiesG,_distT] call RYD_CloseEnemy;				
				if ((_eClose1) or (_eClose2)) then {_noenemy = false};

				if not ((group _SDunit) in RydHQG_RSupportedG) then
					{
					_UL = leader (group (assignedDriver _SDunit));
					if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_SuppReq,"SuppReq"] call RYD_AIChatter}};
					};
				
				if (not ((group _SDunit) in RydHQG_RSupportedG) and ((_SDunit distance _rtr) <= _a) and (_noenemy) and (_x in _rtrs)) then 
					{
					if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQG,RydxHQ_AIC_SuppAss,"SuppAss"] call RYD_AIChatter};
					_rtrs = _rtrs - [_x];
					_SDunits = _SDunits - [_SDunit];
					RydHQG_RSupportedG set [(count RydHQG_RSupportedG),(group _SDunit)];
					[_rtr,_SDunit,_damaged] spawn G_GoRepSupp; 
					}
				else
					{
					if (_a == 20000) then 
						{
						if not ((group _SDunit) in RydHQG_RSupportedG) then {if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQG,RydxHQ_AIC_SuppDen,"SuppDen"] call RYD_AIChatter}};
						_SDunits = _SDunits - [_SDunit]
						};
					};
				
				if (((count _rtrs) == 0) or ((count _SDunits) == 0)) exitwith {};
				};
			if (((count _rtrs) == 0) or ((count _SDunits) == 0)) exitwith {};
			sleep 0.1;
			}
		foreach _rtrs2;
		};

	_Dunits = +_damaged;

	for [{_a = 500},{_a < 10000},{_a = _a + 500}] do
		{
			{
			_rtr = assignedvehicle (leader _x);
			for [{_b = 0},{_b < (count _damaged)},{_b = _b + 1}] do 
				{
				_Dunit = _damaged select _b;

					{
					if ((_Dunit distance (assignedvehicle (leader _x))) < 400) exitwith {if not ((group _Dunit) in RydHQG_RSupportedG) then {RydHQG_RSupportedG set [(count RydHQG_RSupportedG),(group _Dunit)]}};
					}
				foreach RydHQG_RepSupportG;

					{
					if ((_Dunit distance _x) < 400) exitwith {if not ((group _Dunit) in RydHQG_RSupportedG) then {RydHQG_RSupportedG set [(count RydHQG_RSupportedG),(group _Dunit)]}};
					}
				foreach RydHQG_RepPoints;

				_noenemy = true;
				_halfway = [(((position _rtr) select 0) + ((position _Dunit) select 0))/2,(((position _rtr) select 1) + ((position _Dunit) select 1))/2];
				_distT = 600/(0.75 + (RydHQG_Recklessness/2));
				_eClose1 = [_Dunit,RydHQG_KnEnemiesG,_distT] call RYD_CloseEnemy;
				_eClose2 = [_halfway,RydHQG_KnEnemiesG,_distT] call RYD_CloseEnemy;				
				if ((_eClose1) or (_eClose2)) then {_noenemy = false};

				if not ((group _Dunit) in RydHQG_RSupportedG) then
					{
					_UL = leader (group (assignedDriver _Dunit));
					if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_SuppReq,"SuppReq"] call RYD_AIChatter}};
					};
							
				if (not ((group _Dunit) in RydHQG_RSupportedG) and ((_Dunit distance _rtr) <= _a) and (_noenemy) and (_x in _rtrs)) then 
					{
					if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQG,RydxHQ_AIC_SuppAss,"SuppAss"] call RYD_AIChatter};
					_rtrs = _rtrs - [_x];
					_Dunits = _Dunits - [_Dunit];
					RydHQG_RSupportedG set [(count RydHQG_RSupportedG),(group _Dunit)];
					[_rtr,_Dunit,_damaged] spawn G_GoRepSupp; 
					}
				else
					{
					if (_a == 10000) then 
						{
						if not ((group _Dunit) in RydHQG_RSupportedG) then {if ((random 100) < RydxHQ_AIChatDensity) then {[leaderHQG,RydxHQ_AIC_SuppDen,"SuppDen"] call RYD_AIChatter}};
						_Dunits = _Dunits - [_Dunit]
						};
					};
				
				if (((count _rtrs) == 0) or ((count _Dunits) == 0)) exitwith {};
				};
			if (((count _rtrs) == 0) or ((count _Dunits) == 0)) exitwith {};
			sleep 0.1;
			}
		foreach _rtrs2;
		};


	};