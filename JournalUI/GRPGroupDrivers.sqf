private ["_unit","_debug","_case","_unitP","_pos","_actionP","_veh","_group","_dist"];			
			
				_case=_this select 0;
				_unitP=_this select 1;
				_pos=_this select 2;
				_TaxiMan=driver (vehicle _unitP);
				_side= side _unitP;
				_veh=(vehicle _unitP);
				_actionP=_unitP getVariable ["DestinationAction",99];
			
				deletemarker ((name _unitP) + "destinationmarker");
				_unitP removeAction _ActionP;
				
					_group=creategroup _side;
					[_TaxiMan] join _group;
					
				//create marker					 
				_id=format ["%1",(name _unitP) + "destinationmarker"];
				_debug=createMarker [_id,_pos];
				_debug setMarkerShape "ICON";
				_debug setMarkerType "mil_end";
				_debug setMarkerColor "Colorblack";
				_txt=format ["%1","Destination"];
				_debug setMarkerText _txt;
					
				_action=_unitP addaction ["Stop taxi service",
							{
							_TaxiMan=_this select 3;
							[_TaxiMan] join (group (_this select 0));
							(_this select 0) removeAction (_this select 2);
							deletemarker ((name (_this select 0)) + "destinationmarker");
							_id = ["MapClick_ID","onMapSingleClick",{}] call BIS_fnc_addstackedEventHandler;
							}
						,_TaxiMan];	
				_unitP setVariable ["DestinationAction",_action,true];
				
			//Set waypoint
				
					_wp1=(group _TaxiMan) addwaypoint [_pos,0];
					_wp1 setWaypointBehaviour "SAFE";
					_wp1 setWaypointSpeed "LIMITED";
				_mark="Land_HelipadCivil_F" createVehicle _pos;	
				
				_dist=10;					
					switch (_case) do {
						case "Air": {_dist=114;};
						case "Ground": {_dist=14};
					};
					
				waituntil {(_TaxiMan distance (getmarkerpos _debug))<= _dist };
				
				(vehicle _unitP) land _mark;
				
					deleteMarker _debug;
					
					_unitP removeAction _action;
					[_TaxiMan] join _unitP;
					
					
				_id = ["MapClick_ID","onMapSingleClick",{}] call BIS_fnc_addstackedEventHandler;