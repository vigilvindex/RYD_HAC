if (isNil ("RydHQE_MAtt")) then {RydHQE_MAtt = false};
if ((isNil ("RydHQE_Personality")) or not (RydHQE_MAtt)) then {RydHQE_Personality = "OTHER"};

_rnd = random 100;

switch (true) do
	{
	case ((not (RydHQE_MAtt) and (_rnd < 10)) or ((RydHQE_MAtt) and (RydHQE_Personality == "GENIUS"))) : {RydHQE_Personality = "GENIUS";RydHQE_Recklessness = 0.5;RydHQE_Consistency = 1;RydHQE_Activity = 1;RydHQE_Reflex = 1;RydHQE_Circumspection = 1;RydHQE_Fineness = 1};
	case ((not (RydHQE_MAtt) and ((_rnd >= 10) and (_rnd < 20))) or ((RydHQE_MAtt) and (RydHQE_Personality == "IDIOT"))) : {RydHQE_Personality = "IDIOT";RydHQE_Recklessness = 1;RydHQE_Consistency = 0;RydHQE_Activity = 0;RydHQE_Reflex = 0;RydHQE_Circumspection = 0;RydHQE_Fineness = 0};
	case ((not (RydHQE_MAtt) and ((_rnd >= 20) and (_rnd < 30))) or ((RydHQE_MAtt) and (RydHQE_Personality == "COMPETENT"))) : {RydHQE_Personality = "COMPETENT";RydHQE_Recklessness = 0.5;RydHQE_Consistency = 0.5;RydHQE_Activity = 0.5;RydHQE_Reflex = 0.5;RydHQE_Circumspection = 0.5;RydHQE_Fineness = 0.5};
	case ((not (RydHQE_MAtt) and ((_rnd >= 30) and (_rnd < 40))) or ((RydHQE_MAtt) and (RydHQE_Personality == "EAGER"))) : {RydHQE_Personality = "EAGER";RydHQE_Recklessness = 1;RydHQE_Consistency = 0;RydHQE_Activity = 1;RydHQE_Reflex = 1;RydHQE_Circumspection = 0;RydHQE_Fineness = 0};
	case ((not (RydHQE_MAtt) and ((_rnd >= 40) and (_rnd < 50))) or ((RydHQE_MAtt) and (RydHQE_Personality == "DILATORY"))) : {RydHQE_Personality = "DILATORY";RydHQE_Recklessness = 0;RydHQE_Consistency = 1;RydHQE_Activity = 0;RydHQE_Reflex = 0;RydHQE_Circumspection = 0.5;RydHQE_Fineness = 0.5};
	case ((not (RydHQE_MAtt) and ((_rnd >= 50) and (_rnd < 60))) or ((RydHQE_MAtt) and (RydHQE_Personality == "SCHEMER"))) : {RydHQE_Personality = "SCHEMER";RydHQE_Recklessness = 0.5;RydHQE_Consistency = 1;RydHQE_Activity = 0;RydHQE_Reflex = 0;RydHQE_Circumspection = 1;RydHQE_Fineness = 1};
	case ((not (RydHQE_MAtt) and ((_rnd >= 60) and (_rnd < 70))) or ((RydHQE_MAtt) and (RydHQE_Personality == "BRUTE"))) : {RydHQE_Personality = "BRUTE";RydHQE_Recklessness = 0.5;RydHQE_Consistency = 1;RydHQE_Activity = 1;RydHQE_Reflex = 0.5;RydHQE_Circumspection = 0;RydHQE_Fineness = 0};
	case ((not (RydHQE_MAtt) and ((_rnd >= 70) and (_rnd < 80))) or ((RydHQE_MAtt) and (RydHQE_Personality == "CHAOTIC"))) : {RydHQE_Personality = "CHAOTIC";RydHQE_Recklessness = 0.5;RydHQE_Consistency = 0;RydHQE_Activity = 1;RydHQE_Reflex = 1;RydHQE_Circumspection = 0.5;RydHQE_Fineness = 0.5};
	default
		{
		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQE_Recklessness")) then {RydHQE_Recklessness = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQE_Consistency")) then {RydHQE_Consistency = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQE_Activity")) then {RydHQE_Activity = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQE_Reflex")) then {RydHQE_Reflex = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQE_Circumspection")) then {RydHQE_Circumspection = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQE_Fineness")) then {RydHQE_Fineness = _gauss1};
		};
	};

if (RydHQE_Debug) then {diag_log format ["Commander A (%7) - Recklessness: %1 Consistency: %2 Activity: %3 Reflex: %4 Circumspection: %5 Fineness: %6",RydHQE_Recklessness,RydHQE_Consistency,RydHQE_Activity,RydHQE_Reflex,RydHQE_Circumspection,RydHQE_Fineness,RydHQE_Personality]};

RydHQE_PersDone = true;