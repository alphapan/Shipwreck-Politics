//Variables	
	_unitP=_this select 0;
	_unit=_unitP getvariable ["CurrentGroupMemberAssignTask","none"];
	_side=side _unitP;
	_ray=_unitP getvariable ["OwnedVehicles",[]];
	_veh=_ray select (lbCurSel 1701);
	//Have unit join solor group and get vehicle
		_group=creategroup _side;
		[_unit] join _group;
		_unit assignAsDriver _veh;
		[_unit] orderGetIn true;
		//_markScript=[_unit,"Retrieve",_unitP]execVM "VariablesF\LoopingMarker.sqf";
		
	//When unit in range get in vehicle and drive to player	
	waituntil { (_unit distance _veh) <= 3 };
		while {(_unit distance _unitP) >= 10 } do {
			_wp1=(group _unit) addwaypoint [(getpos _unitP),0];
			_wp1 setWaypointBehaviour "SAFE"; 
			_wp2=(group _unit) addwaypoint [(getpos _unitP),0];
			_wp2 setWaypointBehaviour "SAFE"; 
			sleep 15;
			};
	//When in range unit join player		
		[_unit] join _unitP;
		doGetOut _unit;
		terminate _markScript;
		_mark=_unit getVariable "MarkonSelf";
		deleteMarker _mark;