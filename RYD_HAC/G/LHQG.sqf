_cycle = 0;

waitUntil {sleep 1; not (isNil "RydHQG")};

while {not (isNull RydHQG)} do
	{
	_last = leaderHQG;
	if (isNil ("_last")) then {_last = ObjNull};
	sleep 0.2;
	leaderHQG = leader RydHQG;
	RydHQG_LHQInit = true;
	if not (_last == leaderHQG) then
		{
		if not (isNull leaderHQG) then
			{
			if (alive leaderHQG) then
				{
				if not (isNull RydHQG) then
					{
					if not (_cycle == RydHQG_Cyclecount) then
						{
						if not (RydHQG_Cyclecount < 2) then 
							{
							RydxHQ_AllLeaders = RydxHQ_AllLeaders - [_last];RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQG];_cycle = RydHQG_Cyclecount;
							RydHQG_Personality = RydHQG_Personality + "-";
							RydHQG_Recklessness = RydHQG_Recklessness + (random 0.2);
							RydHQG_Consistency = RydHQG_Consistency - (random 0.2);
							RydHQG_Activity = RydHQG_Activity - (random 0.2);
							RydHQG_Reflex = RydHQG_Reflex - (random 0.2);
							RydHQG_Circumspection = RydHQG_Circumspection - (random 0.2);
							RydHQG_Fineness = RydHQG_Fineness - (random 0.2);

							if (RydHQG_Recklessness > 1) then {RydHQG_Recklessness = 1};
							if (RydHQG_Recklessness < 0) then {RydHQG_Recklessness = 0};
							
							if (RydHQG_Consistency > 1) then {RydHQG_Consistency = 1};
							if (RydHQG_Consistency < 0) then {RydHQG_Consistency = 0};
							
							if (RydHQG_Activity > 1) then {RydHQG_Activity = 1};
							if (RydHQG_Activity < 0) then {RydHQG_Activity = 0};
							
							if (RydHQG_Reflex > 1) then {RydHQG_Reflex = 1};
							if (RydHQG_Reflex < 0) then {RydHQG_Reflex = 0};
							
							if (RydHQG_Circumspection > 1) then {RydHQG_Circumspection = 1};
							if (RydHQG_Circumspection < 0) then {RydHQG_Circumspection = 0};
							
							if (RydHQG_Fineness > 1) then {RydHQG_Fineness = 1};
							if (RydHQG_Fineness < 0) then {RydHQG_Fineness = 0};

							[] spawn
								{
								sleep (60 + (random 120));
								RydHQG_Morale = RydHQG_Morale - (10 + round (random 10));
								}
							}
						}
					}
				}
			}
		};

	if (({alive _x} count (units RydHQG)) == 0) then {RydHQG = GrpNull};
	};

if (RydHQG_Debug) then {hintSilent "HQ of G forces has been destroyed!"};

RydHQG_Done = true;