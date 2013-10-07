if (isNil ("RydHQB_MAtt")) then {RydHQB_MAtt = false};
if ((isNil ("RydHQB_Personality")) or not (RydHQB_MAtt)) then {RydHQB_Personality = "OTHER"};

_rnd = random 100;

switch (true) do
	{
	case ((not (RydHQB_MAtt) and (_rnd < 10)) or ((RydHQB_MAtt) and (RydHQB_Personality == "GENIUS"))) : {RydHQB_Personality = "GENIUS";RydHQB_Recklessness = 0.5;RydHQB_Consistency = 1;RydHQB_Activity = 1;RydHQB_Reflex = 1;RydHQB_Circumspection = 1;RydHQB_Fineness = 1};
	case ((not (RydHQB_MAtt) and ((_rnd >= 10) and (_rnd < 20))) or ((RydHQB_MAtt) and (RydHQB_Personality == "IDIOT"))) : {RydHQB_Personality = "IDIOT";RydHQB_Recklessness = 1;RydHQB_Consistency = 0;RydHQB_Activity = 0;RydHQB_Reflex = 0;RydHQB_Circumspection = 0;RydHQB_Fineness = 0};
	case ((not (RydHQB_MAtt) and ((_rnd >= 20) and (_rnd < 30))) or ((RydHQB_MAtt) and (RydHQB_Personality == "COMPETENT"))) : {RydHQB_Personality = "COMPETENT";RydHQB_Recklessness = 0.5;RydHQB_Consistency = 0.5;RydHQB_Activity = 0.5;RydHQB_Reflex = 0.5;RydHQB_Circumspection = 0.5;RydHQB_Fineness = 0.5};
	case ((not (RydHQB_MAtt) and ((_rnd >= 30) and (_rnd < 40))) or ((RydHQB_MAtt) and (RydHQB_Personality == "EAGER"))) : {RydHQB_Personality = "EAGER";RydHQB_Recklessness = 1;RydHQB_Consistency = 0;RydHQB_Activity = 1;RydHQB_Reflex = 1;RydHQB_Circumspection = 0;RydHQB_Fineness = 0};
	case ((not (RydHQB_MAtt) and ((_rnd >= 40) and (_rnd < 50))) or ((RydHQB_MAtt) and (RydHQB_Personality == "DILATORY"))) : {RydHQB_Personality = "DILATORY";RydHQB_Recklessness = 0;RydHQB_Consistency = 1;RydHQB_Activity = 0;RydHQB_Reflex = 0;RydHQB_Circumspection = 0.5;RydHQB_Fineness = 0.5};
	case ((not (RydHQB_MAtt) and ((_rnd >= 50) and (_rnd < 60))) or ((RydHQB_MAtt) and (RydHQB_Personality == "SCHEMER"))) : {RydHQB_Personality = "SCHEMER";RydHQB_Recklessness = 0.5;RydHQB_Consistency = 1;RydHQB_Activity = 0;RydHQB_Reflex = 0;RydHQB_Circumspection = 1;RydHQB_Fineness = 1};
	case ((not (RydHQB_MAtt) and ((_rnd >= 60) and (_rnd < 70))) or ((RydHQB_MAtt) and (RydHQB_Personality == "BRUTE"))) : {RydHQB_Personality = "BRUTE";RydHQB_Recklessness = 0.5;RydHQB_Consistency = 1;RydHQB_Activity = 1;RydHQB_Reflex = 0.5;RydHQB_Circumspection = 0;RydHQB_Fineness = 0};
	case ((not (RydHQB_MAtt) and ((_rnd >= 70) and (_rnd < 80))) or ((RydHQB_MAtt) and (RydHQB_Personality == "CHAOTIC"))) : {RydHQB_Personality = "CHAOTIC";RydHQB_Recklessness = 0.5;RydHQB_Consistency = 0;RydHQB_Activity = 1;RydHQB_Reflex = 1;RydHQB_Circumspection = 0.5;RydHQB_Fineness = 0.5};
	default
		{
		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQB_Recklessness")) then {RydHQB_Recklessness = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQB_Consistency")) then {RydHQB_Consistency = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQB_Activity")) then {RydHQB_Activity = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQB_Reflex")) then {RydHQB_Reflex = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQB_Circumspection")) then {RydHQB_Circumspection = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQB_Fineness")) then {RydHQB_Fineness = _gauss1};
		};
	};

if (RydHQB_Debug) then {diag_log format ["Commander A (%7) - Recklessness: %1 Consistency: %2 Activity: %3 Reflex: %4 Circumspection: %5 Fineness: %6",RydHQB_Recklessness,RydHQB_Consistency,RydHQB_Activity,RydHQB_Reflex,RydHQB_Circumspection,RydHQB_Fineness,RydHQB_Personality]};

RydHQB_PersDone = true;