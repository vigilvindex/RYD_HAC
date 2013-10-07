if (isNil ("RydHQ_MAtt")) then {RydHQ_MAtt = false};
if ((isNil ("RydHQ_Personality")) or not (RydHQ_MAtt)) then {RydHQ_Personality = "OTHER"};

_rnd = random 100;

switch (true) do
	{
	case ((not (RydHQ_MAtt) and (_rnd < 10)) or ((RydHQ_MAtt) and (RydHQ_Personality == "GENIUS"))) : {RydHQ_Personality = "GENIUS";RydHQ_Recklessness = 0.5;RydHQ_Consistency = 1;RydHQ_Activity = 1;RydHQ_Reflex = 1;RydHQ_Circumspection = 1;RydHQ_Fineness = 1};
	case ((not (RydHQ_MAtt) and ((_rnd >= 10) and (_rnd < 20))) or ((RydHQ_MAtt) and (RydHQ_Personality == "IDIOT"))) : {RydHQ_Personality = "IDIOT";RydHQ_Recklessness = 1;RydHQ_Consistency = 0;RydHQ_Activity = 0;RydHQ_Reflex = 0;RydHQ_Circumspection = 0;RydHQ_Fineness = 0};
	case ((not (RydHQ_MAtt) and ((_rnd >= 20) and (_rnd < 30))) or ((RydHQ_MAtt) and (RydHQ_Personality == "COMPETENT"))) : {RydHQ_Personality = "COMPETENT";RydHQ_Recklessness = 0.5;RydHQ_Consistency = 0.5;RydHQ_Activity = 0.5;RydHQ_Reflex = 0.5;RydHQ_Circumspection = 0.5;RydHQ_Fineness = 0.5};
	case ((not (RydHQ_MAtt) and ((_rnd >= 30) and (_rnd < 40))) or ((RydHQ_MAtt) and (RydHQ_Personality == "EAGER"))) : {RydHQ_Personality = "EAGER";RydHQ_Recklessness = 1;RydHQ_Consistency = 0;RydHQ_Activity = 1;RydHQ_Reflex = 1;RydHQ_Circumspection = 0;RydHQ_Fineness = 0};
	case ((not (RydHQ_MAtt) and ((_rnd >= 40) and (_rnd < 50))) or ((RydHQ_MAtt) and (RydHQ_Personality == "DILATORY"))) : {RydHQ_Personality = "DILATORY";RydHQ_Recklessness = 0;RydHQ_Consistency = 1;RydHQ_Activity = 0;RydHQ_Reflex = 0;RydHQ_Circumspection = 0.5;RydHQ_Fineness = 0.5};
	case ((not (RydHQ_MAtt) and ((_rnd >= 50) and (_rnd < 60))) or ((RydHQ_MAtt) and (RydHQ_Personality == "SCHEMER"))) : {RydHQ_Personality = "SCHEMER";RydHQ_Recklessness = 0.5;RydHQ_Consistency = 1;RydHQ_Activity = 0;RydHQ_Reflex = 0;RydHQ_Circumspection = 1;RydHQ_Fineness = 1};
	case ((not (RydHQ_MAtt) and ((_rnd >= 60) and (_rnd < 70))) or ((RydHQ_MAtt) and (RydHQ_Personality == "BRUTE"))) : {RydHQ_Personality = "BRUTE";RydHQ_Recklessness = 0.5;RydHQ_Consistency = 1;RydHQ_Activity = 1;RydHQ_Reflex = 0.5;RydHQ_Circumspection = 0;RydHQ_Fineness = 0};
	case ((not (RydHQ_MAtt) and ((_rnd >= 70) and (_rnd < 80))) or ((RydHQ_MAtt) and (RydHQ_Personality == "CHAOTIC"))) : {RydHQ_Personality = "CHAOTIC";RydHQ_Recklessness = 0.5;RydHQ_Consistency = 0;RydHQ_Activity = 1;RydHQ_Reflex = 1;RydHQ_Circumspection = 0.5;RydHQ_Fineness = 0.5};
	default
		{
		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQ_Recklessness")) then {RydHQ_Recklessness = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQ_Consistency")) then {RydHQ_Consistency = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQ_Activity")) then {RydHQ_Activity = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQ_Reflex")) then {RydHQ_Reflex = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQ_Circumspection")) then {RydHQ_Circumspection = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQ_Fineness")) then {RydHQ_Fineness = _gauss1};
		};
	};

if (RydHQ_Debug) then {diag_log format ["Commander A (%7) - Recklessness: %1 Consistency: %2 Activity: %3 Reflex: %4 Circumspection: %5 Fineness: %6",RydHQ_Recklessness,RydHQ_Consistency,RydHQ_Activity,RydHQ_Reflex,RydHQ_Circumspection,RydHQ_Fineness,RydHQ_Personality]};

RydHQ_PersDone = true;