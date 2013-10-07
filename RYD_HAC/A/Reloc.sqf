_expression = "(1 + (2 * Meadow)) * (1 - Forest) * (1 - (0.5 * Trees)) * (1 - (10 * sea)) * (1 - (2 * Houses))";
_radius = 100;
_precision = 20;
_sourcesCount = 1;

waituntil {sleep 1;not (isNil ("RydHQ_NCCargoG"))};

while {not (isNull RydHQ)} do
	{
	sleep 60;
	if (isNull RydHQ) exitWith {};

		{
		sleep 1;
		_LU = leader _x;
		_lastpos = _x getvariable ("START" + (str _x));
		if (isNil ("_lastpos")) then {_x setVariable [("START" + (str _x)),(position (assignedvehicle _LU))]};
		_lastpos = _x getvariable ("START" + (str _x));
		_position = [((position leaderHQ) select 0) + (random 800) - 400,((position leaderHQ) select 1) + (random 800) - 400];
		_Spot = selectBestPlaces [_position,_radius,_expression,_precision,_sourcesCount];
		_Spot = _Spot select 0;
		_Spot = _Spot select 0;

		_posX = _Spot select 0;
		_posY = _Spot select 1;
		
		_isWater = surfaceIsWater [_posX,_posY];

		if (not (_x in RydHQ_AirG) and not
			(_iswater) and
				((_lastpos distance RydHQ_Obj) > 2000) and 
					((_lastpos distance leaderHQ) > 1000) and 
						((isNull (leaderHQ FindNearestEnemy [_posX,_posY])) or (((leaderHQ findNearestEnemy [_posX,_posY]) distance [_posX,_posY]) > 600)) or
							(not (isNull (_LU FindNearestEnemy _LU)) and (((_LU findNearestEnemy _LU) distance _LU) < 500))) then 
			{
			_x setVariable [("START" + (str _x)),[_posX,_posY]];
			};
		}   
	foreach RydHQ_NCCargoG;
	}