if (isNil ("RydHQH_MAtt")) then {RydHQH_MAtt = false};
if ((isNil ("RydHQH_Personality")) or not (RydHQH_MAtt)) then {RydHQH_Personality = "OTHER"};

_rnd = random 100;

switch (true) do
	{
	case ((not (RydHQH_MAtt) and (_rnd < 10)) or ((RydHQH_MAtt) and (RydHQH_Personality == "GENIUS"))) : {RydHQH_Personality = "GENIUS";RydHQH_Recklessness = 0.5;RydHQH_Consistency = 1;RydHQH_Activity = 1;RydHQH_Reflex = 1;RydHQH_Circumspection = 1;RydHQH_Fineness = 1};
	case ((not (RydHQH_MAtt) and ((_rnd >= 10) and (_rnd < 20))) or ((RydHQH_MAtt) and (RydHQH_Personality == "IDIOT"))) : {RydHQH_Personality = "IDIOT";RydHQH_Recklessness = 1;RydHQH_Consistency = 0;RydHQH_Activity = 0;RydHQH_Reflex = 0;RydHQH_Circumspection = 0;RydHQH_Fineness = 0};
	case ((not (RydHQH_MAtt) and ((_rnd >= 20) and (_rnd < 30))) or ((RydHQH_MAtt) and (RydHQH_Personality == "COMPETENT"))) : {RydHQH_Personality = "COMPETENT";RydHQH_Recklessness = 0.5;RydHQH_Consistency = 0.5;RydHQH_Activity = 0.5;RydHQH_Reflex = 0.5;RydHQH_Circumspection = 0.5;RydHQH_Fineness = 0.5};
	case ((not (RydHQH_MAtt) and ((_rnd >= 30) and (_rnd < 40))) or ((RydHQH_MAtt) and (RydHQH_Personality == "EAGER"))) : {RydHQH_Personality = "EAGER";RydHQH_Recklessness = 1;RydHQH_Consistency = 0;RydHQH_Activity = 1;RydHQH_Reflex = 1;RydHQH_Circumspection = 0;RydHQH_Fineness = 0};
	case ((not (RydHQH_MAtt) and ((_rnd >= 40) and (_rnd < 50))) or ((RydHQH_MAtt) and (RydHQH_Personality == "DILATORY"))) : {RydHQH_Personality = "DILATORY";RydHQH_Recklessness = 0;RydHQH_Consistency = 1;RydHQH_Activity = 0;RydHQH_Reflex = 0;RydHQH_Circumspection = 0.5;RydHQH_Fineness = 0.5};
	case ((not (RydHQH_MAtt) and ((_rnd >= 50) and (_rnd < 60))) or ((RydHQH_MAtt) and (RydHQH_Personality == "SCHEMER"))) : {RydHQH_Personality = "SCHEMER";RydHQH_Recklessness = 0.5;RydHQH_Consistency = 1;RydHQH_Activity = 0;RydHQH_Reflex = 0;RydHQH_Circumspection = 1;RydHQH_Fineness = 1};
	case ((not (RydHQH_MAtt) and ((_rnd >= 60) and (_rnd < 70))) or ((RydHQH_MAtt) and (RydHQH_Personality == "BRUTE"))) : {RydHQH_Personality = "BRUTE";RydHQH_Recklessness = 0.5;RydHQH_Consistency = 1;RydHQH_Activity = 1;RydHQH_Reflex = 0.5;RydHQH_Circumspection = 0;RydHQH_Fineness = 0};
	case ((not (RydHQH_MAtt) and ((_rnd >= 70) and (_rnd < 80))) or ((RydHQH_MAtt) and (RydHQH_Personality == "CHAOTIC"))) : {RydHQH_Personality = "CHAOTIC";RydHQH_Recklessness = 0.5;RydHQH_Consistency = 0;RydHQH_Activity = 1;RydHQH_Reflex = 1;RydHQH_Circumspection = 0.5;RydHQH_Fineness = 0.5};
	default
		{
		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQH_Recklessness")) then {RydHQH_Recklessness = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQH_Consistency")) then {RydHQH_Consistency = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQH_Activity")) then {RydHQH_Activity = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQH_Reflex")) then {RydHQH_Reflex = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQH_Circumspection")) then {RydHQH_Circumspection = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQH_Fineness")) then {RydHQH_Fineness = _gauss1};
		};
	};

if (RydHQH_Debug) then {diag_log format ["Commander A (%7) - Recklessness: %1 Consistency: %2 Activity: %3 Reflex: %4 Circumspection: %5 Fineness: %6",RydHQH_Recklessness,RydHQH_Consistency,RydHQH_Activity,RydHQH_Reflex,RydHQH_Circumspection,RydHQH_Fineness,RydHQH_Personality]};

RydHQH_PersDone = true;