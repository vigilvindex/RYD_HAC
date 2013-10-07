_cycle = 0;

waitUntil {sleep 1; not (isNil "RydHQ")};

while {not (isNull RydHQ)} do
	{
	_last = leaderHQ;
	if (isNil ("_last")) then {_last = ObjNull};
	sleep 0.2;
	leaderHQ = leader RydHQ;
	RydHQ_LHQInit = true;
	if not (_last == leaderHQ) then
		{
		if not (isNull leaderHQ) then
			{
			if (alive leaderHQ) then
				{
				if not (isNull RydHQ) then
					{
					if not (_cycle == RydHQ_Cyclecount) then
						{
						if not (RydHQ_Cyclecount < 2) then 
							{
							RydxHQ_AllLeaders = RydxHQ_AllLeaders - [_last];RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQ];_cycle = RydHQ_Cyclecount;
							RydHQ_Personality = RydHQ_Personality + "-";
							RydHQ_Recklessness = RydHQ_Recklessness + (random 0.2);
							RydHQ_Consistency = RydHQ_Consistency - (random 0.2);
							RydHQ_Activity = RydHQ_Activity - (random 0.2);
							RydHQ_Reflex = RydHQ_Reflex - (random 0.2);
							RydHQ_Circumspection = RydHQ_Circumspection - (random 0.2);
							RydHQ_Fineness = RydHQ_Fineness - (random 0.2);
							
							if (RydHQ_Recklessness > 1) then {RydHQ_Recklessness = 1};
							if (RydHQ_Recklessness < 0) then {RydHQ_Recklessness = 0};
							
							if (RydHQ_Consistency > 1) then {RydHQ_Consistency = 1};
							if (RydHQ_Consistency < 0) then {RydHQ_Consistency = 0};
							
							if (RydHQ_Activity > 1) then {RydHQ_Activity = 1};
							if (RydHQ_Activity < 0) then {RydHQ_Activity = 0};
							
							if (RydHQ_Reflex > 1) then {RydHQ_Reflex = 1};
							if (RydHQ_Reflex < 0) then {RydHQ_Reflex = 0};
							
							if (RydHQ_Circumspection > 1) then {RydHQ_Circumspection = 1};
							if (RydHQ_Circumspection < 0) then {RydHQ_Circumspection = 0};
							
							if (RydHQ_Fineness > 1) then {RydHQ_Fineness = 1};
							if (RydHQ_Fineness < 0) then {RydHQ_Fineness = 0};

							[] spawn
								{
								sleep (60 + (random 120));
								RydHQ_Morale = RydHQ_Morale - (10 + round (random 10));
								}
							}
						}
					}
				}
			}
		};

	if (({alive _x} count (units RydHQ)) == 0) then {RydHQ = GrpNull};
	};

if (RydHQ_Debug) then {hintSilent "HQ of A forces has been destroyed!"};

RydHQ_Done = true;