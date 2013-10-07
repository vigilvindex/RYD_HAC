_cycle = 0;

waitUntil {sleep 1; not (isNil "RydHQE")};

while {not (isNull RydHQE)} do
	{
	_last = leaderHQE;
	if (isNil ("_last")) then {_last = ObjNull};
	sleep 0.2;
	leaderHQE = leader RydHQE;
	RydHQE_LHQInit = true;
	if not (_last == leaderHQE) then
		{
		if not (isNull leaderHQE) then
			{
			if (alive leaderHQE) then
				{
				if not (isNull RydHQE) then
					{
					if not (_cycle == RydHQE_Cyclecount) then
						{
						if not (RydHQE_Cyclecount < 2) then 
							{
							RydxHQ_AllLeaders = RydxHQ_AllLeaders - [_last];RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQE];_cycle = RydHQE_Cyclecount;
							RydHQE_Personality = RydHQE_Personality + "-";
							RydHQE_Recklessness = RydHQE_Recklessness + (random 0.2);
							RydHQE_Consistency = RydHQE_Consistency - (random 0.2);
							RydHQE_Activity = RydHQE_Activity - (random 0.2);
							RydHQE_Reflex = RydHQE_Reflex - (random 0.2);
							RydHQE_Circumspection = RydHQE_Circumspection - (random 0.2);
							RydHQE_Fineness = RydHQE_Fineness - (random 0.2);

							if (RydHQE_Recklessness > 1) then {RydHQE_Recklessness = 1};
							if (RydHQE_Recklessness < 0) then {RydHQE_Recklessness = 0};
							
							if (RydHQE_Consistency > 1) then {RydHQE_Consistency = 1};
							if (RydHQE_Consistency < 0) then {RydHQE_Consistency = 0};
							
							if (RydHQE_Activity > 1) then {RydHQE_Activity = 1};
							if (RydHQE_Activity < 0) then {RydHQE_Activity = 0};
							
							if (RydHQE_Reflex > 1) then {RydHQE_Reflex = 1};
							if (RydHQE_Reflex < 0) then {RydHQE_Reflex = 0};
							
							if (RydHQE_Circumspection > 1) then {RydHQE_Circumspection = 1};
							if (RydHQE_Circumspection < 0) then {RydHQE_Circumspection = 0};
							
							if (RydHQE_Fineness > 1) then {RydHQE_Fineness = 1};
							if (RydHQE_Fineness < 0) then {RydHQE_Fineness = 0};

							[] spawn
								{
								sleep (60 + (random 120));
								RydHQE_Morale = RydHQE_Morale - (10 + round (random 10));
								}
							}
						}
					}
				}
			}
		};

	if (({alive _x} count (units RydHQE)) == 0) then {RydHQE = GrpNull};
	};

if (RydHQE_Debug) then {hintSilent "HQ of E forces has been destroyed!"};

RydHQE_Done = true;