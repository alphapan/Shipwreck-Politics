_unitP=_this select 0;
_unit=_unitP getvariable ["CurrentGroupMemberAssignTask","none"];
_type=typeof _unit;
_airport=_this select 1;
_veh=vehicle _unitP;

if (!((Vehicle _unit)==(vehicle _unitP))) then {
//creating new unit because settings from grounddriver.sqf to here is funky
	_pos=getpos _unit;
	_name=name _unit;
	_mRay=_unitP getvariable ["MemberArray",[]];
	_mRay=_mRay-[_unit];
	_unitP setVariable ["MemberArray",_mRay,true];
	deleteVehicle _unit;
	_mRay=_unitP getvariable ["MemberArray",[]];
	_group=creategroup civilian;
	_unit=_group createUnit [_type,_pos,[],0,"NONE"];
	_unit setpos _pos;
	_unit setName _name;
	_mRay=_mRay + [_unit];
	_unitP setVariable ["MemberArray",_mRay,true];
	_unit assignAsDriver _veh;
	[_unit] orderGetIn true;
	
waituntil {_unit distance (vehicle _unitP) <=8};
};

	if (getpos vehicle _unit select 2 <= 10) then { (vehicle _unit) setFuel 0.98;};

//order landing
(vehicle _unitP) landat _airport;
	
waituntil {(getpos vehicle _unit select 2) >= 55 };	

(vehicle _unitP) landat _airport;	
//when landing	
waituntil {(getpos vehicle _unit select 2) <= 10 };	
hint "Starting descent";
waituntil {(getpos vehicle _unit select 2) <= 3.5 };
sleep 20;

[_unit] join _unitP;
(vehicle _unit) engineOn false;
doGetOut _unit;
unassignVehicle _unit;


