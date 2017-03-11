
if not (isServer) exitWith {};

if (isNil ("RydHQ_Wait")) then {RydHQ_Wait = 15};

sleep RydHQ_Wait;

waituntil {sleep 1;not (isNil ("leaderHQ"))};

_hi = "HAL 1.23 is here";

if ((random 100) < 1) then {_hi = "Good morning, Dave."};

leaderHQ globalchat _hi;

if (isNil "RYD_Path") then {RYD_Path = "RYD_HAL\"};

call compile preprocessfile (RYD_Path + "HAC_fnc.sqf");
call compile preprocessfile (RYD_Path + "HAC_fnc2.sqf");
call compile preprocessfile (RYD_Path + "VarInit.sqf");

publicVariable "RYD_MP_Sidechat";

if (RydHQ_RHQCheck) then {[] call RYD_RHQCheck};

RydxHQ_AllLeaders = [];
RydxHQ_AllHQ = [];

_clB = [(profilenamespace getvariable ['Map_BLUFOR_R',0]),(profilenamespace getvariable ['Map_BLUFOR_G',1]),(profilenamespace getvariable ['Map_BLUFOR_B',1]),(profilenamespace getvariable ['Map_BLUFOR_A',0.8])];
_clO = [(profilenamespace getvariable ['Map_OPFOR_R',0]),(profilenamespace getvariable ['Map_OPFOR_G',1]),(profilenamespace getvariable ['Map_OPFOR_B',1]),(profilenamespace getvariable ['Map_OPFOR_A',0.8])];
_clI = [(profilenamespace getvariable ['Map_Independent_R',0]),(profilenamespace getvariable ['Map_Independent_G',1]),(profilenamespace getvariable ['Map_Independent_B',1]),(profilenamespace getvariable ['Map_Independent_A',0.8])];
_clU = [(profilenamespace getvariable ['Map_Unknown_R',0]),(profilenamespace getvariable ['Map_Unknown_G',1]),(profilenamespace getvariable ['Map_Unknown_B',1]),(profilenamespace getvariable ['Map_Unknown_A',0.8])];

/*RydHQ_CallSignsA = [RydHQ_CallSignsA] call RYD_RandomOrdB;

	{
	_nouns = [_x] call RYD_RandomOrdB;
	RydHQ_CallSignsN set [_foreachIndex,_nouns]
	}
foreach RydHQ_CallSignsN;*/

if not (isNull leaderHQ) then 
	{
	_gp = group leaderHQ;
	RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQ];
	RydxHQ_AllHQ set [(count RydxHQ_AllHQ),_gp];
	_gp setVariable ["RydHQ_CodeSign","A"];
	
	if (isNil {_gp getVariable "RydHQ_MyCrypto"}) then 
		{
		_gp setVariable ["RydHQ_MyCrypto","OLYMPUS"]
		};
	
	_cl = switch (side leaderHQ) do
		{
		case (west) : {_clB};
		case (east) : {_clO};
		case (resistance) : {_clI};
		default {_clU};
		};
	//"%UNIT_NAME"
	_ix = radioChannelCreate [_cl,_gp getVariable ["RydHQ_MyCrypto","OLYMPUS"],_gp getVariable ["RydHQ_MyCrypto","OLYMPUS"], (units _gp)];
	_gp setVariable ["RydHQ_myChannel",_ix];
	
	if not (isNil ("HET_FA")) then 
		{
		_gp setVariable ["RydHQ_Front",HET_FA]
		}
	};
	
if not (isNull leaderHQB) then 
	{
	_gp = group leaderHQB;
	RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQB];
	RydxHQ_AllHQ set [(count RydxHQ_AllHQ),_gp];
	_gp setVariable ["RydHQ_CodeSign","B"];
	
	if (isNil {_gp getVariable "RydHQ_MyCrypto"}) then 
		{
		_gp setVariable ["RydHQ_MyCrypto","OLYMPUS"]
		};
	
	_cl = switch (side leaderHQB) do
		{
		case (west) : {_clB};
		case (east) : {_clO};
		case (resistance) : {_clI};
		default {_clU};
		};
	//"%UNIT_NAME"
	_ix = radioChannelCreate [_cl,_gp getVariable ["RydHQ_MyCrypto","OLYMPUS"],_gp getVariable ["RydHQ_MyCrypto","OLYMPUS"], (units _gp)];
	_gp setVariable ["RydHQ_myChannel",_ix];	
	
	if not (isNil ("HET_FB")) then 
		{
		_gp setVariable ["RydHQ_Front",HET_FB]
		}
	};
	
if not (isNull leaderHQC) then 
	{
	_gp = group leaderHQC;
	RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQC];
	RydxHQ_AllHQ set [(count RydxHQ_AllHQ),_gp];
	_gp setVariable ["RydHQ_CodeSign","C"];
	
	if (isNil {_gp getVariable "RydHQ_MyCrypto"}) then 
		{
		_gp setVariable ["RydHQ_MyCrypto","OLYMPUS"]
		};
	
	_cl = switch (side leaderHQC) do
		{
		case (west) : {_clB};
		case (east) : {_clO};
		case (resistance) : {_clI};
		default {_clU};
		};
	//"%UNIT_NAME"
	_ix = radioChannelCreate [_cl,_gp getVariable ["RydHQ_MyCrypto","OLYMPUS"],_gp getVariable ["RydHQ_MyCrypto","OLYMPUS"], (units _gp)];
	_gp setVariable ["RydHQ_myChannel",_ix];	
	
	if not (isNil ("HET_FC")) then 
		{
		_gp setVariable ["RydHQ_Front",HET_FC]
		}
	};
	
if not (isNull leaderHQD) then 
	{
	_gp = group leaderHQD;
	RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQD];
	RydxHQ_AllHQ set [(count RydxHQ_AllHQ),_gp];
	_gp setVariable ["RydHQ_CodeSign","D"];
	
	if (isNil {_gp getVariable "RydHQ_MyCrypto"}) then 
		{
		_gp setVariable ["RydHQ_MyCrypto","OLYMPUS"]
		};	
	
	_cl = switch (side leaderHQD) do
		{
		case (west) : {_clB};
		case (east) : {_clO};
		case (resistance) : {_clI};
		default {_clU};
		};
	//"%UNIT_NAME"
	_ix = radioChannelCreate [_cl,_gp getVariable ["RydHQ_MyCrypto","OLYMPUS"],_gp getVariable ["RydHQ_MyCrypto","OLYMPUS"], (units _gp)];
	_gp setVariable ["RydHQ_myChannel",_ix];	
	
	if not (isNil ("HET_FD")) then 
		{
		_gp setVariable ["RydHQ_Front",HET_FD]
		}
	};
	
if not (isNull leaderHQE) then 
	{
	_gp = group leaderHQE;
	RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQE];
	RydxHQ_AllHQ set [(count RydxHQ_AllHQ),_gp];
	_gp setVariable ["RydHQ_CodeSign","E"];
	
	if (isNil {_gp getVariable "RydHQ_MyCrypto"}) then 
		{
		_gp setVariable ["RydHQ_MyCrypto","OLYMPUS"]
		};
	
	_cl = switch (side leaderHQE) do
		{
		case (west) : {_clB};
		case (east) : {_clO};
		case (resistance) : {_clI};
		default {_clU};
		};
	//"%UNIT_NAME"
	_ix = radioChannelCreate [_cl,_gp getVariable ["RydHQ_MyCrypto","OLYMPUS"],_gp getVariable ["RydHQ_MyCrypto","OLYMPUS"], (units _gp)];
	_gp setVariable ["RydHQ_myChannel",_ix];	
	
	if not (isNil ("HET_FE")) then 
		{
		_gp setVariable ["RydHQ_Front",HET_FE]
		}
	};
	
if not (isNull leaderHQF) then 
	{
	_gp = group leaderHQF;
	RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQF];
	RydxHQ_AllHQ set [(count RydxHQ_AllHQ),_gp];
	_gp setVariable ["RydHQ_CodeSign","F"];
	
	if (isNil {_gp getVariable "RydHQ_MyCrypto"}) then 
		{
		_gp setVariable ["RydHQ_MyCrypto","OLYMPUS"]
		};
	
	_cl = switch (side leaderHQF) do
		{
		case (west) : {_clB};
		case (east) : {_clO};
		case (resistance) : {_clI};
		default {_clU};
		};
	//"%UNIT_NAME"
	_ix = radioChannelCreate [_cl,_gp getVariable ["RydHQ_MyCrypto","OLYMPUS"],_gp getVariable ["RydHQ_MyCrypto","OLYMPUS"], (units _gp)];
	_gp setVariable ["RydHQ_myChannel",_ix];	
	
	if not (isNil ("HET_FF")) then 
		{
		_gp setVariable ["RydHQ_Front",HET_FF]
		}
	};
	
if not (isNull leaderHQG) then 
	{
	_gp = group leaderHQG;
	RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQG];
	RydxHQ_AllHQ set [(count RydxHQ_AllHQ),_gp];
	_gp setVariable ["RydHQ_CodeSign","G"];
	
	if (isNil {_gp getVariable "RydHQ_MyCrypto"}) then 
		{
		_gp setVariable ["RydHQ_MyCrypto","OLYMPUS"]
		};
	
	_cl = switch (side leaderHQG) do
		{
		case (west) : {_clB};
		case (east) : {_clO};
		case (resistance) : {_clI};
		default {_clU};
		};
	//"%UNIT_NAME"
	_ix = radioChannelCreate [_cl,_gp getVariable ["RydHQ_MyCrypto","OLYMPUS"],_gp getVariable ["RydHQ_MyCrypto","OLYMPUS"], (units _gp)];
	_gp setVariable ["RydHQ_myChannel",_ix];	
	
	if not (isNil ("HET_FG")) then 
		{
		_gp setVariable ["RydHQ_Front",HET_FG]
		}
	};
	
if not (isNull leaderHQH) then 
	{
	_gp = group leaderHQH;
	RydxHQ_AllLeaders set [(count RydxHQ_AllLeaders),leaderHQH];
	RydxHQ_AllHQ set [(count RydxHQ_AllHQ),_gp];
	_gp setVariable ["RydHQ_CodeSign","H"];
	
	if (isNil {_gp getVariable "RydHQ_MyCrypto"}) then 
		{
		_gp setVariable ["RydHQ_MyCrypto","OLYMPUS"]
		};
	
	_cl = switch (side leaderHQH) do
		{
		case (west) : {_clB};
		case (east) : {_clO};
		case (resistance) : {_clI};
		default {_clU};
		};
	//"%UNIT_NAME"
	_ix = radioChannelCreate [_cl,_gp getVariable ["RydHQ_MyCrypto","OLYMPUS"],_gp getVariable ["RydHQ_MyCrypto","OLYMPUS"], (units _gp)];
	_gp setVariable ["RydHQ_myChannel",_ix];	
	
	if not (isNil ("HET_FH")) then 
		{
		_gp setVariable ["RydHQ_Front",HET_FH]
		}
	};

[] call compile preprocessfile (RYD_Path + "Front.sqf");

if (RydHQ_TimeM) then 
	{
	[([player] + (switchableUnits - [player]))] call RYD_TimeMachine
	};
	
if (RydBB_Active) then 
	{
	call compile preprocessfile (RYD_Path + "Boss_fnc.sqf");
	RydBBa_InitDone = false;
	RydBBb_InitDone = false;

		{
		if ((count (_x select 0)) > 0) then 
			{
			if ((_x select 1) == "A") then {RydBBa_Init = false};
			_BBHQs = _x select 0;
			_BBHQGrps = [];

				{
				_BBHQGrps set [(count _BBHQGrps),(group _x)]
				}
			foreach _BBHQs;

				{
				_x setVariable ["BBProgress",0]
				}
			foreach _BBHQGrps;
			[[_x,_BBHQGrps],Boss] call RYD_Spawn
			};

		sleep 1;
		}
	foreach [[RydBBa_HQs,"A"],[RydBBb_HQs,"B"]];
	};

if (((RydHQ_Debug) or (RydHQB_Debug) or (RydHQC_Debug) or (RydHQD_Debug) or (RydHQE_Debug) or (RydHQF_Debug) or (RydHQG_Debug) or (RydHQH_Debug)) and (RydHQ_DbgMon)) then {[[],RYD_DbgMon] call RYD_Spawn};

if not (isNull leaderHQ) then {[[(group leaderHQ)],A_HQSitRep] call RYD_Spawn;sleep 5};
if not (isNull leaderHQB) then {[[(group leaderHQB)],B_HQSitRep] call RYD_Spawn;sleep 5};
if not (isNull leaderHQC) then {[[(group leaderHQC)],C_HQSitRep] call RYD_Spawn;sleep 5};
if not (isNull leaderHQD) then {[[(group leaderHQD)],D_HQSitRep] call RYD_Spawn;sleep 5};
if not (isNull leaderHQE) then {[[(group leaderHQE)],E_HQSitRep] call RYD_Spawn;sleep 5};
if not (isNull leaderHQF) then {[[(group leaderHQF)],F_HQSitRep] call RYD_Spawn;sleep 5};
if not (isNull leaderHQG) then {[[(group leaderHQG)],G_HQSitRep] call RYD_Spawn;sleep 5};
if not (isNull leaderHQH) then {[[(group leaderHQH)],H_HQSitRep] call RYD_Spawn;sleep 5};

if ((count RydHQ_GroupMarks) > 0) then
	{	
	[RydHQ_GroupMarks,RYD_GroupMarkerLoop] call RYD_Spawn
	};