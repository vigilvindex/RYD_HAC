if (isNil ("RydHQF_MAtt")) then {RydHQF_MAtt = false};
if ((isNil ("RydHQF_Personality")) or not (RydHQF_MAtt)) then {RydHQF_Personality = "OTHER"};

_rnd = random 100;

switch (true) do
	{
	case ((not (RydHQF_MAtt) and (_rnd < 10)) or ((RydHQF_MAtt) and (RydHQF_Personality == "GENIUS"))) : {RydHQF_Personality = "GENIUS";RydHQF_Recklessness = 0.5;RydHQF_Consistency = 1;RydHQF_Activity = 1;RydHQF_Reflex = 1;RydHQF_Circumspection = 1;RydHQF_Fineness = 1};
	case ((not (RydHQF_MAtt) and ((_rnd >= 10) and (_rnd < 20))) or ((RydHQF_MAtt) and (RydHQF_Personality == "IDIOT"))) : {RydHQF_Personality = "IDIOT";RydHQF_Recklessness = 1;RydHQF_Consistency = 0;RydHQF_Activity = 0;RydHQF_Reflex = 0;RydHQF_Circumspection = 0;RydHQF_Fineness = 0};
	case ((not (RydHQF_MAtt) and ((_rnd >= 20) and (_rnd < 30))) or ((RydHQF_MAtt) and (RydHQF_Personality == "COMPETENT"))) : {RydHQF_Personality = "COMPETENT";RydHQF_Recklessness = 0.5;RydHQF_Consistency = 0.5;RydHQF_Activity = 0.5;RydHQF_Reflex = 0.5;RydHQF_Circumspection = 0.5;RydHQF_Fineness = 0.5};
	case ((not (RydHQF_MAtt) and ((_rnd >= 30) and (_rnd < 40))) or ((RydHQF_MAtt) and (RydHQF_Personality == "EAGER"))) : {RydHQF_Personality = "EAGER";RydHQF_Recklessness = 1;RydHQF_Consistency = 0;RydHQF_Activity = 1;RydHQF_Reflex = 1;RydHQF_Circumspection = 0;RydHQF_Fineness = 0};
	case ((not (RydHQF_MAtt) and ((_rnd >= 40) and (_rnd < 50))) or ((RydHQF_MAtt) and (RydHQF_Personality == "DILATORY"))) : {RydHQF_Personality = "DILATORY";RydHQF_Recklessness = 0;RydHQF_Consistency = 1;RydHQF_Activity = 0;RydHQF_Reflex = 0;RydHQF_Circumspection = 0.5;RydHQF_Fineness = 0.5};
	case ((not (RydHQF_MAtt) and ((_rnd >= 50) and (_rnd < 60))) or ((RydHQF_MAtt) and (RydHQF_Personality == "SCHEMER"))) : {RydHQF_Personality = "SCHEMER";RydHQF_Recklessness = 0.5;RydHQF_Consistency = 1;RydHQF_Activity = 0;RydHQF_Reflex = 0;RydHQF_Circumspection = 1;RydHQF_Fineness = 1};
	case ((not (RydHQF_MAtt) and ((_rnd >= 60) and (_rnd < 70))) or ((RydHQF_MAtt) and (RydHQF_Personality == "BRUTE"))) : {RydHQF_Personality = "BRUTE";RydHQF_Recklessness = 0.5;RydHQF_Consistency = 1;RydHQF_Activity = 1;RydHQF_Reflex = 0.5;RydHQF_Circumspection = 0;RydHQF_Fineness = 0};
	case ((not (RydHQF_MAtt) and ((_rnd >= 70) and (_rnd < 80))) or ((RydHQF_MAtt) and (RydHQF_Personality == "CHAOTIC"))) : {RydHQF_Personality = "CHAOTIC";RydHQF_Recklessness = 0.5;RydHQF_Consistency = 0;RydHQF_Activity = 1;RydHQF_Reflex = 1;RydHQF_Circumspection = 0.5;RydHQF_Fineness = 0.5};
	default
		{
		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQF_Recklessness")) then {RydHQF_Recklessness = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQF_Consistency")) then {RydHQF_Consistency = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQF_Activity")) then {RydHQF_Activity = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQF_Reflex")) then {RydHQF_Reflex = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQF_Circumspection")) then {RydHQF_Circumspection = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQF_Fineness")) then {RydHQF_Fineness = _gauss1};
		};
	};

if (RydHQF_Debug) then {diag_log format ["Commander A (%7) - Recklessness: %1 Consistency: %2 Activity: %3 Reflex: %4 Circumspection: %5 Fineness: %6",RydHQF_Recklessness,RydHQF_Consistency,RydHQF_Activity,RydHQF_Reflex,RydHQF_Circumspection,RydHQF_Fineness,RydHQF_Personality]};

RydHQF_PersDone = true;