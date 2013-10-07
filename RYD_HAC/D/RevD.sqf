if (isNil ("RydHQD_KnowTL")) then {RydHQD_KnowTL = true};
	
while {not (isNull RydHQD)} do
	{
	waituntil {sleep 1; not (isNil ("RydHQD_KnEnemies"))};
	sleep 20;
	_players = [];
	if (RydHQD_KnowTL) then 
		{
			{
			if (isPlayer (leader _x)) then {_players = _players + [_x]};
			}
		foreach RydHQD_Friends;
		};

	for [{_z = 0},{_z < (count RydHQD_KnEnemies)},{_z = _z + 1}] do
		{
		_KnU = RydHQD_KnEnemies select _z;

			{
			if ((_x knowsAbout _KnU) > 0.01) then 
				{
					{
					_x reveal [_KnU,2]
					} 
				foreach ([RydHQD] + _players);

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
					foreach RydHQD_Friends;
					}
				}
			}
		foreach RydHQD_Friends 
		};

	for [{_z = 0},{_z < (count RydHQD_Friends)},{_z = _z + 1}] do
		{
		_KnU = RydHQD_Friends select _z;

			{
			_x reveal [(vehicle (leader _KnU)),4]
			} 
		foreach ([RydHQD] + _players)
		}
	};