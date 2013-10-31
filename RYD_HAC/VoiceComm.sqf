_UL = _this select 0;
_HQ = _this select 1;

/*if not (isMultiplayer) then
	{
	if (not (_UL kbHasTopic "orders")) then 
		{
		_UL kbAddTopic ["orders","RYD_HAC\topics.bikb",""];
		waituntil {(_UL kbHasTopic "orders")};
		};

	_UL kbTell [_HQ, "orders", "First", true];
	waituntil {(_UL kbWasSaid [_HQ, "orders", "First", 5])};
	sleep 1;

	if ((isPlayer _UL) and (RydHQ_VoiceComm)) then
		{
		_HQ kbTell [_UL, "orders", "NewMessage", true];
		waituntil {(_HQ kbWasSaid [_UL, "orders", "NewMessage", 5])};
		sleep (0.2 + (random 0.8));

		_OK = "OK" + str (floor (random 5));

		_UL kbTell [_HQ, "orders", _OK, true];
		waituntil {(_UL kbWasSaid [_HQ, "orders", _OK, 5])};
		sleep (0.2 + (random 0.8));
		}
	}
else
	{
	if (not (_UL kbHasTopic "orders")) then 
		{
		[[_UL,["orders","RYD_HAC\topics.bikb",""]],"RydHQ_MP_KBADDTOPIC",_UL,false,true] call RydHQ_MP;
		//[objNull,_UL,"loc",rKBADDTOPIC,"orders","RYD_HAC\topics.bikb",""] call RE;
		waituntil {[[_UL,"orders"],"RydHQ_MP_KBHASTOPIC",_UL,false,true] call RydHQ_MP};
		sleep 0.5;
		};

	[[_UL,[_HQ, "orders", "First", true]],"RydHQ_MP_KBTELL",_UL,false,true] call RydHQ_MP;
	//[objNull,_UL,"loc",rKBTELL,_HQ,"orders","First",true] call RE;
	sleep (2 + (random 1));
	
	waituntil {[[_UL,[_HQ, "orders", "First", 5]],"RydHQ_MP_KBWASSAID",_UL,false,true] call RydHQ_MP};
	sleep 1;

	if ((isPlayer _UL) and (RydHQ_VoiceComm)) then
		{
		[[_HQ,[_UL, "orders", "NewMessage", true]],"RydHQ_MP_KBTELL",_UL,false,true] call RydHQ_MP;
		//[objNull,_HQ,"loc",rKBTELL,_UL,"orders","NewMessage",true] call RE;
		waituntil {[[_HQ,[_UL, "orders", "NewMessage", 5]],"RydHQ_MP_KBWASSAID",_UL,false,true] call RydHQ_MP};
		sleep (2 + (random 1));
		sleep (0.2 + (random 0.8));

		_OK = "OK" + str (floor (random 5));

		[[_UL,[_HQ, "orders", _OK, true]],"RydHQ_MP_KBTELL",_UL,false,true] call RydHQ_MP;
		//[objNull,_UL,"loc",rKBTELL,_HQ,"orders",_OK,true] call RE;
		waituntil {[[_UL,[_HQ, "orders", _OK, 5]],"RydHQ_MP_KBWASSAID",_UL,false,true] call RydHQ_MP};
		sleep (2 + (random 1));
		sleep (0.2 + (random 0.8))
		}
	};*/

RydHQ_VCDone = true;
RydHQB_VCDone = true;
RydHQC_VCDone = true;
RydHQD_VCDone = true;
RydHQE_VCDone = true;
RydHQF_VCDone = true;
RydHQG_VCDone = true;
RydHQH_VCDone = true;