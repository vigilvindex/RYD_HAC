if (isNil ("RydHQH_KnowTL")) then {RydHQH_KnowTL = true};
	
while {not (isNull RydHQH)} do
	{
	waituntil {sleep 1; not (isNil ("RydHQH_KnEnemies"))};
	sleep 20;
	_players = [];
	if (RydHQH_KnowTL) then 
		{
			{
			if (isPlayer (leader _x)) then {_players = _players + [_x]};
			}
		foreach RydHQH_Friends;
		};

	for [{_z = 0},{_z < (count RydHQH_KnEnemies)},{_z = _z + 1}] do
		{
		_KnU = RydHQH_KnEnemies select _z;

			{
			if ((_x knowsAbout _KnU) > 0.01) then 
				{
					{
					_x reveal [_KnU,2]
					} 
				foreach ([RydHQH] + _players);

				if (RydxHQ_NEAware > 0) then
					{
						{
						_ldr = vehicle (leader _x);
						_dst = _ldr distance (vehicle _KnU); 
						if (_dst < RydxHQ_NEAware) then
							{
							_x reveal [_KnU,2]
							}
						}
					foreach RydHQH_Friends;
					}
				}
			}
		foreach RydHQH_Friends 
		};

	for [{_z = 0},{_z < (count RydHQH_Friends)},{_z = _z + 1}] do
		{
		_KnU = RydHQH_Friends select _z;

			{
			_x reveal [(vehicle (leader _KnU)),4]
			} 
		foreach ([RydHQH] + _players)
		}
	};