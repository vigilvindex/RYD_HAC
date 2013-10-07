if (isNil ("RydHQB_KnowTL")) then {RydHQB_KnowTL = true};
	
while {not (isNull RydHQB)} do
	{
	waituntil {sleep 1; not (isNil ("RydHQB_KnEnemies"))};
	sleep 20;
	_players = [];
	if (RydHQB_KnowTL) then 
		{
			{
			if (isPlayer (leader _x)) then {_players = _players + [_x]};
			}
		foreach RydHQB_Friends;
		};

	for [{_z = 0},{_z < (count RydHQB_KnEnemies)},{_z = _z + 1}] do
		{
		_KnU = RydHQB_KnEnemies select _z;

			{
			if ((_x knowsAbout _KnU) > 0.01) then 
				{
					{
					_x reveal [_KnU,2]
					} 
				foreach ([RydHQB] + _players);

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
					foreach RydHQB_Friends;
					}
				}
			}
		foreach RydHQB_Friends 
		};

	for [{_z = 0},{_z < (count RydHQB_Friends)},{_z = _z + 1}] do
		{
		_KnU = RydHQB_Friends select _z;

			{
			_x reveal [(vehicle (leader _KnU)),4]
			} 
		foreach ([RydHQB] + _players)
		}
	};