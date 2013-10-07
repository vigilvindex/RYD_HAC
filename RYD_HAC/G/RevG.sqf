if (isNil ("RydHQG_KnowTL")) then {RydHQG_KnowTL = true};
	
while {not (isNull RydHQG)} do
	{
	waituntil {sleep 1; not (isNil ("RydHQG_KnEnemies"))};
	sleep 20;
	_players = [];
	if (RydHQG_KnowTL) then 
		{
			{
			if (isPlayer (leader _x)) then {_players = _players + [_x]};
			}
		foreach RydHQG_Friends;
		};

	for [{_z = 0},{_z < (count RydHQG_KnEnemies)},{_z = _z + 1}] do
		{
		_KnU = RydHQG_KnEnemies select _z;

			{
			if ((_x knowsAbout _KnU) > 0.01) then 
				{
					{
					_x reveal [_KnU,2]
					} 
				foreach ([RydHQG] + _players);

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
					foreach RydHQG_Friends;
					}
				}
			}
		foreach RydHQG_Friends 
		};

	for [{_z = 0},{_z < (count RydHQG_Friends)},{_z = _z + 1}] do
		{
		_KnU = RydHQG_Friends select _z;

			{
			_x reveal [(vehicle (leader _KnU)),4]
			} 
		foreach ([RydHQG] + _players)
		}
	};