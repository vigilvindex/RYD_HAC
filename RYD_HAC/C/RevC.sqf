if (isNil ("RydHQC_KnowTL")) then {RydHQC_KnowTL = true};
	
while {not (isNull RydHQC)} do
	{
	waituntil {sleep 1; not (isNil ("RydHQC_KnEnemies"))};
	sleep 20;
	_players = [];
	if (RydHQC_KnowTL) then 
		{
			{
			if (isPlayer (leader _x)) then {_players = _players + [_x]};
			}
		foreach RydHQC_Friends;
		};

	for [{_z = 0},{_z < (count RydHQC_KnEnemies)},{_z = _z + 1}] do
		{
		_KnU = RydHQC_KnEnemies select _z;

			{
			if ((_x knowsAbout _KnU) > 0.01) then 
				{
					{
					_x reveal [_KnU,2]
					} 
				foreach ([RydHQC] + _players);

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
					foreach RydHQC_Friends;
					}
				}
			}
		foreach RydHQC_Friends 
		};

	for [{_z = 0},{_z < (count RydHQC_Friends)},{_z = _z + 1}] do
		{
		_KnU = RydHQC_Friends select _z;

			{
			_x reveal [(vehicle (leader _KnU)),4]
			} 
		foreach ([RydHQC] + _players)
		}
	};