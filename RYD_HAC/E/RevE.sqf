if (isNil ("RydHQE_KnowTL")) then {RydHQE_KnowTL = true};
	
while {not (isNull RydHQE)} do
	{
	waituntil {sleep 1; not (isNil ("RydHQE_KnEnemies"))};
	sleep 20;
	_players = [];
	if (RydHQE_KnowTL) then 
		{
			{
			if (isPlayer (leader _x)) then {_players = _players + [_x]};
			}
		foreach RydHQE_Friends;
		};

	for [{_z = 0},{_z < (count RydHQE_KnEnemies)},{_z = _z + 1}] do
		{
		_KnU = RydHQE_KnEnemies select _z;

			{
			if ((_x knowsAbout _KnU) > 0.01) then 
				{
					{
					_x reveal [_KnU,2]
					} 
				foreach ([RydHQE] + _players);

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
					foreach RydHQE_Friends;
					}
				}
			}
		foreach RydHQE_Friends 
		};

	for [{_z = 0},{_z < (count RydHQE_Friends)},{_z = _z + 1}] do
		{
		_KnU = RydHQE_Friends select _z;

			{
			_x reveal [(vehicle (leader _KnU)),4]
			} 
		foreach ([RydHQE] + _players)
		}
	};