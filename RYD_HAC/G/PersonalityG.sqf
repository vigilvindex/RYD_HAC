if (isNil ("RydHQG_MAtt")) then {RydHQG_MAtt = false};
if ((isNil ("RydHQG_Personality")) or not (RydHQG_MAtt)) then {RydHQG_Personality = "OTHER"};

_rnd = random 100;

switch (true) do
	{
	case ((not (RydHQG_MAtt) and (_rnd < 10)) or ((RydHQG_MAtt) and (RydHQG_Personality == "GENIUS"))) : {RydHQG_Personality = "GENIUS";RydHQG_Recklessness = 0.5;RydHQG_Consistency = 1;RydHQG_Activity = 1;RydHQG_Reflex = 1;RydHQG_Circumspection = 1;RydHQG_Fineness = 1};
	case ((not (RydHQG_MAtt) and ((_rnd >= 10) and (_rnd < 20))) or ((RydHQG_MAtt) and (RydHQG_Personality == "IDIOT"))) : {RydHQG_Personality = "IDIOT";RydHQG_Recklessness = 1;RydHQG_Consistency = 0;RydHQG_Activity = 0;RydHQG_Reflex = 0;RydHQG_Circumspection = 0;RydHQG_Fineness = 0};
	case ((not (RydHQG_MAtt) and ((_rnd >= 20) and (_rnd < 30))) or ((RydHQG_MAtt) and (RydHQG_Personality == "COMPETENT"))) : {RydHQG_Personality = "COMPETENT";RydHQG_Recklessness = 0.5;RydHQG_Consistency = 0.5;RydHQG_Activity = 0.5;RydHQG_Reflex = 0.5;RydHQG_Circumspection = 0.5;RydHQG_Fineness = 0.5};
	case ((not (RydHQG_MAtt) and ((_rnd >= 30) and (_rnd < 40))) or ((RydHQG_MAtt) and (RydHQG_Personality == "EAGER"))) : {RydHQG_Personality = "EAGER";RydHQG_Recklessness = 1;RydHQG_Consistency = 0;RydHQG_Activity = 1;RydHQG_Reflex = 1;RydHQG_Circumspection = 0;RydHQG_Fineness = 0};
	case ((not (RydHQG_MAtt) and ((_rnd >= 40) and (_rnd < 50))) or ((RydHQG_MAtt) and (RydHQG_Personality == "DILATORY"))) : {RydHQG_Personality = "DILATORY";RydHQG_Recklessness = 0;RydHQG_Consistency = 1;RydHQG_Activity = 0;RydHQG_Reflex = 0;RydHQG_Circumspection = 0.5;RydHQG_Fineness = 0.5};
	case ((not (RydHQG_MAtt) and ((_rnd >= 50) and (_rnd < 60))) or ((RydHQG_MAtt) and (RydHQG_Personality == "SCHEMER"))) : {RydHQG_Personality = "SCHEMER";RydHQG_Recklessness = 0.5;RydHQG_Consistency = 1;RydHQG_Activity = 0;RydHQG_Reflex = 0;RydHQG_Circumspection = 1;RydHQG_Fineness = 1};
	case ((not (RydHQG_MAtt) and ((_rnd >= 60) and (_rnd < 70))) or ((RydHQG_MAtt) and (RydHQG_Personality == "BRUTE"))) : {RydHQG_Personality = "BRUTE";RydHQG_Recklessness = 0.5;RydHQG_Consistency = 1;RydHQG_Activity = 1;RydHQG_Reflex = 0.5;RydHQG_Circumspection = 0;RydHQG_Fineness = 0};
	case ((not (RydHQG_MAtt) and ((_rnd >= 70) and (_rnd < 80))) or ((RydHQG_MAtt) and (RydHQG_Personality == "CHAOTIC"))) : {RydHQG_Personality = "CHAOTIC";RydHQG_Recklessness = 0.5;RydHQG_Consistency = 0;RydHQG_Activity = 1;RydHQG_Reflex = 1;RydHQG_Circumspection = 0.5;RydHQG_Fineness = 0.5};
	default
		{
		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQG_Recklessness")) then {RydHQG_Recklessness = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQG_Consistency")) then {RydHQG_Consistency = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQG_Activity")) then {RydHQG_Activity = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQG_Reflex")) then {RydHQG_Reflex = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQG_Circumspection")) then {RydHQG_Circumspection = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQG_Fineness")) then {RydHQG_Fineness = _gauss1};
		};
	};

if (RydHQG_Debug) then {diag_log format ["Commander A (%7) - Recklessness: %1 Consistency: %2 Activity: %3 Reflex: %4 Circumspection: %5 Fineness: %6",RydHQG_Recklessness,RydHQG_Consistency,RydHQG_Activity,RydHQG_Reflex,RydHQG_Circumspection,RydHQG_Fineness,RydHQG_Personality]};

RydHQG_PersDone = true;