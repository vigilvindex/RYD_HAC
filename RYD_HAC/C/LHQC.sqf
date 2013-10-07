_cycle = 0;

waitUntil {sleep 1; not (isNil "RydHQC")};

while {not (isNull RydHQC)} do
	{
	_last = leaderHQC;
	if (isNil ("_last")) then {_last = ObjNull};
	sleep 0.2;
	leaderHQC = leader RydHQC;
	RydHQC_LHQInit = true;
	if not (_last == leaderHQC) then
		{
		if not (isNull leaderHQC) then
			{
			if (alive leaderHQC) then
				{
				if not (isNull RydHQC) then
					{
					if not (_cycle == RydHQC_Cyclecount) then
						{
						if not (RydHQC_Cyclecount < 2) then 
							{
							RydxHQ_AllLeaders = RydxHQ_AllLeaders - [_last];RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQC];_cycle = RydHQC_Cyclecount;
							RydHQC_Personality = RydHQC_Personality + "-";
							RydHQC_Recklessness = RydHQC_Recklessness + (random 0.2);
							RydHQC_Consistency = RydHQC_Consistency - (random 0.2);
							RydHQC_Activity = RydHQC_Activity - (random 0.2);
							RydHQC_Reflex = RydHQC_Reflex - (random 0.2);
							RydHQC_Circumspection = RydHQC_Circumspection - (random 0.2);
							RydHQC_Fineness = RydHQC_Fineness - (random 0.2);

							if (RydHQC_Recklessness > 1) then {RydHQC_Recklessness = 1};
							if (RydHQC_Recklessness < 0) then {RydHQC_Recklessness = 0};
							
							if (RydHQC_Consistency > 1) then {RydHQC_Consistency = 1};
							if (RydHQC_Consistency < 0) then {RydHQC_Consistency = 0};
							
							if (RydHQC_Activity > 1) then {RydHQC_Activity = 1};
							if (RydHQC_Activity < 0) then {RydHQC_Activity = 0};
							
							if (RydHQC_Reflex > 1) then {RydHQC_Reflex = 1};
							if (RydHQC_Reflex < 0) then {RydHQC_Reflex = 0};
							
							if (RydHQC_Circumspection > 1) then {RydHQC_Circumspection = 1};
							if (RydHQC_Circumspection < 0) then {RydHQC_Circumspection = 0};
							
							if (RydHQC_Fineness > 1) then {RydHQC_Fineness = 1};
							if (RydHQC_Fineness < 0) then {RydHQC_Fineness = 0};

							[] spawn
								{
								sleep (60 + (random 120));
								RydHQC_Morale = RydHQC_Morale - (10 + round (random 10));
								}
							}
						}
					}
				}
			}
		};

	if (({alive _x} count (units RydHQC)) == 0) then {RydHQC = GrpNull};
	};

if (RydHQC_Debug) then {hintSilent "HQ of C forces has been destroyed!"};

RydHQC_Done = true;