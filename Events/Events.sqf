//o OPFOR

aph_Efnc_OpforPatrol={
Hint "Starting Opfor market patrol";
OCP_Unload=false;
OCP_LoadUp=false;
OCP_Returning=false;
//Create and Load groups
_group=createGroup east;
{
_unit=Opfor_CephasGuard select _x;
[_unit] join _group;
_unit setVariable ["OriginalPos",(getpos _unit),true];
} foreach [5,6,9];

	_group1=createGroup east;
	{
	_unit=Opfor_CephasGuard select _x;
	[_unit] join _group1;
	}foreach [20,19,18,17,10,11,13];

		_group2=creategroup east;
		{
		_unit=Opfor_CephasGuard select _x;
		[_unit] join _group2;
		}foreach [25,26,27];
		
//First waypoints, get in vehicles
_wp=_group addWaypoint [Cephas_Armedtruck,0];
_wp setWaypointType "GETIN";
_wp setWaypointSpeed 'NORMAL';
_wp setWaypointBehaviour "SAFE";
_wp setWaypointStatements ["true","
	((units (group this)) select 0) assignasCargo Cephas_Armedtruck;
	((units (group this)) select 1) assignasgunner Cephas_Armedtruck;
	((units (group this)) select 2) assignasdriver Cephas_Armedtruck;
	"];

_wp1=_group1 addWaypoint [Cephas_CoveredTruck,0];
_wp1 setWaypointType "GETIN";
_wp1 setWaypointSpeed 'NORMAL';
_wp1 setWaypointBehaviour "SAFE";
_wp1 setWaypointStatements ["true","
	((units (group this)) select 0) assignasCargo Cephas_CoveredTruck;
	((units (group this)) select 1) assignasCargo Cephas_CoveredTruck;
	((units (group this)) select 2) assignasCargo Cephas_CoveredTruck;
	((units (group this)) select 3) assignasCargo Cephas_CoveredTruck;
	((units (group this)) select 4) assignasCargo Cephas_CoveredTruck;
	((units (group this)) select 5) assignAsCargo Cephas_CoveredTruck;
	((units (group this)) select 6) assignasDriver Cephas_CoveredTruck;
	"];
	
_wp2=_group2 addWaypoint [Cephas_Armedtruck_1,0];
_wp2 setWaypointType "GETIN";
_wp2 setWaypointSpeed 'NORMAL';
_wp2 setWaypointBehaviour "SAFE";
_wp2 setWaypointStatements ["true","
	((units (group this)) select 0) assignasCargo Cephas_Armedtruck_1;
	((units (group this)) select 1) assignasgunner Cephas_Armedtruck_1;
	((units (group this)) select 2) assignasdriver Cephas_Armedtruck_1;
	"];


//When soldiers are loaded into Big truck, start moving
waituntil {isEngineOn Cephas_CoveredTruck;};
_wp1=_group addwaypoint [[3046.78,1742.42,0.00102234],0];
_wp1 setWaypointType 'MOVE';
_wp1 setWaypointSpeed 'LIMITED';
_wp1 setWaypointBehaviour 'SAFE';
_wp1 setWaypointStatements ["true","OCP_LoadUp=true"];
sleep 2.5;
{[_x] join _group} foreach (units _group1);


//When Covered truck reaches first checkpoint, add new truck to group and move on
waituntil {OCP_LoadUp};
{[_x] join _group} foreach (units _group2);
_wp1=_group addwaypoint [[2662.74,680.065,0.0022583],0];
_wp1 setWaypointType 'UNLOAD';
_wp1 setWaypointSpeed 'LIMITED';
_wp1 setWaypointBehaviour 'SAFE';
_wp1 setWaypointStatements ["true","OCP_Unload=true"];

//When units reach town, two groups will patrol
waituntil {OCP_Unload};
sleep 60;
OpforPatrol_Units=(units _group);
_Ngroup=creategroup EAST;
_N1group=creategroup EAST;
{
_random=random 2.9;
	if ((vehicle _x)==_x) then {
		if (_random <1.5) then {
		[_x] join _Ngroup;
		};
		
		if (_random >1.5) then {
		[_x] join _N1group;
		};
	};

}foreach OpforPatrol_Units;
hint format ["%1 %2",units _ngroup,units _n1group];
/*
*/
_wp1=_Ngroup addwaypoint [[2663.84,620.481,0.00154877],30];
_wp1 setWaypointType 'MOVE';
_wp1 setWaypointSpeed 'LIMITED';
_wp1 setWaypointBehaviour 'SAFE';

_wp2=_N1group addwaypoint [[2600.36,623.771,0.00140762],30];
_wp2 setWaypointType 'MOVE';
_wp2 setWaypointSpeed 'LIMITED';
_wp2 setWaypointBehaviour 'SAFE';

sleep 120;

_wp1=_Ngroup addwaypoint [[2600.36,623.771,0.00140762],30];
_wp1 setWaypointType 'MOVE';
_wp1 setWaypointSpeed 'LIMITED';
_wp1 setWaypointBehaviour 'SAFE';

_wp2=_N1group addwaypoint [[2663.84,620.481,0.00154877],30];
_wp2 setWaypointType 'MOVE';
_wp2 setWaypointSpeed 'LIMITED';
_wp2 setWaypointBehaviour 'SAFE';

sleep 150;
_group=creategroup EAST;
{[_x] join _group;}foreach OpforPatrol_Units;

_wp=_group addwaypoint [Cephas_CoveredTruck,0];
_wp setWaypointType 'GETIN';
_wp setWaypointSpeed 'LIMITED';
_wp setWaypointBehaviour 'SAFE';
_wp setWaypointStatements ["true","OCP_Returning=true"];

_wp=_group addwaypoint [Cephas_DeviceTruck,0];
_wp setWaypointType 'GETOUT';
_wp setWaypointSpeed 'LIMITED';
_wp setWaypointBehaviour 'SAFE';
_wp setWaypointStatements ["true","OCP_Returning=true"];

waituntil {OCP_Returning};
sleep 10;
{_x domove (_x getvariable "OriginalPos");} foreach (units _group);


};

aph_Efnc_WestBGBoatAssault={
_group=creategroup EAST;
{[_x] join _group}foreach Opfor_BGSWBoatLaunch;

_wp1=_group addWaypoint [[2200.8,1354.38,0.001477],0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointSpeed 'NORMAL';
_wp1 setWaypointStatements ["true","OpBG_loadup=true;"];

waituntil {OpBG_loadup};
sleep 15;
(Opfor_BGSWBoatLaunch select 0) moveInDriver OpBG_Assaultboat1; 
(Opfor_BGSWBoatLaunch select 1) moveInCargo OpBG_Assaultboat1; 
(Opfor_BGSWBoatLaunch select 2) moveInCargo OpBG_Assaultboat1; 
(Opfor_BGSWBoatLaunch select 3) moveInCargo OpBG_Assaultboat1; 
_wp3=_group addWaypoint [[2289.37,1119.45,-0.0253792],0];
_wp3 setWaypointType "SAD";
_wp3 setWaypointSpeed 'NORMAL';
_wp3 setWaypointBehaviour "SAFE";

};
//c end Opfor



//o BLUFOR

aph_Efnc_BluforTransportheli={
hint "Starting Blufor heli pickup";

//move in driver and first WP
Blufor_HeliPilot moveInDriver AirBase_TransportHeli;
//Waypoint to avoid attacks
_wp2=(group Blufor_HeliPilot) addwaypoint [[395.725,1940.17,-1.77614],0];
_wp2 setWaypointType "MOVE";

waitUntil {(Blufor_HeliPilot distance [395.725,1940.17,-1.77614]) < 300};
_wp2=(group Blufor_HeliPilot) addwaypoint [[2428.02,1145.54,0.00152349],0];
_wp2 setWaypointType "MOVE";





//When unit is 150m from landing spot create heli pad and land there
waitUntil {(Blufor_HeliPilot distance [2428.02,1145.54,0.00152349]) < 150};
ap_pad= createVehicle ["Land_HelipadEmpty_F",[2428.02,1145.54,0.00152349], [], 0, "NONE"]; 
AirBase_TransportHeli land "land";
//delete helipad and wait when unit is on the ground
waitUntil {((getpos AirBase_TransportHeli) select 2)<6};
deleteVehicle ap_pad;
sleep 70;

//Make waypoint for home//Waypoint to avoid attacks
_wp2=(group Blufor_HeliPilot) addwaypoint [[395.725,1940.17,10],0];
_wp2 setWaypointType "MOVE";

waitUntil {(Blufor_HeliPilot distance [395.725,1940.17,10]) < 300};
_wp2=(group Blufor_HeliPilot) addwaypoint [[1729.28,5262.48,0.00143862],0];
_wp2 setWaypointType "MOVE";

//When unit is 150 from marker create pad and land there
waitUntil {(Blufor_HeliPilot distance [1729.28,5262.48,0.00143862]) < 150};
ap_pad= createVehicle ["Land_HelipadEmpty_F",[1729.28,5262.48,0.00143862], [], 0, "NONE"]; 
AirBase_TransportHeli land "land";
//when unit lands delete heli pad
waitUntil {((getpos AirBase_TransportHeli) select 2)<6};
deleteVehicle ap_pad;
};

//c 



//o INDEPENDENT
aph_Efnc_IndiRepCallBoat={
Hint "Starting Indi boat pickup";
Indi_KaminoBoatDriver moveInDriver Kamino_TransportBoat;
Indi_KaminoBoatDriver setvariable ["AssignedToTask",true,true];

//DEBUG MARKER
_null= [Indi_KaminoBoatDriver] spawn {

					_unit=_this select 0;
while {true} do {

					_id=format ["%1",_unit];
					_debug=createMarker [_id,(position _unit)];
					_debug setMarkerShape "ICON";
					_debug setMarkerType "hd_dot";
					_debug setMarkerColor "ColorOrange";
					_text="Driver";
					_txt=format ["%1",_text];
					_debug setMarkerText _txt;
					sleep 2;
					deleteMarker _debug;
};

}; //END DEBUG



//Move out of harbor
_wp2=(group Indi_KaminoBoatDriver) addwaypoint [[7366.08,5717.01,-2.15131],0];
_wp2 setWaypointType "MOVE";
waitUntil {(Indi_KaminoBoatDriver distance [7366.08,5717.01,-2.15131])<35};

//Open ocean
_wp2=(group Indi_KaminoBoatDriver) addwaypoint [[6925.57,2425.66,-2.20651],0];
_wp2 setWaypointType "MOVE";
waitUntil {(Indi_KaminoBoatDriver distance [6925.57,2425.66,-2.20651])<35};

//Near beach
_wp2=(group Indi_KaminoBoatDriver) addwaypoint [[3876.31,868.558,-2.20593],0];
_wp2 setWaypointType "MOVE";
waituntil {(Indi_KaminoBoatDriver distance [3876.31,868.558,-2.20593]) <15 };

_wp2=(group Indi_KaminoBoatDriver) addwaypoint [[2958.38,1040.25,-2.08263],0];
_wp2 setWaypointType "MOVE";
waituntil {(Indi_KaminoBoatDriver distance [2958.38,1040.25,-2.08263]) <15 };

//AT beach
sleep 70;
Kamino_TransportBoat setdir ((getdir Kamino_TransportBoat) + 180);
Indi_KaminoBoatDriver setpos [2958.38,1040.25,-2.08263];
Indi_KaminoBoatDriver moveindriver Kamino_TransportBoat;

//Set WP to near beach
_wp2=(group Indi_KaminoBoatDriver) addwaypoint [[3876.31,868.558,-2.20593],0];
_wp2 setWaypointType "MOVE";
waitUntil {(Indi_KaminoBoatDriver distance [3876.31,868.558,-2.20593])<50};

//Open ocean
_wp2=(group Indi_KaminoBoatDriver) addwaypoint [[6925.57,2425.66,-2.20651],0];
_wp2 setWaypointType "MOVE";
waitUntil {(Indi_KaminoBoatDriver distance [6925.57,2425.66,-2.20651])<50};

//Near Harbor
_wp2=(group Indi_KaminoBoatDriver) addwaypoint [[7366.08,5717.01,-2.15131],0];
_wp2 setWaypointType "MOVE";
waitUntil {(Indi_KaminoBoatDriver distance[7366.08,5717.01,-2.15131])<35};

//Harbor
_wp2=(group Indi_KaminoBoatDriver) addwaypoint [[6550.51,5436.82,-1.33659],0];
_wp2 setWaypointType "MOVE";
waitUntil {(Indi_KaminoBoatDriver distance [6550.51,5436.82,-1.33659])<35};
Indi_KaminoBoatDriver setpos [6560.5,5423.87,0.00200284];
Indi_KaminoBoatDriver setvariable ["AssignedToTask",false,true];

/*
[6550.51,5436.82,-1.33659]
[7366.08,5717.01,-2.15131]
[6925.57,2425.66,-2.20651]
[3876.31,868.558,-2.20593]
*/
};


//c 
