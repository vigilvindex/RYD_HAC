RydHQG_SpotsScan = false;

_spotsneeded = _this select 0;
_windroseOne = _this select 1;
_windroseTwo = _this select 2;
_scanRange = _this select 3;
_sectorLenght = _this select 4;
_sectorWidth = _this select 5;
_markscan = _this select 6;


//_step = (_sectorLenght + _sectorWidth)/30;
_step = 80;
_isdone = false;
_true = true;
RydHQG_GoodSpots = [];
for [{_steepnessInitial = 1},{(_steepnessInitial >= 1) and not (_isdone)},{_steepnessInitial = _steepnessInitial/1.5}] do
	{
	for [{_Y = ((_markscan) select 1) - _sectorWidth},{_Y <= ((_markscan) select 1) + _sectorWidth},{_Y = _Y + _step}] do
		{
		for [{_X = ((_markscan) select 0) - _sectorLenght},{_X <= ((_markscan) select 0) + _sectorLenght},{_X = _X + _step}] do
			{
			_scannedSpot = [_X,_Y];
				
				for [{_probeStep = 2.5;isgood = true},{(_probeStep <= _scanRange) and isgood},{_probeStep = 2*_probeStep}] do
					{
					_steepnessActual = _steepnessInitial/(1 + (10/_probeStep));
					_centralSpot = createTrigger["EmptyDetector",_scannedSpot]; 
					_probeNorth = createTrigger["EmptyDetector",[_X,_Y+_probeStep]];
					_probeSouth = createTrigger["EmptyDetector",[_X,_Y-_probeStep]];
					_probeEast = createTrigger["EmptyDetector",[_X+_probeStep,_Y]];
					_probeWest = createTrigger["EmptyDetector",[_X-_probeStep,_Y]];
					
						switch (_windroseOne) do
						{
						  case "N" : {
							  	if (((getposASL _centralSpot) select 2) <= (((getposASL _probeNorth) select 2)+_steepnessActual))
								  	exitwith {isgood = false};
									  	
										switch (_windroseTwo) do 
										  	{
										  	case "E":   {
											  		if (((getposASL _centralSpot) select 2) <= (((getposASL _probeEast) select 2)+_steepnessActual)) 
														exitwith {isgood = false}; if _true exitwith {isgood = true}
													};
									  
									  		case "W":   {
										  			if (((getposASL _centralSpot) select 2) <= (((getposASL _probeWest) select 2)+_steepnessActual)) 
									  					exitwith {isgood = false}; if _true exitwith {isgood = true}
									  				};
									  		default {if _true exitwith {isgood = true}}
									  		}
								 };
								 
						  case "S": {
							  	if (((getposASL _centralSpot) select 2) <= (((getposASL _probeSouth) select 2)+_steepnessActual))
								  	exitwith {isgood = false}; 
									  	
										switch (_windroseTwo) do 
											{
										  	case "E":   {
											  		if (((getposASL _centralSpot) select 2) <= (((getposASL _probeEast) select 2)+_steepnessActual)) 
									  					exitwith {isgood = false}; if _true exitwith{isgood = true}
									  				};
									  
									  		case "W":   {
										  			if (((getposASL _centralSpot) select 2) <= (((getposASL _probeWest) select 2)+_steepnessActual)) 
									  					exitwith {isgood = false}; if _true exitwith {isgood = true}
									  				};
									  		default {if _true exitwith {isgood = true}}
									  		}
								 };
						  
						  case "E": {
							  	if (((getposASL _centralSpot) select 2) <= (((getposASL _probeEast) select 2)+_steepnessActual))
								  	exitwith {isgood = false}; if _true exitwith {isgood = true}
								};
						  
						  case "W": {
							  	if (((getposASL _centralSpot) select 2) <= (((getposASL _probeWest) select 2)+_steepnessActual))
								  	exitwith {isgood = false}; if _true exitwith {isgood = true}
								};
						  
						  default {if _true exitwith {isgood = false}}
						  
									
						};
					
					deletevehicle _centralSpot;
					deletevehicle _probeNorth;
					deletevehicle _probeSouth;
					deletevehicle _probeEast;
					deletevehicle _probeWest
					
					
					};
				
					
					
			if (isgood) then 
				{
				 RydHQG_GoodSpots = RydHQG_GoodSpots + [_scannedSpot];
				if (RydHQG_Debug) then 
					{
					_goodmark = createMarker[(str _X)+(str _Y),_scannedSpot];
					_goodmark setMarkerColor "ColorBlack";
					_goodmark setMarkerShape "ICON";
					_goodmark setMarkerSize [0.2,0.2];
					((str _X)+(str _Y)) setMarkerType "mil_dot"
					}
				};
			if ((count RydHQG_GoodSpots) >= _Spotsneeded) exitwith {_isdone = true}
			
			}
		}
	};

isgood = nil;
RydHQG_SpotsScan = true;