_HQ = _this select 0;

_reck = RydHQ_Recklessness;

switch (true) do
	{
	case (_HQ == RydHQB) : {_reck = RydHQB_Recklessness};
	case (_HQ == RydHQC) : {_reck = RydHQC_Recklessness};
	case (_HQ == RydHQD) : {_reck = RydHQD_Recklessness};
	case (_HQ == RydHQE) : {_reck = RydHQE_Recklessness};
	case (_HQ == RydHQF) : {_reck = RydHQF_Recklessness};
	case (_HQ == RydHQG) : {_reck = RydHQG_Recklessness};
	case (_HQ == RydHQH) : {_reck = RydHQH_Recklessness};
	};

_rInit = _reck;

while {not (isNull _HQ)} do
	{
	_reck = RydHQ_Recklessness;
	_ally = RydHQ_Friends;
	_enemy = RydHQ_KnEnemiesG;

	switch (true) do
		{
		case (_HQ == RydHQB) : {_ally = RydHQB_Friends;_enemy = RydHQB_KnEnemiesG;_reck = RydHQB_Recklessness};
		case (_HQ == RydHQC) : {_ally = RydHQC_Friends;_enemy = RydHQC_KnEnemiesG;_reck = RydHQC_Recklessness};
		case (_HQ == RydHQD) : {_ally = RydHQD_Friends;_enemy = RydHQD_KnEnemiesG;_reck = RydHQD_Recklessness};
		case (_HQ == RydHQE) : {_ally = RydHQE_Friends;_enemy = RydHQE_KnEnemiesG;_reck = RydHQE_Recklessness};
		case (_HQ == RydHQF) : {_ally = RydHQF_Friends;_enemy = RydHQF_KnEnemiesG;_reck = RydHQF_Recklessness};
		case (_HQ == RydHQG) : {_ally = RydHQG_Friends;_enemy = RydHQG_KnEnemiesG;_reck = RydHQG_Recklessness};
		case (_HQ == RydHQH) : {_ally = RydHQH_Friends;_enemy = RydHQH_KnEnemiesG;_reck = RydHQH_Recklessness};
		};

	_leader = leader _HQ;
	_distAllyS = 0;

		{
		_dist = (vehicle (leader _x)) distance _leader;
		_distAllyS = _distAllyS + _dist;
		}
	foreach _ally;

	_cAlly = count _ally;
	_midD = 20000;
	if not (_cAlly == 0) then {_midD = _distAllyS/_cAlly};


	_distEnemyS = 0;
	_nearE = false;

		{
		_distE = (vehicle (leader _x)) distance _leader;
		_distEnemyS = _distEnemyS + _distE;
		if (_distE < 600) then {_nearE = true};
		}
	foreach _enemy;

	_cEnemy = count _enemy;
	_midDE = 20000;
	if not (_cEnemy == 0) then {_midDE = _distEnemyS/_cEnemy};

	if (((_midD > _midDE) and (_midDE < 2000)) or (_nearE)) then 
		{
		switch (true) do
			{
			case (_HQ == RydHQB) : {RydHQB_Recklessness = (_rInit + 0.2) * 10};
			case (_HQ == RydHQC) : {RydHQC_Recklessness = (_rInit + 0.2) * 10};
			case (_HQ == RydHQD) : {RydHQD_Recklessness = (_rInit + 0.2) * 10};
			case (_HQ == RydHQE) : {RydHQE_Recklessness = (_rInit + 0.2) * 10};
			case (_HQ == RydHQF) : {RydHQF_Recklessness = (_rInit + 0.2) * 10};
			case (_HQ == RydHQG) : {RydHQG_Recklessness = (_rInit + 0.2) * 10};
			case (_HQ == RydHQH) : {RydHQH_Recklessness = (_rInit + 0.2) * 10};
			}
		}
	else
		{
		switch (true) do
			{
			case (_HQ == RydHQB) : {RydHQB_Recklessness = _rInit};
			case (_HQ == RydHQC) : {RydHQC_Recklessness = _rInit};
			case (_HQ == RydHQD) : {RydHQD_Recklessness = _rInit};
			case (_HQ == RydHQE) : {RydHQE_Recklessness = _rInit};
			case (_HQ == RydHQF) : {RydHQF_Recklessness = _rInit};
			case (_HQ == RydHQG) : {RydHQG_Recklessness = _rInit};
			case (_HQ == RydHQH) : {RydHQH_Recklessness = _rInit};
			}
		};
	
	sleep 60;
	}