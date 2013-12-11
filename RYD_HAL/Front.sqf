private ["_front","_pos","_att","_XAxis","_YAxis","_dir","_isRec"];

	{
	_front = _x getVariable ["RydHQ_Front",objNull];
	if not (isNull _front) then
		{
		_pos = position _front;
		_att = triggerArea _front;
		_XAxis = _att select 0;
		_YAxis = _att select 1;
		_dir = _att select 2;
		_isRec = _att select 3;

		_front = createLocation ["Name", _pos, _XAxis, _YAxis];
		_front setDirection _dir;
		_front setRectangular _isRec;
		
		_x setVariable ["RydHQ_Front",_front];

		[_x,_front,_isRec,_pos,_XAxis,_YAxis,_dir] spawn
			{
			_HQ = _this select 0;
			_front = _this select 1;
			_isRec = _this select 2;
			_pos = _this select 3;
			_XAxis = _this select 4;
			_YAxis = _this select 5;
			_dir = _this select 6;
			
			_alive = true;
			
			waitUntil
				{
				sleep 5;
				
				_alive = true;
				
				switch (true) do
					{
					case (isNil "_HQ") : {_alive = false};
					case (isNull _HQ) : {_alive = false};
					case (({alive _x} count (units _HQ)) < 1) : {_alive = false};
					};

				_debug = _HQ getVariable "RydHQ_Debug";
				
				(not (isNil "_debug") or not (_alive))
				};
				
			if not (_alive) exitWith {};	

			if (_HQ getVariable ["RydHQ_Debug",false]) then
				{
				_shape = "ELLIPSE";
				if (_isRec) then {_shape = "RECTANGLE"};

				_ia = "markFront" + (str _HQ);
				_ia = createMarker [_ia,_pos];
				_ia setMarkerColor "ColorRed";
				_ia setMarkerShape _shape;
				_ia setMarkerSize [_XAxis, _YAxis];
				_ia setMarkerDir _dir;
				_ia setMarkerBrush "Border";
				_ia setMarkerColor "ColorKhaki";				
				
				[_HQ,_front,_ia] spawn
					{
					_HQ = _this select 0;
					_front = _this select 1;
					_ia = _this select 2;
										
					while {not (isNull _HQ)} do
						{
						sleep 5;
						
						_ia setMarkerPos (position _front);
						_ia setMarkerDir (direction _front);
						_ia setMarkerSize (size _front)
						};
						
					deleteMarker _ia
					}
				}
			}		
		}
	}
foreach RydxHQ_AllHQ;