
if not (isServer) exitWith {};

if (isNil ("RydHQ_Wait")) then {RydHQ_Wait = 15};

sleep RydHQ_Wait;

waituntil {sleep 1;not (isNil ("leaderHQ"))};

_hi = "HAL 1.0 is here";

if ((random 100) < 1) then {_hi = "Good morning, Dave."};

leaderHQ sidechat _hi;

call compile preprocessfile "RYD_HAC\VarInit.sqf";
call compile preprocessfile "RYD_HAC\HAC_fnc.sqf";

publicVariable "RYD_MP_Sidechat";

RydHQ_Fronts = false;
[] execVM "RYD_HAC\Front.sqf";
waituntil {(RydHQ_Fronts)};

if (RydHQ_TimeM) then 
	{
	[([player] + (switchableUnits - [player]))] call RYD_TimeMachine
	};

if (RydBB_Active) then 
	{
	call compile preprocessfile "RYD_HAC\Boss_fnc.sqf";
	RydBBa_InitDone = false;
	RydBBb_InitDone = false;

		{
		if ((count (_x select 0)) > 0) then 
			{
			if ((_x select 1) == "A") then {RydBBa_Init = false};
			[_x] spawn Boss
			};

		sleep 1;
		}
	foreach [[RydBBa_HQs,"A"],[RydBBb_HQs,"B"]]
	};

if (((RydHQ_Debug) or (RydHQB_Debug) or (RydHQC_Debug) or (RydHQD_Debug) or (RydHQE_Debug) or (RydHQF_Debug) or (RydHQG_Debug) or (RydHQH_Debug)) and (RydHQ_DbgMon)) then {[] spawn RYD_DbgMon};

RydxHQ_AllLeaders = [];

if not (isNull leaderHQ) then {RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQ]};
if not (isNull leaderHQB) then {RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQB]};
if not (isNull leaderHQC) then {RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQC]};
if not (isNull leaderHQD) then {RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQD]};
if not (isNull leaderHQE) then {RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQE]};
if not (isNull leaderHQF) then {RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQF]};
if not (isNull leaderHQG) then {RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQG]};
if not (isNull leaderHQH) then {RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQH]};

if not (isNull leaderHQ) then {[] spawn A_HQSitRep; sleep 5};
if not (isNull leaderHQB) then {[] spawn B_HQSitRep; sleep 5};
if not (isNull leaderHQC) then {[] spawn C_HQSitRep; sleep 5};
if not (isNull leaderHQD) then {[] spawn D_HQSitRep; sleep 5};
if not (isNull leaderHQE) then {[] spawn E_HQSitRep; sleep 5};
if not (isNull leaderHQF) then {[] spawn F_HQSitRep; sleep 5};
if not (isNull leaderHQG) then {[] spawn G_HQSitRep; sleep 5};
if not (isNull leaderHQH) then {[] spawn H_HQSitRep};
