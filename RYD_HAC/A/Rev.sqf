if (isNil ("RydHQ_KnowTL")) then {RydHQ_KnowTL = true};
	
while {not (isNull RydHQ)} do
	{
	waituntil {sleep 1; not (isNil ("RydHQ_KnEnemies"))};
	sleep 20;
	_players = [];
	if (RydHQ_KnowTL) then 
		{
			{
			if (isPlayer (leader _x)) then {_players = _players + [_x]};
			}
		foreach RydHQ_Friends;
		};

	for [{_z = 0},{_z < (count RydHQ_KnEnemies)},{_z = _z + 1}] do
		{
		_KnU = RydHQ_KnEnemies select _z;

			{
			if ((_x knowsAbout _KnU) > 0.01) then 
				{
					{
					_x reveal [_KnU,2]
					} 
				foreach ([RydHQ] + _players);

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
					foreach RydHQ_Friends;
					}
				}
			}
		foreach RydHQ_Friends 
		};

	for [{_z = 0},{_z < (count RydHQ_Friends)},{_z = _z + 1}] do
		{
		_KnU = RydHQ_Friends select _z;

			{
			_x reveal [(vehicle (leader _KnU)),4]
			} 
		foreach ([RydHQ] + _players)
		};
	};