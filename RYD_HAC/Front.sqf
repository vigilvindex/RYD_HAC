_ia = "";_ib = "";_ic = "";_id = "";_ie = "";_if = "";_ig = "";_ih = "";

FrontA = locationNull;
FrontB = locationNull;
FrontC = locationNull;
FrontD = locationNull;
FrontE = locationNull;
FrontF = locationNull;
FrontG = locationNull;
FrontH = locationNull;

if (isNil "RydHQ") then {RydHQ = grpNull};
if (isNil "RydHQB") then {RydHQB = grpNull};
if (isNil "RydHQC") then {RydHQC = grpNull};
if (isNil "RydHQD") then {RydHQD = grpNull};
if (isNil "RydHQE") then {RydHQE = grpNull};
if (isNil "RydHQF") then {RydHQF = grpNull};
if (isNil "RydHQG") then {RydHQG = grpNull};
if (isNil "RydHQH") then {RydHQH = grpNull};

if not (isNil ("HET_FA")) then 
	{
	_pos = position HET_FA;
	_att = triggerArea HET_FA;
	_XAxis = _att select 0;
	_YAxis = _att select 1;
	_dir = _att select 2;
	_isRec = _att select 3;

	FrontA = createLocation ["Name", _pos, _XAxis, _YAxis];
	FrontA setDirection _dir;
	FrontA setRectangular _isRec;

	if (RydHQ_Debug) then 
		{
		_shape = "ELLIPSE";
		if (_isRec) then {_shape = "RECTANGLE"};
		FrontA setText "FrontA";
		_ia = "markFront" + str (FrontA);
		_ia = createMarker [_ia,_pos];
		_ia setMarkerColor "ColorRed";
		_ia setMarkerShape _shape;
		_ia setMarkerSize [_XAxis, _YAxis];
		_ia setMarkerDir _dir;
		_ia setMarkerBrush "Border";
		_ia setMarkerColor "ColorKhaki";

		[_ia] spawn
			{
			_ia = _this select 0;

			waitUntil
				{
				sleep 5;
				not (isNull RydHQ)
				};
			
			while {not (isNull RydHQ)} do
				{
				sleep 5;

				_ia setMarkerPos (position FrontA);
				_ia setMarkerDir (direction FrontA);
				_ia setMarkerSize (size FrontA)
				};
			}
		};
	};

if not (isNil ("HET_FB")) then 
	{
	_pos = position HET_FB;
	_att = triggerArea HET_FB;
	_XAxis = _att select 0;
	_YAxis = _att select 1;
	_dir = _att select 2;
	_isRec = _att select 3;

	FrontB = createLocation ["Name", _pos, _XAxis, _YAxis];
	FrontB setDirection _dir;
	FrontB setRectangular _isRec;

	if (RydHQB_Debug) then 
		{
		_shape = "ELLIPSE";
		if (_isRec) then {_shape = "RECTANGLE"};
		FrontB setText "FrontB";
		_ib = "markFront" + (str FrontB);
		_ib = createMarker [_ib,_pos];
		_ib setMarkerColor "ColorRed";
		_ib setMarkerShape _shape;
		_ib setMarkerSize [_XAxis, _YAxis];
		_ib setMarkerDir _dir;
		_ib setMarkerBrush "Border";
		_ib setMarkerColor "ColorKhaki";

		[_ib] spawn
			{
			_ia = _this select 0;

			waitUntil
				{
				sleep 5;
				not (isNull RydHQB)
				};
			
			while {not (isNull RydHQB)} do
				{
				sleep 5;

				_ia setMarkerPos (position FrontB);
				_ia setMarkerDir (direction FrontB);
				_ia setMarkerSize (size FrontB)
				};
			}
		};
	};

if not (isNil ("HET_FC")) then 
	{
	_pos = position HET_FC;
	_att = triggerArea HET_FC;
	_XAxis = _att select 0;
	_YAxis = _att select 1;
	_dir = _att select 2;
	_isRec = _att select 3;

	FrontC = createLocation ["Name", _pos, _XAxis, _YAxis];
	FrontC setDirection _dir;
	FrontC setRectangular _isRec;

	if (RydHQC_Debug) then 
		{
		_shape = "ELLIPSE";
		if (_isRec) then {_shape = "RECTANGLE"};
		FrontC setText "FrontC";
		_ic = "markFront" + (str FrontC);
		_ic = createMarker [_ic,_pos];
		_ic setMarkerColor "ColorRed";
		_ic setMarkerShape _shape;
		_ic setMarkerSize [_XAxis, _YAxis];
		_ic setMarkerDir _dir;
		_ic setMarkerBrush "Border";
		_ic setMarkerColor "ColorKhaki";

		[_ic] spawn
			{
			_ia = _this select 0;

			waitUntil
				{
				sleep 5;
				not (isNull RydHQC)
				};
			
			while {not (isNull RydHQC)} do
				{
				sleep 5;

				_ia setMarkerPos (position FrontC);
				_ia setMarkerDir (direction FrontC);
				_ia setMarkerSize (size FrontC)
				};
			}
		};
	};


if not (isNil ("HET_FD")) then 
	{
	_pos = position HET_FD;
	_att = triggerArea HET_FD;
	_XAxis = _att select 0;
	_YAxis = _att select 1;
	_dir = _att select 2;
	_isRec = _att select 3;

	FrontD = createLocation ["Name", _pos, _XAxis, _YAxis];
	FrontD setDirection _dir;
	FrontD setRectangular _isRec;

	if (RydHQD_Debug) then 
		{
		_shape = "ELLIPSE";
		if (_isRec) then {_shape = "RECTANGLE"};
		FrontD setText "FrontD";
		_id = "markFront" + (str FrontD);
		_id = createMarker [_id,_pos];
		_id setMarkerColor "ColorRed";
		_id setMarkerShape _shape;
		_id setMarkerSize [_XAxis, _YAxis];
		_id setMarkerDir _dir;
		_id setMarkerBrush "Border";
		_id setMarkerColor "ColorKhaki";

		[_id] spawn
			{
			_ia = _this select 0;

			waitUntil
				{
				sleep 5;
				not (isNull RydHQD)
				};
			
			while {not (isNull RydHQD)} do
				{
				sleep 5;

				_ia setMarkerPos (position FrontD);
				_ia setMarkerDir (direction FrontD);
				_ia setMarkerSize (size FrontD)
				};
			}
		};
	};

if not (isNil ("HET_FE")) then 
	{
	_pos = position HET_FE;
	_att = triggerArea HET_FE;
	_XAxis = _att select 0;
	_YAxis = _att select 1;
	_dir = _att select 2;
	_isRec = _att select 3;

	FrontE = createLocation ["Name", _pos, _XAxis, _YAxis];
	FrontE setDirection _dir;
	FrontE setRectangular _isRec;

	if (RydHQE_Debug) then 
		{
		_shape = "ELLIPSE";
		if (_isRec) then {_shape = "RECTANGLE"};
		FrontE setText "FrontE";
		_ie = "markFront" + (str FrontE);
		_ie = createMarker [_ie,_pos];
		_ie setMarkerColor "ColorRed";
		_ie setMarkerShape _shape;
		_ie setMarkerSize [_XAxis, _YAxis];
		_ie setMarkerDir _dir;
		_ie setMarkerBrush "Border";
		_ie setMarkerColor "ColorKhaki";

		[_ie] spawn
			{
			_ia = _this select 0;

			waitUntil
				{
				sleep 5;
				not (isNull RydHQE)
				};
			
			while {not (isNull RydHQE)} do
				{
				sleep 5;

				_ia setMarkerPos (position FrontE);
				_ia setMarkerDir (direction FrontE);
				_ia setMarkerSize (size FrontE)
				};
			}
		};
	};

if not (isNil ("HET_FF")) then 
	{
	_pos = position HET_FF;
	_att = triggerArea HET_FF;
	_XAxis = _att select 0;
	_YAxis = _att select 1;
	_dir = _att select 2;
	_isRec = _att select 3;

	FrontF = createLocation ["Name", _pos, _XAxis, _YAxis];
	FrontF setDirection _dir;
	FrontF setRectangular _isRec;

	if (RydHQF_Debug) then 
		{
		_shape = "ELLIPSE";
		if (_isRec) then {_shape = "RECTANGLE"};
		FrontF setText "FrontF";
		_if = "markFront" + (str FrontF);
		_if = createMarker [_if,_pos];
		_if setMarkerColor "ColorRed";
		_if setMarkerShape _shape;
		_if setMarkerSize [_XAxis, _YAxis];
		_if setMarkerDir _dir;
		_if setMarkerBrush "Border";
		_if setMarkerColor "ColorKhaki";

		[_if] spawn
			{
			_ia = _this select 0;

			waitUntil
				{
				sleep 5;
				not (isNull RydHQF)
				};
			
			while {not (isNull RydHQF)} do
				{
				sleep 5;

				_ia setMarkerPos (position FrontF);
				_ia setMarkerDir (direction FrontF);
				_ia setMarkerSize (size FrontF)
				};
			}
		};
	};

if not (isNil ("HET_FG")) then 
	{
	_pos = position HET_FG;
	_att = triggerArea HET_FG;
	_XAxis = _att select 0;
	_YAxis = _att select 1;
	_dir = _att select 2;
	_isRec = _att select 3;

	FrontG = createLocation ["Name", _pos, _XAxis, _YAxis];
	FrontG setDirection _dir;
	FrontG setRectangular _isRec;

	if (RydHQG_Debug) then 
		{
		_shape = "ELLIPSE";
		if (_isRec) then {_shape = "RECTANGLE"};
		FrontG setText "FrontG";
		_ig = "markFront" + (str FrontG);
		_ig = createMarker [_ig,_pos];
		_ig setMarkerColor "ColorRed";
		_ig setMarkerShape _shape;
		_ig setMarkerSize [_XAxis, _YAxis];
		_ig setMarkerDir _dir;
		_ig setMarkerBrush "Border";
		_ig setMarkerColor "ColorKhaki";

		[_ig] spawn
			{
			_ia = _this select 0;

			waitUntil
				{
				sleep 5;
				not (isNull RydHQG)
				};
			
			while {not (isNull RydHQG)} do
				{
				sleep 5;

				_ia setMarkerPos (position FrontG);
				_ia setMarkerDir (direction FrontG);
				_ia setMarkerSize (size FrontG)
				};
			}
		};
	};


if not (isNil ("HET_FH")) then 
	{
	_pos = position HET_FH;
	_att = triggerArea HET_FH;
	_XAxis = _att select 0;
	_YAxis = _att select 1;
	_dir = _att select 2;
	_isRec = _att select 3;

	FrontH = createLocation ["Name", _pos, _XAxis, _YAxis];
	FrontH setDirection _dir;
	FrontH setRectangular _isRec;

	if (RydHQH_Debug) then 
		{
		_shape = "ELLIPSE";
		if (_isRec) then {_shape = "RECTANGLE"};
		FrontH setText "FrontH";
		_ih = "markFront" + (str FrontH);
		_ih = createMarker [_ih,_pos];
		_ih setMarkerColor "ColorRed";
		_ih setMarkerShape _shape;
		_ih setMarkerSize [_XAxis, _YAxis];
		_ih setMarkerDir _dir;
		_ih setMarkerBrush "Border";
		_ih setMarkerColor "ColorKhaki";

		[_ih] spawn
			{
			_ia = _this select 0;

			waitUntil
				{
				sleep 5;
				not (isNull RydHQH)
				};
			
			while {not (isNull RydHQH)} do
				{
				sleep 5;

				_ia setMarkerPos (position FrontH);
				_ia setMarkerDir (direction FrontH);
				_ia setMarkerSize (size FrontH)
				};
			}
		};
	};

RydHQ_Fronts = true;