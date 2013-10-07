if (isNil ("RydHQF_KnowTL")) then {RydHQF_KnowTL = true};
	
while {not (isNull RydHQF)} do
	{
	waituntil {sleep 1; not (isNil ("RydHQF_KnEnemies"))};
	sleep 20;
	_players = [];
	if (RydHQF_KnowTL) then 
		{
			{
			if (isPlayer (leader _x)) then {_players = _players + [_x]};
			}
		foreach RydHQF_Friends;
		};

	for [{_z = 0},{_z < (count RydHQF_KnEnemies)},{_z = _z + 1}] do
		{
		_KnU = RydHQF_KnEnemies select _z;

			{
			if ((_x knowsAbout _KnU) > 0.01) then 
				{
					{
					_x reveal [_KnU,2]
					} 
				foreach ([RydHQF] + _players);

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
					foreach RydHQF_Friends;
					}
				}
			}
		foreach RydHQF_Friends 
		};

	for [{_z = 0},{_z < (count RydHQF_Friends)},{_z = _z + 1}] do
		{
		_KnU = RydHQF_Friends select _z;

			{
			_x reveal [(vehicle (leader _KnU)),4]
			} 
		foreach ([RydHQF] + _players)
		}
	};