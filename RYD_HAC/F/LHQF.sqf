_cycle = 0;

waitUntil {sleep 1; not (isNil "RydHQF")};

while {not (isNull RydHQF)} do
	{
	_last = leaderHQF;
	if (isNil ("_last")) then {_last = ObjNull};
	sleep 0.2;
	leaderHQF = leader RydHQF;
	RydHQF_LHQInit = true;
	if not (_last == leaderHQF) then
		{
		if not (isNull leaderHQF) then
			{
			if (alive leaderHQF) then
				{
				if not (isNull RydHQF) then
					{
					if not (_cycle == RydHQF_Cyclecount) then
						{
						if not (RydHQF_Cyclecount < 2) then 
							{
							RydxHQ_AllLeaders = RydxHQ_AllLeaders - [_last];RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQF];_cycle = RydHQF_Cyclecount;
							RydHQF_Personality = RydHQF_Personality + "-";
							RydHQF_Recklessness = RydHQF_Recklessness + (random 0.2);
							RydHQF_Consistency = RydHQF_Consistency - (random 0.2);
							RydHQF_Activity = RydHQF_Activity - (random 0.2);
							RydHQF_Reflex = RydHQF_Reflex - (random 0.2);
							RydHQF_Circumspection = RydHQF_Circumspection - (random 0.2);
							RydHQF_Fineness = RydHQF_Fineness - (random 0.2);

							if (RydHQF_Recklessness > 1) then {RydHQF_Recklessness = 1};
							if (RydHQF_Recklessness < 0) then {RydHQF_Recklessness = 0};
							
							if (RydHQF_Consistency > 1) then {RydHQF_Consistency = 1};
							if (RydHQF_Consistency < 0) then {RydHQF_Consistency = 0};
							
							if (RydHQF_Activity > 1) then {RydHQF_Activity = 1};
							if (RydHQF_Activity < 0) then {RydHQF_Activity = 0};
							
							if (RydHQF_Reflex > 1) then {RydHQF_Reflex = 1};
							if (RydHQF_Reflex < 0) then {RydHQF_Reflex = 0};
							
							if (RydHQF_Circumspection > 1) then {RydHQF_Circumspection = 1};
							if (RydHQF_Circumspection < 0) then {RydHQF_Circumspection = 0};
							
							if (RydHQF_Fineness > 1) then {RydHQF_Fineness = 1};
							if (RydHQF_Fineness < 0) then {RydHQF_Fineness = 0};

							[] spawn
								{
								sleep (60 + (random 120));
								RydHQF_Morale = RydHQF_Morale - (10 + round (random 10));
								}
							}
						}
					}
				}
			}
		};

	if (({alive _x} count (units RydHQF)) == 0) then {RydHQF = GrpNull};
	};

if (RydHQF_Debug) then {hintSilent "HQ of F forces has been destroyed!"};

RydHQF_Done = true;