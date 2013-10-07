if (isNil ("RydHQC_MAtt")) then {RydHQC_MAtt = false};
if ((isNil ("RydHQC_Personality")) or not (RydHQC_MAtt)) then {RydHQC_Personality = "OTHER"};

_rnd = random 100;

switch (true) do
	{
	case ((not (RydHQC_MAtt) and (_rnd < 10)) or ((RydHQC_MAtt) and (RydHQC_Personality == "GENIUS"))) : {RydHQC_Personality = "GENIUS";RydHQC_Recklessness = 0.5;RydHQC_Consistency = 1;RydHQC_Activity = 1;RydHQC_Reflex = 1;RydHQC_Circumspection = 1;RydHQC_Fineness = 1};
	case ((not (RydHQC_MAtt) and ((_rnd >= 10) and (_rnd < 20))) or ((RydHQC_MAtt) and (RydHQC_Personality == "IDIOT"))) : {RydHQC_Personality = "IDIOT";RydHQC_Recklessness = 1;RydHQC_Consistency = 0;RydHQC_Activity = 0;RydHQC_Reflex = 0;RydHQC_Circumspection = 0;RydHQC_Fineness = 0};
	case ((not (RydHQC_MAtt) and ((_rnd >= 20) and (_rnd < 30))) or ((RydHQC_MAtt) and (RydHQC_Personality == "COMPETENT"))) : {RydHQC_Personality = "COMPETENT";RydHQC_Recklessness = 0.5;RydHQC_Consistency = 0.5;RydHQC_Activity = 0.5;RydHQC_Reflex = 0.5;RydHQC_Circumspection = 0.5;RydHQC_Fineness = 0.5};
	case ((not (RydHQC_MAtt) and ((_rnd >= 30) and (_rnd < 40))) or ((RydHQC_MAtt) and (RydHQC_Personality == "EAGER"))) : {RydHQC_Personality = "EAGER";RydHQC_Recklessness = 1;RydHQC_Consistency = 0;RydHQC_Activity = 1;RydHQC_Reflex = 1;RydHQC_Circumspection = 0;RydHQC_Fineness = 0};
	case ((not (RydHQC_MAtt) and ((_rnd >= 40) and (_rnd < 50))) or ((RydHQC_MAtt) and (RydHQC_Personality == "DILATORY"))) : {RydHQC_Personality = "DILATORY";RydHQC_Recklessness = 0;RydHQC_Consistency = 1;RydHQC_Activity = 0;RydHQC_Reflex = 0;RydHQC_Circumspection = 0.5;RydHQC_Fineness = 0.5};
	case ((not (RydHQC_MAtt) and ((_rnd >= 50) and (_rnd < 60))) or ((RydHQC_MAtt) and (RydHQC_Personality == "SCHEMER"))) : {RydHQC_Personality = "SCHEMER";RydHQC_Recklessness = 0.5;RydHQC_Consistency = 1;RydHQC_Activity = 0;RydHQC_Reflex = 0;RydHQC_Circumspection = 1;RydHQC_Fineness = 1};
	case ((not (RydHQC_MAtt) and ((_rnd >= 60) and (_rnd < 70))) or ((RydHQC_MAtt) and (RydHQC_Personality == "BRUTE"))) : {RydHQC_Personality = "BRUTE";RydHQC_Recklessness = 0.5;RydHQC_Consistency = 1;RydHQC_Activity = 1;RydHQC_Reflex = 0.5;RydHQC_Circumspection = 0;RydHQC_Fineness = 0};
	case ((not (RydHQC_MAtt) and ((_rnd >= 70) and (_rnd < 80))) or ((RydHQC_MAtt) and (RydHQC_Personality == "CHAOTIC"))) : {RydHQC_Personality = "CHAOTIC";RydHQC_Recklessness = 0.5;RydHQC_Consistency = 0;RydHQC_Activity = 1;RydHQC_Reflex = 1;RydHQC_Circumspection = 0.5;RydHQC_Fineness = 0.5};
	default
		{
		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQC_Recklessness")) then {RydHQC_Recklessness = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQC_Consistency")) then {RydHQC_Consistency = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQC_Activity")) then {RydHQC_Activity = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQC_Reflex")) then {RydHQC_Reflex = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQC_Circumspection")) then {RydHQC_Circumspection = _gauss1};

		_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1);
		if (isNil ("RydHQC_Fineness")) then {RydHQC_Fineness = _gauss1};
		};
	};

if (RydHQC_Debug) then {diag_log format ["Commander A (%7) - Recklessness: %1 Consistency: %2 Activity: %3 Reflex: %4 Circumspection: %5 Fineness: %6",RydHQC_Recklessness,RydHQC_Consistency,RydHQC_Activity,RydHQC_Reflex,RydHQC_Circumspection,RydHQC_Fineness,RydHQC_Personality]};

RydHQC_PersDone = true;