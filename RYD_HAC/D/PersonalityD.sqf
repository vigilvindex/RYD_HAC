if (isNil ("RydHQD_MAtt")) then {RydHQD_MAtt = false};
if ((isNil ("RydHQD_Personality")) or not (RydHQD_MAtt)) then {RydHQD_Personality = "OTHER"};

_rnd = random 100;

switch (true) do
	{
	case ((not (RydHQD_MAtt) and (_rnd < 10)) or ((RydHQD_MAtt) and (RydHQD_Personality == "GENIUS"))) : {RydHQD_Personality = "GENIUS";RydHQD_Recklessness = 0.5;RydHQD_Consistency = 1;RydHQD_Activity = 1;RydHQD_Reflex = 1;RydHQD_Circumspection = 1;RydHQD_Fineness = 1};
	case ((not (RydHQD_MAtt) and ((_rnd >= 10) and (_rnd < 20))) or ((RydHQD_MAtt) and (RydHQD_Personality == "IDIOT"))) : {RydHQD_Personality = "IDIOT";RydHQD_Recklessness = 1;RydHQD_Consistency = 0;RydHQD_Activity = 0;RydHQD_Reflex = 0;RydHQD_Circumspection = 0;RydHQD_Fineness = 0};
	case ((not (RydHQD_MAtt) and ((_rnd >= 20) and (_rnd < 30))) or ((RydHQD_MAtt) and (RydHQD_Personality == "COMPETENT"))) : {RydHQD_Personality = "COMPETENT";RydHQD_Recklessness = 0.5;RydHQD_Consistency = 0.5;RydHQD_Activity = 0.5;RydHQD_Reflex = 0.5;RydHQD_Circumspection = 0.5;RydHQD_Fineness = 0.5};
	case ((not (RydHQD_MAtt) and ((_rnd >= 30) and (_rnd < 40))) or ((RydHQD_MAtt) and (RydHQD_Personality == "EAGER"))) : {RydHQD_Personality = "EAGER";RydHQD_Recklessness = 1;RydHQD_Consistency = 0;RydHQD_Activity = 1;RydHQD_Reflex = 1;RydHQD_Circumspection = 0;RydHQD_Fineness = 0};
	case ((not (RydHQD_MAtt) and ((_rnd >= 40) and (_rnd < 50))) or ((RydHQD_MAtt) and (RydHQD_Personality == "DILATORY"))) : {RydHQD_Personality = "DILATORY";RydHQD_Recklessness = 0;RydHQD_Consistency = 1;RydHQD_Activity = 0;RydHQD_Reflex = 0;RydHQD_Circumspection = 0.5;RydHQD_Fineness = 0.5};
	case ((not (RydHQD_MAtt) and ((_rnd >= 50) and (_rnd < 60))) or ((RydHQD_MAtt) and (RydHQD_Personality == "SCHEMER"))) : {RydHQD_Personality = "SCHEMER";RydHQD_Recklessness = 0.5;RydHQD_Consistency = 1;RydHQD_Activity = 0;RydHQD_Reflex = 0;RydHQD_Circumspection = 1;RydHQD_Fineness = 1};
	case ((not (RydHQD_MAtt) and ((_rnd >= 60) and (_rnd < 70))) or ((RydHQD_MAtt) and (RydHQD_Personality == "BRUTE"))) : {RydHQD_Personality = "BRUTE";RydHQD_Recklessness = 0.5;RydHQD_Consistency = 1;RydHQD_Activity = 1;RydHQD_Reflex = 0.5;RydHQD_Circumspection = 0;RydHQD_Fineness = 0};
	case ((not (RydHQD_MAtt) and ((_rnd >= 70) and (_rnd < 80))) or ((RydHQD_MAtt) and (RydHQD_Personality == "CHAOTIC"))) : {RydHQD_Personality = "CHAOTIC";RydHQD_Recklessness = 0.5;RydHQD_Consistency = 0;RydHQD_Activity = 1;RydHQD_Reflex = 1;RydHQD_Circumspection = 0.5;RydHQD_Fineness = 0.5};
	default
		{
		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQD_Recklessness")) then {RydHQD_Recklessness = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQD_Consistency")) then {RydHQD_Consistency = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQD_Activity")) then {RydHQD_Activity = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQD_Reflex")) then {RydHQD_Reflex = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQD_Circumspection")) then {RydHQD_Circumspection = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQD_Fineness")) then {RydHQD_Fineness = _gauss1};
		};
	};

if (RydHQD_Debug) then {diag_log format ["Commander A (%7) - Recklessness: %1 Consistency: %2 Activity: %3 Reflex: %4 Circumspection: %5 Fineness: %6",RydHQD_Recklessness,RydHQD_Consistency,RydHQD_Activity,RydHQD_Reflex,RydHQD_Circumspection,RydHQD_Fineness,RydHQD_Personality]};

RydHQD_PersDone = true;