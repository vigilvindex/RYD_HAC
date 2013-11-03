RYD_RandomAround = 
	{//based on Muzzleflash' function
	private ["_pos","_xPos","_yPos","_a","_dir","_angle","_mag","_nX","_nY","_temp"];

	_pos = _this select 0;
	_a = _this select 1;

	_xPos = _pos select 0;
	_yPos = _pos select 1;

	_dir = random 360;

	_mag = sqrt ((random _a) * _a);
	_nX = _mag * (sin _dir);
	_nY = _mag * (cos _dir);

	_pos = [_xPos + _nX, _yPos + _nY,0];  

	_pos	
	};

RYD_RandomAroundB = 
	{//[[_posX,_posY],100] call RYD_RandomAround
	private ["_pos","_X","_Y","_radius","_radiusMax","_angle"];

	_pos = _this select 0;
	_radiusMax = _this select 1;

	_angle = random 360;
	_radius = random _radiusMax;

	_X = _radius * sin _angle;
	_Y = _radius * cos _angle;

	_pos = [(_pos select 0) + _X,(_pos select 1) + _Y,0];

	_pos	
	};

RYD_PointToSecDst = 
	{
	private ["_p1","_p2","_pc","_d","_d0","_d1","_d2","_x1","_y1","_x2","_y2","_xc","_yc","_a","_b"];

	_p1 = _this select 0;//ATL
	_p2 = _this select 1;//ATL
	_pc = _this select 2;//ATL

	_d0 = _p1 distance _p2;
	_d1 = _pc distance _p1;
	_d2 = _pc distance _p2;

	_d = _d1;

	switch (true) do
		{
		case (((_d0 * _d0) + (_d1 * _d1)) <= (_d2 * _d2)) : {_d = _d1};
		case (((_d0 * _d0) + (_d2 * _d2)) <= (_d1 * _d1)) : {_d = _d2};
		default
			{
			_x1 = _p1 select 0;
			_y1 = _p1 select 1;

			_x2 = _p2 select 0;
			_y2 = _p2 select 1;

			_xc = _pc select 0;
			_yc = _pc select 1;

			_a = (_y2 - _y1)/(_x2 - _x1);
			_b = _y1 - _x1 * _a;

			_d = abs (((_a/_b) * _xc) + ((-1/_b) * _yc) + 1)/(sqrt (((_a/_b) * (_a/_b)) + (1/(_b * _b))));
			}
		};

	_d
	};

RYD_AngTowards = 
	{
	private ["_source0", "_target0", "_rnd0","_dX0","_dY0","_angleAzimuth0"];

	_source0 = _this select 0;
	_target0 = _this select 1;
	_rnd0 = _this select 2;

	_dX0 = (_target0 select 0) - (_source0 select 0);
	_dY0 = (_target0 select 1) - (_source0 select 1);

	_angleAzimuth0 = (_dX0 atan2 _dY0) + (random (2 * _rnd0)) - _rnd0;

	_angleAzimuth0
	};

RYD_PosTowards2D = 
	{
	private ["_source","_distT","_angle","_dXb","_dYb","_px","_py","_pz"];

	_source = _this select 0;
	_angle = _this select 1;
	_distT = _this select 2;

	_dXb = _distT * (sin _angle);
	_dYb = _distT * (cos _angle);

	_px = (_source select 0) + _dXb;
	_py = (_source select 1) + _dYb;

	_pz = getTerrainHeightASL [_px,_py];

	[_px,_py,_pz]
	};

RYD_GarrP = 
	{
	private ["_gp","_points","_nHouse","_frm","_wp","_i","_posAll","_posAct","_sum","_sumAct","_added"];

	_gp = _this select 0;
	_points = _this select 1;

		{
		_nHouse = _x nearestObject "House";
		_posAll = [];
		_i = 0;
		_posAct = _nHouse buildingpos _i;
		
		while {not ((str _posAct) in ["[0,0,0]"])} do
			{
			_i = _i + 1;
			_sum = 0;
			
				{
				_sum = _sum + _x
				}
			foreach _posAct;
			
			_added = false;
			
				{
				_sumAct = 0;
				
					{
					_sum = _sum + _x
					}
				foreach _x;
				
				if (_sum == _sumAct) exitWith {_added = true}
				}
			foreach _posAll;
			
			if not (_added) then 
				{
				_posAll set [(count _posAll),_posAct]
				};
				
			_posAct = _nHouse buildingpos _i;
			};

		_frm = "DIAMOND";
		if (isPlayer (leader _gp)) then {_frm = formation _gp};

		_wp = [[_gp],_x,"MOVE","AWARE","YELLOW","LIMITED",["true",""],false,0.01,[10,15,20],_frm] call RYD_WPadd;

		//_i = [_x,(random 1000),"markPatrol","ColorOrange","ICON","mil_box","Patrol","",[0.3,0.3]] call RYD_Mark;

		if ((count _posAll) > 0) then
			{
			_wp waypointAttachVehicle _nHouse;
			sleep 0.05;
			_wp setWaypointHousePosition (floor (random (count _posAll)))
			}
		}
	foreach _points;

	_wp = [[_gp],_points select 0,"CYCLE","AWARE","YELLOW","LIMITED",["true",""],false,0.01,[10,15,20],_frm] call RYD_WPadd;

	[_gp] spawn
		{
		private ["_gp","_UL","_nE","_dst"];

		_gp = _this select 0;

		_UL = leader _gp;

		_alive = true;

		waitUntil
			{
			sleep 20;
			_dst = 10000;
			_alive = true;
			if (isNull _gp) then {_alive = false};
			if (_alive) then 
				{
				_UL = leader _gp;
				if not (alive _UL) then {_alive = false};

				if (_alive) then
					{
					_nE = _UL findNearestEnemy (vehicle _UL);
					if not (isNull _nE) then {_dst = _nE distance (vehicle _UL)}
					}
				};
			
			(_dst < 500)
			};

		_gp setVariable ["Garrisoned" + (str _gp),false]
		};
	};

RYD_GarrS = 
	{
	private ["_unit","_pos","_timer","_alive","_dst","_taken","_gar","_i","_vel","_sum","_posLast","_dst2"];

	_unit = _this select 0;
	_pos = _this select 1;
	_taken = _this select 2;

	_unit doMove _pos;

	//_i = [_pos,_unit,"markPos","ColorBrown","ICON","mil_box","Pos","",[0.3,0.3]] call RYD_Mark;

	_timer = 0;
	_alive = true;

	_posLast = getPosASL _unit;

	waitUntil 
		{
		_dst = 0;
		if not (isNull _unit) then {_dst = _unit distance _pos};
		sleep 0.1;
		_dst2 = 0;
		if not (isNull _unit) then {_dst2 = _unit distance _pos};
		if (isNull _unit) then {_alive = false};
		if not (alive _unit) then {_alive = false};
		if (_dst2 >= _dst) then {_timer = _timer + 1};

		((unitReady _unit) or (_timer > 240) or not (_alive))
		};


	if (_alive) then {doStop _unit};

	_unit doWatch ObjNull;
	sleep 0.1;
	_unit setDir (random 360);

	waitUntil 
		{
		sleep 30;
		if (isNull _unit) then {_alive = false};
		if not (alive _unit) then {_alive = false};
		_gar = (group _unit) getVariable ("Garrisoned" + (str (group _unit)));
		if not (_gar) then {_alive = false};
		not (_alive)
		};

	_taken = _taken - [_pos]
	};

RYD_AmmoCount = 
	{//[_gp] call RYD_AmmoCount
	private ["_gp","_ct","_ncVeh"];

	_gp = _this select 0;
	
	_ncVeh = [];
	if ((count _this) > 1) then {_ncVeh = _this select 1};

	_ct = 0;
	
		{
		_ct = _ct + (count (magazines (vehicle _x)));
		if ((typeOf (vehicle _x)) in _ncVeh) then {_ct = _ct + (count (magazines _x))}
		}
	foreach (units _gp);

	_ct
	};

RYD_WPdel = 
	{//[_gp] call RYD_WPdel
	private ["_gp","_count"];

	_gp = _this select 0;

	if (isNil "_gp") exitWith {};
	if (isNull _gp) exitWith {};

	_count = (count (waypoints _gp)) - 1;

	if (_count < 0) exitWith {};

	[_gp, (currentWaypoint _gp)] setWaypointPosition [position (vehicle (leader _gp)), 0];

	while {(_count >= 0)} do
		{
		deleteWaypoint ((waypoints _gp) select _count);
		_count = (count (waypoints _gp)) - 1
		}
	};

RYD_Mark = 
	{//[_pos,_ref,_pfx,_cl,_shp,_tp,_dTxt,_ifPTxt,_sz,_dir] call RYD_Mark;
	private ["_pos","_ref","_pfx","_cl","_shp","_tp","_dTxt","_ifPTxt","_sz","_dir","_txt","_i"];
	
	_pos = _this select 0;
	_ref = _this select 1;
	_pfx = _this select 2;

	_cl = _this select 3;
	_shp = _this select 4;
	_tp = _this select 5;
	_dTxt = _this select 6;
	_ifPTxt = _this select 7;

	_sz = [1,1];
	if ((count _this) > 8) then {_sz = _this select 8};

	_dir = 0;
	if ((count _this) > 9) then {_dir = _this select 9};

	_txt = _dTxt;

	if (typeName _ref == "GROUP") then
		{
		if (isPlayer (leader _ref)) then {_txt = (str (leader _ref)) + _ifPTxt}
		};

	if ((typeName _pos) == "OBJECT") then {_pos = position _pos};

	if not ((typename _pos) == "ARRAY") exitWith {};
	if ((_pos select 0) == 0) exitWith {};
	if ((count _pos) < 2) exitWith {};
//diag_log format ["mark: %1 pos: %2 col: %3 size: %4 dir: %5 text: %6",_pfx + (str _ref),_pos,_cl,_sz,_dir,_txt];

	if (isNil "_pos") exitWith {};

	_i = _pfx + (str _ref);
	_i = createMarker [_i,_pos];
	_i setMarkerColor _cl;
	_i setMarkerShape _shp;
	if (_shp =="ICON") then {_i setMarkerType _tp} else {_i setMarkerBrush _tp};
	_i setMarkerSize _sz;
	_i setMarkerDir _dir;
	_i setMarkerText _txt;

	_i
	};

RYD_WPadd = 
	{//[_gp,_pos,_tp,_beh,_CM,_spd,_sts,_crr,_rds,_TO,_frm] call RYD_WPadd;
	private 
		[
		"_gp","_pos","_tp","_beh","_CM","_spd","_sts","_crr","_rds","_TO","_frm","_wp","_vh",
		"_topArr","_fFactor","_posX","_posY","_isWater","_wpn","_addedpath","_assVeh","_wps",
		"_isAir","_sPoint","_dst","_dstFirst","_mPoints","_num","_actDst","_angle","_mPoint",
		"_topPoints","_sPosX","_sPosY","_sUrban","_sForest","_sHills","_sFlat","_sSea",
		"_sGr","_count","_friendly","_opt","_j","_samplePos","_sRoads,","_lastDistance",
		"_dstCheck","_pfAll","_sRoads","_mpl","_frds"
		];

	_pfAll = true;

	_gp = _this select 0;

	if ((typeName _gp) == "ARRAY") then {_pfAll = false;_gp = _gp select 0};

	_pos = _this select 1;

	_tp = "MOVE";
	if ((count _this) > 2) then {_tp = _this select 2};

	_beh = "AWARE";
	if ((count _this) > 3) then {_beh = _this select 3};

	_CM = "YELLOW";
	if ((count _this) > 4) then {_CM = _this select 4};

	_spd = "NORMAL";
	if ((count _this) > 5) then {_spd = _this select 5};

	if (RydHQ_Rush) then 
		{
		if (_spd == "LIMITED") then
			{
			_spd = "NORMAL"
			};

		if (_beh == "SAFE") then
			{
			_beh = "AWARE"
			}
		};
	
	_sts = ["true","deletewaypoint [(group this), 0]"];
	if ((count _this) > 6) then {_sts = _this select 6};

	_crr = true;
	if ((count _this) > 7) then {_crr = _this select 7};

	_rds = 0;
	if ((count _this) > 8) then {_rds = _this select 8};

	_TO = [0,0,0];
	if ((count _this) > 9) then {_TO = _this select 9};

	_frm = formation _gp;
	if ((count _this) > 10) then {_frm = _this select 10};

	if ((typeName _pos) == "OBJECT") then {_pos = position _pos};

	if (isNull _gp) exitWith {diag_log format ["wp error group: %1 type: %3 pos: %2",_gp,_pos,typeOf (vehicle (leader _gp))]};
	if not ((typename _pos == "ARRAY")) exitWith {diag_log format ["wp error group: %1 typ: %3 pos: %2",_gp,_pos,typeOf (vehicle (leader _gp))]};
	if ((count _pos) < 2) exitWith {diag_log format ["wp error group: %1 type: %3 pos: %2",_gp,_pos,typeOf (vehicle (leader _gp))]};
	if ((_pos select 0) == 0) exitWith {diag_log format ["wp error group: %1 type: %3 pos: %2",_gp,_pos,typeOf (vehicle (leader _gp))]};

	if (isNil "_pos") exitWith {diag_log format ["wp error group: %1 type: %3 pos: %2",_gp,_pos,typeOf (vehicle (leader _gp))]};

	_addedpath = false;

	if (isPlayer (leader _gp)) then {_pfAll = false};

	if not (_rds == 0.01) then {[_gp] call RYD_WPdel};

	_frds = floor _rds;
	if (_frds == _rds) then
		{
		_pos = [_pos,50] call RYD_FlatLandNoRoad
		}
	else
		{
		_rds = 0
		};

	if ((RydHQ_PathFinding > 0) and (_pfAll)) then
		{
		_assVeh = assignedVehicle (leader _gp);
		if (isNull _assVeh) then
			{
				{
				_vh = assignedVehicle _x;
				if not (isNull _vh) exitWith {_assVeh = _vh};
				_vh = vehicle _x;
				if not (_vh == _x) exitWith {_assVeh = _vh}
				}
			foreach (units _gp)
			};

		if not (isNull _assVeh) exitWith {};//!

		_isAir = false;
		if not (isNull _assVeh) then
			{
			if (_assVeh isKindOf "Air") then {_isAir = true}
			};

		if not (_isAir) then
			{
			_sPoint = getPosATL (vehicle (leader _gp));

			_wps = waypoints _gp;

			if not ((count _wps) == 0) then
				{
				_sPoint = waypointPosition (_wps select ((count _wps) - 1))
				};

			_dst = _sPoint distance _pos;

			_lastDistance = _dst;

			if (_dst > RydHQ_PathFinding) then
				{
				_dstFirst = _dst;
				_mPoints = [];

				while {(_dst > RydHQ_PathFinding)} do
					{
					_dst = floor (_dst/2)
					};

				_dst = _dst * 2;

				_num = floor (_dstFirst/_dst);

				if (_num >= 2) then
					{
					_actDst = 0;
					_angle = [_sPoint,_pos,0] call RYD_AngTowards;

					for "_i" from 1 to _num do
						{
						_actDst = _actDst + _dst;
						_mPoint = [_sPoint,_angle,_actDst] call RYD_PosTowards2D;
						_mPoints set [(count _mPoints),_mPoint];
						};

					_topPoints = [];

						{
						_sPosX = _x select 0;
						_sPosY = _x select 1;

						_count = 10;

						_friendly = -1000000;
						_opt = _x;
						_samplePos = _x;
						_mpl = 1.5;

						for "_i" from 1 to _count do
							{
							_samplePos = [_sPosX + ((random (RydHQ_PathFinding * _mpl)) - ((RydHQ_PathFinding * _mpl)/2)),_sPosY + ((random (RydHQ_PathFinding * _mpl)) - ((RydHQ_PathFinding * _mpl)/2))];

							_topArr = [_samplePos,1] call RYD_TerraCognita;

							_sUrban = _topArr select 0;
							_sForest = _topArr select 1;
							_sHills = _topArr select 2;
							_sFlat = _topArr select 3;
							_sSea = _topArr select 4;
							_sGr = _topArr select 5;

							_sUrban = round (_sUrban*100);
							_sForest = round (_sForest*100);
							_sHills = round (_sHills*100);
							_sFlat = round (_sFlat*100);
							_sSea = round (_sSea*100);
							_sGr = round _sGr;

							_sRoads = count (_samplePos nearRoads 100);

							_fFactor = _sUrban + _sForest + _sGr - _sFlat - _sHills;

							if (not (isNull _assVeh) and (_assVeh isKindOf "LandVehicle")) then
								{
								_fFactor = _sFlat + _sHills + _sRoads - _sUrban - _sForest - _sGr
								};

							if (_fFactor > _friendly) then
								{
								_opt = _samplePos;
								_friendly = _fFactor
								}
							};
						
						_posX = _opt select 0;
						_posY = _opt select 1;

						_isWater = surfaceIsWater [_posX,_posY];

						
						_dstCheck = [_posX,_posY] distance _pos;

						if ((not (_isWater)) and (true)) then
							{
							_topPoints set [(count _topPoints),[_posX,_posY,0]];
							_lastDistance = _dstCheck;
							}
						}
					foreach _mPoints;

					if ((count _topPoints) > 0) then
						{
						_wpn = 0;
							{
							//if (RydBB_Debug) then {_j = [_x,_gp,(str (random 1000)),"ColorPink","ICON","mil_dot",(str _wpn),"",[0.25,0.25]] call RYD_Mark};
							_wpn = _wpn + 1;
							_wp = _gp addWaypoint [_x, 0];
							_wp setWaypointType "MOVE";
							_wp setWaypointBehaviour _beh;
							_wp setWaypointCombatMode _CM;
							_wp setWaypointSpeed _spd;
							_wp setWaypointStatements ["true","deletewaypoint [(group this), 0]"];
							_wp setWaypointTimeout [0,0,0];
							_wp setWaypointFormation _frm;
							if ((_crr) and (_wpn == 1)) then {_gp setCurrentWaypoint _wp};
							}
						foreach _topPoints
						};
					_addedpath = true;
					}
				}
			}
		};

	_wp = _gp addWaypoint [_pos, _rds];
	_wp setWaypointType _tp;
	_wp setWaypointBehaviour _beh;
	_wp setWaypointCombatMode _CM;
	_wp setWaypointSpeed _spd;
	_wp setWaypointStatements _sts;
	_wp setWaypointTimeout _TO;
	_wp setWaypointFormation _frm;
	if not (_addedpath) then {if (_crr) then {_gp setCurrentWaypoint _wp}};

	_wp
	};

RYD_TerraCognita = 
	{
	private ["_position","_posX","_posY","_radius","_precision","_sourcesCount","_urban","_forest","_hills","_flat","_sea","_valS","_value","_val0","_samples","_sGr","_hprev","_hcurr","_samplePos","_i","_rds"];	

	_position = _this select 0;
	_samples = _this select 1;
	_rds = 100;
	if ((count _this) > 2) then {_rds = _this select 2};

	if not ((typeName _position) == "ARRAY") then {_position = getPosATL _position};

	_posX = _position select 0;
	_posY = _position select 1;

	_radius = 5;
	_precision = 1;
	_sourcesCount = 1;

	_urban = 0;
	_forest = 0;
	_hills = 0;
	_flat = 0;
	_sea = 0;

	_sGr = 0;
	_hprev = getTerrainHeightASL [_posX,_posY];

	for "_i" from 1 to 10 do
		{
		_samplePos = [_posX + ((random (_rds * 2)) - _rds),_posY + ((random (_rds * 2)) - _rds)];
		_hcurr = getTerrainHeightASL _samplePos;
		_sGr = _sGr + abs (_hcurr - _hprev)
		};

	_sGr = _sGr/10;

		{
		_valS = 0;

		for "_i" from 1 to _samples do
			{
			_position = [_posX + (random (_rds/5)) - (_rds/10),_posY + (random (_rds/5)) - (_rds/10)];


			_value = selectBestPlaces [_position,_radius,_x,_precision,_sourcesCount];

			_val0 = _value select 0;
			_val0 = _val0 select 1;

			_valS = _valS + _val0;
			};

		_valS = _valS/_samples;

		switch (_x) do
			{
			case ("Houses") : {_urban = _urban + _valS};
			case ("Trees") : {_forest = _forest + (_valS/3)};
			case ("Forest") : {_forest = _forest + _valS};
			case ("Hills") : {_hills = _hills + _valS};
			case ("Meadow") : {_flat = _flat + _valS};
			case ("Sea") : {_sea = _sea + _valS};
			};
		}
	foreach ["Houses","Trees","Forest","Hills","Meadow","Sea"];

	[_urban,_forest,_hills,_flat,_sea,_sGr]
	};

RYD_GoLaunch = 
	{
	private ["_side","_kind","_code"];

	_side = _this select 0;
	_kind = _this select 1;

	_code = {};

	switch (_side) do
		{
		case ("A") : 
			{
			switch (_kind) do
				{
				case ("INF") : {_code = A_GoAttInf};
				case ("ARM") : {_code = A_GoAttArmor};
				case ("SNP") : {_code = A_GoAttSniper};
				case ("AIR") : {_code = A_GoAttAir};
				};
			};

		case ("B") : 
			{
			switch (_kind) do
				{
				case ("INF") : {_code = B_GoAttInf};
				case ("ARM") : {_code = B_GoAttArmor};
				case ("SNP") : {_code = B_GoAttSniper};
				case ("AIR") : {_code = B_GoAttAir};
				};
			};

		case ("C") : 
			{
			switch (_kind) do
				{
				case ("INF") : {_code = C_GoAttInf};
				case ("ARM") : {_code = C_GoAttArmor};
				case ("SNP") : {_code = C_GoAttSniper};
				case ("AIR") : {_code = C_GoAttAir};
				};
			};

		case ("D") : 
			{
			switch (_kind) do
				{
				case ("INF") : {_code = D_GoAttInf};
				case ("ARM") : {_code = D_GoAttArmor};
				case ("SNP") : {_code = D_GoAttSniper};
				case ("AIR") : {_code = D_GoAttAir};
				};
			};

		case ("E") : 
			{
			switch (_kind) do
				{
				case ("INF") : {_code = E_GoAttInf};
				case ("ARM") : {_code = E_GoAttArmor};
				case ("SNP") : {_code = E_GoAttSniper};
				case ("AIR") : {_code = E_GoAttAir};
				};
			};

		case ("F") : 
			{
			switch (_kind) do
				{
				case ("INF") : {_code = F_GoAttInf};
				case ("ARM") : {_code = F_GoAttArmor};
				case ("SNP") : {_code = F_GoAttSniper};
				case ("AIR") : {_code = F_GoAttAir};
				};
			};

		case ("G") : 
			{
			switch (_kind) do
				{
				case ("INF") : {_code = G_GoAttInf};
				case ("ARM") : {_code = G_GoAttArmor};
				case ("SNP") : {_code = G_GoAttSniper};
				case ("AIR") : {_code = G_GoAttAir};
				};
			};

		case ("H") : 
			{
			switch (_kind) do
				{
				case ("INF") : {_code = H_GoAttInf};
				case ("ARM") : {_code = H_GoAttArmor};
				case ("SNP") : {_code = H_GoAttSniper};
				case ("AIR") : {_code = H_GoAttAir};
				};
			};
		};

	_code
	};

RYD_DistOrd = 
	{
	private ["_array","_first","_point","_dst","_limit","_final","_VL"];

	_array = _this select 0;
	_point = _this select 1;
	_limit = _this select 2;

	_first = [];
	_final = [];

		{
		_VL = vehicle (leader _x);
		_dst = round (_VL distance _point);
		if (_dst <= _limit) then {_first set [_dst,_x]}
		}
	foreach _array;

		{
		if not (isNil "_x") then {_final set [(count _final),_x]}
		}
	foreach _first;

	_first = nil;

	_final
	};

RYD_Recon = 
	{
	private ["_ammo","_gps","_IR","_garrA","_recAv","_flankAv","_AOnlyA","_exhA","_final","_pass","_trg","_lmt","_rcArr","_nCargo","_busy","_isRAir","_NCVeh"];

	_gps = _this select 0;
	_IR = _this select 1;
	_rcArr = _this select 2;

	_garrA = _rcArr select 0;
	_recAv = _rcArr select 1;
	_flankAv = _rcArr select 2;
	_AOnlyA = _rcArr select 3; 
	_exhA = _rcArr select 4;
	_nCargo = _rcArr select 5;
	_trg = _rcArr select 6;
	_NCVeh = _rcArr select 7;

	_lmt = _this select 3;
	_isRAir = _this select 4;

	_final = [];

		{
		_pass = true;

		if not ((_x in _recAv) or (_IR == "NR")) then
			{
			_pass = false
			}
		else
			{
			if (_x in _AOnlyA) then
				{
				_pass = false
				}
			else
				{
				if (_x in _exhA) then 
					{
					_pass = false
					}
				else
					{
					if (_x in _garrA) then
						{
						_pass = false
						}
					else
						{
						if ((_x in _nCargo) and ((count (units _x)) <= 1) and (((assignedvehicle (leader _x)) emptyPositions "Cargo") > 4)) then
							{
							_pass = false
							}
						else
							{
							_ammo = [_x,_NCVeh] call RYD_AmmoCount;
							if ((_ammo == 0) and not (_isRAir)) then
								{
								_pass = false
								}
							else
								{
								_busy = _x getvariable ("Busy" + (str _x));
								if (isNil ("_busy")) then {_busy = false};
								if (_busy) then
									{
									_pass = false
									}
								else
									{
									if (_x in _flankAv) then
										{
										_pass = false
										}
									}
								}
							}
						}
					}
				}
			};

		if (_pass) then {_final set [(count _final),_x]}
		}
	foreach _gps;

	if ((count _final) > 0) then {[_final,_trg,_lmt] call RYD_DistOrd};

	_final
	};

RYD_Dispatcher =
	{
	private ["_threat","_kind","_pool","_cars","_air","_Fpool","_side","_force","_range","_pattern","_SortedForce","_tPos","_limit","_avF","_trg","_ix","_infEnough","_armEnough","_airEnough","_sum","_handled",
	"_SnipersG","_NCrewInfG","_LArmorG","_HArmorG","_LArmorATG","_ATInfG","_AAInfG","_chosen","_ammo","_reck","_topo","_sCity","_sForest","_sHills","_sMeadow","_sGr","_sVal","_mpl","_attackAv","_garrison",
	"_garrR","_flankAv","_busy","_positive","_ATriskResign1","_ATriskResign2","_AAriskResign","_AAthreat","_ATthreat","_allAir","_armorATthreat","_ATRR1","_ATRR2","_thRep","_isClose","_enDst","_thFct","_chVP",
	"_clstE","_Airmpl","_NCVeh","_snpEnough","_cntInf","_cntArm","_cntAir","_cntSnp"];

	_threat = _this select 0;
	_kind = _this select 1;
	_side = _this select 2;
	_ATriskResign1 = _this select 3;
	_ATriskResign2 = _this select 4;
	_AAriskResign = _this select 5;
	_AAthreat = _this select 6;
	_ATthreat = _this select 7;
	_armorATthreat = _this select 8;
	_Fpool = _this select 9;

	_SnipersG = _Fpool select 0;
	_NCrewInfG = _Fpool select 1;
	_air = _Fpool select 2;
	_LArmorG = _Fpool select 3;
	_HArmorG = _Fpool select 4;
	_cars = _Fpool select 5;
	_LArmorATG = _Fpool select 6;
	_ATInfG = _Fpool select 7;
	_AAInfG = _Fpool select 8;
	_reck = _Fpool select 9;
	_attackAv = _Fpool select 10;
	_garrison = _Fpool select 11;
	_garrR = _Fpool select 12;
	_flankAv = _Fpool select 13;
	_allAir = _Fpool select 14;
	_NCVeh = _Fpool select 15;

	_pool = [];

	switch (_kind) do
		{
		case ("Recon") : 
			{
			_pool = [[_SnipersG,0.5,"SNP"],[_NCrewInfG,0.5,"INF"]]
			};

		case ("ATInf") : 
			{
			_pool = [[_SnipersG,0.5,"SNP"],[_air,2,"AIR"],[_NCrewInfG,0.5,"INF"]]
			};

		case ("Inf") : 
			{
			_pool = [[_LArmorG,1,"ARM"],[_HArmorG,1,"ARM"],[_SnipersG,0.5,"SNP"],[_cars,1,"INF"],[_air,2,"AIR"],[_NCrewInfG,0.5,"INF"]]
			};

		case ("Armor") : 
			{
			_pool = [[_air,2,"AIR"],[_HArmorG,1,"ARM"],[_LArmorATG,1,"ARM"],[_ATInfG,0.5,"INF"]]
			};

		case ("Cars") : 
			{
			_pool = [[_LArmorG,1,"ARM"],[_cars,1,"INF"],[_HArmorG,1,"ARM"],[_air,2,"AIR"],[_NCrewInfG,0.5,"INF"]]
			};

		case ("Art") : 
			{
			_pool = [[_air,2,"AIR"],[_LArmorG,1,"ARM"],[_cars,1,"INF"],[_HArmorG,1,"ARM"],[_NCrewInfG,0.5,"INF"]]
			};

		case ("Air") : 
			{
			_pool = [[_air,2,"AIR"],[_AAInfG,0.5,"INF"]]
			};

		case ("Static") : 
			{
			_pool = [[_air,2,"AIR"],[_LArmorG,1,"ARM"],[_SnipersG,0.5,"SNP"],[_cars,1,"INF"],[_HArmorG,1,"ARM"],[_NCrewInfG,0.5,"INF"]]
			};
		};

	_limit = 3;
	_infEnough = 3;
	_armEnough = 2;
	_airEnough = 1;
	_snpEnough = 2;

	_cntInf = {(_x in ((_NCrewInfG - _cars) + _cars))} count _attackAv;
	_cntArm = {(_x in ((_HArmorG + _LArmorG) - (_NCrewInfG + _air)))} count _attackAv;
	_cntAir = {(_x in (_air - (_NCrewInfG)))} count _attackAv;
	_cntSnp = {((_x in (_SnipersG)) and ((count (units _x)) <= 2))} count _attackAv;

		{
		if (_x >= 0) then
			{
			switch (_foreachIndex) do
				{
				case (0) : {_infEnough = ceil (_cntInf * _x)};
				case (1) : {_armEnough = ceil (_cntArm * _x)};
				case (2) : {_airEnough = ceil (_cntAir * _x)};
				case (3) : {_snpEnough = ceil (_cntSnp * _x)};
				}
			}
		}
	foreach RydxHQ_MARatio;

	_sVal = 0;
	_mpl = 1 + _reck;

		{
		_handled = _x getVariable "HAC_Attacked";

		_sum = 0;

		if (isNil "_handled") then 
			{
			_sum = 6;
			_infEnough = 3;
			_armEnough = 2;
			_airEnough = 1;
			_snpEnough = 2;

				{
				if (_x >= 0) then
					{
					switch (_foreachIndex) do
						{
						case (0) : {_infEnough = ceil (_cntInf * _x)};
						case (1) : {_armEnough = ceil (_cntArm * _x)};
						case (2) : {_airEnough = ceil (_cntAir * _x)};
						case (3) : {_snpEnough = ceil (_cntSnp * _x)};
						}
					}
				}
			foreach RydxHQ_MARatio;
			}
		else
			{
			{_sum = _sum + _x} foreach _handled;
			_infEnough = _handled select 0;
			_armEnough = _handled select 1;
			_airEnough = _handled select 2;
			_snpEnough = _handled select 3;
			};

		if not (alive (leader _x)) then {_sum = 0};
		if (isNull (leader _x)) then {_sum = 0};
		
		if (_sum > 0) then
			{
			_trg = vehicle (leader _x);
			_tPos = getPosATL _trg;	

			_topo = [_trg,5] call RYD_TerraCognita;

			_sCity = 100 * (_topo select 0);
			_sForest = 100 * (_topo select 1);
			_sHills = 100 * (_topo select 2);
			_sMeadow = 100 * (_topo select 3);
			_sGr = _topo select 5;

				{
				_pattern = _x select 2;

				switch (true) do
					{
					case (_pattern in ["ARM"]) : {_limit = _armEnough};
					case (_pattern in ["AIR"]) : {_limit = _airEnough};
					case (_pattern in ["SNP"]) : {_limit = _snpEnough};
					default {_limit = _infEnough};
					};

				if (_limit >= 1) then
					{
					_force = _x select 0;
					_range = _x select 1;

					_SortedForce = [_force,_tPos,10000*_range] call RYD_DistOrd;

					_avF = _SortedForce;

					_ix = 0;

					while {((_limit > 0) and ((count _avF) > 0) and (_ix < (count _SortedForce)))} do
						{
						_chosen = _SortedForce select _ix;
						_chVP = getPosATL (vehicle (leader _chosen));
						_ix = _ix + 1;

						_positive = true;

						_ammo = [_chosen,_NCVeh] call RYD_AmmoCount;

						switch (true) do
							{
							case (_pattern in ["SNP"]) : {_sVal = ((((2 * _sHills) + (2 * _sMeadow) + (_sGr/5)) * _mpl) - (((_sCity/2) + _sForest)/_mpl))};
							case (_pattern in ["ARM"]) : {_sVal = ((((5 * _sMeadow) + (_sHills)) * _mpl) - (((_sCity/2) + (3 * _sForest) + _sGr)/_mpl))};
							case (_pattern in ["AIR"]) : {_sVal = ((((4 * _sMeadow) + (_sHills)) * _mpl) - (((_sCity) + (2 * _sForest) + (_SGr/5))/_mpl))};
							default {_sVal = (0.5 + _sCity + (2 * _sForest) + (_sGr/10)) * (0.5 * _mpl) - ((0.05 + (2 * _sMeadow)) * (0.5/_mpl))};
							};

						if (_sVal < (5 + (10 * _reck))) then {_sVal = (5 + (10 * _reck))};

						_busy = _chosen getvariable ("Busy" + (str _chosen));
						if (isNil "_busy") then {_busy = false};

						if (_busy) then
							{
							_positive = false
							}
						else
							{
							if (_ammo == 0) then 
								{
								_positive = false
								} 
							else
								{
								if ((random 100) > _sVal) then
									{
									_positive = false
									}
								else
									{
									if ((_chosen in _garrison) and (((vehicle (leader _chosen)) distance _tPos) > _garrR)) then
										{
										_positive = false
										}
									else
										{
										if not (_chosen in _attackAv) then
											{
											_positive = false
											}
										else
											{
											if (_chosen in _flankAv) then
												{
												_positive = false
												}
											else
												{
												if (_pattern in ["AIR"]) then
													{
													_Airmpl = 0;
													if ([] call RYD_IsNight) then {_Airmpl = 3};
													if ((((random 100) * (1 + _reck)) < ((_Airmpl + overcast) * 30)) and not ((random 100) > 95)) then
														{
														_positive = false
														}
													}
												else
													{
													if (_pattern in ["SNP","INF"]) then
														{
														if (_pattern in ["SNP"]) then
															{
															if ((count (units _chosen)) > 2) then
																{
																_positive = false
																}
															};

														if ((_chosen in _allAir) and ((count _AAthreat) > 0)) then
															{
															_thRep = [_chVP,_AAthreat,25000] call RYD_CloseEnemyB;
															_isClose = _thRep select 0;
															_clstE = getPosATL (vehicle (leader (_thRep select 2)));
															_enDst = [_chVP,_tPos,_clstE] call RYD_PointToSecDst;

															if ((_isClose) and (_enDst > 0) and (_enDst < 1500)) then
																{
																_thFct = (2500/(sqrt _enDst))/(0.5 + (2 * _reck));//diag_log format ["Grp: %1 endst: %2 thFct: %3",typeOf (vehicle (leader _chosen)),_enDst,_thFct];
																if (((random 100) < _thFct) and not (((random 100) > (90 - (_reck * 10))) and (_thFct >= (95 - (_reck * 10))))) then 
																	{
																	_positive = false
																	}
																}
															}
														else
															{
															if ((_chosen in (_LArmorG + _HArmorG)) and ((count _ATthreat) > 0)) then
																{
																_thRep = [_chVP,_ATthreat,25000] call RYD_CloseEnemyB;
																_isClose = _thRep select 0;
																_clstE = getPosATL (vehicle (leader (_thRep select 2)));
																_enDst = [_chVP,_tPos,_clstE] call RYD_PointToSecDst;

																if ((_isClose) and (_enDst > 0) and (_enDst < 1500)) then
																	{
																	_thFct = (2500/(sqrt _enDst))/(0.5 + (2 * _reck));//diag_log format ["Grp: %1 endst: %2 thFct: %3",typeOf (vehicle (leader _chosen)),_enDst,_thFct];
																	if (((random 100) < _thFct) and not (((random 100) > (95 - (_reck * 10))) and (_thFct >= (95 - (_reck * 10))))) then 
																		{
																		_positive = false
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							};
						
						_ATRR1 = _ATriskResign1;
						_ATRR2 = _ATriskResign2;
						if (_chosen in _LArmorG) then 
							{
							_ATRR1 = _ATRR1 + 10;
							_ATRR2 = _ATRR2 + 10;
							};

						if (_positive) then
							{
							if (_pattern in ["ARM"]) then
								{
								if ((count _ATthreat) > 0) then
									{
									_thRep = [_chVP,_ATthreat,25000] call RYD_CloseEnemyB;
									_isClose = _thRep select 0;
									_clstE = getPosATL (vehicle (leader (_thRep select 2)));
									_enDst = [_chVP,_tPos,_clstE] call RYD_PointToSecDst;

									if ((_isClose) and (_enDst > 0) and (_enDst < 1500)) then
										{
										_thFct = ((_ATRR1 * 40)/(sqrt _enDst))/(0.5 + (2 * _reck));//diag_log format ["Grp: %1 endst: %2 thFct: %3",typeOf (vehicle (leader _chosen)),_enDst,_thFct];
										if (((random 100) < _thFct) and not (((random 100) > (95 - (_reck * 10))) and (_thFct >= (95 - (_reck * 10))))) then 
											{
											_positive = false
											}
										}
									}
								else
									{
									if ((count _armorATthreat) > 0) then
										{
										_thRep = [_chVP,_ATthreat,25000] call RYD_CloseEnemyB;
										_isClose = _thRep select 0;
										_clstE = getPosATL (vehicle (leader (_thRep select 2)));
										_enDst = [_chVP,_tPos,_clstE] call RYD_PointToSecDst;

										if ((_isClose) and (_enDst > 0) and (_enDst < 1500)) then
											{
											_thFct = ((_ATRR2 * 40)/(sqrt _enDst))/(0.5 + (2 * _reck));//diag_log format ["Grp: %1 endst: %2 thFct: %3",typeOf (vehicle (leader _chosen)),_enDst,_thFct];
											if (((random 100) < _thFct) and not (((random 100) > (95 - (_reck * 10))) and (_thFct >= (95 - (_reck * 10))))) then 
												{
												_positive = false
												}
											}
										}
									}
								};

							if (_pattern in ["AIR"]) then
								{
								if ((count _AAthreat) > 0) then
									{
									_thRep = [_chVP,_ATthreat,25000] call RYD_CloseEnemyB;
									_isClose = _thRep select 0;
									_clstE = getPosATL (vehicle (leader (_thRep select 2)));
									_enDst = [_chVP,_tPos,_clstE] call RYD_PointToSecDst;

									if ((_isClose) and (_enDst > 0) and (_enDst < 1500)) then
										{
										_thFct = ((_AAriskResign * 40)/(sqrt _enDst))/(0.5 + (2 * _reck));//diag_log format ["Grp: %1 endst: %2 thFct: %3",typeOf (vehicle (leader _chosen)),_enDst,_thFct];
										if (((random 100) < _thFct) and not (((random 100) > (95 - (_reck * 10))) and (_thFct >= (95 - (_reck * 10))))) then 
											{
											_positive = false
											}
										}
									}
								}
							};

						if (_positive) then
							{
							_chosen setVariable ["Busy" + (str _chosen),true];
							[_chosen,_trg] spawn ([_side,_pattern] call RYD_GoLaunch);
							_limit = _limit - 1
							};

						_avF = _avF - [_chosen]
						};

					switch (true) do
						{
						case (_pattern in ["ARM"]) : {_armEnough = _limit};
						case (_pattern in ["AIR"]) : {_airEnough = _limit};
						case (_pattern in ["SNP"]) : {_snpEnough = _limit};
						default {_infEnough = _limit};
						}
					}

				}
			foreach _pool;
			
			_x setVariable ["HAC_Attacked",[_infEnough,_armEnough,_airEnough,_snpEnough]]
			}
		}
	foreach _threat
	};

RYD_VarReductor = 
	{
	private ["_trg","_kind","_HAC_Attacked","_infEnough","_armEnough","_airEnough","_isAttacked","_snpEnough"];

	_trg = _this select 0;
	_kind = _this select 1;

	_HAC_Attacked = (group _trg) getVariable "HAC_Attacked";
	if (isNil "_HAC_Attacked") then {_HAC_Attacked = [0,0,0,0]};

	_infEnough = _HAC_Attacked select 0;
	_armEnough = _HAC_Attacked select 1;
	_airEnough = _HAC_Attacked select 2;
	_snpEnough = _HAC_Attacked select 3;

	switch (_kind) do
		{
		case ("InfAttacked") : {_infEnough = _infEnough + 1};
		case ("SnpAttacked") : {_snpEnough = _snpEnough + 1};
		case ("ArmorAttacked") : {_armEnough = _armEnough + 1};
		case ("AirAttacked") : {_airEnough = _airEnough + 1};
		};
	
	(group _trg) setVariable ["HAC_Attacked",[_infEnough,_armEnough,_airEnough,_snpEnough]];

	if not (_kind == "AirAttacked") then 
		{
		_isAttacked = (group _trg) getvariable (_kind + (str (group _trg)));if (isNil "_isAttacked") then {_isAttacked = 0};
		if (_isAttacked > 0) then {(group _trg) setVariable [(_kind + (str (group _trg))),_isAttacked - 1]}
		}
	};

RYD_CloseEnemy = 
	{
	private ["_pos","_eG","_limit","_tooClose","_dst"];

	_pos = _this select 0;
	_eG = _this select 1;
	_limit = _this select 2;
	
	if ((count _eG) == 0) exitWith {false};

	_tooClose = false;

	_dst = 100000;

		{
		_dst = (vehicle (leader _x)) distance _pos;
		if (_dst < _limit) exitwith {_tooClose = true}
		}
	foreach _eG;

	_tooClose
	};

RYD_CloseEnemyB = 
	{
	private ["_pos","_eG","_limit","_tooClose","_dstM","_dstAct","_closest"];

	_pos = _this select 0;
	_eG = _this select 1;
	_limit = _this select 2;
	
	if ((count _eG) == 0) exitWith {[false,100000,grpNull]};

	_tooClose = false;

	_dstM = 100000;
	_closest = _eG select 0;

		{
		_dstAct = (vehicle (leader _x)) distance _pos;
		if (_dstAct < _dstM) then {_closest = _x;_dstM = _dstAct}
		}
	foreach _eG;

	if (_dstM < _limit) then {_tooClose = true};

	[_tooClose,_dstM,_closest]
	};

RYD_Wait = 
	{
	private ["_gp","_int","_int0","_ammoF","_speedF","_enemyF","_tolerance","_air","_cargo","_timer","_alive","_enemy","_UL","_DAV","_GDV","_AV","_inside","_outside","_own","_wplimit","_isBusy","_busy",
	"_isInside","_isOutside","_enG","_arr","_type","_cplR","_cWp","_wpCheck","_boxed","_firedF","_fCount","_forBoxing","_wp"];

	_gp = _this select 0;
	_int0 = _this select 1;

	_int = floor _int0;
	_ammoF = false;

	_speedF = _this select 2;
	_enemyF = _this select 3;
	_tolerance = _this select 4;

	_arr = _this select 5;
	_air = [];
	_enG = [];

	if ((count _arr) > 0) then 
		{
		_enG = _arr select 1;
		_air = _arr select 0
		};

	if not (_int == _int0) then
		{
		_ammoF = true
		};

	_cargo = _this select 6;
	_inside = true;
	if ((count _this) > 7) then {_inside = _this select 7};
	_outside = true;
	if ((count _this) > 8) then {_outside = _this select 8};
	_own = false;
	if ((count _this) > 9) then {_own = _this select 9};
	_isBusy = false;
	if ((count _this) > 10) then {_isBusy = _this select 10};
	_wpCheck = true;
	if ((count _this) > 11) then {_wpCheck = _this select 11};
	_firedF = false;
	if ((count _this) > 12) then {_firedF = _this select 12};

	_wplimit = 1;
	if not ((_tolerance - (round _tolerance)) == 0) then {_wplimit = 2};

	_timer = 0;
	_alive = false;
	_enemy = false;
	_busy = false;
	_isInside = false;
	_isOutside = false;

	waituntil 
		{
		sleep _int;

		_UL = leader (_this select 0);
		_AV = vehicle _UL;
		_DAV = _UL;
		_GDV = _gp;

		if (_cargo) then
			{
			_AV = assignedVehicle _UL;
			_DAV = assigneddriver _AV;
			if not (_own) then {_GDV = group _DAV};

			waitUntil {sleep 0.5;not (isNull (assignedVehicle _UL))};

			_AV = assignedVehicle _UL;
			_DAV = assigneddriver _AV;
			if not (_own) then {_GDV = group _DAV};
			};


		_alive = true;
		if not (alive _AV) then {_alive = false};
		if (isNull _AV) then {_alive = false};

		if (_enemyF > 0) then
			{
			if not (_GDV in _air) then {_enemy = [_AV,_enG,_enemyF] call RYD_CloseEnemy}
			};

		if (not (isNull _GDV) and not (isNull _UL)) then {_alive = true} else {_alive = false};
		if (_speedF) then
			{
			if not (RydxHQ_SynchroAttack) then
				{
				if (abs (speed (vehicle (leader _GDV))) < 0.05) then {_timer = _timer + 1}
				}
			else
				{
				_type = typeOf _AV;
				_cplR = getNumber (configFile>>"cfgvehicles">>_type>>"precision");
				_cWp = waypointPosition [_gp, (currentWaypoint _gp)];
				if ((abs (speed (vehicle (leader _GDV))) < 0.05) and ((_cWp distance _AV) >= _cplR)) then {_timer = _timer + 1}
				}
			};

		if not (_inside) then
			{			
				{
				if not (_x in _AV) exitwith {_isInside = false};
				_isInside = true;
				}
			foreach (units _gp)
			};

		if not (_outside) then
			{
				{
				if (_x in _AV) exitwith {_isOutside = false};
				_isOutside = true;
				}
			foreach (units _gp)
			};

		if (_cargo) then
			{
			if (_own) then
				{
				_alive = false;
				if not (isNull _AV) then {_alive = true}
				}
			};

		if (_isBusy) then
			{
			_busy = _gp getvariable ("Busy" + (str _gp));
			if (isNil "_busy") then {_busy = false}
			};

		_forBoxing = _gp getVariable "forBoxing";

		if ((_ammoF) and not (isNil "_forBoxing")) then
			{
			[_gp, (currentWaypoint _gp)] setWaypointType "HOLD";
			[_gp, (currentWaypoint _gp)] setWaypointPosition [_forBoxing, 10];
			_forBoxing = nil;
			_gp setVariable ["ForBoxing",nil]
			};

		_boxed = _gp getVariable "isBoxed";

		if ((_ammoF) and not (isNil "_boxed")) then
			{
			_boxed = getPosATL _boxed;
			_boxed = [_boxed,20] call RYD_RandomAround;
			_wp = [_gp,[_boxed select 0,_boxed select 1],"MOVE","AWARE","GREEN","FULL",["true","deletewaypoint [(group this), 0]"]] call RYD_WPadd;
			_boxed = nil;
			_gp setVariable ["isBoxed",nil]
			};

		_fCount = (leader _gp) getVariable "FireCount";
		if (isNil "_fCount") then {_fCount = 0};

		if ((_firedF) and (_fCount >= 2)) then
			{
			_timer = _tolerance + _int;
			(leader _gp) setVariable ["FireCount",nil]
			};

		((((count (waypoints _GDV)) < _wplimit) and (_wpCheck)) or (_timer > _tolerance) or (_enemy) or not (_alive) or (_isInside) or (_isOutside) or (_busy))
		};

	if (_timer > _tolerance) then {if ((random 100) < RydxHQ_AIChatDensity) then {[(leader _gp),RydxHQ_AIC_OrdDen,"OrdDen"] call RYD_AIChatter}};

	[_timer,_alive,_enemy,_busy]
	};

RYD_Smoke = 
	{
	private ["_gp","_lastV","_Scount","_unit","_muzzles","_mags","_sMuzzle","_mag"];	

	_gp = _this select 0;

	_lastV = objNull;
	_Scount = 0;
	
		{
		_unit = _x;
		if (((vehicle _unit) == _unit) and not (isPlayer _unit)) then 
			{
			_muzzles = getArray (configFile >> "CfgWeapons" >> (primaryWeapon _unit) >> "muzzles");
			_muzzles = _muzzles + (getArray (configFile >> "CfgWeapons" >> "Throw" >> "muzzles"));
			_mags = magazines _unit;
			
			_sMuzzle = "";
			_mag = "";
			
				{
				if ((_x select 0) in _muzzles) then
					{
					_sMuzzle = _x select 0;
					};
					
				if not (_sMuzzle in [""]) then
					{
						{
						if (_x in _mags) exitWith 
							{
							_mag = _x
							}
						}
					foreach (_x select 1)
					};
					
				if not ("" in [_sMuzzle,_mag]) exitWith
					{
					_unit selectWeapon _sMuzzle;
					if (_sMuzzle in ["EGLM","GL_3GL_F"]) then
						{
						_unit fire [_sMuzzle,_sMuzzle,_mag]
						}
					else
						{
						_unit fire _sMuzzle
						};
						
					_Scount = _Scount + 1
					}
				}
			foreach RydxHQ_SmokeMuzzles;
			};
			
		if not (((vehicle _x) == _x) and not (_lastV == (vehicle _x))) then {_lastV = vehicle _x;_lastV selectWeapon "SmokeLauncher";_lastV fire "SmokeLauncher";_Scount = _Scount + 1};
		if (_Scount > 2) exitwith {};
		}
	foreach (units _gp)	
	};

RYD_isNight = 
	{//math by CarlGustaffa
	private ["_lat","_day","_hour","_sunangle","_isNight"];

	_isNight = false;

	_lat = -1 * getNumber(configFile >> "CfgWorlds" >> worldName >> "latitude"); 
	_day = 360 * (dateToNumber date); 
	_hour = (daytime / 24) * 360; 
	_sunangle = ((12 * (cos _day) - 78) * (cos _lat) * (cos _hour)) - (24 * (sin _lat) * (cos _day)); 

	if (_sunangle < -10) then {_isNight = true};

	_isNight
	};

RYD_Flares = 
	{
	private ["_gp","_UL","_nE","_inDef","_Scount","_lat","_day","_hour","_sunangle","_arty","_flare","_shells","_pos","_CFF","_ldr"];

	_gp = _this select 0;
	_arty = _this select 2;
	_shells = _this select 3;
	_ldr = _this select 4;

	_UL = leader _gp;

	_inDef = true;

	while {_inDef} do
		{
		sleep (60 + (random 60));

		_flare = _this select 1;

		if (_flare) then
			{
			if ([] call RYD_isNight) then
				{
				if not (false) then
					{
					_nE = _UL findnearestenemy _UL;
					if not (isNull _nE) then
						{
						if ((_nE distance (vehicle _UL)) <= 400) then
							{
							_pos = getPosASL _nE;

							_CFF = false;

							if ((_shells > 0) and ((random 100) > 50)) then 
								{
								if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_IllumReq,"IllumReq"] call RYD_AIChatter}};
								_CFF = ([_pos,_arty,"ILLUM",1,_UL] call RYD_ArtyMission) select 0;
								if (_CFF) then
									{
									if ((random 100) < RydxHQ_AIChatDensity) then {[_ldr,RydxHQ_AIC_ArtAss,"ArtAss"] call RYD_AIChatter};
									}
								else
									{
									if ((random 100) < RydxHQ_AIChatDensity) then {[_ldr,RydxHQ_AIC_ArtDen,"ArtDen"] call RYD_AIChatter};
									}
								};

							if (not (_CFF) and not (isPlayer _UL) and (false)) then//manual flare turned off - fire command bad behavior - firing at own feet
								{

								_Scount = 0;
								
									{
									_unit = _x;
									if (((vehicle _unit) == _unit) and not (isPlayer _unit)) then 
										{
										_muzzles = getArray (configFile >> "CfgWeapons" >> (primaryWeapon _unit) >> "muzzles");
										_mags = magazines _unit;
										
										_sMuzzle = "";
										_mag = "";
										
											{
											if ((_x select 0) in _muzzles) then
												{
												_sMuzzle = _x select 0;
												};
												
											if not (_sMuzzle in [""]) then
												{
													{
													if (_x in _mags) exitWith 
														{
														_mag = _x
														}
													}
												foreach (_x select 1)
												};
												
											if not ("" in [_sMuzzle,_mag]) exitWith
												{
												_unit selectWeapon _sMuzzle;
												_unit fire [_sMuzzle,_sMuzzle,_mag];
												_Scount = _Scount + 1
												}
											}
										foreach RydxHQ_FlareMuzzles;
										};

									if (_Scount > 0) exitwith {};
									}
								foreach (units _gp)
								}
							}
						}
					}
				}
			};

		_inDef = _gp getVariable "Defending";
		if (isNull _gp) then {_inDef = false};
		if not (alive _UL) then {_inDef = false};
		}
	};

RYD_ArtyPrep = 
	{
	private ["_arty","_amount","_vh","_handled","_magTypes","_mags","_tp","_cnt"];	

	_arty = _this select 0;
	_amount = _this select 1;
	
	_amount = ceil _amount;
	//if (_amount < 2) exitWith {};

		{		
			{
			_vh = vehicle _x;
			_handled = _vh getVariable ["RydHQArtyAmmoHandled",false];
			
			if not (_handled) then
				{
				_vh setVariable ["RydHQArtyAmmoHandled",true];
				
				_vh addEventHandler ["Fired",
					{
					(_this select 0) setVariable ["RydHQ_ShotFired",true];
					(_this select 0) setVariable ["RydHQ_ShotFired2",((_this select 0) getVariable ["RydHQ_ShotFired2",0]) + 1];
					}];
				
				_magTypes = getArtilleryAmmo [_vh];
				_mags = magazines _vh;
				
					{
					_tp = _x;
					_cnt = {_x in [_tp]} count _mags;
					_vh addMagazines [_tp, _cnt * (_amount - 1)];
					}
				foreach _magTypes
				}
			}
		foreach (units _x)
		}
	foreach _arty;
	};

RYD_CFF_TGT = 
	{//_tgt = [RydHQ_KnEnemies] call RYD_CFF_TGT;
	private ["_enemies","_targets","_target","_nothing","_potential","_potL","_taken","_candidate","_CL","_vehFactor","_artFactor","_crowdFactor","_veh","_nearImp","_ValMax","_trgValS",
	"_temptation","_vh","_HQfactor"];

	_enemies = _this select 0;

	_targets = [];
	_target = objNull;
	_temptation = 0;
	_nothing = 0;

		{
		_potential = _x;
		
		_potL = vehicle (leader _potential);
		_taken = (group _potential) getVariable ["CFF_Taken",false];

		if not (isNull _potential) then
			{
			if (alive _potential) then
				{
				if not (_taken) then
					{
					if (((getposATL _potL) select 2) < 20) then
						{ 
						if ((abs(speed _potL)) < 50) then
							{ 
							if ((count (weapons (leader _potential))) > 0) then
								{ 
								if not ((leader _potential) isKindOf "civilian") then 
									{
									if not (captive _potL) then
										{
										if not (_potential in _targets) then
											{
											if ((damage _potL) < 0.9) then 
												{
												_targets set [(count _targets),_potential]
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	foreach _enemies;

		{
		_candidate = _x;
		_CL = leader _candidate;

		_temptation = 0;
		_vehFactor = 0;
		_artFactor = 1;
		_crowdFactor = 1;
		_HQFactor = 1;
		_veh = ObjNull;

		if not (isNull (assignedVehicle _CL)) then {_veh = assignedVehicle _CL};
		if not ((vehicle _CL) == _CL) then 
			{
			_veh = vehicle _CL;
			if (typeOf _veh in (RydHQ_Howitzer + RydHQ_Mortar + RydHQ_Rocket + RydHQ_Mortar_A3 + RydHQ_SPMortar_A3 + RydHQ_Rocket_A3)) then {_artFactor = 10} else {_vehFactor = 500 + (rating _veh)};
			};

		_nearImp = (getPosATL _CL) nearEntities [["CAManBase","AllVehicles","Strategic","WarfareBBaseStructure","Fortress"],100];

			{
			if (((side _x) getFriend (side _CL) >= 0.6) and not (_x isKindOf "civilian")) then 
				{
				_vh = vehicle _x;
				_crowdFactor = _crowdFactor + 0.2;
				if not (_x == _vh) then 
					{
					_crowdFactor = _crowdFactor + 0.2;
					if (typeOf _vh in (RydHQ_Howitzer + RydHQ_Mortar + RydHQ_Rocket + RydHQ_Mortar_A3 + RydHQ_SPMortar_A3 + RydHQ_Rocket_A3)) then 
						{
						_crowdFactor = _crowdFactor + 0.2
						}
					}
				};
			}
		foreach _nearImp;

		if (_CL in RydxHQ_AllLeaders) then {_HQFactor = 20};

			{
			_temptation = _temptation + (250 + (rating _x));
			}
		foreach (units _candidate);

		_temptation = (((_temptation + _vehFactor)*10)/(5 + (speed _CL))) * _artFactor * _crowdFactor * _HQFactor;
		_candidate setVariable ["CFF_Temptation",_temptation]
		}
	foreach _targets;

	_ValMax = 0;

		{
		_trgValS = _x getVariable ["CFF_Temptation",0];
		if ((_ValMax < _trgValS) and (random 100 < 85)) then {_ValMax = _trgValS;_target = _x};
		}
	foreach _targets;

	if (isNull _target) then 
		{
		if not ((count _targets) == 0) then 
			{
			_target = _targets select (floor (random (count _targets)))
			} 
		else 
			{
			_nothing = 1
			}
		};

	_target
	};
	
RYD_CFF_Fire = 
	{
	private ["_battery","_pos","_ammo","_amount","_guns","_vh","_mags","_amount0","_eta","_alive","_available","_perGun","_rest","_aGuns","_perGun1","_shots","_check","_toFire","_rest0","_bad","_ammoC"];
	
	_battery = _this select 0;
	_pos = _this select 1;
	_ammo = _this select 2;
	_amount = _this select 3;
	
	_eta = -1;
	
	_guns = [];
	
		{
		if not (isNull _x) then
			{
				{
				_vh = vehicle _x;
				if not (_vh in _guns) then
					{
					_guns set [(count _guns),_vh];
					_shots = 0;
					
						{
						if ((_x select 0) in _ammo) then
							{
							_shots = _shots + (_x select 1)
							}
						}
					foreach (magazinesAmmo _vh);
					
					_vh setVariable ["RydHQ_ShotsToFire",0];
					_vh setVariable ["RydHQ_MyShots",_shots]
					}
				}
			foreach (units _x)
			}
		}
	foreach _battery;
	
	_aGuns = count _guns;
	
	if (_aGuns < 1) exitWith {-1};
	
	_perGun = floor (_amount/_aGuns);
	_rest = _amount - (_perGun * _aGuns);
	
	_check = false;
	_ct = 0;
	_bad = false;
	
	while {not (_check) or (_amount > 0)} do
		{
		_check = true;
		_rest0 = _rest;
		
			{
			_shots = _x getVariable ["RydHQ_MyShots",0];
			if not (_shots > _perGun) then
				{
				_x setVariable ["RydHQ_ShotsToFire",_shots];
				_amount = _amount - _shots;
				_rest = _rest + (_perGun - _shots)
				}
			else
				{
				_toFire = _x getVariable ["RydHQ_ShotsToFire",_perGun];
				if (_toFire == 0) then {_toFire = _perGun};
				
				if (_rest > 0) then
					{
					_toFire = _toFire + 1;
					_rest = _rest - 1
					};
					
				_x setVariable ["RydHQ_ShotsToFire",_toFire];
				_amount = _amount - _toFire;
				};
			}
		foreach _guns;
		
		if ((_rest0 <= _rest) and (_rest > 0)) exitWith {_bad = true}
		};
		
	if (_bad) exitWith {-1};
				
		/*{
		diag_log format ["Gun: %1 MyShots: %2 ToFire: %3",_x,_x getVariable ["RydHQ_MyShots",0],_x getVariable ["RydHQ_ShotsToFire",0]];
		}
	foreach _guns;*/
		
		{
		if not (isNull _x) then
			{
			_vh = vehicle _x;
			
			if ((_vh getVariable ["RydHQ_ShotsToFire",0]) > 0) then
				{
				_mags = getArtilleryAmmo [_vh];
				
				_ammoC = (magazines _vh) select 0;
				
					{
					if (_x in _ammo) exitWith
						{
						_ammoC = _x
						}
					}
				foreach (magazines _vh);	
				
				if (_ammoC in _mags) then
					{
					_amount = _amount - 1;
					
					_newEta = _vh getArtilleryETA [_pos,_ammoC];
					
					if ((_newEta < _eta) or (_eta < 0)) then
						{
						_eta = _newEta
						};

					[_vh,_pos,_ammoC] spawn
						{
						_vh = _this select 0;
						_pos = _this select 1;
						_ammo = _this select 2;
						
						if (_pos inRangeOfArtillery [[_vh],_ammo]) then
							{
							if (_ammo in (getArtilleryAmmo [_vh])) then
								{
								_vh setVariable ["RydHQ_GunFree",false];
								_vh doArtilleryFire [_pos, _ammo,(_vh getVariable ["RydHQ_ShotsToFire",1])];
								
								_ct = 0;
								
								waitUntil
									{
									sleep 0.1;
									_ct = _ct + 0.1;
									(not ((_vh getVariable ["RydHQ_ShotFired2",0]) < (_vh getVariable ["RydHQ_ShotsToFire",1])) or (_ct > 15))
									};
								
								_vh setVariable ["RydHQ_ShotFired",true];
								_vh setVariable ["RydHQ_ShotFired2",0];
								
								sleep 2;
								
								_vh setVariable ["RydHQ_GunFree",true]
								}
							}
						}
					}
				}
			}
		}
	foreach _guns;
		
		/*{
		if not (isNull _x) then
			{
				{
				(vehicle _x) setVariable ["RydHQ_GunFree",true]
				}
			foreach (units _x)
			}			
		}
	foreach _battery;*/
		
	_eta
	};

RYD_ArtyMission = 
	{//_bArr = [_tgtPos,RydHQ_ArtG,"SADARM",6,leaderHQ] call RYD_ArtyMission;
	private ["_pos","_arty","_ammoG","_amount","_FO","_ammo","_possible","_battery","_agp","_artyAv","_vehs","_gp","_hasAmmo","_checked","_vh","_tp","_inRange","_pX","_pY","_pZ","_ammoArr"];

	_pos = _this select 0;
	_arty = _this select 1;
	_ammoG = _this select 2;
	_amount = _this select 3;
	_FO = _this select 4;

	_ammo = "";
	_ammoArr = [];

	_hasAmmo = 0;
	_possible = false;
	_battery = [];
	_agp = [];

	_artyAv = [];
	_vehs = 0;

		{
		_gp = _x; 
		if not (isNull _gp) then
			{
			if not (_gp getVariable ["RydHQ_BatteryBusy",false]) then
				{
				_hasAmmo = 0;
				_checked = [];
				
					{
					_vh = vehicle _x;
					if not (_vh in _checked) then
						{
						_checked set [(count _checked),_vh];
											
						_tp = typeOf _vh;
						
						switch (true) do
							{
							case (_tp in RydHQ_Mortar_A3) : 
								{
								switch (_ammoG) do
									{
									case ("HE") : {_ammo = "8Rnd_82mm_Mo_shells"};
									case ("CLUSTER") : {_ammo = "8Rnd_82mm_Mo_shells"};
									case ("GUIDED") : {_ammo = "8Rnd_82mm_Mo_shells"};
									case ("SMOKE") : {_ammo = "8Rnd_82mm_Mo_Smoke_white"};
									case ("ILLUM") : {_ammo = "8Rnd_82mm_Mo_Flare_white"};
									}
								};
								
							case (_tp in RydHQ_SPMortar_A3) : 
								{
								switch (_ammoG) do
									{
									case ("HE") : {_ammo = "32Rnd_155mm_Mo_shells"};
									case ("CLUSTER") : {_ammo = "2Rnd_155mm_Mo_Cluster"};
									case ("GUIDED") : {_ammo = "2Rnd_155mm_Mo_guided"};
									case ("SMOKE") : {_ammo = "6Rnd_155mm_Mo_smoke"};
									case ("ILLUM") : {_ammo = ""};
									};
								};
										
							case (_tp in RydHQ_Rocket_A3) :
								{
								switch (_ammoG) do
									{
									case ("HE") : {_ammo = "12Rnd_230mm_rockets"};
									case ("CLUSTER") : {_ammo = "12Rnd_230mm_rockets"};
									case ("GUIDED") : {_ammo = "12Rnd_230mm_rockets"};
									case ("SMOKE") : {_ammo = ""};
									case ("ILLUM") : {_ammo = ""};
									};
								}
							};
							
						_inRange = _pos inRangeOfArtillery [[_vh],_ammo];
						
						if (_inRange) then
							{
								{
								if ((_x select 0) in [_ammo]) then
									{
									_hasAmmo = _hasAmmo + (_x select 1);
									_ammoArr set [(count _ammoArr),_ammo];
									_vehs = _vehs + 1
									};
									
								if not (_hasAmmo < _amount) exitWith {}
								}
							foreach (magazinesAmmo _vh);
							}
						};

					if not (_vehs < _amount) exitWith {}
					}
				foreach (units _gp);

				if (_hasAmmo > 0) then
					{
					_artyAv set [(count _artyAv),_gp];
					_agp set [(count _agp),leader _gp]
					}
				}
			};
			
		if not (_hasAmmo < _amount) exitWith {}
		}
	foreach _arty;
	
	if not ((count _artyAv) == 0) then
		{
		_battery = _artyAv;

		_possible = true;

		if (_ammoG in ["ILLUM","SMOKE"]) then
			{
				{
				if not (isNull _x) then
					{
					_x setVariable ["RydHQ_BatteryBusy",true]
					}
				}
			foreach _battery;

			_pX = _pos select 0;
			_pY = _pos select 1;
			_pZ = _pos select 2;

			_pX = _pX + (random 100) - 50;
			_pY = _pY + (random 100) - 50;
			_pZ = _pZ + (random 20) - 10;

			_pos = [_pX,_pY,_pZ];
//_i = [_pos,(random 1000),"markArty","ColorRed","ICON","mil_dot",_ammoG,"",[0.75,0.75]] call RYD_Mark;
			[_battery,_pos,_ammoArr,_FO,_amount,_ammoG] spawn
				{
				_battery = _this select 0;
				_pos = _this select 1;
				_ammo = _this select 2;
				_FO = getPosASL (_this select 3);
				_amount = _this select 4;
				_ammoG = _this select 5;

				if (_ammoG == "ILLUM") then 
					{
					[_battery,_pos,_ammo,_amount] call RYD_CFF_Fire;
					}
				else
					{
					_angle = [_FO,_pos,10] call RYD_AngTowards;
					_pos2 = [_pos,_angle + 110,200 + (random 100) - 50] call RYD_PosTowards2D;
					_pos3 = [_pos,_angle - 110,200 + (random 100) - 50] call RYD_PosTowards2D;
					//_i2 = [_pos2,(random 1000),"markArty","ColorRed","ICON","mil_dot",_ammoG,"",[0.75,0.75]] call RYD_Mark;
					//_i3 = [_pos3,(random 1000),"markArty","ColorRed","ICON","mil_dot",_ammoG,"",[0.75,0.75]] call RYD_Mark;

						{
						[_battery,_x,_ammo,ceil (_amount/3)] call RYD_CFF_Fire;
								
						_ct = 0;
						waitUntil 
							{
							sleep 0.1;
							_ct = _ct + 0.1;
							_busy = 0; 
							
								{
								if not (isNull _x) then
									{
									_busy = _busy + ({not ((vehicle _x) getVariable ["RydHQ_GunFree",true])} count (units _x))
									};
								}
							foreach _battery;
							
							((_busy == 0) or (_ct > 12))
							};
						}
					foreach [_pos,_pos2,_pos3]
					};
					
				_ct = 0;
				waitUntil 
					{
					sleep 0.1;
					_ct = _ct + 0.1;
					_busy = 0; 
					
						{
						if not (isNull _x) then
							{
							_add = {not ((vehicle _x) getVariable ["RydHQ_GunFree",true])} count (units _x);
							_busy = _busy + _add;
							if (_add == 0) then {_x setVariable ["RydHQ_BatteryBusy",false]}
							};
						}
					foreach _battery;
					
					((_busy == 0) or (_ct > 12))
					};
										
					{
					if not (isNull _x) then
						{
						_x setVariable ["RydHQ_BatteryBusy",false]
						}
					}
				foreach _battery
				}
			}
		};

	//diag_log format ["AM: %1",[_possible,_battery,_agp,_ammoArr]];

	[_possible,_battery,_agp,_ammoArr]
	};

RYD_CFF_FFE = 
	{//[_battery,_tgt,_batlead,"SADARM",RydHQ_Friends,RydHQ_Debug] spawn RYD_CFF_FFE
	private ["_battery","_target","_batlead","_Ammo","_friends","_Debug","_ammoG","_batname","_first","_phaseF","_targlead","_againF","_dispF","_accF","_amount","_Rate","_FMType","_againcheck","_Aunit",
	"_RydAccF","_TTI","_amount1","_amount2","_template","_targetPos","_X0","_Y0","_X1","_Y1","_X2","_Y2","_Xav","_Yav","_transspeed","_transdir","_Xhd","_Yhd","_impactpos","_safebase","_distance",
	"_safe","_safecheck","_gauss1","_gauss09","_gauss04","_gauss2","_distance2","_DdistF","_DdamageF","_DweatherF","_DskillF","_anotherD","_Dreduct","_spawndisp","_dispersion","_disp","_RydAccF",
	"_gauss1b","_gauss2b","_AdistF","_AweatherF","_AdamageF","_AskillF","_Areduct","_spotterF","_anotherA","_acc","_finalimpact","_posX","_posY","_i","_dX","_dY","_angle","_dXb","_dYb","_posX2",
	"_posY2","_AmmoN","_exDst","_exPX","_exPY","_onRoad","_exPos","_nR","_stRS","_dMin","_dAct","_dSum","_checkedRS","_RSArr","_angle","_rPos","_actRS","_ammocheck","_artyGp","_ammoCount","_dstAct",
	"_maxRange","_minRange","_isTaken","_batlead","_alive","_waitFor","_UL","_ammoC","_add"];	

	_battery = _this select 0;
	_target = _this select 1;
	_batlead = _this select 2;
	_Ammo = _this select 3;
	_friends = _this select 4;
	_Debug = _this select 5;
	_ammoG = _this select 6;
	_amount = _this select 7;
	
	_markers = [];
	
	_battery1 = _battery select 0;
	_batLead1 = leader _battery1;

	_batname = str _battery1;

	//_first = _battery getVariable [("FIRST" + _batname),1];

	//_artyGp = group _batlead;

	_isTaken = (group _target) getVariable ["CFF_Taken",false];
	if (_isTaken) exitWith 
		{
			{
			if not (isNull _x) then
				{
				_x setVariable ["RydHQ_BatteryBusy",false]
				}
			}
		foreach _battery
		};
		
	(group _target) setVariable ["CFF_Taken",true];

	_phaseF = [1,2];

	_targlead = vehicle (leader _target);

	_waitFor = true;

		{
		if (isNil ("_target")) exitwith {_waitFor = false};
		if (isNull _targlead) exitwith {_waitFor = false};
		if not (alive _targlead) exitwith {_waitFor = false};
		
		if (({not (isNull _x)} count _batlead) < 1) exitwith {_waitFor = false};
		if (isNull _battery1) exitWith {_waitFor = false};
		if (({(alive _x)} count _batlead) < 1)  exitwith {_waitFor = false};

		if ((abs (speed _targlead)) > 50) exitWith {_waitFor = false};
		if (((getposATL _targlead) select 2) > 20)  exitWith {_waitFor = false};
		
		_againF = 0.5;
		_accF = 2;

		_againcheck = _battery1 getVariable [("CFF_Trg" + _batname),objNull];
		if not ((str _againcheck) == (str _target)) then {_againF = 1};

		_RydAccF = 1;

		if (isNil ("RydART_Amount")) then {_amount = _this select 7} else {_amount = RydART_Amount};
		if (isNil ("RydART_Acc")) then {_accF = 2} else {_accF = RydART_Acc};

		if (_ammoG in ["CLUSTER","GUIDED"]) then {_amount = ceil (_amount/3)};

		_amount1 = ceil (_amount/6);
		_amount2 = _amount - _amount1;

		if ((count _phaseF) == 2) then
			{
			if (_x == 1) then
				{
				_amount = _amount1
				}
			else
				{
				_amount = _amount2
				}
			};

		if (_amount == 0) exitwith {_waitFor = false};

		_targetPos = getPosASL _targlead;
		_targetPosATL = ASLtoATL _targetPos;
		
		_eta = -1;
		
			{
				{
				_vh = vehicle _x;
				_ammoC = (magazines _vh) select 0;
				
					{
					if (_x in _ammo) exitWith
						{
						_ammoC = _x
						}
					}
				foreach (magazines _vh);
				
				_newEta = _vh getArtilleryETA [_targetPosATL,_ammoC];
				
				if ((_newEta < _eta) or (_eta < 0)) then
					{
					_eta = _newEta
					}
				}
			foreach (units _x)
			}
		foreach _battery;
		
		if (_eta == -1) exitWith {_waitFor = false};

		_X0 = (_targetpos select 0);
		_Y0 = (_targetpos select 1);
		sleep 10;

		if (isNull _targlead) exitwith {_waitFor = false};
		if not (alive _targlead) exitwith {_waitFor = false};
		
		if (({not (isNull _x)} count _batlead) < 1) exitwith {_waitFor = false};
		if (isNull _battery1) exitWith {_waitFor = false};
		if (({(alive _x)} count _batlead) < 1)  exitwith {_waitFor = false};

		if ((abs (speed _targlead)) > 50) exitWith {_waitFor = false};
		if (((getposATL _targlead) select 2) > 20)  exitWith {_waitFor = false};

		_targetPos = getPosASL _targlead;
		_X1 = (_targetpos select 0);
		_Y1 = (_targetpos select 1);
		sleep 10;

		if (isNull _targlead) exitwith {_waitFor = false};
		if not (alive _targlead) exitwith {_waitFor = false};
		
		if (({not (isNull _x)} count _batlead) < 1) exitwith {_waitFor = false};
		if (isNull _battery1) exitWith {_waitFor = false};
		if (({(alive _x)} count _batlead) < 1)  exitwith {_waitFor = false};

		if ((abs (speed _targlead)) > 50) exitWith {_waitFor = false};
		if (((getposATL _targlead) select 2) > 20)  exitWith {_waitFor = false};

		_targetPos = getPosASL _targlead;
		_X2 = (_targetpos select 0);
		_Y2 = (_targetpos select 1);

		_onRoad = isOnRoad _targlead;

		_Xav = (_X1+_X2)/2;
		_Yav = (_Y1+_Y2)/2;

		_transspeed = ([_X0,_Y0] distance [_Xav,_Yav])/15;
		_transdir = (_Xav - _X0) atan2 (_Yav - _Y0);
		
		_add = 16/(1 + (_transspeed));

		_Xhd = _transspeed * (sin _transdir) * (_eta + _add);
		_Yhd = _transspeed * (cos _transdir) * (_eta + _add);
		_impactpos = _targetpos;
		_safebase = 100;

		_exPX = (_targetPos select 0) + _Xhd;
		_exPY = (_targetPos select 1) + _Yhd;

		_exPos = [_exPX,_exPY,getTerrainHeightASL [_exPX,_exPY]];
		_exTargetPosATL = ASLtoATL _exPos;
		
		_eta = -1;
		
			{
				{
				_vh = vehicle _x;
				
				_ammoC = (magazines _vh) select 0;
				
					{
					if (_x in _ammo) exitWith
						{
						_ammoC = _x
						}
					}
				foreach (magazines _vh);
				
				_newEta = _vh getArtilleryETA [_exTargetPosATL,_ammoC];
				
				if ((_newEta < _eta) or (_eta < 0)) then
					{
					_eta = _newEta
					}
				}
			foreach (units _x)
			}
		foreach _battery;
		
		if (_eta == -1) exitWith {_waitFor = false};
		
		_Xhd = _transspeed * (sin _transdir) * (_eta + _add);
		_Yhd = _transspeed * (cos _transdir) * (_eta + _add);

		_exPX = (_targetPos select 0) + _Xhd;
		_exPY = (_targetPos select 1) + _Yhd;

		_exPos = [_exPX,_exPY,getTerrainHeightASL [_exPX,_exPY]];

		_exDst = _targetPos distance _exPos;

		if (isNil ("RydART_Safe")) then {_safebase = 100} else {_safebase = RydART_Safe};

		_safe = _safebase * _RydAccf * (1 + overcast);

		_safecheck = true;

		if not (_onRoad) then
			{
				{
				if (([(_impactpos select 0) + _Xhd, (_impactpos select 1) + _Yhd] distance (vehicle (leader _x))) < _safe) exitwith 
						{
						_Xhd = _Xhd/2;
						_Yhd = _Yhd/2
						}
				}
			foreach _friends;

				{
				if ([(_impactpos select 0) + _Xhd, (_impactpos select 1) + _Yhd] distance (vehicle (leader _x)) < _safe) exitwith {_safecheck = false};
				}
			foreach _friends;

			if not (_safecheck) then 
				{
				_Xhd = _Xhd/2;
				_Yhd = _Yhd/2;
				_safecheck = true;
					{
					if ([(_impactpos select 0) + _Xhd, (_impactpos select 1) + _Yhd] distance (vehicle (leader _x)) < _safe) exitwith {_safecheck = false};
					}
				foreach _friends;
				if not (_safecheck) then 
					{
					_Xhd = _Xhd/5;
					_Yhd = _Yhd/5;
					_safecheck = true;
						{
						if ([(_impactpos select 0) + _Xhd, (_impactpos select 1) + _Yhd] distance (vehicle (leader _x)) < _safe) exitwith {_safecheck = false};
						}
					foreach _friends
					}
				};

			_impactpos = [(_targetpos select 0) + _Xhd, (_targetpos select 1) + _Yhd];
			}
		else
			{
			_nR = _targlead nearRoads 30;

			_stRS = _nR select 0;
			_dMin = _stRS distance _exPos;

				{
				_dAct = _x distance _exPos;
				if (_dAct < _dMin) then {_dMin = _dAct;_stRS = _x}
				}
			foreach _nR;

			_dSum = _targlead distance _stRS;
			_checkedRS = [_stRS];
			_actRS = _stRS;

			while {_dSum < _exDst} do
				{
				_RSArr = (roadsConnectedTo _actRS) - _checkedRS;
				if ((count _RSArr) == 0) exitWith {};
				_stRS = _RSArr select 0;
				_dMin = _stRS distance _exPos;

					{
					_dAct = _x distance _exPos;
					if (_dAct < _dMin) then {_dMin = _dAct;_stRS = _x}
					}
				foreach _RSArr;

				_dSum = _dSum + (_stRS distance _actRS);

				_actRS = _stRS;

				_checkedRS set [(count _checkedRS),_stRS];
				};

			if (_dSum < _exDst) then
				{
				//if (_transdir < 0) then {_transdir = _transdir + 360};
				_angle = [_targetPos,(getPosASL _stRS),1] call RYD_AngTowards;
				_impactPos = [(getPosASL _stRS),_angle,(_exDst - _dSum)] call RYD_PosTowards2D
				}
			else
				{
				_rPos = getPosASL _stRS;
				_impactPos = [_rPos select 0,_rPos select 1]
				};
			
				{
				if ((_impactpos distance (vehicle (leader _x))) < _safe) exitwith 
					{
					_safeCheck = false;
					_impactpos = [((_impactpos select 0) + (_targetPos select 0))/2,((_impactpos select 1) + (_targetPos select 1))/2]
					}
				}
			foreach _friends
			};

		if not (_safeCheck) then
			{
			_safeCheck = true;

				{
				if ((_impactpos distance (vehicle (leader _x))) < _safe) exitwith 
					{
					_safeCheck = false
					}
				}
			foreach _friends
			};

		if not (_safecheck) exitwith {(group _target) setVariable ["CFF_Taken",false]};
		
		_BBusy = false;
		
			{
			if not (isNull _x) then
				{
				_BBusy = _x getVariable ["RydHQ_BatteryBusy",false]
				};
				
			if (_BBusy) exitWith {}
			}
		foreach _battery;
		
		if ((_BBusy) and (_x == 1)) exitWith {(group _target) setvariable ["CFF_Taken",false]};
		
			{
			if not (isNull _x) then
				{
				_x setVariable ["RydHQ_BatteryBusy",true]
				}
			}
		foreach _battery;
		
		_distance2 = _impactPos distance (getPosATL (vehicle _batlead1));
		_DweatherF = 1 + overcast;
		_gauss09 = (random 0.09) + (random 0.09) + (random 0.09) + (random 0.09) + (random 0.09) + (random 0.09) + (random 0.09) + (random 0.09) +  (random 0.09) + (random 0.09);

		//_gauss1 = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) +  (random 0.1) + (random 0.1);
		//_gauss04 = (random 0.04) + (random 0.04) + (random 0.04) + (random 0.04) + (random 0.04) + (random 0.04) + (random 0.04) + (random 0.04) +  (random 0.04) + (random 0.04);
		//_gauss2 = (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) +  (random 0.2) + (random 0.2);
		//_DdistF = (_distance2/10) * (0.1 + _gauss04);
		//_DdamageF = 1 + 0.5 * (damage _batlead1);
		//_DskillF = 2 * (skill _batlead1);
		//_anotherD = 1 + _gauss1;
		//_Dreduct = (1 + _gauss2) + _DskillF;
		 
		//_spawndisp = _dispF * ((_RydAccf * _DdistF * _DdamageF) + (50 * _DweatherF * _anotherD)) / _Dreduct;
		//_dispersion = 10000 * (_spawndisp atan2 _distance2) / 57.3;

		//_disp = _dispersion;
		//if (isNil ("RydART_SpawnM")) then {_disp = _dispersion} else {_disp = _spawndisp};

		//[_battery,_disp] call BIS_ARTY_F_SetDispersion;
		
		_RydAccF = 1;

		_gauss1b = (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) + (random 0.1) +  (random 0.1) + (random 0.1);
		_gauss2b = (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) + (random 0.2) +  (random 0.2) + (random 0.2);
		_AdistF = (_distance2/10) * (0.1 + _gauss09);
		_AweatherF = _DweatherF;
		_AdamageF = 1 + 0.1 * (damage (vehicle _batlead1));
		_AskillF = 5 * (_batlead1 skill "aimingAccuracy");
		_Areduct = (1 + _gauss2b) + _AskillF;
		_spotterF = 0.2 + (random 0.2);
		_anotherA = 1 + _gauss1b;
		if not (isNil ("RydART_FOAccGain")) then {_spotterF = RydART_FOAccGain + (random 0.2)};
		if (((count _phaseF) == 2) and (_x == 1) or ((count _phaseF) == 1)) then {_spotterF = 1};

		_acc = _spotterF * _againF * _accF * ((_AdistF * _AdamageF) + (50 * _AweatherF * _anotherA)) / _Areduct;

		_finalimpact = [(_impactpos select 0) + (random (2 * _acc)) - _acc,(_impactpos select 1) + (random (2 * _acc)) - _acc];

		if (isNull _targlead) exitwith {_waitFor = false};
		if not (alive _targlead) exitwith {_waitFor = false};
		
		if (({not (isNull _x)} count _batlead) < 1) exitwith {_waitFor = false};
		if (isNull _battery1) exitWith {_waitFor = false};
		if (({(alive _x)} count _batlead) < 1)  exitwith {_waitFor = false};

		if ((abs (speed _targlead)) > 50) exitWith {_waitFor = false};
		if (((getposATL _targlead) select 2) > 20)  exitWith {_waitFor = false};

		//_dstAct = _impactpos distance _batlead;
		
			{
			if not (isNull _x) then
				{
					{
					(vehicle _x) setVariable ["RydHQ_ShotFired",false]
					}
				foreach (units _x)
				};
			}
		foreach _battery;

		sleep 0.2;
		_posX = 0;
		_posY = 0;
		if (_Debug) then 
			{
			_i = "markBat" + str (_battery1);
			_i = createMarker [_i,getposATL (vehicle _batlead1)];
			_i setMarkerColor "ColorBlack";
			_i setMarkerShape "ICON";
			_i setMarkerType "mil_circle";
			_i setMarkerSize [0.4,0.4];
			_i setMarkerText (" " + _i + " - " + str (typeOf (vehicle _batlead1)));
			
			_markers set [(count _markers),_i];
			
			_distance = _impactPos distance _finalimpact;
			_distance2 = _impactPos distance (getposATL (vehicle _batlead1));
			_i = "mark0" + str (_battery1);
			_i = createMarker [_i,_impactPos];
			_i setMarkerColor "ColorBlue";
			_i setMarkerShape "ELLIPSE";
			_i setMarkerSize [_distance, _distance];
			_i setMarkerBrush "Border";
			
			_markers set [(count _markers),_i];

			_dX = (_impactPos select 0) - (getposATL (vehicle _batlead1) select 0);
			_dY = (_impactPos select 1) - (getposATL (vehicle _batlead1) select 1);
			_angle = _dX atan2 _dY;
			if (_angle >= 180) then {_angle = _angle - 180};
			_dXb = (_distance2/2) * (sin _angle);
			_dYb = (_distance2/2) * (cos _angle);
			_posX = (getposATL (vehicle _batlead1) select 0) + _dXb;
			_posY = (getposATL (vehicle _batlead1) select 1) + _dYb;

			_i = "mark1" + str (_battery1);
			_i = createMarker [_i,[_posX,_posY]];
			_i setMarkerColor "ColorBlack";
			_i setMarkerShape "RECTANGLE";
			_i setMarkerSize [0.5,_distance2/2];
			_i setMarkerBrush "Solid";
			_i setMarkerdir _angle;
			
			_markers set [(count _markers),_i];

			_dX = (_finalimpact select 0) - (_impactPos select 0);
			_dY = (_finalimpact select 1) - (_impactPos select 1);
			_angle = _dX atan2 _dY;
			if (_angle >= 180) then {_angle = _angle - 180};
			_dXb = (_distance/2) * (sin _angle);
			_dYb = (_distance/2) * (cos _angle);
			_posX2 = (_impactPos select 0) + _dXb;
			_posY2 = (_impactPos select 1) + _dYb;

			_i = "mark2" + str (_battery1);
			_i = createMarker [_i,[_posX2,_posY2]];
			_i setMarkerColor "ColorBlack";
			_i setMarkerShape "RECTANGLE";
			_i setMarkerSize [0.5,_distance/2];
			_i setMarkerBrush "Solid";
			_i setMarkerdir _angle;
			
			_markers set [(count _markers),_i];

			_i = "mark3" + str (_battery1);
			_i = createMarker [_i,_impactPos];
			_i setMarkerColor "ColorBlack";
			_i setMarkerShape "ICON";
			_i setMarkerType "mil_dot";
			
			_markers set [(count _markers),_i];

			_i = "mark4" + str (_battery1);
			_i = createMarker [_i,_finalimpact];
			_i setMarkerColor "ColorRed";
			_i setMarkerShape "ICON";
			_i setMarkerType "mil_dot";
			_i setMarkerText (str (round _distance) + "m" + " - ETA: " + str (round _eta) + " - " + _ammoG);
			
			_markers set [(count _markers),_i];
						
			[_battery,_distance,_eta,_ammoG,_batlead,_target,_markers] spawn
				{
				private ["_mark","_battery","_distance","_eta","_Ammo","_target","_alive","_stoper","_TOF","_batlead"];

				_battery = _this select 0;
				_distance = _this select 1;
				_eta = _this select 2;
				_ammoG = _this select 3;
				_batlead = _this select 4;
				_target = _this select 5;
				_markers = _this select 6;
				
				_battery1 = _battery select 0;
				
				_alive = true;
				_shot = false;

				waitUntil 
					{
					sleep 0.1;
					if (({not (isNull _x)} count _batlead) < 1) then {_alive = false};
					if (isNull _battery1) then {_alive = false};
					if (({(alive _x)} count _batlead) < 1) then {_alive = false};
					
						{
						if not (isNull _x) then
							{
								{
								if ((vehicle _x) getVariable ["RydHQ_ShotFired",false]) exitWith {_shot = true}
								}
							foreach (units _x)
							};
						
						if (_shot) exitWith {}
						}
					foreach _battery;
					
					((_shot) or not (_alive))
					};
					
					{
					if not (isNull _x) then
						{
							{
							(vehicle _x) setVariable ["RydHQ_ShotFired",false]
							}
						foreach (units _x)
						};
					}
				foreach _battery;

				_stoper = time;
				_TOF = 0;
				_rEta = _eta;
				
				_mark = _markers select ((count _markers) -1);

				while {(not (_rEta < 5) and not (_TOF > 200) and (_alive))} do
					{
					if (({not (isNull _x)} count _batlead) < 1) exitWith {_alive = false};
					if (isNull _battery1) exitWith {_alive = false};
					if (({(alive _x)} count _batlead) < 1) exitWith {_alive = false};

					_TOF = (round (10 * (time - _stoper)))/10;
					_rEta = _eta - _TOF;
					
					 if ((_rEta < 5) or (_TOF > 200)) then {_battery1 setVariable ["RydHQ_SPLASH",true]};
					
					_mark setMarkerText (str (round _distance) + "m" + " - ETA: " + str (round _rEta) + " - TOF: " + (str _TOF) + " - " + _ammoG);
					sleep 0.1
					};

				if not (_alive) exitWith 
					{
					(group _target) setvariable ["CFF_Taken",false];
					
						{
						deleteMarker _x;
						}
					foreach _markers;
					};

				_mark setMarkerText (str (round _distance) + "m"  + " - SPLASH!" + " - " + _ammoG);
				};

			/*_i = "mark5" + str (_battery);
			_i = createMarker [_i,_finalimpact];
			_i setMarkerColor "ColorRedAlpha";
			_i setMarkerShape "ELLIPSE";
			_i setMarkerSize [_spawndisp,_spawndisp];*/
			};
			
		[_battery,_finalimpact,_ammo,_amount] call RYD_CFF_Fire;
					
		_UL = _batlead1;
		if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_ArtFire,"ArtFire"] call RYD_AIChatter};

		_alive = true;

		waituntil 
			{
			sleep 1;

			_available = true;
			if (({not (isNull _x)} count _batlead) < 1) then {_alive = false};
			if (isNull _battery1) then {_alive = false};
			if (({(alive _x)} count _batlead) < 1) then {_alive = false};
						
				{
				if not (isNull _x) then
					{
						{
						if not ((vehicle _x) getVariable ["RydHQ_GunFree",true]) exitWith {_available = false}
						}
					foreach (units _x)
					};
				
				if not (_available) exitWith {}
				}
			foreach _battery;
			
			((_available) or not (_alive))
			};

		if not (_alive) exitWith {};

		if (((count _phaseF) == 2) and (_x == 1)) then 
			{
			_alive = true;
			_splash = false;			

			waitUntil 
				{
				sleep 1;

				if (({not (isNull _x)} count _batlead) < 1) then {_alive = false};
				if (isNull _battery1) then {_alive = false};
				if (({(alive _x)} count _batlead) < 1) then {_alive = false};
				if not (isNull _battery1) then {_splash = _battery1 getVariable ["RydHQ_SPLASH",false]};
				
				((_splash) or not (_alive))
				};
				
			if not (isNull _battery1) then {_battery1 setVariable ["RydHQ_SPLASH",false]};

			sleep 10;
			
				{
				deleteMarker _x;
				}
			foreach _markers
			};

		if not (_alive) exitWith {};
		}
	foreach _phaseF;

	_battery1 setVariable [("CFF_Trg" + _batname),_target];

	_alive = true;
	_splash = false;

	if (_waitFor) then
		{
		waitUntil 
			{
			sleep 1;

			if (({not (isNull _x)} count _batlead) < 1) then {_alive = false};
			if (isNull _battery1) then {_alive = false};
			if (({(alive _x)} count _batlead) < 1) then {_alive = false};
			if not (isNull _battery1) then {_splash = _battery1 getVariable ["RydHQ_SPLASH",false]};
			
			((_splash) or not (_alive))
			};
			
		if not (isNull _battery1) then {_battery1 setVariable ["RydHQ_SPLASH",false]};

		sleep 10
		};

		{
		deleteMarker _x;
		}
	foreach _markers;

	(group _target) setVariable ["CFF_Taken",false];
	
	_alive = true;

	waitUntil 
		{
		sleep 1;

		_available = true;
		if (({not (isNull _x)} count _batlead) < 1) then {_alive = false};
		//if (isNull _battery1) then {_alive = false};
		if (({(alive _x)} count _batlead) < 1) then {_alive = false};
					
			{
			if not (isNull _x) then
				{
					{
					if not ((vehicle _x) getVariable ["RydHQ_GunFree",true]) exitWith {_available = false}
					}
				foreach (units _x)
				};
			
			if not (_available) exitWith {}
			}
		foreach _battery;
		
		((_available) or not (_alive))
		};

	//if not (_alive) exitWith {};

		{
		if not (isNull _x) then
			{
			_x setVariable ["RydHQ_BatteryBusy",false]
			}
		}
	foreach _battery
	};

RYD_CFF = 
	{//[RydHQ_ArtG,RydHQ_KnEnemies,(RydHQ_EnHArmor + RydHQ_EnMArmor + RydHQ_EnLArmor),RydHQ_Friends,RydHQ_Debug] call RYD_CFF;
	private ["_amnt","_artG","_knEnemies","_enArmor","_friends","_Debug","_CFFMissions","_tgt","_ammo","_bArr","_possible","_UL","_ldr"];

	_artG = _this select 0;
	_knEnemies = _this select 1;
	_enArmor = _this select 2;
	_friends = _this select 3;
	_Debug = _this select 4;
	_ldr = _this select 5;

	_CFFMissions = ceil (random (count _artG));

	for "_i" from 1 to _CFFMissions do
		{
		_tgt = [_knEnemies] call RYD_CFF_TGT;
		if not (isNull _tgt) then
			{
			_ammo = "HE";
			_amnt = 6;
			if ((random 100) > 85) then {_ammo = "CLUSTER";_amnt = 6};
			//if (_tgt in _enArmor) then {_ammo = "HE";_amnt = 6};	

			_bArr = [(getPosATL _tgt),_artG,_ammo,_amnt,objNull] call RYD_ArtyMission;
			_possible = _bArr select 0;

			_UL = leader (_friends select (floor (random (count _friends))));

			if not (isPlayer _UL) then {if ((random 100) < RydxHQ_AIChatDensity) then {[_UL,RydxHQ_AIC_ArtyReq,"ArtyReq"] call RYD_AIChatter}};

			if (_possible) then
				{
				if ((random 100) < RydxHQ_AIChatDensity) then {[_ldr,RydxHQ_AIC_ArtAss,"ArtAss"] call RYD_AIChatter};
				[_bArr select 1,_tgt,_bArr select 2,_bArr select 3,_friends,_Debug,_ammo,_amnt] spawn RYD_CFF_FFE
				}
			else
				{
				switch (true) do
					{
					case (_ammo in ["CLUSTER","GUIDED"]) : {_ammo = "HE";_amnt = 6};
					case (_ammo in ["HE"]) : {_ammo = "GUIDED";_amnt = 6};
					};

				_bArr = [(getPosATL _tgt),_artG,_ammo,_amnt,objNull] call RYD_ArtyMission;

				_possible = _bArr select 0;
				if (_possible) then
					{
					if ((random 100) < RydxHQ_AIChatDensity) then {[_ldr,RydxHQ_AIC_ArtAss,"ArtAss"] call RYD_AIChatter};
					[_bArr select 1,_tgt,_bArr select 2,_bArr select 3,_friends,_Debug,_ammo,_amnt] spawn RYD_CFF_FFE
					}
				else
					{
					if ((random 100) < RydxHQ_AIChatDensity) then {[_ldr,RydxHQ_AIC_ArtDen,"ArtDen"] call RYD_AIChatter}
					}
				}
			};

		sleep (5 + (random 5));
		};
	};

RYD_WPSync = 
	{
	private ["_wp","_trg","_otherWP","_gp","_isRest","_pos","_alive","_cwp","_timer"];

	_wp = _this select 0;
	_trg = group (_this select 1);

	if (isNull _trg) exitWith {};

	_pos = waypointPosition _wp;

	_otherWP = _trg getVariable ["RYD_Attacks",[]];

	_wp synchronizeWaypoint _otherWP;
	_trg setVariable ["RYD_Attacks",_otherWP + [_wp]];

	_otherWP = _trg getVariable ["RYD_Attacks",[]];

	_gp = _wp select 0;

	_timer = 0;
	_alive = true;

	waitUntil 
		{
		sleep 5;
		_isRest = _gp getVariable [("Resting" + (str _gp)),false];
		if (fleeing (leader _gp)) then {_isRest = true};
		_timer = _timer + 1;
		_cwp = [_gp,currentWaypoint _gp];
		if (isNull _trg) then {_alive = false};
		if ((((waypointPosition _cwp) distance _pos) > 1) and (((waypointPosition _cwp) distance (vehicle (leader _gp))) > 20)) then {_isRest = true};
		((_isRest) or (_timer > 360) or not (_alive))
		};

	_wp synchronizeWaypoint [];
	};

RYD_DbgMon = 
	{
	private ["_txtArr","_dbgMon","_txt"];

	waitUntil 
		{
		sleep 1;
		(not (isNull RydHQ))
		};

	if (RydBB_Active) then
		{
		waitUntil
			{
			sleep 1;
			not (isNil "RydBB_mapReady")
			}
		};

	_txtArr = [];

	while {((RydHQ_Debug) or (RydHQB_Debug) or (RydHQC_Debug) or (RydHQD_Debug) or (RydHQE_Debug) or (RydHQF_Debug) or (RydHQG_Debug) or (RydHQH_Debug))} do
		{
		_txtArr = [];

			{
			if not (isNil "_x") then
				{
				if not (isNull _x) then
					{
					_dbgMon = _x getVariable "DbgMon";
					if not (isNil "_dbgMon") then 
						{
						_txtArr set [(count _txtArr),_dbgMon];
						_txtArr set [(count _txtArr),linebreak];
						}
					}
				}
			}
		foreach [RydHQ,RydHQB,RydHQC,RydHQD,RydHQE,RydHQF,RydHQG,RydHQH];

		if ((count _txtArr) > 0) then
			{
			_txt = composeText _txtArr;

			hintSilent _txt
			};

		sleep 15
		};
	};

RYD_LZ = 
	{
	private ["_pos","_lz","_rds","_isFlat","_posX","_posY"];

	_pos = _this select 0;

	_posX = -1;
	_posY = -1;
	_rds = 50;

	_lz = objNull;

	_isFlat = [];

	while {_rds <= 250} do
		{
		_isFlat = _pos isFlatEmpty [30,_rds,1.5,30,0,false,objNull];

		if ((count _isFlat) > 1) exitWith
			{
			_posX = _isFlat select 0;
			_posY = _isFlat select 1;
			};

		_rds = _rds + 50;
		};

	if (_posX > 0) then
		{
		_lz = createVehicle ["HeliHEmpty", [_posX,_posY,0], [], 0, "NONE"];
		//_i01 = [[_posX,_posY],str (random 100),"markLZ","ColorRed","ICON","mil_dot","LZ",""] call RYD_Mark
		};

	_lz
	};

RYD_TimeMachine = 
	{
	private ["_units","_id"];

	_units = _this select 0;

		{
		_id = _x addAction ["Time: x2", "RYD_HAC\TimeM\TimeFaster.sqf", "", -50, false, true, "", "true"];
		_id = _x addAction ["Time: x0.5", "RYD_HAC\TimeM\TimeSlower.sqf", "", -60, false, true, "", "true"];
		_id = _x addAction ["Order pause enabled", "RYD_HAC\TimeM\EnOP.sqf", "", -70, false, true, "", "not RydHQ_GPauseActive"];
		_id = _x addAction ["Order pause disabled", "RYD_HAC\TimeM\DisOP.sqf", "", -80, false, true, "", "RydHQ_GPauseActive"];
		}
	foreach _units;

	true
	};
	
RYD_AddTask = 
	{//[(leader _unitG),[],[_posX,_posY]] call RYD_AddTask;
	private ["_unit","_descr","_dstn","_task","_tasks","_tName"];

	_unit = _this select 0;
	_descr = _this select 1;
	_dstn = _this select 2;
	
	_tasks = _unit getVariable ["HACAddedTasks",[]];
	_task = taskNull;
		
	if (isPlayer _unit) then
		{
		if not (isMultiplayer) then
			{
			["TaskAssigned",[nil,(_descr select 1)]] call BIS_fnc_showNotification;
			_unit setVariable ["HACAddedTasks",[]];
			
				{
				_unit removeSimpleTask _x
				} 
			foreach _tasks;

			_task = _unit createSimpleTask ["title"];
			_tasks = [];
			
			_tasks set [(count _tasks),_task];

			_unit setVariable ["HACAddedTasks",_tasks];
			_task setSimpleTaskDescription _descr;
			_task setSimpleTaskDestination _dstn
			}
		else
			{
			[["TaskAssigned",[nil,(_descr select 1)]],"BIS_fnc_showNotification",_unit,false,true] call BIS_fnc_MP;
			
			_unit setVariable ["HACAddedTasks",[]];

			_tasks = [];

			_task = [nil,_unit,_descr,_dstn,"ASSIGNED",0,false,true] call BIS_fnc_SetTask;
			_tasks set [(count _tasks),_task];
			
			_unit setVariable ["HACAddedTasks",_tasks];
			}
		};

	_task
	};
	
RYD_FindHighestWithIndex = 
	{
	private ["_array","_ix","_highest","_valMax","_valAct","_index","_clIndex"];

	_array = _this select 0;
	_ix = _this select 1;

	_highest = [];

	if ((count _array) > 0) then 
		{
		_highest = _array select 0;
		_index = 0;
		_clIndex = 0;
		_valMax = _highest select _ix;

			{
			_valAct = _x select _ix;

			if (_valAct > _valMax) then
				{
				_highest = _x;
				_valMax = _valAct;
				_clIndex = _index
				};

			_index = _index + 1
			}
		foreach _array
		};

	[_highest,_clIndex]
	};

RYD_ValueOrd = 
	{
	private ["_array","_final","_highest","_ix"];

	_array = _this select 0;

	_final = [];

	while {((count _array) > 0)} do
		{
		_highest = [_array,3] call RYD_FindHighestWithIndex;
		_ix = _highest select 1;
		_highest = _highest select 0;
		
		_final set [(count _final),_highest];

		_array set [_ix,"Delete"];
		_array = _array - ["Delete"]
		};

	_final
	};

RYD_FindOverwatchPos = 
	{
	private ["_pos","_tgtPos","_radius","_dir","_posASL","_tgtPosASL","_pool","_posX","_posY","_posX2","_posY2","_pool2","_isBlock","_pool3","_elevImp","_terrImp","_terr","_elev","_final","_value",
	"_urban","_forest","_gp","_dst","_vh"];

	_pos = _this select 0;//ATL
	_tgtPos = _this select 1;//ATL
	_tgtPos = [_tgtPos select 0,_tgtPos select 1,1.5];
	_radius = _this select 2;
	_elevImp = 1;
	if ((count _this) > 3) then {_elevImp = _this select 3};
	_terrImp = 1;
	if ((count _this) > 4) then {_terrImp = _this select 4};
	_gp = grpNull;
	if ((count _this) > 5) then {_gp = _this select 5};
	_vh = vehicle (leader _gp);

	_tgtPosASL = [_tgtPos select 0,_tgtPos select 1,getTerrainHeightASL [_tgtPos select 0,_tgtPos select 1] + 1.5];

	_pool = [];

	_posX = _pos select 0;
	_posY = _pos select 1;

	for "_i" from 1 to 100 do
		{
		_posX2 = _posX + (random (2 * _radius)) - _radius;
		_posY2 = _posY + (random (2 * _radius)) - _radius;

		if not (surfaceIsWater [_posX2,_posY2]) then {_pool set [(count _pool),[_posX2,_posY2,1]]}
		};

	_pool2 = [];

		{
		_isBlock = terrainIntersect [_x, _tgtPos];
		if not (_isBlock) then
			{
			_pool2 set [(count _pool2),_x]
			}
		}
	foreach _pool;

	if ((count _pool2) == 0) then {_pool2 = _pool};

	_pool3 = [];

		{
		_isBlock = lineIntersects [[_x select 0,_x select 1,getTerrainHeightASL [_x select 0,_x select 1] + 1], _tgtPosASL];
		if not (_isBlock) then
			{
			_pool3 set [(count _pool3),_x]
			}
		}
	foreach _pool2;

	if ((count _pool3) == 0) then {_pool3 = _pool2};

		{
		_value = [_x,1,1] call RYD_TerraCognita;
		_urban = _value select 0;
		_forest = _value select 1;

		_terr = (_urban + _forest) * 100;

		_posX = _x select 0;
		_posY = _x select 1;
		_elev = getTerrainHeightASL [_posX,_posY];
		_dst = 0;
		if not (isNull _gp) then
			{
			_dst = ([_posX,_posY] distance _vh)/1000
			};

		_x set [(count _x),((_terr * _terrImp) + (_elev * _elevImp))/(1 + _dst)]
		}
	foreach _pool3;

	_pool3 = [_pool3] call RYD_ValueOrd;

	_final = [];

		{
		_final set [(count _final),[_x select 0,_x select 1]]
		}
	foreach _pool3;

	_final
	};

RYD_KeepAlt = 
	{
	private ["_veh","_alt","_keep"];
	
	_veh = _this select 0;
	_alt = _this select 1;

	_keep = true;

	while {_keep} do
		{
		sleep 0.1;
		if (isNull _veh) exitWith {};
		if not (alive _veh) exitWith {};
		_keep = _veh getVariable ["KeepAlt",true];
		_veh flyInHeight _alt
		};

	_veh setVariable ["KeepAlt",nil]
	};

RYD_AmmoDrop = 
	{
	private ["_cargo","_ammoBox","_spawnPos","_parachute","_parachutePos","_height1","_height2","_height3","_speed","_dir","_vel","_pos","_off","_type","_benef"];

	_cargo = _this select 0;
	_ammoBox = _this select 1;
	_benef = _this select 2;
	_type = typeOf _ammoBox;

	_dir = getDir _cargo;

	_parachutePos = _cargo modelToWorld [(random 10) - 5,-10,-10];

	_parachute = createVehicle ["B_Parachute_02_F", [_parachutePos select 0,_parachutePos select 1,2000], [], 0.5, "NONE"];
	_parachute setPos _parachutePos;
	_parachute setDir _dir;

	_vel = velocity _cargo;

	_parachute setVelocity [(_vel select 0)/2,(_vel select 1)/2,(_vel select 2)/2];

	_ammoBox setDir _dir;

	_ammoBox attachTo [_parachute,[0,0,0]];

	sleep 2;

	waitUntil
		{
		_height1 = (getPosATL _ammoBox) select 2;
		sleep 0.005;
		_height2 = (getPosATL _ammoBox) select 2;
		_speed = abs ((velocity _ammoBox) select 2);
		if (_height2 > _height1) then {_parachute setVelocity [0,0,-20]};
		sleep 0.005;
		_height3 = (getPosATL _ammoBox) select 2;

		((_height2 < 0.05) or (_height3 > _height2) or (_speed < 0.001) or (isNull _parachute))
		};

	detach _ammoBox;

	_pos = getPosATL _ammoBox;

	//deleteVehicle _ammoBox;

	//_ammoBox = createVehicle [_type, _pos, [], 0, "NONE"];

	_off = _ammoBox modelToWorld [0,0,0] select 2;
	if (_off < 2) then 
		{
		_ammoBox setPos [_pos select 0,_pos select 1,0];
		} 
	else 
		{
		_off = getPos _ammoBox select 2;
		_ammoBox setPosATL [_pos select 0,_pos select 1,(_pos select 2)-_off];
		};

	_benef setVariable ["isBoxed",_ammoBox];

	if not (isNull _parachute) then 
		{
		_parachute setVelocity [0,0,0]
		};

	sleep 5;

	if not (isNull _parachute) then 
		{
		deleteVehicle _parachute
		}
	};

RYD_ResetAI = 
	{
	private ["_gp","_All","_unit","_pos","_posX","_posY","_type","_muzzles"];

	_gp = _this select 0;
	_All = units _gp;

		{
		_unit = _x;
		_pos = getPosATL _unit;

		_posX = _pos select 0;
		_posY = _pos select 1;

		_posX = _posX + (random 0.25) - 0.125;
		_posY = _posY + (random 0.25) - 0.125;

		_unit setPos [_posX,_posY,1];

		sleep 0.05;

		_unit doMove [_posX,_posY,0];

		sleep 0.05;

		_unit setDir (getDir player);

		sleep 0.05;

		_unit forcespeed -1;

		sleep 0.05;

		if ((count (weapons _unit)) > 0) then
			{
			private["_type", "_muzzles"];

			_type = (weapons _unit) select 0;
			_muzzles = getArray(configFile >> "cfgWeapons" >> _type >> "muzzles");

			if (count _muzzles > 1) then
				{
				_unit selectWeapon (_muzzles select 0);
				}
			else
				{
				_unit selectWeapon _type
				}
			}
		}
	foreach _All;

	sleep 0.5;

		{
		_x doWatch ObjNull;
		sleep 0.05;
		_x doTarget ObjNull;
		sleep 0.05;
		_x enableReload false;
		sleep 0.05;
		_x stop true;
		sleep 0.05;
		_x setUnitPos "UP";
		sleep 0.05
		}
	foreach _All;

	sleep 0.5;

		{
		_x switchMove "";
		sleep 0.05;
		_x disableAI "TARGET";
		sleep 0.05;
		_x disableAI "AUTOTARGET";
		sleep 0.05;
		_x disableAI "MOVE";
		sleep 0.05;
		_x disableAI "FSM";
		sleep 0.05;
		_x disableAI "ANIM";
		sleep 0.05
		}
	foreach _All;

	sleep 5;

		{
		_x setUnitPos "AUTO";
		sleep 0.05;
		_x enableAI "TARGET";
		sleep 0.05;
		_x enableAI "AUTOTARGET";
		sleep 0.05;
		_x enableAI "MOVE";
		sleep 0.05;
		_x enableAI "FSM";
		sleep 0.05;
		_x enableAI "ANIM";
		sleep 0.05;
		_x stop false;
		sleep 0.05;
		_x enableReload true;
		sleep 0.05
		}
	foreach _All;
	};

RYD_FireCount = 
	{
	private ["_unit","_count","_fEH"];

	_unit = _this select 0;

	_count = _unit getVariable "FireCount";
	if (isNil "_count") then {_count = 0};

	if (_count >= 2) exitWith 
		{
		_fEH = _unit getVariable "HAC_FEH";
		if not (isNil "_fEH") then
			{
			_unit removeEventHandler ["Fired",_fEH];
			_unit setVariable ["HAC_FEH",nil]
			}
		};

	_unit setVariable ["FireCount",_count + 1]
	};

RYD_AIChatter = 
	{
	//if (isMultiPlayer) exitWith {};
	
	private ["_unit","_gp","_lastComm","_sentences","_side","_lastTime","_varName","_sentence","_kind","_lastKind","_exitNow","_chatRep","_repExChance","_ct","_units"];

	_unit = _this select 0;
	
	_gp = group _unit;
	
	_lastComm = _gp getVariable "HAC_LastComm";
	if (isNil "_lastComm") then {_lastComm = -20};
	if ((time - _lastComm) < 20) exitWith {};
			
	_sentences = _this select 1;
	_side = side _unit;

	if (({(((side _x) == _side) and (isPlayer _x))} count AllUnits) < 1) exitWith {};
	
	_gp setVariable ["HAC_LastComm",time];

	_kind = _this select 2;

	_varName = "_West";

	switch (_side) do
		{
		case (east) : {_varName = "_East"};
		case (resistance) : {_varName = "_Guer"};
		};

	_lastTime = missionNameSpace getVariable ["HAC_AIChatLT" + _varName,[0,""]];
	_lastKind = _lastTime select 1;
	_lastTime = _lastTime select 0;

	if ((time - _lastTime) < 10) then {sleep (4 + (random 2))};

	_lastTime = missionNameSpace getVariable ["HAC_AIChatLT" + _varName,[0,""]];
	_lastKind = _lastTime select 1;
	_lastTime = _lastTime select 0;

	if ((time - _lastTime) < 10) exitWith {}; 

	_exitNow = false;

	_chatRep = 0;

	if (_lastKind in [_kind]) then
		{
		_chatRep = missionNameSpace getVariable ["HAC_AIChatRep" + _varName,0];
		_repExChance = round (random 2);

		if (_chatRep >= _repExChance) then 
			{
			if ((random 100) < (90 + _chatRep)) then
				{
				_exitNow = true
				}
			}
		};

	if (_exitNow) exitWith {};

	missionNameSpace setVariable ["HAC_AIChatLT" + _varName,[_lastTime,_kind]];

	if (_lastKind in [_kind]) then
		{
		missionNameSpace setVariable ["HAC_AIChatRep" + _varName,_chatRep + 1]
		};

	_sentence = _sentences select (floor (random (count _sentences)));

	if not (isMultiplayer) then
		{
		_unit sideRadio _sentence
		}
	else
		{
		_sentence = getText (missionConfigFile >> "CfgRadio" >> _sentence >> "title");		
		[[_unit,_sentence],"RYD_MP_Sidechat",true,false,true] call BIS_fnc_MP;
		};

	missionNameSpace setVariable ["HAC_AIChatLT" + _varName,[time,_kind]];
	};
	
RYD_MP_Sidechat = 
	{
	private ["_unit","_sentence"];
	
	_unit = _this select 0;
	_sentence = _this select 1;
	_unit sidechat _sentence;
	
	true
	};
	
RYD_FindBiggest = 
	{
	private ["_array","_biggest","_valMax","_valAct","_index","_clIndex"];

	_array = _this select 0;

	_biggest = grpNull;

	if ((count _array) > 0) then 
		{
		_biggest = _array select 0;
		_index = 0;
		_clIndex = 0;
		_valMax = count (units _biggest);

			{
			_valAct = count (units _x);

			if (_valAct > _valMax) then
				{
				_biggest = _x;
				_valMax = _valAct;
				_clIndex = _index
				};

			_index = _index + 1
			}
		foreach _array
		};

	[_biggest,_clIndex]
	};

RYD_SizeOrd = 
	{
	private ["_array","_final","_highest","_ix"];

	_array = _this select 0;

	_final = [];

	while {((count _array) > 0)} do
		{
		_highest = [_array] call RYD_FindBiggest;
		_ix = _highest select 1;
		_highest = _highest select 0;
		
		if not (isNil "_highest") then 
			{
			if not (isNull _highest) then
				{
				_final set [(count _final),_highest];
				}
			};

		_array set [_ix,"Delete"];
		_array = _array - ["Delete"]
		};

	_final
	};

RYD_RandomOrd = 
	{
	private ["_array","_final","_random","_select"];

	_array = _this select 0;

	_final = [];

	while {((count _array) > 0)} do
		{
		_select = floor (random (count _array));
		_random = _array select _select;
		
		if not (isNil "_random") then 
			{
			if not (isNull _random) then
				{
				_final set [(count _final),_random];
				}
			};
			
		_array = _array - [_random];

		//_array set [_select,"Delete"];
		//_array = _array - ["Delete"]
		};

	_final
	};

RYD_NearestRoad = 
	{
	private ["_pos","_radius","_roads","_chosen","_dist","_distC"];

	_pos = _this select 0;
	_radius = _this select 1;

	_chosen = objNull;

	_roads = _pos nearRoads _radius;

	if ((count _roads) > 0) then
		{
		_chosen = _roads select 0;
		_distC = (getPosATL _chosen) distance _pos;

			{
			_dist = (getPosATL _x) distance _pos;
			if (_dist <_distC) then {_chosen = _x;_distC = _dist} 
			}
		foreach _roads
		};

	_chosen
	};

RYD_FlatLandNoRoad =
	{
	private ["_pos","_radius","_final","_isGood","_isFlat","_noRoad","_nR","_ct"];

	_pos = _this select 0;
	_radius = _this select 1;

	_final = +_pos;

	_isGood = true;

	_isFlat = _pos isFlatEmpty [5,_radius/2,2,5,0,false,objNull];
	if ((count _isFlat) <= 1) then
		{
		_isGood = false
		}
	else
		{
		_noRoad = true;
		_nR = [_pos,20] call RYD_NearestRoad;
		if (not (isNull _nR) or (isOnRoad _pos)) then
			{
			_isGood = false
			}
		};

	_ct = 0;
	while {not (_isGood)} do
		{
		_ct = _ct + 1;
		if (_ct > 30) exitWith {};
		_pos = [_pos,_radius] call RYD_RandomAround;

		_isGood = true;

		_isFlat = _pos isFlatEmpty [5,_radius/2,2,5,0,false,objNull];
		if ((count _isFlat) <= 1) then
			{
			_isGood = false
			}
		else
			{
			_noRoad = true;
			_nR = [_pos,20] call RYD_NearestRoad;
			if (not (isNull _nR) or (isOnRoad _pos)) then
				{
				_isGood = false
				}
			};
		};
	
	if (_isGood) then {_final = _pos};

	_final
	};

RYD_GoInside = 
	{
	private ["_wp","_pos","_nHouses","_nHouse","_posAll","_posAct","_chosen","_enterable","_stat","_oldStat"];

	_wp = _this select 0;
	_pos = waypointPosition _wp;
	
	_posAll = [];
	_chosen = -1;

	_nHouses = _pos nearObjects ["House",100];

	if ((count _nHouses) > 0) then
		{
		_nHouse = _nHouses select (floor (random (count _nHouses)));
		_nHouses = _nHouses - [_nHouse];

		_enterable = true;
		if ((str (_nHouse buildingpos 0)) == "[0,0,0]") then {_enterable = false};

		if not (_enterable) then
			{
			while {((count _nHouses) > 0)} do
				{
				_nHouse = _nHouses select (floor (random (count _nHouses)));
				_nHouses = _nHouses - [_nHouse];

				_enterable = true;
				if ((str (_nHouse buildingpos 0)) == "[0,0,0]") then {_enterable = false};
				if (_enterable) exitWith {}
				}
			};

		if (_enterable) then
			{
			_posAct = [1,1,1];

			_i = 0;
			while {not ((str _posAct) == "[0,0,0]")} do
				{
				_posAct = _nHouse buildingpos _i;
				_i = _i + 1;
				if not ((str _posAct) == "[0,0,0]") then 
					{
					if not (_posAct in _posAll) then 
						{
						_posAll set [(count _posAll),_posAct]
						}
					}
				}
			};

		if ((count _posAll) > 0) then
			{
			_chosen = _posAll select (floor (random (count _posAll)));
			_wp setWaypointPosition [_chosen,0];
			_stat = "this doMove " + (str _chosen);

			_oldStat = (waypointStatements _wp) select 1;
			_stat = _stat + ";" + _oldStat;

			_wp setWaypointStatements ["true",_stat];
			}
		};

	[_nHouse,_chosen]
	};
	
RYD_RHQCheck = 
	{
	private ["_type","_noInTotal","_noInAdditional","_noInBasic","_civF","_total","_basicrhq","_Additionalrhq","_Inf","_Art","_HArmor","_LArmor","_Cars","_Air","_Naval","_Static","_Other","_specFor",
		"_recon","_FO","_snipers","_ATInf","_AAInf","_LArmorAT","_NCAir","_StaticAA","_StaticAT","_Cargo","_NCCargo","_Crew","_MArmor","_BAir","_RAir","_ammo","_fuel","_med","_rep"];

	_specFor = RHQ_SpecFor + 
		[
		] - RHQs_SpecFor;

	_recon = RHQ_Recon + 
		[
		"O_recon_exp_F",
		"O_recon_F",
		"O_recon_JTAC_F",
		"O_recon_LAT_F",
		"O_recon_M_F",
		"O_recon_medic_F",
		"O_recon_TL_F",
		"B_recon_exp_F",
		"B_recon_F",
		"B_recon_JTAC_F",
		"B_recon_LAT_F",
		"B_recon_M_F",
		"B_recon_medic_F",
		"B_recon_TL_F",
		"I_UAV_AI",
		"O_UAV_AI",
		"B_UAV_AI",
		"I_UAV_01_F",
		"I_UAV_02_CAS_F",
		"I_UAV_02_F",
		"I_UGV_01_F",
		"I_UGV_01_rcws_F",
		"O_UAV_01_F",
		"O_UAV_02_CAS_F",
		"O_UAV_02_F",
		"O_UGV_01_F",
		"O_UGV_01_rcws_F",
		"B_UAV_01_F",
		"B_UAV_02_CAS_F",
		"B_UAV_02_F",
		"B_UGV_01_F",
		"B_UGV_01_rcws_F"
		] - RHQs_Recon;
		
	_FO = RHQ_FO + 
		[
		"I_Spotter_F",
		"O_spotter_F",
		"B_spotter_F",
		"O_recon_JTAC_F",
		"B_recon_JTAC_F"
		] - RHQs_FO;
		
	_snipers = RHQ_Snipers + 
		[
		"I_Sniper_F",
		"O_sniper_F",
		"B_sniper_F",
		"I_Soldier_M_F",
		"O_soldier_M_F",
		"B_G_Soldier_M_F",
		"B_soldier_M_F",
		"O_recon_M_F",
		"B_recon_M_F",
		"O_soldierU_M_F"
		] - RHQs_Snipers;
		
	_ATinf = RHQ_ATInf + 
		[
		"I_Soldier_AT_F",
		"I_Soldier_LAT_F",
		"O_Soldier_AT_F",
		"O_Soldier_LAT_F",
		"B_soldier_AT_F",
		"B_soldier_LAT_F",
		"B_G_Soldier_LAT_F",
		"O_soldierU_AT_F",
		"O_soldierU_LAT_F",
		"O_recon_LAT_F",
		"B_CTRG_soldier_GL_LAT_F",
		"B_recon_LAT_F"
		] - RHQs_ATInf;
		
	_AAinf = RHQ_AAInf + 
		[
		"I_Soldier_AA_F",
		"B_soldier_AA_F",
		"O_Soldier_AA_F",
		"O_APC_Tracked_02_AA_F",
		"B_APC_Tracked_01_AA_F",
		"O_soldierU_AA_F"
		] - RHQs_AAInf;

	_Inf = RHQ_Inf + 
		[
		"I_crew_F",
		"I_engineer_F",
		"I_helicrew_F",
		"I_helipilot_F",
		"I_medic_F",
		"I_officer_F",
		"I_pilot_F",
		"I_Soldier_A_F",
		"I_Soldier_AA_F",
		"I_Soldier_AR_F",
		"I_Soldier_AT_F",
		"I_Soldier_exp_F",
		"I_soldier_F",
		"I_Soldier_GL_F",
		"I_Soldier_LAT_F",
		"I_Soldier_lite_F",
		"I_Soldier_M_F",
		"I_Soldier_repair_F",
		"I_Soldier_SL_F",
		"I_Soldier_TL_F",
		"I_soldier_UAV_F",
		"O_crew_F",
		"O_engineer_F",
		"O_helicrew_F",
		"O_helipilot_F",
		"O_medic_F",
		"O_officer_F",
		"O_Pilot_F",
		"O_Soldier_A_F",
		"O_Soldier_AA_F",
		"O_Soldier_AR_F",
		"O_Soldier_AT_F",
		"O_soldier_exp_F",
		"O_Soldier_F",
		"O_Soldier_GL_F",
		"O_Soldier_LAT_F",
		"O_Soldier_lite_F",
		"O_soldier_M_F",
		"O_soldier_PG_F",
		"O_soldier_repair_F",
		"O_Soldier_SL_F",
		"O_Soldier_TL_F",
		"O_soldier_UAV_F",
		"B_G_engineer_F",
		"B_G_medic_F",
		"B_G_officer_F",
		"B_G_Soldier_A_F",
		"B_G_Soldier_AR_F",
		"B_G_Soldier_exp_F",
		"B_G_Soldier_F",
		"B_G_Soldier_GL_F",
		"B_G_Soldier_LAT_F",
		"B_G_Soldier_lite_F",
		"B_G_Soldier_M_F",
		"B_G_Soldier_SL_F",
		"B_G_Soldier_TL_F",
		"B_crew_F",
		"B_engineer_F",
		"B_helicrew_F",
		"B_Helipilot_F",
		"B_medic_F",
		"B_officer_F",
		"B_Pilot_F",
		"B_Soldier_A_F",
		"B_soldier_AA_F",
		"B_soldier_AR_F",
		"B_soldier_AT_F",
		"B_soldier_exp_F",
		"B_Soldier_F",
		"B_Soldier_GL_F",
		"B_soldier_LAT_F",
		"B_Soldier_lite_F",
		"B_soldier_M_F",
		"B_soldier_PG_F",
		"B_soldier_repair_F",
		"B_Soldier_SL_F",
		"B_Soldier_TL_F",
		"B_soldier_UAV_F",
		"O_recon_exp_F",
		"O_recon_F",
		"O_recon_JTAC_F",
		"O_recon_LAT_F",
		"O_recon_M_F",
		"O_recon_medic_F",
		"O_recon_TL_F",
		"B_recon_exp_F",
		"B_recon_F",
		"B_recon_JTAC_F",
		"B_recon_LAT_F",
		"B_recon_M_F",
		"B_recon_medic_F",
		"B_recon_TL_F",
		"I_Sniper_F",
		"I_Spotter_F",
		"O_sniper_F",
		"O_spotter_F",
		"B_sniper_F",
		"B_spotter_F",
		"O_engineer_U_F",
		"O_soldierU_A_F",
		"O_soldierU_AA_F",
		"O_soldierU_AAA_F",
		"O_soldierU_AAR_F",
		"O_soldierU_AAT_F",
		"O_soldierU_AR_F",
		"O_soldierU_AT_F",
		"O_soldierU_exp_F",
		"O_soldierU_F",
		"O_SoldierU_GL_F",
		"O_soldierU_LAT_F",
		"O_soldierU_M_F",
		"O_soldierU_medic_F",
		"O_soldierU_repair_F",
		"O_SoldierU_SL_F",
		"O_soldierU_TL_F",
		"I_Soldier_AAA_F",
		"I_Soldier_AAR_F",
		"I_Soldier_AAT_F",
		"I_support_AMG_F",
		"I_support_AMort_F",
		"I_support_GMG_F",
		"I_support_MG_F",
		"I_support_Mort_F",
		"O_Soldier_AAA_F",
		"O_Soldier_AAR_F",
		"O_Soldier_AAT_F",
		"O_support_AMG_F",
		"O_support_AMort_F",
		"O_support_GMG_F",
		"O_support_MG_F",
		"O_support_Mort_F",
		"B_soldier_AAA_F",
		"B_soldier_AAR_F",
		"B_soldier_AAT_F",
		"B_support_AMG_F",
		"B_support_AMort_F",
		"B_support_GMG_F",
		"B_support_MG_F",
		"B_support_Mort_F",
		"I_diver_exp_F",
		"I_diver_F",
		"I_diver_TL_F",
		"O_diver_exp_F",
		"O_diver_F",
		"O_diver_TL_F",
		"B_diver_exp_F",
		"B_diver_F",
		"B_diver_TL_F",
		"I_Story_Colonel_F",
		"O_Story_CEO_F",
		"O_Story_Colonel_F",
		"I_G_Story_Protagonist_F",
		"B_Competitor_F",
		"B_RangeMaster_F",
		"B_Story_Colonel_F",
		"B_Story_Engineer_F",
		"B_Story_Pilot_F",
		"B_Story_Protagonist_F",
		"B_Story_SF_Captain_F",
		"B_Story_Tank_Commander_F",
		"B_CTRG_soldier_engineer_exp_F",
		"B_CTRG_soldier_M_medic_F",
		"B_CTRG_soldier_AR_A_F",
		"B_CTRG_soldier_GL_LAT_F",
		"I_G_Story_SF_Captain_F",
		"I_G_resistanceCommander_F",
		"I_G_resistanceLeader_F"
		] - RHQs_Inf;
		
	_Art = RHQ_Art + 
		[
		"B_MBT_01_arty_F",
		"O_MBT_02_arty_F",
		"B_MBT_01_mlrs_F",
		"I_Mortar_01_F",
		"O_Mortar_01_F",
		"B_G_Mortar_01_F",
		"B_Mortar_01_F"
		] - RHQs_Art;
		
	_HArmor = RHQ_HArmor + 
		[
		"B_MBT_01_cannon_F",
		"O_MBT_02_cannon_F"
		] - RHQs_HArmor;
		
	_MArmor = RHQ_MArmor + 
		[
		] - RHQs_MArmor;

	_LArmor = RHQ_LArmor + 
		[
		"I_APC_Wheeled_03_cannon_F",
		"O_APC_Tracked_02_AA_F",
		"O_APC_Tracked_02_cannon_F",
		"O_APC_Wheeled_02_rcws_F",
		"B_APC_Tracked_01_AA_F",
		"B_APC_Tracked_01_rcws_F",
		"B_APC_Wheeled_01_cannon_F"
		] - RHQs_LArmor;
		
	_LArmorAT = RHQ_LArmorAT + 
		[
		"I_APC_Wheeled_03_cannon_F",
		"O_APC_Tracked_02_cannon_F"
		] - RHQs_LArmorAT;

	_Cars = RHQ_Cars + 
		[
		"I_MRAP_03_F",
		"I_MRAP_03_gmg_F",
		"I_MRAP_03_hmg_F",
		"I_Quadbike_01_F",
		"I_Truck_02_covered_F",
		"I_Truck_02_transport_F",
		"O_MRAP_02_F",
		"O_MRAP_02_gmg_F",
		"O_MRAP_02_hmg_F",
		"O_Quadbike_01_F",
		"O_Truck_02_covered_F",
		"O_Truck_02_transport_F",
		"B_G_Offroad_01_armed_F",
		"B_G_Offroad_01_F",
		"B_G_Quadbike_01_F",
		"B_G_Van_01_transport_F",
		"B_MRAP_01_F",
		"B_MRAP_01_gmg_F",
		"B_MRAP_01_hmg_F",
		"B_Quadbike_01_F",
		"B_Truck_01_box_F",
		"B_Truck_01_covered_F",
		"B_Truck_01_mover_F",
		"B_Truck_01_transport_F",
		"I_Truck_02_ammo_F",
		"I_Truck_02_box_F",
		"I_Truck_02_fuel_F",
		"I_Truck_02_medical_F",
		"O_Truck_02_Ammo_F",
		"O_Truck_02_box_F",
		"O_Truck_02_fuel_F",
		"O_Truck_02_medical_F",
		"B_G_Van_01_fuel_F",
		"B_Truck_01_ammo_F",
		"B_Truck_01_Repair_F",
		"B_Truck_01_fuel_F",
		"B_Truck_01_medical_F",
		"I_UGV_01_F",
		"I_UGV_01_rcws_F",
		"O_UGV_01_F",
		"O_UGV_01_rcws_F",
		"B_UGV_01_F",
		"B_UGV_01_rcws_F"
		] - RHQs_Cars;
		
	_Air = RHQ_Air + 
		[
		"I_Heli_Transport_02_F",
		"I_Plane_Fighter_03_AA_F",
		"I_Plane_Fighter_03_CAS_F",
		"O_Heli_Attack_02_black_F",
		"O_Heli_Attack_02_F",
		"O_Heli_Light_02_F",
		"O_Heli_Light_02_unarmed_F",
		"B_Heli_Attack_01_F",
		"B_Heli_Light_01_armed_F",
		"B_Heli_Light_01_F",
		"B_Heli_Transport_01_camo_F",
		"B_Heli_Transport_01_F",
		"I_UAV_AI",
		"O_UAV_AI",
		"B_UAV_AI",
		"I_UAV_01_F",
		"I_UAV_02_CAS_F",
		"I_UAV_02_F",
		"O_UAV_01_F",
		"O_UAV_02_CAS_F",
		"O_UAV_02_F",
		"B_UAV_01_F",
		"B_UAV_02_CAS_F",
		"B_UAV_02_F"
		] - RHQs_Air;
		
	_BAir = RHQ_BAir + 
		[
		"I_Plane_Fighter_03_CAS_F"
		] - RHQs_BAir;
		
	_RAir = RHQ_RAir + 
		[
		"I_UAV_01_F",
		"I_UAV_02_CAS_F",
		"I_UAV_02_F",
		"O_UAV_01_F",
		"O_UAV_02_CAS_F",
		"O_UAV_02_F",
		"B_UAV_01_F",
		"B_UAV_02_CAS_F",
		"B_UAV_02_F"
		] - RHQs_RAir;
		
	_NCAir = RHQ_NCAir + 
		[
		"I_Heli_Transport_02_F",
		"O_Heli_Light_02_unarmed_F",
		"B_Heli_Light_01_F",
		"B_Heli_Transport_01_camo_F",
		"B_Heli_Transport_01_F",
		"I_UAV_01_F",
		"I_UAV_02_F",
		"O_UAV_01_F",
		"O_UAV_02_F",
		"B_UAV_01_F",
		"B_UAV_02_F"	
		] - RHQs_NCAir;

	_Naval = RHQ_Naval + 
		[
		"I_Boat_Armed_01_minigun_F",
		"I_Boat_Transport_01_F",
		"O_Boat_Armed_01_hmg_F",
		"O_Boat_Transport_01_F",
		"O_Lifeboat",
		"B_G_Boat_Transport_01_F",
		"B_Boat_Armed_01_minigun_F",
		"B_Boat_Transport_01_F",
		"B_Lifeboat",
		"I_SDV_01_F",
		"O_SDV_01_F",
		"B_SDV_01_F"	
		] - RHQs_Naval;

	_Static = RHQ_Static + 
		[
		"I_GMG_01_A_F",
		"I_GMG_01_F",
		"I_GMG_01_high_F",
		"I_HMG_01_A_F",
		"I_HMG_01_F",
		"I_HMG_01_high_F",
		"I_Mortar_01_F",
		"I_static_AA_F",
		"I_static_AT_F",
		"O_GMG_01_A_F",
		"O_GMG_01_F",
		"O_GMG_01_high_F",
		"O_HMG_01_A_F",
		"O_HMG_01_F",
		"O_HMG_01_high_F",
		"O_Mortar_01_F",
		"O_static_AA_F",
		"O_static_AT_F",
		"B_G_Mortar_01_F",
		"B_GMG_01_A_F",
		"B_GMG_01_F",
		"B_GMG_01_high_F",
		"B_HMG_01_A_F",
		"B_HMG_01_F",
		"B_HMG_01_high_F",
		"B_Mortar_01_F",
		"B_static_AA_F",
		"B_static_AT_F"
		] - RHQs_Static;
		
	_StaticAA = RHQ_StaticAA + 
		[
		"I_static_AA_F",
		"O_static_AA_F",
		"B_static_AA_F"
		] - RHQs_StaticAA;
		
	_StaticAT = RHQ_StaticAT + 
		[
		"I_static_AT_F",
		"O_static_AT_F",
		"B_static_AT_F"
		] - RHQs_StaticAT;
		
	_Support = RHQ_Support + 
		[
		"I_Truck_02_ammo_F",
		"I_Truck_02_box_F",
		"I_Truck_02_fuel_F",
		"I_Truck_02_medical_F",
		"O_Truck_02_Ammo_F",
		"O_Truck_02_box_F",
		"O_Truck_02_fuel_F",
		"O_Truck_02_medical_F",
		"B_G_Van_01_fuel_F",
		"B_APC_Tracked_01_CRV_F",
		"B_Truck_01_ammo_F",
		"B_Truck_01_Repair_F",
		"B_Truck_01_fuel_F",
		"B_Truck_01_medical_F"
		] - RHQs_Support;
		
	_Cargo = RHQ_Cargo + 
		[
		"I_Heli_Transport_02_F",
		"O_Heli_Attack_02_black_F",
		"O_Heli_Attack_02_F",
		"O_Heli_Light_02_F",
		"O_Heli_Light_02_unarmed_F",
		"B_Heli_Light_01_F",
		"B_Heli_Transport_01_camo_F",
		"B_Heli_Transport_01_F",
		"I_Truck_02_medical_F",
		"O_Truck_02_medical_F",
		"B_Truck_01_medical_F",
		"I_Boat_Armed_01_minigun_F",
		"I_Boat_Transport_01_F",
		"O_Boat_Armed_01_hmg_F",
		"O_Boat_Transport_01_F",
		"O_Lifeboat",
		"B_G_Boat_Transport_01_F",
		"B_Boat_Armed_01_minigun_F",
		"B_Boat_Transport_01_F",
		"B_Lifeboat",
		"I_SDV_01_F",
		"O_SDV_01_F",
		"B_SDV_01_F",
		"B_MBT_01_cannon_F",
		"I_APC_Wheeled_03_cannon_F",
		"O_APC_Tracked_02_cannon_F",
		"O_APC_Wheeled_02_rcws_F",
		"B_APC_Tracked_01_rcws_F",
		"B_APC_Wheeled_01_cannon_F",
		"I_MRAP_03_F",
		"I_MRAP_03_gmg_F",
		"I_MRAP_03_hmg_F",
		"I_Quadbike_01_F",
		"I_Truck_02_covered_F",
		"I_Truck_02_transport_F",
		"O_MRAP_02_F",
		"O_MRAP_02_gmg_F",
		"O_MRAP_02_hmg_F",
		"O_Quadbike_01_F",
		"O_Truck_02_covered_F",
		"O_Truck_02_transport_F",
		"B_G_Offroad_01_armed_F",
		"B_G_Offroad_01_F",
		"B_G_Quadbike_01_F",
		"B_G_Van_01_transport_F",
		"B_MRAP_01_F",
		"B_MRAP_01_gmg_F",
		"B_MRAP_01_hmg_F",
		"B_Quadbike_01_F",
		"B_Truck_01_box_F",
		"B_Truck_01_covered_F",
		"B_Truck_01_mover_F",
		"B_Truck_01_transport_F"	
		] - RHQs_Cargo;
		
	_NCCargo = RHQ_NCCargo + 
		[
		"I_Heli_Transport_02_F",
		"O_Heli_Light_02_unarmed_F",
		"B_Heli_Light_01_F",
		"B_Heli_Transport_01_camo_F",
		"B_Heli_Transport_01_F",
		"I_Truck_02_medical_F",
		"O_Truck_02_medical_F",
		"B_Truck_01_medical_F",
		"I_Boat_Transport_01_F",
		"O_Boat_Transport_01_F",
		"O_Lifeboat",
		"B_G_Boat_Transport_01_F",
		"B_Boat_Transport_01_F",
		"B_Lifeboat",
		"I_MRAP_03_F",
		"I_Quadbike_01_F",
		"I_Truck_02_covered_F",
		"I_Truck_02_transport_F",
		"O_MRAP_02_F",
		"O_Quadbike_01_F",
		"O_Truck_02_covered_F",
		"O_Truck_02_transport_F",
		"B_G_Offroad_01_F",
		"B_G_Quadbike_01_F",
		"B_G_Van_01_transport_F",
		"B_MRAP_01_F",
		"B_Quadbike_01_F",
		"B_Truck_01_box_F",
		"B_Truck_01_covered_F",
		"B_Truck_01_mover_F",
		"B_Truck_01_transport_F"	
		] - RHQs_NCCargo;
		
	_Crew = RHQ_Crew + 
		[
		"I_crew_F",
		"I_helicrew_F",
		"I_helipilot_F",
		"I_pilot_F",
		"O_crew_F",
		"O_helicrew_F",
		"O_helipilot_F",
		"O_Pilot_F",
		"B_crew_F",
		"B_helicrew_F",
		"B_Helipilot_F",
		"B_Pilot_F",
		"B_Story_Pilot_F"
		] - RHQs_Crew;
		
	_Other = RHQ_Other + 
		[
		"I_UAV_AI",
		"O_UAV_AI",
		"B_UAV_AI"	
		];
		
	_ammo = RHQ_Ammo + 
		[
		"I_Truck_02_ammo_F",
		"O_Truck_02_Ammo_F",
		"B_APC_Tracked_01_CRV_F",
		"B_Truck_01_ammo_F"
		] - RHQs_Ammo;
		
	_fuel = RHQ_Fuel + 
		[
		"I_Truck_02_fuel_F",
		"O_Truck_02_fuel_F",
		"B_G_Van_01_fuel_F",
		"B_APC_Tracked_01_CRV_F",
		"B_Truck_01_fuel_F"
		] - RHQs_Fuel;
		
	_med = RHQ_Med + 
		[
		"I_Truck_02_medical_F",
		"O_Truck_02_medical_F",
		"B_Truck_01_medical_F"
		] - RHQs_Med;
		
	_rep = RHQ_Rep + 
		[
		"I_Truck_02_box_F",
		"O_Truck_02_box_F",
		"B_APC_Tracked_01_CRV_F",
		"B_Truck_01_Repair_F"
		] - RHQs_Rep;
		
	_civF = ["CIV_F","CIV","CIV_RU","BIS_TK_CIV","BIS_CIV_special"];

	_basicrhq = _Inf + _Art + _HArmor + _LArmor + _Cars + _Air + _Naval + _Static;

	_Additionalrhq = _Other + _specFor + _recon + _FO + _snipers + _ATInf + _AAInf + _LArmorAT + _NCAir + _StaticAA + _StaticAT + _Cargo + _NCCargo + _Crew + _MArmor + _BAir + _RAir + _ammo + _fuel + _med + _rep;

	_total = _basicrhq + _Additionalrhq;

	_noInBasic = [];
	_noInAdditional = [];
	_noInTotal = [];

		{
		if not ((faction _x) in _civF) then
			{
			_type = typeOf _x;
			if not ((_type in _basicrhq) or (_type in _noInBasic)) then {_noInBasic set [(count _noInBasic),_type]};
			if not ((_type in _Additionalrhq) or (_type in _noInAdditional)) then {_noInAdditional set [(count _noInAdditional),_type]};
			if not ((_type in _total) or (_type in _noInTotal)) then {_noInTotal set [(count _noInTotal),_type]};
			}
		}
	foreach (AllUnits + Vehicles);

	diag_log "-------------------------------------------------------------------------";
	diag_log "-----------------------------RHQCHECK REPORT-----------------------------";
	diag_log "-------------------------------------------------------------------------";
	diag_log "Types not added to basic RHQ:";

		{
		diag_log format ["%1",_x];
		}
	foreach _noInBasic;

	diag_log "-------------------------------------------------------------------------";
	diag_log "Types not added to exact RHQ (not all must be):";

		{
		diag_log format ["%1",_x];
		}
	foreach _noInAdditional;

	diag_log "-------------------------------------------------------------------------";
	diag_log "Types not added anywhere:";

		{
		diag_log format ["%1",_x];
		}
	foreach _noInTotal;
	diag_log "-------------------------------------------------------------------------";
	diag_log "-------------------------END OF RHQCHECK REPORT--------------------------";
	diag_log "-------------------------------------------------------------------------";

	"RHQ CHECK" hintC format ["Forgotten classes: %1\nClasses not present in basic categories: %2\n(see RPT file for detailed forgotten classes list)",count _noInTotal,count _noInBasic];
	};