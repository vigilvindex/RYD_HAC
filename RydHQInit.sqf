
if not (isServer) exitWith {};

if (isNil ("RydHQ_Wait")) then {RydHQ_Wait = 15};

sleep RydHQ_Wait;

waituntil {sleep 1;not (isNil ("leaderHQ"))};

_hi = "HAL 1.1 is here";

if ((random 100) < 1) then {_hi = "Good morning, Dave."};

leaderHQ sidechat _hi;

call compile preprocessfile "RYD_HAL\VarInit.sqf";
call compile preprocessfile "RYD_HAL\HAC_fnc.sqf";

publicVariable "RYD_MP_Sidechat";

if (RydHQ_RHQCheck) then {[] call RYD_RHQCheck};

RydxHQ_AllLeaders = [];
RydxHQ_AllHQ = [];

if not (isNull leaderHQ) then {RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQ];RydxHQ_AllHQ set [(count RydxHQ_AllHQ),(group leaderHQ)];(group leaderHQ) setVariable ["RydHQ_CodeSign","A"];if not (isNil ("HET_FA")) then {(group leaderHQ) setVariable ["RydHQ_Front",HET_FA]}};
if not (isNull leaderHQB) then {RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQB];RydxHQ_AllHQ set [(count RydxHQ_AllHQ),(group leaderHQB)];(group leaderHQB) setVariable ["RydHQ_CodeSign","B"];if not (isNil ("HET_FB")) then {(group leaderHQB) setVariable ["RydHQ_Front",HET_FB]}};
if not (isNull leaderHQC) then {RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQC];RydxHQ_AllHQ set [(count RydxHQ_AllHQ),(group leaderHQC)];(group leaderHQC) setVariable ["RydHQ_CodeSign","C"];if not (isNil ("HET_FC")) then {(group leaderHQC) setVariable ["RydHQ_Front",HET_FC]}};
if not (isNull leaderHQD) then {RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQD];RydxHQ_AllHQ set [(count RydxHQ_AllHQ),(group leaderHQD)];(group leaderHQD) setVariable ["RydHQ_CodeSign","D"];if not (isNil ("HET_FD")) then {(group leaderHQD) setVariable ["RydHQ_Front",HET_FD]}};
if not (isNull leaderHQE) then {RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQE];RydxHQ_AllHQ set [(count RydxHQ_AllHQ),(group leaderHQE)];(group leaderHQE) setVariable ["RydHQ_CodeSign","E"];if not (isNil ("HET_FE")) then {(group leaderHQE) setVariable ["RydHQ_Front",HET_FE]}};
if not (isNull leaderHQF) then {RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQF];RydxHQ_AllHQ set [(count RydxHQ_AllHQ),(group leaderHQF)];(group leaderHQF) setVariable ["RydHQ_CodeSign","F"];if not (isNil ("HET_FF")) then {(group leaderHQF) setVariable ["RydHQ_Front",HET_FF]}};
if not (isNull leaderHQG) then {RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQG];RydxHQ_AllHQ set [(count RydxHQ_AllHQ),(group leaderHQG)];(group leaderHQG) setVariable ["RydHQ_CodeSign","G"];if not (isNil ("HET_FG")) then {(group leaderHQG) setVariable ["RydHQ_Front",HET_FG]}};
if not (isNull leaderHQH) then {RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQH];RydxHQ_AllHQ set [(count RydxHQ_AllHQ),(group leaderHQH)];(group leaderHQH) setVariable ["RydHQ_CodeSign","H"];if not (isNil ("HET_FH")) then {(group leaderHQH) setVariable ["RydHQ_Front",HET_FH]}};

[] call compile preprocessfile "RYD_HAL\Front.sqf";

if (RydHQ_TimeM) then 
	{
	[([player] + (switchableUnits - [player]))] call RYD_TimeMachine
	};

if (RydBB_Active) then 
	{
	call compile preprocessfile "RYD_HAL\Boss_fnc.sqf";
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

if not (isNull leaderHQ) then {[(group leaderHQ)] spawn A_HQSitRep; sleep 5};
if not (isNull leaderHQB) then {[(group leaderHQB)] spawn B_HQSitRep; sleep 5};
if not (isNull leaderHQC) then {[(group leaderHQC)] spawn C_HQSitRep; sleep 5};
if not (isNull leaderHQD) then {[(group leaderHQD)] spawn D_HQSitRep; sleep 5};
if not (isNull leaderHQE) then {[(group leaderHQE)] spawn E_HQSitRep; sleep 5};
if not (isNull leaderHQF) then {[(group leaderHQF)] spawn F_HQSitRep; sleep 5};
if not (isNull leaderHQG) then {[(group leaderHQG)] spawn G_HQSitRep; sleep 5};
if not (isNull leaderHQH) then {[(group leaderHQH)] spawn H_HQSitRep};
