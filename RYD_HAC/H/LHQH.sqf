_cycle = 0;

waitUntil {sleep 1; not (isNil "RydHQH")};

while {not (isNull RydHQH)} do
	{
	_last = leaderHQH;
	if (isNil ("_last")) then {_last = ObjNull};
	sleep 0.2;
	leaderHQH = leader RydHQH;
	RydHQH_LHQInit = true;
	if not (_last == leaderHQH) then
		{
		if not (isNull leaderHQH) then
			{
			if (alive leaderHQH) then
				{
				if not (isNull RydHQH) then
					{
					if not (_cycle == RydHQH_Cyclecount) then
						{
						if not (RydHQH_Cyclecount < 2) then 
							{
							RydxHQ_AllLeaders = RydxHQ_AllLeaders - [_last];RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQH];_cycle = RydHQH_Cyclecount;
							RydHQH_Personality = RydHQH_Personality + "-";
							RydHQH_Recklessness = RydHQH_Recklessness + (random 0.2);
							RydHQH_Consistency = RydHQH_Consistency - (random 0.2);
							RydHQH_Activity = RydHQH_Activity - (random 0.2);
							RydHQH_Reflex = RydHQH_Reflex - (random 0.2);
							RydHQH_Circumspection = RydHQH_Circumspection - (random 0.2);
							RydHQH_Fineness = RydHQH_Fineness - (random 0.2);

							if (RydHQH_Recklessness > 1) then {RydHQH_Recklessness = 1};
							if (RydHQH_Recklessness < 0) then {RydHQH_Recklessness = 0};
							
							if (RydHQH_Consistency > 1) then {RydHQH_Consistency = 1};
							if (RydHQH_Consistency < 0) then {RydHQH_Consistency = 0};
							
							if (RydHQH_Activity > 1) then {RydHQH_Activity = 1};
							if (RydHQH_Activity < 0) then {RydHQH_Activity = 0};
							
							if (RydHQH_Reflex > 1) then {RydHQH_Reflex = 1};
							if (RydHQH_Reflex < 0) then {RydHQH_Reflex = 0};
							
							if (RydHQH_Circumspection > 1) then {RydHQH_Circumspection = 1};
							if (RydHQH_Circumspection < 0) then {RydHQH_Circumspection = 0};
							
							if (RydHQH_Fineness > 1) then {RydHQH_Fineness = 1};
							if (RydHQH_Fineness < 0) then {RydHQH_Fineness = 0};

							[] spawn
								{
								sleep (60 + (random 120));
								RydHQH_Morale = RydHQH_Morale - (10 + round (random 10));
								}
							}
						}
					}
				}
			}
		};

	if (({alive _x} count (units RydHQH)) == 0) then {RydHQH = GrpNull};
	};

if (RydHQH_Debug) then {hintSilent "HQ of H forces has been destroyed!"};

RydHQH_Done = true;