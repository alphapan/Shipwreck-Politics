//////////////////
/*


FUNCTION CITY

*/
//////////////////

//killzone kid
KK_fnc_attachToRelative = {
    private ["_o","_v"];
    _o = _this select 0;
    _v = _this call KK_fnc_vectorDirAndUpRelative;
    _o attachTo [_this select 1];
    _o setVectorDirAndUp _v;
};

KK_fnc_vectorDirAndUpRelative = {
    private ["_o1","_o2","_v"];
    _o1 = _this select 0;
    _o2 = _this select 1;
    _v = _o2 worldToModelVisual [0,0,0];
    [
        _o2 worldToModelVisual vectorDirVisual _o1 vectorDiff _v,
        _o2 worldToModelVisual vectorUpVisual _o1 vectorDiff _v
    ]
};


//bapedibupa BIS WIKI
fnc_SetPitchBankYaw = { 
    private ["_object","_rotations","_aroundX","_aroundY","_aroundZ","_dirX","_dirY","_dirZ","_upX","_upY","_upZ","_dir","_up","_dirXTemp",
    "_upXTemp"];
    _object = _this select 0; 
    _rotations = _this select 1; 
    _aroundX = _rotations select 0; 
    _aroundY = _rotations select 1; 
    _aroundZ = (360 - (_rotations select 2)) - 360; 
    _dirX = 0; 
    _dirY = 1; 
    _dirZ = 0; 
    _upX = 0; 
    _upY = 0; 
    _upZ = 1; 
    if (_aroundX != 0) then { 
        _dirY = cos _aroundX; 
        _dirZ = sin _aroundX; 
        _upY = -sin _aroundX; 
        _upZ = cos _aroundX; 
    }; 
    if (_aroundY != 0) then { 
        _dirX = _dirZ * sin _aroundY; 
        _dirZ = _dirZ * cos _aroundY; 
        _upX = _upZ * sin _aroundY; 
        _upZ = _upZ * cos _aroundY; 
    }; 
    if (_aroundZ != 0) then { 
        _dirXTemp = _dirX; 
        _dirX = (_dirXTemp* cos _aroundZ) - (_dirY * sin _aroundZ); 
        _dirY = (_dirY * cos _aroundZ) + (_dirXTemp * sin _aroundZ);        
        _upXTemp = _upX; 
        _upX = (_upXTemp * cos _aroundZ) - (_upY * sin _aroundZ); 
        _upY = (_upY * cos _aroundZ) + (_upXTemp * sin _aroundZ); 		
    }; 
    _dir = [_dirX,_dirY,_dirZ]; 
    _up = [_upX,_upY,_upZ]; 
	[[_object,[_dir,_up]],"setVectorDirAndUp",true,FALSE] spawn BIS_fnc_MP;
};  

//Various Functions
AP_EnableSim={
_obj=_this select 0;
_bool=_this select 1;
_obj enableSimulationGlobal _bool;
};
AP_addactionMP ={
	private["_object","_screenMsg","_scriptToCall","_arg"];
	_object = _this select 0;
	_screenMsg = _this select 1;
	_scriptToCall = _this select 2;
	_arg=_this select 3;

	if(isNull _object) exitWith {};

	_object addaction [_screenMsg,_scriptToCall,_Arg,6];
};
aph_WarningTrigger={
_unit=_this select 0;


};

//JOURNAL UI//

//tabs
aphU_fnc_OpenCharacterPage={
disableSerialization;
closedialog 0;
_handle=createDialog "PlayerUINotebookCharacter";
_display = uiNameSpace getVariable "PlayerUINotebookCharacter";

//lbadd [1500,"VA Character"];
lbadd [1500,"Mission Journal"];
lbadd [1500,"Military Locations"];
lbadd [1500,"Mining Locations"];
	_LeftText = _display displayCtrl 1100;
	_RightText=	_display displayCtrl 1101;
	
_LeftText ctrlSetStructuredText (parsetext format ["
<t size='1.8' color='#000000'>
<t underline='true'>Character_Actions</t>
</t>
"]);

};
aphU_fnc_OpenCraftingPage={
disableSerialization;
closedialog 0;
_handle=createdialog "PlayerUINotebookCrafting";
_display = uiNameSpace getVariable "PlayerUINotebookCrafting";
		_LeftText = _display displayCtrl 1100;
		_RightText=	_display displayCtrl 1101;
_RightText ctrlSetStructuredText (parsetext format [""]);
_LeftText ctrlSetStructuredText (parsetext format ["
<t size='1.8' color='#000000'>
<t underline='true'>Buildable Objects</t></t>
"]);
lbclear 1500;		
lbAdd[1500,"Fortifications"];
lbAdd[1500,"Buildings"];
lbAdd[1500,"Building extensions"];
lbAdd[1500,"Furniture"];
lbAdd[1500,"Plants"];
_RightText ctrlSetStructuredText (parsetext format [
"<t size='1.8' color='#000000'>

</t>"]);
};
aphU_fnc_OpenInfluencePage={
disableSerialization;
closedialog 0;
_handle=createdialog "PlayerUINotebookInfluence";
	_display = uiNameSpace getVariable "PlayerUINotebookInfluence";
lbadd [1500,"Factions"];
lbadd [1500,"Towns"];
lbadd [1500,"Noteables"];

		_LeftText = _display displayCtrl 1100;
		_RightText=	_display displayCtrl 1101;
_RightText ctrlSetStructuredText (parsetext format ["

"]);
_LeftText ctrlSetStructuredText (parsetext format ["
<t size='1.8' color='#000000'>
<t underline='true'>Influence</t></t>
"]);
};
aphU_fnc_OpenGroupPage={
disableSerialization;
closedialog 0;
_handle=createdialog "PlayerUINotebookGroup";
_display = uiNameSpace getVariable "PlayerUINotebookGroup";
		_LeftText = _display displayCtrl 1100;
		_RightText=	_display displayCtrl 1101;
_RightText ctrlSetStructuredText (parsetext format [""]);
_LeftText ctrlSetStructuredText (parsetext format ["
<t size='1.8' color='#000000'><t underline='true'>Group_Members</t><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
</t>"]);

lbclear 1500;
_callerMembers=player getVariable ["MemberArray",[]];
{
lbadd [1500,name _x];
}foreach _callerMembers;

/*
_callerSoldiers= player getVariable ["SoldierArray",[]];
{
lbadd [1501,name _x];
}foreach _callerSoldiers;
*/
};

//CHARACTER
aph_fnc_CharacterPageList={
_index = lbCurSel 1500;
lbSetCurSel [1501,0];
_text = lbText [1500, _index];
disableSerialization;
	_display = uiNameSpace getVariable "PlayerUINotebookCharacter";
	_LeftText = _display displayCtrl 1100;
	_RightText=	_display displayCtrl 1101;
_LeftText ctrlSetStructuredText (parsetext format [""]);	
_RightText ctrlSetStructuredText (parsetext format [""]);	
lbclear 1501;
lbclear 1700;
lbclear 1701;
_unit=player;
switch (_text) do {
	case "Mission Journal": {
	_LeftText ctrlSetStructuredText (parsetext format ["
<t size='1.8' color='#000000'><t underline='true'>Character_Actions</t>
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
<t underline='true'>Current_Missions</t>"]);	
	_Missions=player getVariable ["CurrentMissions_ID",[]];
		lbclear 1501;
	{	lbadd [1501,_x] }foreach _missions;
	lbSetCurSel [1501,0];
	};
	case "Military Locations": {
	_LeftText ctrlSetStructuredText (parsetext format ["
<t size='1.8' color='#000000'>
<t underline='true'>Character_Actions</t>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<t underline='true'>Guarded_Locations</t>"]);
		lbclear 1501;
		lbadd [1501,"Review Guard Posts"];
		lbadd [1501,"Assign new Guard Post"];
		};
	case "Mining Locations": {
	_LeftText ctrlSetStructuredText (parsetext format ["
<t size='1.8' color='#000000'>
<t underline='true'>Character_Actions</t>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<t underline='true'>Mining_Locations</t>"]);
		lbclear 1501;
		lbadd [1501,"Known mining locations"];
		lbadd [1501,"Add mining location"];
	
	};
	
	//OFFLINE ATM
	case "VA Character": { [] spawn aph_fnc_CharacterVA};
	case "Claim house": {[_unit] spawn aph_fnc_ClaimHouse};
	case "Claim garage": {[_unit] spawn aph_fnc_ClaimGarage};
	case "Claim vehicle": {[_unit] spawn aph_fnc_ClaimVehicle};
	};//end switch
};
aph_fnc_CharacterBottomPage={
disableSerialization;
_display = uiNameSpace getVariable "PlayerUINotebookCharacter";
	_LeftText = _display displayCtrl 1100;
	_RightText=	_display displayCtrl 1101;
_indexT=lbcursel 1500;
_indexB=lbcursel 1501;
_textT= lbText [1500, _indexT];
_textB= lbText [1501, _indexB];

switch (_textT) do {
	case "Mission Journal": {
	_missionsID=player getVariable ["CurrentMissions_ID",[]];
	_missions=player getVariable ["CurrentMissions",[]];
	if (count _missions<=0) exitwith {
	_RightText ctrlSetStructuredText (parsetext format ["
<br/>
<br/>
<t size='1.5' color='#000000'>There an no active missions in your journal.</t>"]);
};
	_CurrentSelection=_missions select (_MissionsID find _textB);
	_description=_CurrentSelection select 1;
	_RightText ctrlSetStructuredText (parsetext format ["
<br/>
<br/>
<t size='1.8' color='#000000' underline='true' align=center>Mission_Description</t>
<br/>
<t size='1.5' color='#000000' >%1</t>",_description]);
	};
	case "Mining Locations":{
		switch (_textB) do {
			case "Known mining locations":{
			_RightText ctrlSetStructuredText (parsetext format ["
<t size='1.8' color='#000000' t underline='true'>Known_Mining_Locations</t>
				"]);
			lbClear 1700;
			lbClear 1701;
			_locations=player getVariable ["KnownMiningLocations",[]];
		if (count _locations <=0) exitwith {lbadd [1700,"No known mining locations"]};
			{lbadd [1700,(_x select 0) + " at " + (_x select 1)]}foreach _locations;
			};
			case "Add mining location":{
			_RightText ctrlSetStructuredText (parsetext format ["
<t size='1.8' color='#000000' t underline='true'>Local_Mining_Locations</t>
				"]);
			lbclear 1700;
			lbClear 1701;
			_RockList= (position player) nearObjects ["AP_GroundRock",10];
			if (count _RockList<=0) exitwith {lbadd [1700,"No ore within range."];};
			player setVariable ["QueriedRockList",_rocklist,true];
			{lbadd [1700,typeof _x];}foreach _rocklist;
			};
		
		};
	
	};
	case "Military Locations": {
		switch (_textB) do {
			case "Review Guard Posts": {
			_RightText ctrlSetStructuredText (parsetext format ["
<t size='1.8' color='#000000'  underline='true'>Guarding_Locations</t>
				"]);
			_ray=player getVariable ["GuardablePositions",[]];
			if ((count _ray)<=0) exitwith {lbclear 1700;lbadd [1700,"No Guardable Positions."]};
			lbclear 1700;
			{lbadd [1700,(_x select 0) + " at " + (mapGridPosition (_x select 1))];}foreach _ray;
			};
			case "Assign new Guard Post": {
			_RightText ctrlSetStructuredText (parsetext format ["
<t size='1.8' color='#000000'  underline='true'>Guarding_Locations</t>
				"]);
			lbclear 1700;
			lbadd [1700,"Assign Guard Post at this location."];
			};
		};
	
	};
	};//end switch top text


};
aph_fnc_CharacterRightTopList={
disableSerialization;
_display = uiNameSpace getVariable "PlayerUINotebookCharacter";
	_LeftText = _display displayCtrl 1100;
	_RightText=	_display displayCtrl 1101;
_indexLT=lbCurSel 1500;
_textLT= lbText [1500, _indexLT];
_indexLB=lbCurSel 1501;
_textLB= lbText [1501, _indexLB];
_indexRT=lbcursel 1700;

	switch (_textLT) do {
		case "Mining Locations": {
			switch (_textLB) do {
				case "Known mining locations": {
				_Known=player getVariable ["KnownMiningLocations",[]];
				_selected=_known select _indexRT;
					_type=_Selected select 0;
					_coord=_selected select 1;
					_OreRemain=_selected select 4;
					
				lbclear 1701;
				lbadd [1701,"Show on map"];
				_RightText ctrlSetStructuredText (parsetext format ["
<t size='1.8' color='#000000' underline='true'>Known_Mining_Locations</t><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<t size='1.8' color='#000000'>Ore type:</t><t size='1.8' color='#FFFFFF' shadow='2'> %1 </t><br/>
<t size='1.8' color='#000000'>Coordinate grid:</t><t size='1.8' color='#FFFFFF' shadow='2'> %2 </t><br/>
<t size='1.8' color='#000000'>Last known remaining:</t><t size='1.8' color='#FFFFFF' shadow='2'> %3 ounces </t>",_type,_coord,_OreRemain]);
				
				};
				case "Add mining location": {
_RightText ctrlSetStructuredText (parsetext format ["
<t size='1.8' color='#000000' t underline='true'>Local_Mining_Locations</t>
				"]);
					lbclear 1701;
					_ray=player getVariable ["QueriedRockList",[]];
					_selected=_ray select _indexRT;
					_pos=getposatl _selected;
					_Coord=mapGridPosition _selected;
					lbadd [1701,"Add " + (typeof _selected) + " at " + _coord];
				};
				
			
			
			};
		
		
		
		};
		case "Military Locations": {
			switch (_textLB) do {
				case "Assign new Guard Post":{
				closedialog 0;
				_diag=createDialog "SetGuardedLocationUI";
				};
				case "Review Guard Posts": {
				_ray=player getVariable ["GuardablePositions",[]];
				_GuardPost=_ray select (_indexRT);
					_name=_GuardPost select 0;
					_pos=_Guardpost select 1;
					_members=_Guardpost select 2;
					_notes=_GuardPost select 3;
					
			if ((count _ray)<=0) exitwith {};
				_RightText ctrlSetStructuredText (parsetext format ["
<t size='1.8' color='#000000' underline='true'>Guarding_Locations</t><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<t size='1.8' color='#000000' underline='true'>%1</t><br/>
<t size='1.8' color='#000000'>Stationed count:</t><t size='1.8' color='#FFFFFF' shadow='2'> %2 </t><br/>
<t size='1.8' color='#000000'>Map Coordinate:</t><t size='1.8' color='#FFFFFF' shadow='2'> %3</t><br/>
<t size='1.8' color='#000000'>Notes:</t><t size='1.8' color='#FFFFFF' shadow='2'>%4</t>",_name,count _members,mapGridPosition _pos,_notes]);
				
				
				};
			};
		};
	};


};
aph_fnc_CharacterRightBottomList={
_indexLT=lbCurSel 1500;
_textLT= lbText [1500, _indexLT];
_indexLB=lbCurSel 1501;
_textLB= lbText [1501, _indexLB];
_indexRT=lbcursel 1700;


	switch (_textLT) do {
		case "Mining Locations": {
			switch (_textLB) do {
				case "Add mining location": {
					lbclear 1701;
					_ray=player getVariable ["QueriedRockList",[]];
					_selected=_ray select _indexRT;
					_pos=getposatl _selected;
					_Coord=mapGridPosition _selected;
					
					_Known=player getVariable ["KnownMiningLocations",[]];	
					_positions=[];
					{_positions pushback (_x select 3)}foreach _known;
					if ((str _pos) in _positions) exitwith {hint "Known location"};
					
					_Known pushback [(typeof _selected),_Coord,_pos,str _pos,_selected getVariable ["MineralAmount",0]];
					player setVariable ["KnownMiningLocations",_Known,true];
					hint "Added location";
				};
				case "Known mining locations": {
					_Known=player getVariable ["KnownMiningLocations",[]];	
						_selected=_known select _indexRT;
						_type=_Selected select 0;
						_coord=_selected select 1;
						_pos=_selected select 2;
						_OreRemain=_selected select 4;
					_id=format ["%1",_type +"Location" + (str random 999999)];
					_debug=createMarker [_id,_pos];
					_debug setMarkerShape "ICON";
					_debug setMarkerType "hd_dot";
					_debug setMarkerColor "ColorOrange";
					_text=_type +" ore";
					_txt=format ["%1",_text];
					_debug setMarkerText _txt;	
				
					closedialog 0;
					openMap [true, false];
					waituntil {!visibleMap};
					deleteMarker _debug;
				};
			
			};
		
		
		
		};
	
	
	};
};
	//Page functions
aph_fnc_CharacterVA={
//Init stuff
closedialog 0;

_crate = player;
_WArray=player getVariable ["VAWeaponArray",[]];
_IArray=player getVariable ["VAItemArray",[]];
_BArray=player getVariable ["VABackpackArray",[]];
_MArray=player getVariable ["VAMagazineArray",[]];

[_crate,_WArray,true,false] call BIS_fnc_removeVirtualWeaponCargo;
[_crate,_BArray,true,false] call BIS_fnc_removeVirtualBackpackCargo;
[_crate,_IArray,true,false] call BIS_fnc_removeVirtualItemCargo;
[_crate,_MArray,true,false] call BIS_fnc_removeVirtualMagazineCargo;

_list = (position player) nearObjects ["Aph_Boxes",2];
_count=(count _list);

if (_count<=0) then { ["Open",false] spawn BIS_fnc_arsenal; } 
	else { 
	_box=_list select 0;
	_BoxVar=_box getvariable ["BoxOwnedBy",_box];

	_WeapCargo=weaponCargo _box;
	_itemCargo= itemCargo _box;
	_backpackCargo= backpackCargo _box;
	_magazineCargo= magazineCargo _box;

	if (_BoxVar==player) then {
	//Populate with predefined items and whatever is already in the crate
	[_crate, _backpackCargo,false,false] call BIS_fnc_addVirtualBackpackCargo;
	[_crate,_itemCargo,false,false] call BIS_fnc_addVirtualItemCargo;
	[_crate, _magazineCargo,false,false] call BIS_fnc_addVirtualMagazineCargo;
	[_crate,_WeapCargo,false,false] call BIS_fnc_addVirtualWeaponCargo;
	["Open",[nil,_crate],false] call bis_fnc_arsenal;
	} else {["Open",false] spawn BIS_fnc_arsenal;};

	player setVariable ["VAMagazineArray",_magazineCargo,true];
	player setVariable ["VABackpackArray",_backpackCargo,true];
	player setVariable ["VAItemArray",_itemCargo,true];
	player setVariable ["VAWeaponArray",_WeapCargo,true];
	};


};
aph_dfnc_SetGuardLocation={
disableSerialization;
_Display=uiNamespace getVariable "SetGuardedLocationUI";
_Edittext = ctrlText 1400;
_pos=position player;

_Positions=player getvariable ["GuardablePositions",[]];
_positions pushback [_editText,_pos,[]];
player setVariable ["GuardablePositions",_positions,true];

closedialog 0;
_diag=createdialog "PlayerUINotebookCharacter";
[] spawn aphU_fnc_OpenCharacterPage;
sleep 0.25;
lbSetCurSel [1500,1];
sleep 0.25;
lbSetCurSel [1501,0];
};

//GROUP page
aph_fnc_JournalGroupTopList={
disableSerialization;
_index=lbcursel 1500;
_textH=lbtext [1500,_index];
_array=player getVariable ["MemberArray",[]];
_unit= _array select _index;
_fact=_unit getvariable ["PersonalFaction",str (side _unit)+"Rating"];

player setvariable ["CurrentGroupMemberAssignTask",_unit];

_rightext=((uiNamespace getVariable "PlayerUINotebookGroup") displayCtrl 1101);
_rightext ctrlSetStructuredText parsetext format ["
"];
 _rightext ctrlSetStructuredText parsetext format ["
<t color='#0066CC' size='1.4'>Name:</t><t color='#FFFFFF' size='1.4' shadow=2> %1</t>",
 name _unit,_fact];
 //add jobs to list
lbclear 1700;
lbclear 1701;
lbadd [1700,"Customize Soldier"];
lbadd [1700,"Build jobs"];
lbadd [1700,"Gather ore"];
lbadd [1700,"Send to Guarded Location"];
//lbadd [1700,"Taxi Service"];
};
aph_fnc_JournalGroupBottomList={
disableSerialization;
_index=lbcursel 1501;
_array=player getVariable ["SoldierArray",[]];
_unit= _array select _index;
_fact=_unit getvariable ["PersonalFaction",str (side _unit)+"Rating"];

player setvariable ["CurrentGroupMemberAssignTask",_unit];
_rightext=((uiNamespace getVariable "PlayerUINotebookGroup") displayCtrl 1101);
_rightext ctrlSetStructuredText parsetext format ["
"];
 _rightext ctrlSetStructuredText parsetext format ["
<t color='#0066CC' size='1.2'>Name:</t><t color='#FFFFFF' size='1.2'> %1</t>",
 name _unit,_fact];
lbclear 1700;
lbclear 1701;
lbadd [1700,"Customize Soldier"];
lbadd [1700,"Command Squad"];
lbadd [1700,"Assign Guard Post"];
};
aph_fnc_JournalGroupRightTopList={
_index=lbCurSel 1700;
_text = lbText [1700, _index];

switch (_text) do {
	case "Build jobs": {	
			lbclear 1701;
			_list=player getvariable ["BuildableObjectList",[]];
			if (count _list<=0) exitwith {lbadd [1701,"No build jobs available."]};
				{
				_1=_x select 1;
				lbadd [1701,_1];
				}foreach _list;
			};
	case "Taxi Service": {
			lbclear 1701;
			_veh= vehicle player;
				if (_veh isKindOf "car") then {
					lbadd [1701,"Ground travel destination"];
				};
				if (_veh isKindOf "air") then {
					lbadd [1701,"Air travel destination"];
				};
			};		
	case "Head home": {
		lbclear 1701;
		lbadd [1701,"Do it"];
	};
	case "Send to Guarded Location": {
		lbclear 1701;
		_ray=player getvariable ["GuardablePositions",[]];
		if (count _ray<=0) exitwith {lbadd [1701,"No Guardable Positions."]};
		lbclear 1701;
		{lbadd [1701,(_x select 0) + " at " + (mapGridPosition (_x select 1))];}foreach _ray;
			};
	case "Gather ore": {
		lbclear 1701;
		_ray=player getVariable ["KnownMiningLocations",[["No known mining locations",[]]]];
		{lbadd [1701,(_x select 0)];}foreach _ray;
	
	};
	case "Customize Soldier": {
		lbclear 1701;
		lbadd [1701,"Customize " + (name (player getVariable "CurrentGroupMemberAssignTask"))];
	};

	};//end text switch
};
aph_fnc_JournalGroupRightBottomList={
_index=lbCurSel 1700;
_text = lbText [1700, _index];
_Btext = lbText [1701, lbcursel 1701];
_Lindex=lbCurSel 1500;
//_LBindex=lbcursel 1501;
player setVariable ["Lindex",_lindex,true];
player setVariable ["LBindex",_LBindex,true];
switch (_text) do {
	case "Build jobs": {
		_indexB=lbCurSel 1701;
		_list=player getvariable ["BuildableObjectList",[]];
		_unit=player getvariable ["CurrentGroupMemberAssignTask","none"];
		_reference=_list select _indexB;

		//Select group member to perform building
		_array=player getVariable ["MemberArray",[]];
			_array=_array-[_unit];
			player setvariable ["MemberArray",_array];
		//select cone identifier, get pos	
		_buildObject=_list select _indexB SELECT 0;

			_pos=getPosATL _buildObject;
		//select worker to build, worker run to buildsite
		
			_ghost=creategroup civilian;
			[_unit] join _ghost;
			lbSetColor [1701, _indexB, [1,0,0,0.8]];
			group _unit addWaypoint [_pos, 0];
			_unit addaction ["Form up","JournalUI\GRPJoinCallerGroup.sqf"];
		//waituntil unit is close to buildsite then build
		waitUntil {_unit distance _buildObject < 8};
		sleep 5;
		_sc=[_buildObject,_unit,_reference] spawn aph_fnc_BuildUpConstructionsite;
		_array=player getVariable ["BuildableObjectList",[]];
		_array=_array-[_reference];
		player setVariable ["BuildableObjectList",_array,true];
		_list=player getvariable ["BuildableObjectList",[]];
		waitUntil {scriptDone _sc};
		[_unit] join player;
			_array=player getVariable ["MemberArray",[]];
			_array=_array+[_unit];
			player setvariable ["MemberArray",_array];
			removeAllActions _unit;
		lbclear 1701;
			{
				_1=_x select 1;
				lbadd [1701,_1];
			}foreach _list;
			
			};
	case "Taxi Service": {
	_unit=player getvariable ["CurrentGroupMemberAssignTask","none"];
		switch ((lbText[1701,(lbcurSel 1701)])) do {
		
			case "Ground travel destination": {
				openMap true; 
				closeDialog 0;
				waitUntil { !isNull (findDisplay 46) };
				
					_id = ["MapClick_ID","onMapSingleClick", 
					{
					
				
				_null=["Ground",player,_pos] ExecVM "JournalUI\GRPGroupDrivers.sqf";
				
				
				}] call BIS_fnc_addstackedEventHandler;
			};
			case "Air travel destination": {
				_veh=(vehicle player);
			if (_veh isKindOf "Plane") then 
					{
					lbclear 1701; 
					lbadd [1701,"Altis Airbase"]; 
					lbadd [1701,"AAC Airfield"]; 
					lbadd [1701,"Krya Nera Airstrip"]; 
					lbadd [1701,"Selakeno Airfield"];
					lbadd [1701,"Molos Airfield"];
					lbadd [1701,"Almyra Salt Lake Airstrip"];
					}
			else
					{
					if (isnull (driver player)) exitwith 	{
				hint "Your vehicle needs a driver to preform taxi services.";
				};
					closedialog 0;
					openMap true;
				waitUntil { !isNull (findDisplay 46) };
				
				_id = ["MapClick_ID","onMapSingleClick", 
					{
					
				null=["Air",player,_pos] ExecVM "JournalUI\GRPGroupDrivers.sqf";
				
				}] call BIS_fnc_addstackedEventHandler;
					};
			};
			case "Altis Airbase": {
			null=[player,0]execVM "JournalUI\GRPPlaneTaxi.sqf";
			closedialog 0;
			};
			case "AAC Airfield": {
			null=[player,1]execVM "JournalUI\GRPPlaneTaxi.sqf";
			closedialog 0;
			};
			case "Krya Nera Airstrip": {
			null=[player,2]execVM "JournalUI\GRPPlaneTaxi.sqf";
			closedialog 0;
			};
			case "Selakeno Airfield": {
			null=[player,3]execVM "JournalUI\GRPPlaneTaxi.sqf";
			closedialog 0;
			};
			case "Molos Airfield": {
			null=[player,4]execVM "JournalUI\GRPPlaneTaxi.sqf";
			closedialog 0;
			};
			case "Almyra Salt Lake Airstrip": {
			null=[player,5]execVM "JournalUI\GRPPlaneTaxi.sqf";
			closedialog 0;
			};
		
		};
	};
	case "Head home": {
	_unit=player getvariable ["CurrentGroupMemberAssignTask","none"];
	_home=player getvariable ["OwnedHouse","none"];
	if ("none" ==_home) then {Hint "No home destination";} else {
	_group=creategroup civilian;
	[_unit] join _group;
	_unit doMove (getpos _home);
		};
	};
	case "Retrieve vehicle": {
		_null=[player]ExecVM "JournalUI\GRPRetrieveVehicle.sqf";
	};
	case "Gather ore": {
	
		_index=lbCurSel 1701;
		_null=[_index] spawn aph_fnc_GroupGatherOre;
		closedialog 0;
	};
	case "Customize Soldier": {
		_gMember=(player getVariable "CurrentGroupMemberAssignTask");
		[_gMember] spawn aph_SwitchCharacter;
	};
	case "Send to Guarded Location": {
		_ray=player getvariable ["GuardablePositions",[]];
	if (count _ray<=0) exitwith {};
		_unit=player getvariable ["CurrentGroupMemberAssignTask","none"];
		_GuardPost=_ray select lbcursel 1701;
			_name=_GuardPost select 0;
			_pos=_GuardPost select 1;
			_members=_GuardPost select 2;
		_side=side player;
		
	_group=createGroup _side;
	[_unit] join _group;
	_unit doMove _pos;
	[[[_members,_unit,_ray,lbcursel 1701,_guardpost],{
			_members=_this select 0;
			_unit=_this select 1;
			_ray=_this select 2;
			_index=_this select 3;
			_guardpost=_this select 4;
			
			_ray set [_index,[_GuardPost select 0,_GuardPost select 1,_members,""]];
			_members set [count _members,[typeof _unit,([_unit] call getLoadout)]];
		}], "BIS_fnc_spawn",false, false] call BIS_fnc_MP;
	
	closedialog 0;
	
	};
	};//end switch
};
	//Page functions
aph_fnc_GroupGatherOre={
_index=_this select 0;
_worker=(player getVariable "CurrentGroupMemberAssignTask");
_ray=player getVariable ["KnownMiningLocations",[]];
if (count _ray<=0) exitwith {};
_selection=_ray select _index;
_type=_selection select 0;
_coord=_selection select 1;
_pos=_selection select 2;
_side=side player;
//Add unit to new group and unassign from player groups
_group=createGroup _side;
[_worker] join _group;
_gArray=player getvariable [(_worker getVariable "InMemberArray") + "Array",[]];
_gArray=_gArray - [_worker];
player setvariable [(_worker getVariable "InMemberArray") + "Array",_gArray,true];

//unit move to rock location
_worker doMove _pos;
while {(_worker distance _pos)>=14} do {sleep 20;_worker doMove _pos;};
[[[_worker], {(_this select 0) playMove "AinvPknlMstpSnonWnonDr_medicUp1";}], "BIS_fnc_call", true, false] call BIS_fnc_MP;
sleep 1;
_typename="";
switch (_type) do {
	case "Iron_rock": {_typename="aph_IronOre"};
	case "Gold_rock": {_typename="aph_goldore"};
	case "Stone_rock": {_typename="aph_StoneGravel"};
	case "Platinum_rock": {_typename="aph_PlatinumOre"};
	case "Wool_source": {_typename="aph_woolfiber"};
	case "Flax_source": {_typename="aph_flaxfiber"};
	case "Wood_Source": {_typename="aph_Woodpiece"};
	case "Grass_source": {_typename="aph_switchgrass"};
	
	};
for "_a" from 1 to 20 do {
	_worker additem _typeName;
};
sleep 3;


_worker doMove (position player);
while {(_worker distance (position player))>=6} do {
_worker doMove (position player);
sleep 15;
};
[_worker] join player;
_gArray=player getvariable [(_worker getVariable "InMemberArray") + "Array",[]];
_gArray=_gArray + [_worker];
player setvariable [(_worker getVariable "InMemberArray") + "Array",_gArray,true];

};
aph_fnc_GroupGuardPost={

};
aph_fnc_GroupSoldierPatrol={
closedialog 0;
_unit=(player getVariable "SoldierArray") select (player getVariable "LBindex");
//open map to mark locations
openMap [true, false];
waituntil {visibleMap};
hint "map open";
//Add map click editing
_id = ["MapClick_GP","onMapSingleClick",{
		/*
		_pos
		_units
		_shift
		_alt
		*/
		_unit=_this;
		_PArray=_unit getvariable ["CurrentPatrol",[]];
		_PArray pushback _pos;
		hint format ["%1",_Parray];

},_unit] call BIS_fnc_addstackedEventHandler;

waitUntil {!visibleMap};
["MapClick_GP","onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
hint "map closed";
};

//INFLUENCE page
aph_fnc_JournalInfluenceTopList={
disableSerialization;
_index=lbCurSel 1500;
_text = lbText [1500, _index];
_display = uiNameSpace getVariable "PlayerUINotebookInfluence";
	_LeftText = _display displayCtrl 1100;
	_RightText=	_display displayCtrl 1101;
switch (_text) do {
	case "Factions": {
_lefttext ctrlSetStructuredText (parseText format ["
<t size='1.8' color='#000000' underline='true'>Influence<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>Factions</t>"]);
		lbclear 1501;
		lbadd [1501,"Blufor"];
		lbadd [1501,"Opfor"];
		lbadd [1501,"Guerilla"];
		lbadd [1501,"Civilian"];
	};
	case "Towns": {
_lefttext ctrlSetStructuredText (parseText format ["
<t size='1.8' color='#000000' underline='true'>Influence<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>Towns</t>"]);
		lbclear 1501;
		_List=player getVariable ["KnownTownRatings",[["You have not discovered any towns.",0]]];
		{lbadd [1501,(_x select 0)]}foreach _list;
	
	};
	case "Noteables": {
_lefttext ctrlSetStructuredText (parseText format ["
<t size='1.8' color='#000000' underline='true'>Influence<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>Noteable_Characters</t>"]);		
		lbclear 1501;
		_List=player getVariable ["SavedNotableRatings",[]];
		{lbadd [1501,(_x select 0)]}foreach _list;
	
	};
};



};
aph_fnc_JournalInfluenceBottomList={
disableSerialization;
_display = uiNameSpace getVariable "PlayerUINotebookInfluence";
	_LeftText = _display displayCtrl 1100;
	_RightText=	_display displayCtrl 1101;
_indexT=lbcursel 1500;
_indexB=lbcursel 1501;
_textT= lbText [1500, _indexT];
_textB= lbText [1501, _indexB];
_RightText ctrlSetStructuredText (parsetext format [""]);
switch (_textT) do {

	case "Factions": {
		switch (_indexB) do {
			case 0: {
			_Rating=player getvariable ["WESTRATING",0];
_RightText ctrlSetStructuredText (parsetext format ["
<t size='1.8' color='#000000' underline='true'>Blufor_Relations<t/><br/>
<t size='1.5' color='#000000' underline='false'>Standing: <t/><t size='1.5' color='#FFFFFF' shadow='2'>%1<t/><br/><br/>
<t size='1.8' color='#000000' underline='true' shadow='0'>Faction_Clans<t/>
",_rating]);			
			};
			case 1: {
			_Rating=player getvariable ["EASTRATING",0];
_RightText ctrlSetStructuredText (parsetext format ["
<t size='1.8' color='#000000' underline='true'>Opfor_Relations<t/><br/>
<t size='1.5' color='#000000' underline='false'>Standing: <t/><t size='1.5' color='#FFFFFF' shadow='2'>%1<t/><br/><br/>
<t size='1.8' color='#000000' underline='true' shadow='0'>Faction_Clans<t/><t size='1.5' color='#FFFFFF' shadow='2'>%2<t/><br/><br/>
",_rating]);			
			
			};
			case 2: {
			_Rating=player getvariable ["GUERRATING",0];
_RightText ctrlSetStructuredText (parsetext format ["
<t size='1.8' color='#000000' underline='true'>Guerilla_Relations<t/><br/>
<t size='1.5' color='#000000' underline='false'>Standing: <t/><t size='1.5' color='#FFFFFF' shadow='2'>%1<t/><br/><br/>
<t size='1.8' color='#000000' underline='true' shadow='0'>Faction_Clans<t/>
",_rating]);			
				
			};
			case 3: {
			_Rating=player getvariable ["CIVRATING",0];
_RightText ctrlSetStructuredText (parsetext format ["
<t size='1.8' color='#000000' underline='true'>Civilian_Relations<t/><br/>
<t size='1.5' color='#000000' underline='false'>Standing: <t/><t size='1.5' color='#FFFFFF' shadow='2'>%1<t/><br/><br/>
<t size='1.8' color='#000000' underline='true' shadow='0'>Faction_Clans<t/>
",_rating]);		
			};
		
		};
	
	
	
	};
	case "Towns": {};
	case "Noteables": {};
	
	
};




};
aph_fnc_JournalInfluenceRightTopList={

};
aph_fnc_JournalInfluenceRightBottomList={

};
//BUILD page
aph_fnc_JournalCraftingTopList={
disableSerialization;
_index=lbcursel 1500;
_text = lbText [1500, _index];
_objects = [];
if (_text=="Fortifications") then {
	_display = uiNameSpace getVariable "PlayerUINotebookCrafting";
		_ctrl = _display displayCtrl 1501;
	_objects=player getvariable ["APH_FortificationBuildList",[]];	
	lbClear 1501;
	{
		_index = _ctrl lbAdd (_x select 0);
	} forEach _objects;
};
if (_text=="Buildings") then {
	_display = uiNameSpace getVariable "PlayerUINotebookCrafting";
		_ctrl = _display displayCtrl 1501;
	_objects=player getvariable ["APH_BuildingBuildList",[]];	
	lbClear 1501;
	{
		_index = _ctrl lbAdd (_x select 0);
	} forEach _objects;
};
if (_text=="Building extensions") then {
	_display = uiNameSpace getVariable "PlayerUINotebookCrafting";
		_ctrl = _display displayCtrl 1501;
	_objects=player getvariable ["APH_BExtensionBuildList",[]];	
	lbClear 1501;
	{
		_index = _ctrl lbAdd (_x select 0);
	} forEach _objects;
};
if (_text=="Furniture") then {
	_display = uiNameSpace getVariable "PlayerUINotebookCrafting";
		_ctrl = _display displayCtrl 1501;
	_objects=player getvariable ["APH_FurnitureBuildList",[]];	
	lbClear 1501;
	{
		_index = _ctrl lbAdd (_x select 0);
	} forEach _objects;
};
if (_text=="Plants") then {
	_display = uiNameSpace getVariable "PlayerUINotebookCrafting";
		_ctrl = _display displayCtrl 1501;
		
		_cargo=itemCargo player;
		lbClear 1501;
		if ("aph_PineSapling" in _cargo) then {lbadd[1501,"Pine sapling"];};
		if ("aph_PalmSapling" in _cargo) then {lbadd[1501,"Palm sapling"];};
		if ("aph_MulberrySapling" in _cargo) then {lbadd[1501,"Paper Mulberry sapling"];};
		if ("aph_WheatSeed" in _cargo) then {lbadd[1501,"Wheat Stalk"];};
		/*
	_playerList1=getitemcargo uniformcontainer player; 
	_playerList2=getitemcargo vestcontainer player; 
	_playerList3=getitemcargo backpackcontainer player; 
	_itemsUni= _playerList1 select 0;
	_itemsVest= _playerList2 select 0;
	_itemsBack= _playerList3 select 0;
	_FullitemList=_itemsUni+_itemsVest+_itemsBack;	
	lbClear 1501;
	{
		
		if (_x=="aph_PineSapling") then {lbadd[1501,"Pine sapling"];};
		if (_x=="aph_PalmSapling") then {lbadd[1501,"Palm sapling"];};
		if (_x=="aph_MulberrySapling") then {lbadd[1501,"Paper Mulberry sapling"];};
		if (_x=="aph_WheatSeed") then {lbadd[1501,"Wheat Stalk"];};
		
		
	} forEach _FullitemList;
	*/
};
};


aph_fnc_JournalCraftingBottomList={
disableSerialization;
_indextop=lbcursel 1500;
_indexbttm=lbcursel 1501;
_text=lbtext [1501,_indexbttm];
_toptext=lbtext [1500,_indextop];
if (_toptext=="Plants") exitwith {closedialog 0;[_text] call aph_fnc_PlacePlant;};
if !(_text=="Wheat Stalk") then {closeDialog 0;closeDialog 1;};
_display = uiNameSpace getVariable "PlayerUINotebookCrafting";
		_LeftText = _display displayCtrl 1100;
		_RightText=	_display displayCtrl 1101;

//Build Selected Object
_fortlist=player getvariable ["APH_FortificationBuildList","none"];
_buildinglist=player getvariable ["APH_BuildingBuildList","none"];
_BExtlist=player getvariable ["APH_BExtensionBuildList","none"];
_Towerlist=player getvariable ["APH_FurnitureBuildList","none"];

switch(_indexTop) do {
	case 0: {player setvariable ["CurrentBuildingArrayShown",_fortlist];};
	case 1: {player setvariable ["CurrentBuildingArrayShown",_buildinglist];};
	case 2: {player setvariable ["CurrentBuildingArrayShown",_BExtlist];};
	case 3: {player setvariable ["CurrentBuildingArrayShown",_Towerlist];};
};
_list=player getvariable "CurrentBuildingArrayShown";
_create=(_list select _indexbttm) select 1;
_CostArray=(_list select _indexbttm) select 2;

if (_create=="aph_bp_PersonalGarage") then {_create="ap_BuildGarage";};
if (_create=="aph_bp_BuildingTable") then {_create="ap_BuildTable";};

_veh= _create createVehicle position player;
	_type=typeof _veh;
//set distance from player based on object type
	//default
_veh attachto [player, [0, 2, 0.5] ];
	//others
	if (_type=="Land_i_Garage_V1_F") then {_veh attachto [player, [0, 5, 0.5] ];};
	if (_type=="Land_ShelvesWooden_F") then {_veh attachto [player, [0, 1.5, 0.5] ];};
	
(findDisplay 46) displaySetEventHandler ["MouseZchanged","_this call AP_AdjustAttached"];
(findDisplay 46) displaySetEventHandler ["KeyDown","_this call AP_key;false;"];
player setvariable ["AP_CurrentCarryObject",_veh,true];
player setvariable ["HoldingObject",true,true];
_veh setVariable ["NeedsBuilt",true,true];
_veh setVariable ["CostArray",_CostArray,true];
};
aph_fnc_BuildObjectUISingle={
_indextop=lbcursel 1500;
_indexbttm=lbcursel 1501;
_display = uiNameSpace getVariable "PlayerUINotebook";
		_LeftText = _display displayCtrl 1100;
		_RightText=	_display displayCtrl 1101;

_fortlist=player getvariable ["APH_FortificationBuildList","none"];
_buildinglist=player getvariable ["APH_BuildingBuildList","none"];
_BExtlist=player getvariable ["APH_BExtensionBuildList","none"];
_Towerlist=player getvariable ["APH_FurnitureBuildList","none"];
_plantlist=player getvariable ["APH_PlantBuildList","none"];

switch(_indexTop) do {
	case 0: {player setvariable ["CurrentBuildingArrayShown",_fortlist];};
	case 1: {player setvariable ["CurrentBuildingArrayShown",_buildinglist];};
	case 2: {player setvariable ["CurrentBuildingArrayShown",_BExtlist];};
	case 3: {player setvariable ["CurrentBuildingArrayShown",_Towerlist];};
	case 4: {player setvariable ["CurrentBuildingArrayShown",_plantlist];};
};
_list=player getvariable "CurrentBuildingArrayShown";
_currentObjectArray=_list select _indexbttm;

//		0				1			2		3	 4     5	6	  7   8     9     10	
//["Display Name","Item_Created",IRONcost,steel,Plat,Stone,Wool,Flax,Wood,Grass,"imagepath"]

	_Name=_currentObjectArray select 0;
	_objectpath=_currentObjectArray select 1;
	_Iron=_currentObjectArray select 2;
	_steel=_currentObjectArray select 3;
	_plati=_currentObjectArray select 4;
	_stone=_currentObjectArray select 5;
	_wool=_currentObjectArray select 6;
	_flax=_currentObjectArray select 7;
	_wood=_currentObjectArray select 8;
	_grass=_currentObjectArray select 9;
	_picture=_currentObjectArray select 10;
//Change Left page
_righttext ctrlSetStructuredText (parsetext format [
"<t size='1.8' align='center' color='#000000'>
%1<br />
Object Cost:<br />
Iron bar:		%2<br />
Steel bar:		%3<br />
Platinum bar:	%4<br />
Stone brick:	%5<br />
Wool cloth:		%6<br />
Flax fiber:		%7<br />
Wood plank:		%8<br />
Plastic bar:	%9<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
</t>",
_Name,
_Iron,
_steel,
_plati,
_stone,
_wool,
_flax,
_wood,
_grass,
_picture]);

//Change right page
_LeftText ctrlSetStructuredText (parsetext format [
"<t size='1.8' align='center' color='#000000' >
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
</t>"]);
};

//BUILDING ground objects
aph_fnc_BuildObjectsUIEnd={
closeDialog 0;
closeDialog 1;
_indextop=lbcursel 1500;
_indexbttm=lbcursel 1501;
_display = uiNameSpace getVariable "PlayerUINotebook";
		_LeftText = _display displayCtrl 1100;
		_RightText=	_display displayCtrl 1101;


//Build Selected Object
_fortlist=player getvariable ["APH_FortificationBuildList","none"];
_buildinglist=player getvariable ["APH_BuildingBuildList","none"];
_BExtlist=player getvariable ["APH_BExtensionBuildList","none"];
_Towerlist=player getvariable ["APH_FurnitureBuildList","none"];
_plantlist=player getvariable ["APH_PlantBuildList","none"];

switch(_indexTop) do {
	case 0: {player setvariable ["CurrentBuildingArrayShown",_fortlist];};
	case 1: {player setvariable ["CurrentBuildingArrayShown",_buildinglist];};
	case 2: {player setvariable ["CurrentBuildingArrayShown",_BExtlist];};
	case 3: {player setvariable ["CurrentBuildingArrayShown",_Towerlist];};
	case 4: {player setvariable ["CurrentBuildingArrayShown",_plantlist];};
};
_list=player getvariable "CurrentBuildingArrayShown";
_create=_list select _indexbttm select 1;

_veh= _create createVehicle position player;
_veh attachto [player, [0, 3, 0.5] ];
player setvariable ["AP_CurrentCarryObject",_veh,true];
(findDisplay 46) displaySetEventHandler ["MouseZchanged","_this call AP_AdjustAttached"];
(findDisplay 46) displaySetEventHandler ["KeyDown","_this call AP_key;false;"];

/*
_action=player addAction ["Drop", {player setvariable ["ReadytoDrop",true,true];}];
waituntil {player getvariable "ReadytoDrop"};

if (_veh isKindOf "Fence") then {
_veh setvariable ["HarvestAmount",3];
_veh setvariable ["HarvestItem","sc_potato"];
[_veh] spawn aph_fnc_PlacePlant;
} else { [_veh] spawn aph_fnc_PutBuildingFirstObject;};

player removeaction _action;
player setvariable ["ReadytoDrop",false,true];
*/

};
aph_fnc_BuildObjectsUIStart={

_index=lbcursel 1500;
_text = lbText [1500, _index];
_objects = [];
if (_text=="Fortifications") then {
	_display = uiNameSpace getVariable "PlayerUINotebook";
		_ctrl = _display displayCtrl 1501;
	_objects=player getvariable ["APH_FortificationBuildList","none"];	
	lbClear 1501;
	{
		_index = _ctrl lbAdd _x;
	} forEach _objects;
};
if (_text=="Buildings") then {
	_display = uiNameSpace getVariable "PlayerUINotebook";
		_ctrl = _display displayCtrl 1501;
	_objects=player getvariable ["APH_BuildingBuildList","none"];	
	lbClear 1501;
	{
		_index = _ctrl lbAdd (_x select 0);
	} forEach _objects;
};
if (_text=="Building extensions") then {
	_display = uiNameSpace getVariable "PlayerUINotebook";
		_ctrl = _display displayCtrl 1501;
	_objects=player getvariable ["APH_BExtensionBuildList","none"];	
	lbClear 1501;
	{
		_index = _ctrl lbAdd _x;
	} forEach _objects;
};
if (_text=="Furniture") then {
	_display = uiNameSpace getVariable "PlayerUINotebook";
		_ctrl = _display displayCtrl 1501;
	_objects=player getvariable ["APH_FurnitureBuildList","none"];	
	lbClear 1501;
	{
		_index = _ctrl lbAdd _x;
	} forEach _objects;
};
if (_text=="Plants") then {
	_display = uiNameSpace getVariable "PlayerUINotebook";
		_ctrl = _display displayCtrl 1501;
	_objects=player getvariable ["APH_PlantBuildList","none"];	
	lbClear 1501;
	{
		_index = _ctrl lbAdd _x;
	} forEach _objects;
};

};
aph_fnc_setBuildObject={
		_veh=player getvariable "AP_CurrentCarryObject";
		_type=typeof _veh;
		_pos=getPosATL _veh;
		_dir = getDir _veh;
		detach _veh;
		_PBY=_veh getvariable ["AP_OPBY",[0,0,0]];
		_CostArray=_veh getVariable ["CostArray",[0,0,0,0,0,0,0,0,0]];
		_veh4 = "RoadCone_F" createVehicle position player;
		_veh4 attachto [_veh, [0, 0, 0] ];
		_veh4 setvariable ["BuildInfo",[_type,_pos,_dir,0,_PBY,player,_CostArray]];
		_veh4 setvariable ["ActionActivated",false,true];
		_veh4 addaction ["BuildObject",{call aph_fnc_BuildUpConstructionsite;(_this select 0) setvariable ["ActionActivated",true,true];} ];
		deleteVehicle _veh;
		_list=player getvariable ["BuildableObjectList",[]];
		_NewRay=[[_veh4,_type]];
		_array=_list+_NewRay;   
		player setVariable ["BuildableObjectList",_array,true];
		player setvariable ["HoldingObject",false,true];
		waituntil {(_veh4 getvariable "ActionActivated")};
		_list=player getvariable ["BuildableObjectList",[]];
		_array=_list - _NewRay; 
		player setVariable ["BuildableObjectList",_array,true];
	
};
aph_fnc_BuildUpConstructionsite={
_target=_this select 0;
_caller=_this select 1;
_reference=_this select 2;
_array=_target getvariable "BuildInfo";
_type=_array select 0;
_pos=_array select 1;
_dir=_array select 2;
_buildcount=_array select 3;
_PBY=_array select 4;
_owner=_array select 5;
_materialCost=_array select 6;

_veh=_type createvehicle _pos;
_veh setposATL _pos;
//[_veh,[_PBY select 0,_PBY select 1, - 720]] call fnc_SetPitchBankYaw;
_veh setdir _dir;
if (_type=="ap_BuildGarage") then {
//create 
[_veh] spawn aph_spawnPersonalGarage;

};
if (_type=="ap_BuildTable") then {
[_veh,player] spawn aph_spawnBuildingTable;
};
if (_type=="aph_ResourceCollector") then {
[_veh,player] spawn aph_ResourceCollectorAddaction;
};
deleteVehicle _target;

_veh setVariable ["APH_OBJECTBOOL",true,true];
_veh setVariable ["MaterialCost",_materialCost,true];
};

//PERSONAL BUILDING UIs//

//Vehicle table
aph_fnc_LargeObjectbuildingStart={
_target=_this select 0;
_caller=_this select 1;
_ammobox=_this select 3;
_var=_ammobox getVariable ["AttachedBuildingPad","none"];
if ((typename _var)=="STRING") exitwith {hint "You need to place a build pad first."; [_target] spawn aph_fnc_GarageBuildPad;};
_caller setVariable ["CurrentBuildingBox",_target];

_handle= createdialog "VehicleBuildTableUI";
lbAdd[1501,"Land Vehicle"];
lbAdd[1501,"Air Vehicle"];
lbAdd[1501,"Water Vehicle"];
lbAdd[1501,"Vehicle parts"];
lbAdd[1501,"Vehicle Fuel and Ammo"];
	if ((_target getvariable ["CurrentlyBuilding",[false,""]]) select 0) then 
	{
		_obj=(_target getvariable ["CurrentlyBuilding",[false,""]]) select 1;
		//adjust que pic
		_CFG="";
		if ( isClass (configFile >> "CFGweapons" >> _obj)) then {
			//is weapon
			_CFG="CfgWeapons";
		}else{
			if ( isClass (configFile >> "CFGMagazines" >> _obj)) then {
				//is magazine
				_CFG="CfgMagazines";
			}else{
				//is some other class
				_CFG="CfgVehicles";
			};
		}; 
		ctrlSetText [1202,getText (configfile >> _CFG >> _obj >> "picture")];
	};

disableserialization;
_display=uinamespace getvariable "VehicleBuildTableUI";
_Progress=_display displayCtrl 1800;

//adjust progres bar
while {!(isnull (uiNameSpace getVariable "VehicleBuildTableUI"))} do 
	{
		sleep 0.01;
		_status=(_target getvariable ["CurrentBuildProgress",0.01]);
		_Progress progressSetPosition (_status*0.01);
	};
};
aph_fnc_VehBuildtable_topList={
disableSerialization;
_display = uiNameSpace getVariable "VehicleBuildTableUI";
	_Text = _display displayCtrl 1000;
_text ctrlSetStructuredText (parsetext format [""]);
ctrlSetText [1200,""];
_index = lbCurSel 1501;
_1list=player getvariable ["APH_LandVehBuildList",[]];
_2list=player getvariable ["APH_AirVehBuildList",[]];
_3list=player getvariable ["APH_WaterVehBuildList",[]];
_4list=player getvariable ["APH_VehiclePartBuildList",[]];
_5list=player getvariable ["APH_VehicleAccesorybuildList",[]];

if (_index==0) then {
lbClear 1500;
{lbadd [1500,(_x select 0)];} foreach _1list;
};
if (_index==1) then {
lbClear 1500;
{lbadd [1500,(_x select 0)];} foreach _2list;
};
if (_index==2) then {
lbClear 1500;
{lbadd [1500,(_x select 0)];} foreach _3list;
};
if (_index==3) then {
lbClear 1500;
{lbadd [1500,(_x select 0)];} foreach _4list;
};
if (_index==4) then {
lbClear 1500;
{lbadd [1500,(_x select 0)];} foreach _5list;
};


lbSetCurSel [1500, 0];

};
aph_fnc_VehBuildtable_BottomList={
//Controls Picture Frame Handling
disableSerialization;
_indexTop = lbCurSel 1501;
_indexBtm= lbCurSel 1500;
_text = lbText [1500, _indexTop];
_1list=player getvariable ["APH_LandVehBuildList","none"];
_2list=player getvariable ["APH_AirVehBuildList","none"];
_3list=player getvariable ["APH_WaterVehBuildList","none"];
_4list=player getvariable ["APH_VehiclePartBuildList","none"];
_5list=player getvariable ["APH_VehicleAccesorybuildList","none"];

switch(_indexTop) do {
	case 0: {player setvariable ["CurrentBuildingArrayShown",_1list];};
	case 1: {player setvariable ["CurrentBuildingArrayShown",_2list];};
	case 2: {player setvariable ["CurrentBuildingArrayShown",_3list];};
	case 3: {player setvariable ["CurrentBuildingArrayShown",_4list];};
	case 4: {player setvariable ["CurrentBuildingArrayShown",_5list];};
};

if ( (count (player getvariable "CurrentBuildingArrayShown")) <=0) exitwith {};
_item=(((player getvariable "CurrentBuildingArrayShown") select _indexBtm) select 1);
_CFG="";
if ( isClass (configFile >> "CFGweapons" >> _item)) then {
    //is weapon
	_CFG="CfgWeapons";
}else{
    if ( isClass (configFile >> "CFGMagazines" >> _item)) then {
        //is magazine
		_CFG="CfgMagazines";
    }else{
        //is some other class
		_CFG="CfgVehicles";
    };
}; 

ctrlSetText [1200,getText (configfile >> _CFG >> _item >> "picture")];

_TopText=(((player getvariable "CurrentBuildingArrayShown") select _indexBtm) select 0);
_costArray=(((player getvariable "CurrentBuildingArrayShown") select _indexBtm) select 2);
_display = uiNameSpace getVariable "VehicleBuildTableUI";
	_Text = _display displayCtrl 1000;
_text ctrlSetStructuredText (parsetext format ["<t size='1.8' color='#ffffff'  shadow='2' >Item Information: <br/>%1 <br/> %2</t>",_TopText,_costArray]);

};
aph_fnc_VehBuildtable_FinalObject={
_list=player getvariable "CurrentBuildingArrayShown";
_box=player getvariable "CurrentBuildingBox";
if ((_box getvariable ["CurrentlyBuilding",[false,""]]) select 0) exitwith {hint "Project already in progress"};
	if (typeName _pad=="STRING") exitwith { Hint "You need to place a building pad first. (Addaction on the box)";};
//closeDialog 0;
_indexTop = lbCurSel 1501;
_indexBtm= lbCurSel 1500;
_text = lbText [1500, _indexBtm];
_ArrayObject=_list select _indexBtm;
//select object
_name= _list select _indexBtm select 0;
_type= _list select _indexBtm select 1;
_Costarray=_list select _indexBtm select 2;
//get reference BP	
	_BPs=[];
	{
		_BPs pushback (_x select 1);
	}foreach aph_Arr_Blueprints;
_ReferenceBP= (aph_Arr_Blueprints select (_BPs find _type));
//hint format ["%1",_bps];
//Object material costs
_ironcost= _Costarray select 0;
_steelcost= _Costarray select 1;
_platcost=_Costarray select 2;
_stonecost=_Costarray select 3;
_woolcost=_Costarray select 4;
_flaxcost=_Costarray select 5;
_woodcost=_Costarray select 6;
_plasticcost=_Costarray select 7;
_goldCost=_Costarray select 8;
_imagePicture=_list select _indexBtm select 3;



//Build object	
_Itemlist= itemCargo _box;
//Compare inventory to material cost of object
	_fc=0;
	_ib=0;
	_psb=0;
	_pnb=0;
	_stb=0;
	_sbr=0;
	_wp=0;
	_wc=0;
	_go=0;
	{	if (_x =="aph_flaxcloth") then {_fc=_fc+1;};
		if (_x =="aph_ironbar") then {_ib=_ib+1;};
		if (_x =="aph_plasticbar") then {_psb=_psb+1;};
		if (_x =="aph_platinumbar") then {_pnb=_pnb+1;};
		if (_x =="aph_Steelbar") then {_stb=_stb+1;};
		if (_x =="aph_Stonebrick") then {_sbr=_sbr+1;};
		if (_x =="aph_woodplank") then {_wp=_wp+1;};
		if (_x =="aph_woolcloth") then {_wc=_wc+1;};
		if (_x =="aph_goldOre") then {_go=_go+1;};
	} foreach _itemlist;
	
	
if (_fc>=_flaxcost and _ib>=_ironcost and _psb>=_plasticcost and _pnb>=_platcost and _stb>=_Steelcost and _sbr>=_stonecost and _wp>=_woodcost and _wc>=_woolcost and _go>=_goldCost) 
then {
//complete build and spawn object
_box setvariable ["CurrentlyBuilding",[true,_type]];
[_box,_ReferenceBP] spawn aph_fnc_ProcessGarageBuilding;
hint format ["%1",_ReferenceBP];
clearItemCargoGlobal _box;
_fc=_fc-_flaxcost;
_ib=_ib-_ironcost;
_psb=_psb-_plasticcost;
_stb=_stb-_Steelcost;
_sbr=_sbr-_stonecost;
_wp=_wp-_woodcost;
_wc=_wc-_woolcost;
	//processed
	_box addItemCargoGlobal ["aph_flaxcloth",_fc];
	_box addItemCargoGlobal ["aph_ironbar",_ib];
	_box addItemCargoGlobal ["aph_plasticbar",_psb];
	_box addItemCargoGlobal ["aph_platinumbar",_pnb];
	_box addItemCargoGlobal ["aph_Steelbar",_stb];
	_box addItemCargoGlobal ["aph_Stonebrick",_sbr];
	_box addItemCargoGlobal ["aph_woodplank",_wp];
	_box addItemCargoGlobal ["aph_woolcloth",_wc];
	_box addItemCargoGlobal ["aph_goldore",_go];
	} else { hint "Not enough materials" };
	
		

};
aph_fnc_ProcessGarageBuilding={
_box=_this select 0;
_ReferenceBP=_this select 1;
	_BP=_ReferenceBP select 0;
	_Created=_ReferenceBP select 1;
		_Costarray=getarray (Missionconfigfile >> "BluePrintInfo" >> _BP >> "cost");
		_ItemMade=gettext (Missionconfigfile >> "BluePrintInfo" >> _BP >> "ItemCreated");
		_difficulty=getnumber (Missionconfigfile >> "BluePrintInfo" >> _BP >> "Difficulty");
_pad=_box getVariable "AttachedBuildingPad";
_pos=getPos _pad;
_wait=(0.1 * _difficulty);
//end variables

		//adjust que pic
		_CFG="";
		if ( isClass (configFile >> "CFGweapons" >> _Created)) then {
			//is weapon
			_CFG="CfgWeapons";
		}else{
			if ( isClass (configFile >> "CFGMagazines" >> _Created)) then {
				//is magazine
				_CFG="CfgMagazines";
			}else{
				//is some other class
				_CFG="CfgVehicles";
			};
		}; 
		ctrlSetText [1202,getText (configfile >> _CFG >> _Created >> "picture")];
		ctrlSetText [1200,""];


//build holder and start building function
_veh= createVehicle ["Land_JunkPile_F", _pos, [], 0, "CAN_COLLIDE"];
_box setvariable ["ObjectHolder",_veh];
	while {(_box getvariable ["CurrentBuildProgress",0])<=99} do 
		{
			sleep _wait;
			
			_status=(_box getvariable ["CurrentBuildProgress",0]);
			_box setvariable ["CurrentBuildProgress",_status + 1];
				
				//check if project request is canceled
				if (_box getvariable ["CancelProject",false]) exitwith {};
			
		};

deletevehicle _veh;	
ctrlSetText [1202,"Convo\Images\BoxIcon.jpg"];	
_box setvariable ["CurrentBuildProgress",0];
_box setvariable ["CurrentlyBuilding",[false,""]];
	
	//if canceling project
	if (_box getvariable ["CancelProject",false]) exitwith 
		{ 
			_box setvariable ["CancelProject",false];
			hint format ["stopping \n %1",_costArray];
		};
	
_Built= createVehicle [_ItemMade, _pos, [], 0, "CAN_COLLIDE"];	
_Built setVariable ["APH_OBJECTBOOL",true,true];
_Built setVariable ["MaterialCost",_Costarray,true];
hint format ["Created %1",_name];
};
aph_fnc_VehBuildtable_CancelBuild={
_box=player getVariable "CurrentBuildingBox";
_box setvariable ["CancelProject",true];
};


//Small build Table
aph_fnc_smallObjectbuildingStart={
_target=_this select 0;
_caller=_this select 1;
_caller setvariable ["BuildTableObject",_target,true];
_handle= createdialog "BuildTableUINew";

lbAdd[1501,"Ammunition"];
lbAdd[1501,"Weapons"];
lbAdd[1501,"Objects"];
lbAdd[1501,"Accessory"];
lbAdd[1501,"Small parts"];
lbAdd[1501,"Gear"];


};
aph_fnc_Buildtable_UIChange= {
disableSerialization;
_display = uiNameSpace getVariable "VehicleBuildTableUI";
	_Text = _display displayCtrl 1000;
_text ctrlSetStructuredText (parsetext format [""]);
ctrlSetText [1200,""];
_index = lbCurSel 1501;
lbSetCurSel [1500, 0];
_ammolist=player getvariable ["APH_AmmoBuildList","none"];
_weaponlist=player getvariable ["APH_WeapBuildList","none"];
_objectlist=player getvariable ["APH_ObjBuildList","none"];
_accesslist=player getvariable ["APH_AccessoryBuildList","none"];
_partlist=player getvariable ["APH_SmallPartBuildList","none"];
_gearlist=player getvariable ["APH_BuildableGearList","none"];

if (_index==0) then {
lbClear 1500;
{lbadd [1500,(_x select 0)];} foreach _ammolist;
lbSetCurSel [1500,0];
};
if (_index==1) then {
lbClear 1500;
{lbadd [1500,(_x select 0)];} foreach _weaponlist;
lbSetCurSel [1500,0];
};
if (_index==2) then {
lbClear 1500;
{lbadd [1500,(_x select 0)];} foreach _objectlist;
lbSetCurSel [1500,0];
};
if (_index==3) then {
lbClear 1500;
{lbadd [1500,(_x select 0)];} foreach _accesslist;
lbSetCurSel [1500,0];
};
if (_index==4) then {
lbClear 1500;
{lbadd [1500,(_x select 0)];} foreach _partlist;
lbSetCurSel [1500,0];
};
if (_index==5) then {
lbClear 1500;
{lbadd [1500,(_x select 0)];} foreach _gearlist;
lbSetCurSel [1500,0];
};
};
aph_fnc_Buildtable_UIChangeBottom= {
//Controls Picture Frame Handling
_indexTop = lbCurSel 1501;
_indexBtm= lbCurSel 1500;
_text = lbText [1500, _indexTop];
_ammolist=player getvariable ["APH_AmmoBuildList",[]];
_weaponlist=player getvariable ["APH_WeapBuildList",[]];
_objectlist=player getvariable ["APH_ObjBuildList",[]];
_vehiclelist=player getvariable ["APH_AccessoryBuildList",[]];
_partlist=player getvariable ["APH_SmallPartBuildList",[]];
_gearlist=player getvariable ["APH_BuildableGearList",[]];
switch(_indexTop) do {
	case 0: {player setvariable ["CurrentBuildingArrayShown",_ammolist];};
	case 1: {player setvariable ["CurrentBuildingArrayShown",_weaponlist];};
	case 2: {player setvariable ["CurrentBuildingArrayShown",_objectlist];};
	case 3: {player setvariable ["CurrentBuildingArrayShown",_vehiclelist];};
	case 4: {player setvariable ["CurrentBuildingArrayShown",_partlist];};
	case 5: {player setvariable ["CurrentBuildingArrayShown",_gearlist];};
};
if ( (count (player getvariable "CurrentBuildingArrayShown")) <=0) exitwith {};
_item=(((player getvariable "CurrentBuildingArrayShown") select _indexBtm) select 1);
_CFG="";
if ( isClass (configFile >> "CFGweapons" >> _item)) then {
    //is weapon
	_CFG="CfgWeapons";
}else{
    if ( isClass (configFile >> "CFGMagazines" >> _item)) then {
        //is magazine
		_CFG="CfgMagazines";
    }else{
        //is some other class
		_CFG="CfgVehicles";
    };
}; 
ctrlSetText [1200,getText (configfile >> _CFG >> _item >> "picture")];

_TopText=(((player getvariable "CurrentBuildingArrayShown") select _indexBtm) select 0);
_costArray=(((player getvariable "CurrentBuildingArrayShown") select _indexBtm) select 2);
_display = uiNameSpace getVariable "BuildTableUINew";
	_Text = _display displayCtrl 1000;
_text ctrlSetStructuredText (parsetext format ["<t size='1.8' color='#ffffff' shadow='2' align='center'>Item Information: <br/><br/>%1 <br/>%2</t>",_TopText,_costArray]);

};
aph_fnc_Buildtable_BuildObject={

_list=player getvariable "CurrentBuildingArrayShown";

_indexTop = lbCurSel 1501;
_indexBtm= lbCurSel 1500;
_text = lbText [1500, _indexBtm];

//select object
_ArrayObject=_list select _indexBtm;
_name= _list select _indexBtm select 0;
_type= _list select _indexBtm select 1;
//Object material costs
_CostArray= _list select _indexBtm select 2;
	//Object material costs
	_ironcost= _Costarray select 0;
	_steelcost= _Costarray select 1;
	_platcost=_Costarray select 2;
	_stonecost=_Costarray select 3;
	_woolcost=_Costarray select 4;
	_flaxcost=_Costarray select 5;
	_woodcost=_Costarray select 6;
	_plasticcost=_Costarray select 7;
	_goldCost=_Costarray select 8;
	_imagePicture=_list select _indexBtm select 3;

_costtext= format ["
------------\n
Iron bar:  %1 \n
Steel bar:  %2 \n
Platinum bar:  %3 \n
Stone brick:  %4\n
Wool cloth:  %5\n
Flax cloth:  %6\n
Wood plank:  %7\n
Plastic bar:  %8\n
Gold bar:  %9\n
------------\n
",_ironcost,_steelcost,_platcost,_stonecost,_woolcost,_flaxcost,_woodcost,_plasticcost,_goldcost];


//Build object	
_box=player getvariable "BuildTableObject";
_Itemlist= itemCargo _box;
//Compare inventory to material cost of object
	_fc=0;
	_ib=0;
	_psb=0;
	_pnb=0;
	_stb=0;
	_sbr=0;
	_wp=0;
	_wc=0;
	_go=0;
	{	if (_x =="aph_flaxcloth") then {_fc=_fc+1;};
		if (_x =="aph_ironbar") then {_ib=_ib+1;};
		if (_x =="aph_plasticbar") then {_psb=_psb+1;};
		if (_x =="aph_platinumbar") then {_pnb=_pnb+1;};
		if (_x =="aph_Steelbar") then {_stb=_stb+1;};
		if (_x =="aph_Stonebrick") then {_sbr=_sbr+1;};
		if (_x =="aph_woodplank") then {_wp=_wp+1;};
		if (_x =="aph_woolcloth") then {_wc=_wc+1;};
		if (_x =="aph_goldbar") then {_go=_go+1;};
	} foreach _itemlist;

	
if (_fc>=_flaxcost and _ib>=_ironcost and _psb>=_plasticcost and _pnb>=_platcost and _stb>=_Steelcost and _sbr>=_stonecost and _wp>=_woodcost and _wc>=_woolcost and _go>=_goldCost) 
then {

if (_type iskindof "Bag_Base") then {hint "true";_box addbackpackcargoglobal [_type, 1]; } else {_box addItemCargoGlobal [_type, 1];};
hint format ["Built %1",_name];

//hint format ["Built %1",_name];
//clearItemCargoGlobal _box;
_fc=_fc-_flaxcost;
_ib=_ib-_ironcost;
_psb=_psb-_plasticcost;
_stb=_stb-_Steelcost;
_sbr=_sbr-_stonecost;
_wp=_wp-_woodcost;
_wc=_wc-_woolcloth;
	//processed
	_box addItemCargoGlobal ["aph_flaxcloth",_fc];
	_box addItemCargoGlobal ["aph_ironbar",_ib];
	_box addItemCargoGlobal ["aph_plasticbar",_psb];
	_box addItemCargoGlobal ["aph_platinumbar",_pnb];
	_box addItemCargoGlobal ["aph_Steelbar",_stb];
	_box addItemCargoGlobal ["aph_Stonebrick",_sbr];
	_box addItemCargoGlobal ["aph_woodplank",_wp];
	_box addItemCargoGlobal ["aph_woolcloth",_wc];
	_box addItemCargoGlobal ["aph_goldore",_go];
	} else { hint format ["Not enough materials, you need %1",_costtext];
	
	};
	
		
};

//Crafting tables
aph_spawnBuildingTable={
_unit=_this select 0;
_player=_this select 1;

[[_unit,["Start Building",aph_fnc_smallObjectbuildingStart,[], 0, false, false, "", ""]],"addAction",true,true] call BIS_fnc_MP;  
};
aph_spawnPersonalGarage={
_veh=_this select 0;


[[_veh,["Start Building",aph_fnc_LargeObjectbuildingStart,_veh, 0, false, false, "", ""]],"addAction",true,true] call BIS_fnc_MP;  
[[_veh,["Put building pad",aph_fnc_GarageBuildPad,[_veh,player], 0, false, false, "", ""]],"addAction",true,true] call BIS_fnc_MP;  
_veh allowdamage false; 
//_veh enableSimulation false;
};
aph_fnc_GarageBuildPad={
_target=_this select 0;
player setvariable ["ReadytoDrop",false,true];
_Old=_target getvariable ["AttachedBuildingPad",""];

_mark="Land_JumpTarget_F" createVehicle position player;
_mark attachTo [player, [0, 2.5, 0] ]; 
			
	
	//Place buildpad action
	_action=player addAction ["Choose build location", {
					_distance=((_this select 3 select 0) distance (_this select 3 select 1));
					if (_distance > 15) then {
						Hint "Place build pad closer to garage";
						};
					if (_distance <3.5) then {
						Hint "Building pad too close. Place elsewhere.";
						};
					if ( (_distance <= 35)&&(_distance>=3.5)) then {
						Hint "Placed build pad";player setvariable ["ReadytoDrop",true,true];
						};
				},[_target,player]];


//when ready and correct place buildpad
waituntil {player getvariable "ReadytoDrop"};
player removeaction _Cancel;
player removeaction _action;
detach _mark;
_target setVariable ["AttachedBuildingPad",_mark];
deletevehicle _old;
player setvariable ["ReadytoDrop",false,true];
};

//Map Markers
aph_checkbox={
_this=_this select 0;

_control=_this select 0;
_index=_this select 1;
_state=_this select 2;



_display= uiNamespace getVariable "MapMarkerCheckbox";
	_checkbox0=_display displayCtrl 2800;
	_checkbox1=_display displayCtrl 2801;
	_checkbox2=_display displayCtrl 2802;
	_checkbox3=_display displayCtrl 2803;
	_checkbox4=_display displayCtrl 2804;
_markers= allmapmarkers; 
_known=(player getvariable ["KnownMarkers",[]]);	

		_FlagMarker="hd_objective";
		_Battles="hd_join";
		_PersonalLoca="hd_dot";
		_MovingMilitia="hd_ambush";

	
switch (_state) do {		
	//OFF
	case 0: {
		switch (_control) do {
			case _checkbox0: {
				{_type=getMarkerType _x; if (_type==_FlagMarker) then {_x setMarkerAlpha 0;};}foreach _markers;
			};
			
			case _checkbox1: {
				{_type=getMarkerType _x; if (_type==_Battles) then {_x setMarkerAlpha 0;};}foreach _markers;
			};
			
			case _checkbox2: {
				{_type=getMarkerType _x; if (_type==_PersonalLoca) then {_x setMarkerAlpha 0;};}foreach _markers;
			};
			
			case _checkbox3: {
				{_type=getMarkerType _x; if (_type==_MovingMilitia) then {_x setMarkerAlpha 0;};}foreach _markers;

							
			};	
			case _checkbox4: {
					
			};
			
			};//switch control
		};
	//ON		
	case 1: {
		switch (_control) do {
			case _checkbox0: {
				{
					if (_x in _known) then {_type=getMarkerType _x; if (_type==_FlagMarker) then {_x setMarkerAlpha 1;};};
				}foreach _markers;
			};
			
			case _checkbox1: {
				{
					if (_x in _known) then {_type=getMarkerType _x; if (_type==_Battles) then {_x setMarkerAlpha 1;};};
				}foreach _markers;
			};
			
			case _checkbox2: {
				{
					if (_x in _known) then {_type=getMarkerType _x; if (_type==_PersonalLoca) then {_x setMarkerAlpha 1;};};
				}foreach _markers;
			};
			
			case _checkbox3: {
				{
					if (_x in _known) then {_type=getMarkerType _x; if (_type==_MovingMilitia) then {_x setMarkerAlpha 1;};};
				}foreach _markers;
			};
			
			case _checkbox4: {
					
			};			
			
			};//switch control
	
		};		
			
	}; //end state switch		



_FM=ctrlChecked _checkbox0;
_BM=ctrlChecked _checkbox1;
_PL=ctrlChecked _checkbox2;
_MM=ctrlChecked _checkbox3;

player setvariable ["ShowingMarkers",[_FM,_BM,_PL,_MM]];
};

aph_discoverMarker={
_target=_this;
_known=(player getvariable ["KnownMarkers",[]]);
	{
		if !(_x in _known) then 
			{
				if (	((getmarkerpos _x) distance _target) <=15	) then 
					{	
						_known pushback _x;
					};
			};
	}foreach allmapmarkers;

	
player setvariable ["KnownMarkers",_known];
_toggled=player getvariable ["ShowingMarkers",[false,false,false,false]];
	_FlagMarkers=_toggled select 0;
	_BattleMarkers=_toggled select 1;
	_PersonalLoca=_toggled select 2;
	_MovingMilitia=_toggled select 3;
{
	if ( 
		( (GetMarkerType _x =="hd_objective") && (_FlagMarkers) ) ||
		( (GetMarkerType _x =="hd_join") && (_BattleMarkers) ) ||
		( (GetMarkerType _x =="hd_dot") && (_PersonalLoca) ) ||
		( (GetMarkerType _x =="hd_ambush") && (_MovingMilitia) )
		)	then 
			{	
				_x setMarkerAlpha 1;
			};

}foreach _known; 

};
//UI Functions//

	//seeds
aph_fnc_PlacePlant={
_treetype=_this select 0;
_CurrentItem=nil;
_seed=nil;
_attachTO=nil;
switch (_treetype) do {
	case "Pine sapling": {
		_CurrentItem="Pine_1";
		_Seed="aph_PineSapling";	
		_attachTO=[0,3.5,3.5];
		};
	case "Palm sapling": {
		_CurrentItem="Palm_1";
		_Seed="aph_PalmSapling";
		_attachTO=[0,5,4];		
		};
	case "Paper Mulberry sapling": {
		_CurrentItem="Paper_Mulberry";
		_Seed="aph_MulberrySapling";	
		_attachTO=[0,5,4];		
		};
	case "Wheat Stalk": {
		_CurrentItem="Wheat_Stalk";
		_Seed="aph_WheatSeed";
		_attachTO=[0, 3, 0.5];
	};
};//end switch

//Create tree
_tree= createVehicle [_CurrentItem, position player, [], 0, "NONE"];
_tree attachto [player,_attachTO];
_action=player addAction ["Drop", {	player setvariable ["ReadytoDropT",true,true];player removeaction (_this select 2)}];
[player,_Seed]execVM "JournalUI\deleteitem.sqf";	

//Spawn ground mark
_mark= "Sign_Sphere10cm_F" createvehicle [0,0,1000];
	[_mark,_tree,player] spawn {
	_mark=_this select 0;
		while {(!((_this select 2) getvariable ["ReadytoDropT",false]))} do {
			_tree=_this select 1;
			_pos=_tree modeltoWorld [0,0,0];
				_x= _pos select 0;
				_y= _pos select 1;
				_z= _pos select 2;
			sleep 0.25;
			_mark setpos [_x,_y,0];
		};
		hint "Ended";
	sleep 6;
	hint "delete";
	deleteVehicle _mark;
	};
	
//Place tree when ready
waituntil {player getvariable ["ReadytoDropT",false]};
_bbr = boundingBoxReal _tree;
_p1 = _bbr select 0;
_p2 = _bbr select 1;
_maxHeight = abs ((_p2 select 2) - (_p1 select 2));	

//Get tree location/size
_pos=_tree modeltoWorld [0,0,0];
_x= _pos select 0;
_y= _pos select 1;
_z= _pos select 2;
[[_tree,true],"AP_EnableSim",false,true] spawn BIS_fnc_MP;
detach _tree;
_tree setVariable ["APH_OBJECTBOOL",true,true];
_tree setVariable ["AP_TREE",true,true];
//[[_plant,[0,0,1]],"setVectorUp",true,FALSE] spawn BIS_fnc_MP;
_tree setpos [_x,_y,-0.05];
	if (typeof _tree=="Wheat_Stalk") then {_tree enableSimulation false;};
//grow tree
[_tree,_seed,_maxheight] spawn aph_fnc_GrowPlant;
sleep 1;
player setvariable ["ReadytoDropT",false,true];
};
aph_fnc_GrowPlant={
_plant=_this select 0;
//_SeedType=_this select 1;
//_maxHeight=_this select 2;
//_count=(_maxHeight*0.125);

//Add Harvest Action
if (_plant iskindof "AP_GroundCrop") then {

	[[_plant,"Harvest",{
			_target= _this select 0;
			_caller= _this select 1;
			_ID= _this select 2;
			_pos= getpos _target;
			 
			for "_i" from 1 to 3 do {
				[[[_caller], {(_this select 0) playMove "AinvPknlMstpSnonWnonDr_medicUp1";}], "BIS_fnc_call", true, false] call BIS_fnc_MP;
				sleep 4.5;
				_holder = createVehicle ["groundweaponholder",[_pos select 0,_pos select 1,0], [],random 5, "can_Collide"];
				_holder addItemCargoGlobal ["aph_wheatSeed", 5];
			};
			_target removeAction _id;
			deleteVehicle _target;
			},""],"AP_addactionMP",true,true] spawn BIS_fnc_MP;
	
	} else {
	
	//_plant setVariable ["CurrentGrowthSize",0,true];	
		
[[_plant,"Cut tree",{
			_target= _this select 0;
			_caller= _this select 1;
			_ID= _this select 2;
			_pos= getpos _target;
			 
			for "_i" from 1 to 3 do {
				[[[_caller], {(_this select 0) playMove "AinvPknlMstpSnonWnonDr_medicUp1";}], "BIS_fnc_call", true, false] call BIS_fnc_MP;
				sleep 4.5;
				_holder = createVehicle ["groundweaponholder",[_pos select 0,_pos select 1,0], [],random 5, "can_Collide"];
				_holder addItemCargoGlobal ["aph_Singlelog", 1];
			};
			_target removeAction _id;
			_target setdamage 1;
			},""],"AP_addactionMP",true,true] spawn BIS_fnc_MP;
	};				
};


//Key pressed handler
AP_key={
_control=_this select 0;
_code=_this select 1;
_shift=_this select 2;
_ctrl=_this select 3;
_alt=_this select 4;

if (_shift) then {
	switch (_this select 1) do {
		
		//t
		case 20: {
		if !(player getVariable ["HoldingObject",false]) exitwith {[(cursortarget)] spawn aph_SwitchCharacter;};
		//Icon UI
		0 cutrsc ["BottomRightFrame","PLAIN"];
		_display= uiNameSpace getVariable "BottomRightFrame";
		_PicBox= _display displayCtrl 1200;
		_textbox=_display displayCtrl 1100;
		_textbox ctrlSetStructuredText (parsetext format ["<t color='#FFFFFF' align= 'center' size= '1.5' shadow='2'>'Rotate'</t><br/>"]);
		_picbox ctrlsettext "JournalUI\Images\rotate2.paa";
		
		(findDisplay 46) displaySetEventHandler ["MouseZchanged","_this call AP_ShiftAdjustRotate;"];
		};
		
		//f
		case 33: {
		_HoldingBool=player getVariable ["HoldingObject",false];
		
		if (_holdingBool) then { 
		
			[] spawn aph_DisassembleTarget;
		
		} else {
		
			[player] spawn aph_StabAttack;
			
		};
		
		};
	};//end switch
	};//end shift

if (_ctrl) then {
	switch (_this select 1) do {
		//t
		case 20: {
		if !(player getVariable ["HoldingObject",false]) exitwith {};
		//Icon UI
		0 cutrsc ["BottomRightFrame","PLAIN"];
		_display= uiNameSpace getVariable "BottomRightFrame";
		_PicBox= _display displayCtrl 1200;
		_textbox=_display displayCtrl 1100;
		_textbox ctrlSetStructuredText (parsetext format ["<t color='#FFFFFF' align= 'center' size= '1.5' shadow='2'>'Vertical'</t><br/>"]);
		_picbox ctrlsettext "JournalUI\Images\vertical.paa";
		
		(findDisplay 46) displaySetEventHandler ["MouseZchanged","_this call AP_AdjustAttached"];
			
				};
	
		//f
		case 33: {
		
			if (isnull cursortarget) exitwith {};
			if ((player distance cursortarget) >=5) exitwith {};
					[cursortarget] spawn aph_fnc_learnBlueprint;
					
		};	
	};//end switch
	};//end shift

if (_alt) then {

	switch (_this select 1) do {
		//t
		case 20: {
		if !(player getVariable ["HoldingObject",false]) exitwith {};
		//Icon UI
		0 cutrsc ["BottomRightFrame","PLAIN"];
		_display= uiNameSpace getVariable "BottomRightFrame";
		_PicBox= _display displayCtrl 1200;
		_textbox=_display displayCtrl 1100;
		_textbox ctrlSetStructuredText (parsetext format ["<t color='#FFFFFF' align= 'center' size= '1.5' shadow='2'>'Tilt'</t><br/>"]);
		_picbox ctrlsettext "JournalUI\Images\Tilt.paa";
		
		(findDisplay 46) displaySetEventHandler ["MouseZchanged","_this call AP_ShiftAdjustTilt"];
		};
};//end swich
	};//end alt

if (!_shift && !_ctrl and !_alt) then {

	switch (_this select 1) do {

		//H
		case 35: {
			_Null=[]execVM "JournalUI\Hpressed.sqf"
		};
		//t
		case 20: {
			_Null=[]execVM "JournalUI\Tpressed.sqf"
		};
		//y
		case 21: {
			_Null=[]execVM "JournalUI\Ypressed.sqf"
		};
		//f
		case 33: {
			_nill=[]execVM "JournalUI\Fpressed.sqf";
		};

		//n 
		case 49: {			
			_nill=[]execVM "JournalUI\Npressed.sqf";
		};
		
		//ESC
		case 1: {
		
			[] spawn aph_fnc_delayAbort;
			_null=[]execVM "Database\PlayerSaveSetup.sqf";
			
		};
};//end switch
};//end no shift, etc

};
AP_AdjustAttached={
_ctrl=_this select 0;
_change=_this select 1;

_obj=player getvariable "AP_CurrentCarryObject";
if (_change >=0.01) then {
_pos=player getvariable ["CurrentCarryZ",2];
_nPos=_pos + 0.1;
_obj attachto [player,[0,2,_nPos]];
player setvariable ["CurrentCarryZ",_nPos,true];
		//dont go below ground
		_pos=getposatl _obj;
		if ((_pos select 2) >3) then {_obj attachto [player,[0,2,3]];player setvariable ["CurrentCarryZ",3,true];};
};

if (_change <=0.01) then {
_pos=player getvariable ["CurrentCarryZ",2];
_nPos=_pos - 0.1;
_obj attachto [player,[0,2,_nPos]];
player setvariable ["CurrentCarryZ",_nPos,true];
		//dont go below ground
		_pos=getposatl _obj;
		if ((_pos select 2) <0.1) then {_obj attachto [player,[0,2,0.1]];};
};

};
AP_ShiftAdjustRotate={
_ctrl=_this select 0;
_change=_this select 1;
_obj=player getvariable "AP_CurrentCarryObject";
_PBY=_obj getvariable ["AP_OPBY",[0,0,0]];
_pitch=_PBY select 0;
_bank=_PBY select 1;
_yaw=_PBY select 2;
				
			if (_change >=0.0001) then {	
				_yaw=_yaw + 10;
						[_obj,[_pitch,_bank,_yaw]] call fnc_SetPitchBankYaw;
						_obj setvariable ["AP_OPBY",[_pitch,_bank,_yaw],true];
			};			
			if (_change <=0) then {	
				_yaw=_yaw - 10;
						[_obj,[_pitch,_bank,_yaw]] call fnc_SetPitchBankYaw;
						_obj setvariable ["AP_OPBY",[_pitch,_bank,_yaw],true];
			};	
	

};
AP_ShiftAdjustTilt={
_ctrl=_this select 0;
_change=_this select 1;
_obj=player getvariable "AP_CurrentCarryObject";
_PBY=_obj getvariable ["AP_OPBY",[0,0,0]];
_pitch=_PBY select 0;
_bank=_PBY select 1;
_yaw=_PBY select 2;

if (_change >=0.0001) then {
_pitch=_pitch+10;
[_obj,[_pitch,_bank,_yaw]] call fnc_SetPitchBankYaw;
_obj setvariable ["AP_OPBY",[_pitch,_bank,_yaw],true];
};			
if (_change <=0) then {	
_pitch=_pitch-10;
[_obj,[_pitch,_bank,_yaw]] call fnc_SetPitchBankYaw;
_obj setvariable ["AP_OPBY",[_pitch,_bank,_yaw],true];
};	

};
aph_DisassembleTarget={
_obj=player getvariable "AP_CurrentCarryObject";
if (isnull _obj) exitwith {};

_Costarray=_obj getVariable ["MaterialCost",[0,0,0,0,0,0,0,0,0]];
_ironcost= _Costarray select 0;
_steelcost= _Costarray select 1;
_platcost=_Costarray select 2;
_stonecost=_Costarray select 3;
_woolcost=_Costarray select 4;
_flaxcost=_Costarray select 5;
_woodcost=_Costarray select 6;
_plasticcost=_Costarray select 7;
_goldCost=_Costarray select 8;
_costtext= format ["
------------\n
Iron bar:  %1 \n
Steel bar:  %2 \n
Platinum bar:  %3 \n
Stone brick:  %4\n
Wool cloth:  %5\n
Flax cloth:  %6\n
Wood plank:  %7\n
Plastic bar:  %8\n
Gold bar:  %9\n
------------\n
",_ironcost,_steelcost,_platcost,_stonecost,_woolcost,_flaxcost,_woodcost,_plasticcost,_goldcost];
hint format ["%1 materials back",_costtext];

deleteVehicle _obj;

0 cutrsc ["Default","PLAIN"];
player setvariable ["AP_CurrentCarryObject","none",true];
player setvariable ["HoldingObject",false,true];
};
AP_SpawnObject={
_type=_this select 0;
_pos=player modelToWorld [0,1.5,0.05];
_obj= createVehicle [_type,_pos, [], 0, "NONE"];  
_dirP=getdir _obj;
			_obj enableSimulation false;
			
	_obj attachto [player, [0,1.25,0.5]];
		
			
		(findDisplay 46) displaySetEventHandler ["MouseZchanged","_this call AP_AdjustAttached"];
		(findDisplay 46) displaySetEventHandler ["KeyDown","_this call AP_key;false;"];
			
		player setvariable ["AP_CurrentCarryObject",_obj,true];
		[_obj,[0,0,0]] call fnc_SetPitchBankYaw;
		_PBY=_obj setvariable ["AP_OPBY",[0,0,0]];
};
ap_IntroedPlayer={
_puid=_this select 0;
_profileName=_this select 1;
_unitFileName=_this select 2;

_players=(["SERVERINFO","INTROEDPLAYERS", "PlayerList","ARRAY"] call iniDB_read);
_players=_players + [_unitfileName];
["SERVERINFO","INTROEDPLAYERS","PlayerList",_players,"ARRAY"] call iniDB_write;

aph_players=(["SERVERINFO","INTROEDPLAYERS", "PlayerList","ARRAY"] call iniDB_read);
publicVariable "aph_players";
};
aph_SwitchCharacter={
closedialog 0;
_unit=player;
_group=(_unit getvariable ["MemberArray",[]]);
_target=_this select 0;
if !(_target isKindOf "man") exitwith {};
	if (_target in (units group player)) then {
		if (count (_target getvariable ["MemberArray",[]]) <=0) then {_target setvariable ["MemberArray",_group - [_target] + [_unit],true];};
		selectplayer _target;
		{ if (_x==(leader group _x)) exitwith {};dostop _x;}foreach _group;
	};
};

//Cinematics
aph_fnc_StartSpawn={
player setvariable ["PasswordNeeded",false];
disableSerialization;
_display= uiNameSpace getVariable "IntroScreenSelect";
_quest=_display displayCtrl 2101;
_questType=lbCurSel _quest;
_text = ctrlText 1400;
player setName _text;
player setvariable ["QuestType",_questType,true];
closedialog 0;
playMusic ["IntroMusaq", 0];
_camera = "camera" camCreate [0,0,0];
_camera cameraEffect ["Internal","back"]; 


_camera camPrepareTarget [103831.16,6935.41,2412.68];
_camera camPreparePos [4079.04,265.15,54.72];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;


_camera camPrepareTarget [90762.23,6061.50,-49468.21];
_camera camPreparePos [4079.07,265.10,54.19];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 10;


waituntil {camCommitted _camera};
_camera camPrepareTarget [102563.98,6851.95,-16170.58];
_camera camPreparePos [4102.27,258.53,21.26];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 15;


waituntil {camCommitted _camera};
_camera camPrepareTarget [33798.23,94363.11,-16175.27];
_camera camPreparePos [4152.53,243.24,12.40];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 10;

//Lightening strike
	_pos=position introBoat;       
	_center = createCenter sideLogic;         
	_group = createGroup _center;     
	_zlb = _group createUnit ["ModuleLightning_F",_pos,[],0,""];    
	IntroFire attachto [Introboat, [0,9,4]];

waituntil {camCommitted _camera};
_camera camPrepareTarget [-50646.00,82319.52,-16178.17];
_camera camPreparePos [4168.49,263.18,10.28];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 12;

//Increase burning
Introfire_1 attachto [introboat,[2.5,9,2]];
sleep 4;
Introfire_2 attachto [introboat,[2.5,7,1]];
waituntil {camCommitted _camera};
sleep 7;
cutText ["","BLACK OUT",7];
sleep 7;
_camera cameraEffect ["Terminate","back"];
//onshore
Introfire attachto [Firepad1,[0,0,0]];
Introfire_1 attachto [Firepad2,[0,0,0]];
Introfire_2 attachto [Firepad3,[0,0,0]];
_null0=[]execVM "Cinematics\IntroScreen.sqf";

};
aph_fnc_lightning={
for "_i" from 1 to 15 do {
sleep (random 5);_nul = [_this select 0, nil, true] spawn BIS_fnc_moduleLightning;
};
};
aph_IntroButton={
closedialog 0;
cutText ["","BLACK IN",10];
player setdir 219.63;
player setpos [2639.51,409.774,0.00183344];
sleep 3;
[Lancer,player]execVM "Convo\StartConversation.sqf";
player setVariable ["CurrentIntroScreen",1,true];
player setVariable ["HasSeenIntro",true,true];
};
aph_NextButton={
disableSerialization;
_screen=player getVariable ["CurrentIntroScreen",1];
_display= uiNameSpace getVariable "IntroScreen";
		_TextBox= _display displayCtrl 1100;
		_RightPic= _display displayCtrl 1200;
		
if (_screen==1) then {
	ctrlSetText [1200,"Convo\Images\INTROshot1.jpg"];
	_TextBox ctrlSetStructuredText (parsetext format ['<t color="#FFFFFF" align= "LEFT" size= "1.5" shadow="2">
	<br/>
	<br/>
	<br/>	
	<br/>
   Scanning towards the sound of the voice you are taken back by the large crowd that silently fell into order around you and your would be captors. While only two openly carry weapons, you get a sense that this is not the local welcoming party.
   <br/>
   <br/>
	</t>']);	
	player setVariable ["CurrentIntroScreen",2,true];
	};
	
if (_screen==2) then {
ctrlSetText [1200,"Convo\Images\INTROshot2.jpg"];
	_TextBox ctrlSetStructuredText (parsetext format ['<t color="#FFFFFF" align= "LEFT" size= "1.5" shadow="2">
		*Snap*, a quick decision changes the course of this island forever.
	</t>']);	
	player setVariable ["CurrentIntroScreen",3,true];

};

if (_screen==3) then {
closedialog 0;
_dialog=createdialog "IntroScreenNoNext";
_display= uiNameSpace getVariable "IntroScreenNoNext";
		_TextBox= _display displayCtrl 1100;
		_RightPic= _display displayCtrl 1200;
		ctrlSetText [1200,"Convo\Images\INTROshot2.jpg"];
	_TextBox ctrlSetStructuredText (parsetext format ['<t color="#FFFFFF" align= "LEFT" size= "1.5" shadow="2">
		"We are not the help you are looking for."
	</t>']);	
	player setVariable ["CurrentIntroScreen",1,true];
};



};
aph_fnc_Introcombochanged={
_selection= lbCurSel 2100;
_text=lbText [2100, _selection];

player setFace _text;
player setvariable ["SelectedFace",_text];
};
aph_fnc_StoryArchChanged={
_selection= lbCurSel 2101;
_text=lbText [2101, _selection];

player setvariable ["SelectedStoryArch",_selection];


};
//Conversation
aph_ConvoPartnerReset={
_partner=player getvariable "CurrentConversationPartner";
	_partner enableAI "ANIM";
	//_partner enableAI "MOVE";
	_partner enableAI "FSM";
	_partner dowatch objnull;
	closeDialog 0;
};
aph_ConvKBSynth={
_unit=_this select 0;
_text=_this select 1;
_sayier=_this select 2;
_sayier kbaddtopic  ["First","talk.bikb",""];
_unit kbAddTopic ["First","talk.bikb",""];

_sayier kbTell [_unit, "First", "OpenText",["Variable",{},format ["%1",_text],[]],["Location",{},"",[]]];
};
aph_ConversationInfluenceSynth={
_partner=player getvariable "CurrentConversationPartner";
while {!isNull (uiNameSpace getVariable "ConversationSideChat")} do {

	_LoyaltyFaction=(str side _partner) + "Rating";
	_Clan=_partner getvariable ["PersonalClan",""];
	_ClanRating=_partner getvariable [_clan + "Rating",1];
	_Loyalty=player getVariable [_LoyaltyFaction,1];
		if (_Loyalty<=-1) then {
		_Loyalty=_Loyalty *-1;
		};
		if (_ClanRating<=-1) then {
		_ClanRating=_ClanRating *-1;
		};
((uiNamespace getVariable "ConversationSideChat") displayCtrl 1301) progressSetPosition _Loyalty / 100;
((uiNamespace getVariable "ConversationSideChat") displayCtrl 1302) progressSetPosition _ClanRating / 100;

};
};
aph_characterConversation={
_Scontrol=_this select 0;
_sindex=0;
_partner=player getvariable "CurrentConversationPartner";
_ConversationArray=player getVariable "ConversationOptions";


	switch (str _Scontrol) do {
		case "Control #1000": {_sindex=0;_Scontrol=1000;};
		case "Control #1001": {_sindex=1;_Scontrol=1001;};
		case "Control #1002": {_sindex=2;_Scontrol=1002;};
		case "Control #1003": {_sindex=3;_Scontrol=1003;};
		case "Control #1004": {_sindex=4;_Scontrol=1004;};
		
	};


_id= aph_dialogNodes_ID find (((_ConversationArray select 1) select _Sindex) select 4);
_dialogNode= aph_dialogNodes select _id;
//Check if end of convo

//Character say text
((uiNamespace getVariable 'ConversationSideChat')displayCtrl 1100) ctrlSetStructuredText (parsetext format ["<t size='1' color='#000000'>%1</t>",(_dialogNode select 0)]);


//run code
_code=(((_ConversationArray select 1) select _Sindex) select 2);
_argu=(((_ConversationArray select 1) select _Sindex) select 3);	
//[[[player,_partner,_argu],(compile _code)], "BIS_fnc_spawn",false, false] call BIS_fnc_MP;
[player,_partner,_argu] spawn (compile _code);

_NextID=(((_ConversationArray select 1) select _Sindex) select 4);
if (_NextID=="") exitwith {[player] call aph_ConvoPartnerReset;};

/* Possibly redundent ^^
_text = lbText [_Scontrol,0];	
if (_text=="") exitWith {[player] call aph_ConvoPartnerReset;};
if (_text==nil) exitWith {[player] call aph_ConvoPartnerReset;};
if (_text=="Exit") exitWith { [player] call aph_ConvoPartnerReset;};
if (_text=="Goodbye") exitWith { [player] call aph_ConvoPartnerReset;};
*/ 
	
	//Add New Options
	_NewforListbox=(_dialogNode select 1);
		lbclear 1000;
		lbclear 1001;
		lbclear 1002;
		lbclear 1003;
		lbclear 1004;
	
	_display=1000;
{
	_condition=(_x select 1);
if (_condition=="") then {_condition="true";};	
	if ([player,_partner] call compile _condition) then {
	_text= (_x select 0);
			_run=[_text,_display] call {
				if ((_this select 0)=="") exitwith {};
				((uiNamespace getVariable "ConversationSideChat") displayctrl (_this select 1)) lbAdd (_this select 0);	};	
	} else {	}; //end condition	
_display=_display+1;	
}foreach _NewforListbox;

player setVariable ["ConversationOptions",_dialogNode];
	
};
	//Unique Conversation functions
aph_fnc_sheepTrg={
_unit=_this;
if !(isplayer _unit) exitwith {};
if ((_unit distance ap_sheep) > 4) exitwith {};
_gBool=(_unit getvariable ["ap_sheepBool",false]);
if (_gBool) exitwith {};
_nilli=[ap_sheep,_unit]execVM "Convo\StartConversation.sqf";
};
RG_Trigger={
_trigger=_this select 0;
_player=_this select 1;
_uniform=uniform _player; 
if (_uniform=="U_O_CombatUniform_ocamo") then {

titleText ["You are behind enemy lines. Do not get spotted.", "PLAIN",1];
	
	
} else { 
	titleText ["Warning, this area is off limits! You will be shot!", "PLAIN",1];
	_list=(position _player) nearEntities ["O_Soldier_F",35];
	//Countdown
	[_player,_list,_trigger] spawn {
		_CurrentCount=0;
		_Nearby=(position (_this select 0)) nearEntities ["O_Soldier_F",25];
		while {count _Nearby>=1} do {
		_Nearby=(position (_this select 0)) nearEntities ["O_Soldier_F",25];
		sleep 1.2;
		titleText [format ["You have %1 seconds to get out of sight! You will be shot! Get %2 m away to live.",abs(_CurrentCount - 10),25], "PLAIN",1];
		_CurrentCount=_CurrentCount+1;
		if (_CurrentCount>=10) exitwith {hint "Dead"; {_x enableAI 'ANIM'}foreach (_this select 1);(_this select 0) addrating -9000; titleText ["Warning, you are now an enemy, if you are seen you will be shot!", "PLAIN",1];};
		if (count _Nearby<=0) exitwith {titleText ["You are safe.", "PLAIN",1];{_x enableAI 'ANIM'}foreach (_this select 1);};
		};
	//Guns up
	{if (isplayer _X) exitwith {};_x playmove "AmovPercMstpSlowWrflDnon_AmovPercMstpSrasWrflDnon"; _x playMove "AmovPercMstpSrasWrflDnon"; _x disableAI "ANIM";}foreach _list;
	};
};
//[[_player,"Warning",OpforRustGuard1],"aph_ConvKBSynth",(owner _player),false] call BIS_fnc_MP; 
};


//Refinery UI Boxes
aph_fnc_RefineryStartup={
_refinery= _this select 0;
_caller=_this select 1;
_caller setVariable ["RefineryObject",_refinery];
_handle= createdialog "LowRefineryUI";
disableserialization;
_display=uinamespace getvariable "LowRefineryUI";
	_Progress=_display displayCtrl 1600;
	
//Set Buttons and light 
_OnOffBool=_refinery getvariable ["MachineOn",false];

	if (_OnOffBool) then 
		{
			ctrlSetText [1205,"JournalUI\Images\OnSwitch.paa"];	
			ctrlSetText [1206,"JournalUI\Images\OnLightRefinery.paa"];
		} else 
			{
				ctrlSetText [1205,"JournalUI\Images\OffSwitch.paa"];	
				ctrlSetText [1206,"JournalUI\Images\OffLightRefinery.paa"];
			};	
	
//_Progress progressSetPosition (_refinery getvariable ["ProcessingStatus",0.01]);
sliderSetPosition [1900, 100];
lbSetCurSel [1500,0];
lbSetCurSel [1501,0];

[] spawn aph_fnc_RefreshRefineUI;
[] spawn aph_fnc_Refinery_slidervalue;
[] spawn aph_refinery_adjustQuePics;
while {!(isnull (uiNameSpace getVariable "LowRefineryUI"))} do 
	{
		sleep 0.01;
		_status=(_refinery getvariable ["ProcessingStatus",0.01]);
		_Progress progressSetPosition (_status*0.01);
	};


};
aph_fnc_Refinery_OnOffSwitch={
_refinery=player getvariable ["RefineryObject","non"];
_OnOffBool=_refinery getvariable ["MachineOn",false];
_que=_refinery getvariable ["CurrentQue",[]];
	if ( (count _que)==0) exitwith {hint "No items in que";};
	if (_OnOffBool) then 
		{
			_refinery setvariable ["MachineOn",false];
			ctrlSetText [12505,"JournalUI\Images\OffSwitch.paa"];	
			ctrlSetText [1206,"JournalUI\Images\OffLightRefinery.paa"];
		} else 
			{
				_refinery setvariable ["MachineOn",true];
				ctrlSetText [12505,"JournalUI\Images\OnSwitch.paa"];	
				ctrlSetText [1206,"JournalUI\Images\OnLightRefinery.paa"];
					//Start Processing			
					[_refinery] spawn aph_fnc_refinery_processingFunction;
			};
};
aph_fnc_refinery_processingFunction={
_refinery=_this select 0;

//end Variables

//Function while machine is on
while {_refinery getvariable ["MachineOn",false]} do	
	{
		_que=_refinery getvariable ["CurrentQue",[]];
		_item=toLower ((_que select 0) select 0);
		_wait=0.1;
			switch (_item) do	
				{
					case "aph_ironore": {_wait=0.12;};
					case "aph_platinumore": {_wait=0.15};
					case "aph_woolcloth": {_wait=0.35};
					case "aph_woodplank": {_wait=0.15};
					case "aph_goldore": {_wait=0.45};
					case "aph_stonegravel": {_wait=0.10};
					case "aph_switchgrass": {_wait=0.25};
					case "aph_flaxfiber": {_wait=0.25};
					case "aph_ironbar": {_wait=0.35};
				};
				
		sleep _wait;
		_val=(_refinery getvariable ["ProcessingStatus",0]);
		_val=_val + 1 ;
		_refinery setvariable ["ProcessingStatus",_val];
			if (_val>=100) then 
				{
					_Items=[];
					_counts=[];
						{
							_items pushback (_x select 0);
							_counts pushback (_x select 1);
						}foreach _que;
					_current=_counts select 0;
					_Current=_current-1;
						if (_current==0) then 
							{
								_que deleteAt 0;
								{
									((uinamespace getvariable "LowRefineryUI") displayCtrl (1800 + _foreachIndex )) ctrlSetStructuredText parsetext "";
								}foreach [0,1,2,3];
							} else 
								{
									_que set [0,[_items select 0,_current]];
								};
					_refinery getvariable ["CurrentQue",_que];
					_refinery setvariable ["ProcessingStatus",0];
					
					//add refined mineral
					_Reference=gettext (configfile >> "CfgWeapons" >> _items select 0 >> "author");
					_refinery additemcargoglobal [_Reference,1];		
					[] spawn aph_refinery_adjustQuePics;
					[] spawn aph_fnc_RefreshRefineUI;
					_refinery setvariable ["ProcessingStatus",0];
				};
			if ((count _que)==0) exitwith {_refinery setvariable ["ProcessingStatus",0];};
	};
//reset progress bar if above 100%
sleep 1.5;
	if ((_refinery getvariable ["ProcessingStatus",0]) >=100) then 
		{
			_refinery setvariable ["ProcessingStatus",0];
		};



};
aph_fnc_refinery_AddtoQue={
_index=lbcurSel 1501;
_refinery=player getvariable ["RefineryObject","non"];

if (_index==-1) exitwith {hint "No selection";};
_val=sliderPosition 1900;
_Val= (_val*0.1);

_array=getItemCargo _refinery;
	_items=_array select 0;
	_count=_array select 1;
_iteminQuestion=(_items select _index);
_countinQuestion=(_count select _index);
_PicReference=gettext (configfile >> "CfgWeapons" >> _iteminQuestion >> "author");
	if (_PicReference=="") exitwith {hint "This item cannot be refined"};
_que=_refinery getvariable ["CurrentQue",[]];
	_queitems=[];
	{_queitems pushback (_x select 0)}foreach _que;
if ( (count _que)>3) exitwith {hint "que is full"};

	if ((_items select _index) in _queitems) then
		{
			(_que select (_queitems find _iteminQuestion)) set [1,(_que select (_queitems find _iteminQuestion) select 1) + _countinQuestion];
		} else 
			{
				_que pushback [_items select _index,_count select _index];
			};

_refinery setvariable ["CurrentQue",_que];

//adjust refinery numbers
_items deleteAt _index;
_count deleteAt _index;

//adjust refinery inventory
clearitemcargoglobal _refinery;
{
	_refinery additemcargoglobal [_x,_count select _foreachIndex];
} foreach _items;

lbSetCurSel [1501,0];
[] call	aph_fnc_RefreshRefineUI;
[] spawn aph_refinery_adjustQuePics;
[] spawn aph_fnc_refinery_RefinerySelChanged;
};
aph_refinery_adjustQuePics={
_refinery=player getvariable ["RefineryObject","non"];
_que=_refinery getvariable ["CurrentQue",[]];
//clear que texts
		{
			((uinamespace getvariable "LowRefineryUI") displayCtrl (1800 + _foreachIndex )) ctrlSetStructuredText parsetext "";
		}foreach [0,1,2,3];
		
//clear que pics
	ctrlSetText [1222,""];
	ctrlSetText [1223,""];
		{
			ctrlSetText [_x,""];
		}foreach [120000,120001,120002,120003];

		
if ((count _que)==0) exitwith {};
{ 
	_pic=gettext (configfile >> "CfgWeapons" >> ((_que select _foreachIndex) select 0) >> "picture");
	ctrlSetText [_x,_pic];

	_kount=((_que select _foreachIndex) select 1);
		if ((typename _kount)=="SCALAR") then 
			{
				((uinamespace getvariable "LowRefineryUI") displayCtrl (1800 + _foreachIndex )) ctrlSetStructuredText parsetext format ["<t size='1.25' shadow='2'><br/><br/><br/><br/><br/><br/>     %1</t>",_kount];
			};
}foreach [120000,120001,120002,120003];

ctrlSetText [1222,""];
ctrlSetText [1223,""];

};
aph_fnc_PutButton={
_index=lbCurSel 1500;
_refinery=player getvariable ["RefineryObject","non"];
if (_index==-1) exitwith {hint "No selection"};

_val =sliderPosition 1900;
_val=_val*.1;
_PlayerInvArray=[player] call aph_checkInventory;
	_PlayerItems=_PlayerInvArray select 0;
	_PlayerCounts=_PlayerInvArray select 1;

//which item
_select=_PlayerItems select _index;

//how many
_stop=_PlayerCounts select _index;
_stop=_stop*_val;

for "_m" from 1 to _stop do {
player removeitem _select;
_refinery additemcargoglobal [_select,1];	
};
sliderSetPosition [1900, 100];
[] spawn aph_fnc_RefreshRefineUI;
[] spawn aph_fnc_refinery_RefinerySelChanged;
[] spawn aph_fnc_Refinery_slidervalue;
};
aph_fnc_TakeButton={
_val =sliderPosition 1900;
_val=_val*.1;
_index=lbcurSel 1501;
if (_index==-1) exitwith {hint "No selection"};
_refinery=player getvariable ["RefineryObject","non"];
	_array= getItemCargo _refinery;
		_refineryItems=_array select 0;
		_Refinerynumbers=_array select 1;

//which item
_select=_refineryItems select _index;

//how many
_amt=_Refinerynumbers select _index;
_amt=_amt*_val;

//new count
_count=(_Refinerynumbers select _index) - _amt;

//adjust array
_refineryNumbers set [_index,_count];

//adjust refinery numbers
clearitemcargoglobal _refinery;

{
	_refinery additemcargoglobal [_x,_refineryNumbers select _foreachIndex];
} foreach _refineryItems;

//add to player inventory
for "_v" from 1 to (round _amt) do		
	{
		player additem _select;
	
	};
sliderSetPosition [1900, 100];
[] spawn aph_fnc_RefreshRefineUI;
[] spawn aph_refinery_adjustQuePics;
[] spawn aph_fnc_Refinery_slidervalue;
[] spawn aph_fnc_refinery_RefinerySelChanged;
};
aph_fnc_Refinery_slidervalue= {
_val =sliderPosition 1900;
_val=floor (_val*10);
disableserialization;
_display=uinamespace getvariable "LowRefineryUI";
_Text=_display displayCtrl 1100;
_wanted=(parsetext format ["%1",_val]);
_Text ctrlSetStructuredText _wanted;
};
aph_fnc_refinery_RefinerySelChanged={
_index=lbcursel 1501;
if (_index==-1) exitwith {ctrlSetText [1222,""];};
_refinery=player getvariable ["RefineryObject","non"];
_array=getItemCargo _refinery;
	_items=_array select 0;
	_count=_array select 1;
_selected=_items select _index;
_pic=gettext (configfile >> "CfgWeapons" >> _selected >> "picture");
_PicReference=gettext (configfile >> "CfgWeapons" >> _selected >> "author");
_Fpic="";
	if (_PicReference=="") then {_Fpic="JournalUI\Images\Refinery\XoutImage.paa";} else {
_Fpic=gettext (configfile >> "CfgWeapons" >> _PicReference >> "picture");
	};
//set picture
[] spawn aph_fnc_Refinery_slidervalue;
ctrlSetText [1222,_pic];
ctrlSetText [1223,_Fpic];
};
aph_fnc_refinery_ReturnFromQue={
_index=_this select 0;
_refinery=player getvariable ["RefineryObject","non"];
_que=_refinery getvariable ["CurrentQue",[]];
_refinery setvariable ["ProcessingStatus",0];
	if ( (count _que)<=0) exitwith {hint "empty que"};
_count=(_que select _index) select 1;
_item=(_que select _index) select 0;
_count=_count - 1;
	if (_count==0) then 
		{
			_que deleteAt _index;
			_refinery additemcargoglobal [_item,1];
				if ((count _que)==0) then	
					{
						_refinery setvariable ["MachineOn",false];
						ctrlSetText [12505,"JournalUI\Images\OffSwitch.paa"];	
						ctrlSetText [1206,"JournalUI\Images\OffLightRefinery.paa"];
						_refinery setvariable ["ProcessingStatus",0];
					};
		} else 
			{
				_que set [_index,[(_que select _index) select 0,_count]];
				_refinery additemcargoglobal [_item,1];
			};
[] spawn aph_refinery_adjustQuePics;
[] spawn aph_fnc_RefreshRefineUI;
[] spawn aph_fnc_refinery_RefinerySelChanged;
};
	//inventories
aph_fnc_RefreshRefineUI={ 
_refinery=player getvariable ["RefineryObject","non"];
_refList=getitemcargo _refinery;
	_refineryItems=_refList select 0;
	_Refinerynumbers=_refList select 1;
_refineryCargo=itemcargo _refinery;
_PlayerInvArray=[player] call aph_checkInventory;
	_PlayerItems=_PlayerInvArray select 0;
	_PlayerCounts=_PlayerInvArray select 1;
//End Variables



//Edit Top Listboxes
lbclear 1500;
lbclear 1501;

//Add to player list
{
	_var=_PlayerCounts select _foreachIndex;
	//Raw
if (_x=="aph_IronOre") then {
lbadd [1500,format ["%1 Iron ore",_var]];
lbsetpicture [1500,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1500,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_GoldOre") then {
lbadd [1500,format ["%1 Gold ore",_var]];
lbsetpicture [1500,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1500,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_PlatinumOre") then {
lbadd [1500,format ["%1 Platinum ore",_var]];
lbsetpicture [1500,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1500,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_StoneGravel") then {
lbadd [1500,format ["%1 Stone gravel",_var]];
lbsetpicture [1500,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1500,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_WoolFiber") then {
lbadd [1500,format ["%1 Wool fiber",_var]];
lbsetpicture [1500,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1500,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_FlaxFiber") then {
lbadd [1500,format ["%1 Flax fiber",_var]];
lbsetpicture [1500,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1500,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_WoodPiece") then {
lbadd [1500,format ["%1 Wood piece(s)",_var]];
lbsetpicture [1500,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1500,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_Switchgrass") then {
lbadd [1500,format ["%1 switchgrass bundle(s)",_var]];
lbsetpicture [1500,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1500,_foreachIndex,[1,1,1,1]];
};
	//Processed
if (_x=="aph_IronBar") then {
lbadd [1500,format ["%1 Iron bar(s)",_var]];
lbsetpicture [1500,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1500,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_SteelBar") then {
lbadd [1503,format ["%1 Steel bar(s)",_var]];
lbsetpicture [1500,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1500,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_GoldBar") then {
lbadd [1500,format ["%1 Gold bar(s)",_var]];
lbsetpicture [1500,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1500,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_PlatinumBar") then {
lbadd [1500,format ["%1 Platinum bar(s)",_var]];
lbsetpicture [1500,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1500,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_StoneBrick") then {
lbadd [1500,format ["%1 Stone brick(s)",_var]];
lbsetpicture [1500,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1500,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_WoolCloth") then {
lbadd [1500,format ["%1 Wool cloth",_var]];
lbsetpicture [1500,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1500,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_FlaxCloth") then {
lbadd [1500,format ["%1 Flax cloth",_var]];
lbsetpicture [1500,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1500,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_WoodPlank") then {
lbadd [1500,format ["%1 Wood plank(s)",_var]];
lbsetpicture [1500,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1500,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_PlasticBar") then {
lbadd [1500,format ["%1 Plastic bar(s)",_var]];
lbsetpicture [1500,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1500,_foreachIndex,[1,1,1,1]];
};

}
foreach _PlayerItems;


//add to _refine list
{
	_var=_Refinerynumbers select _foreachIndex;
	//Raw
if (_x=="aph_IronOre") then {
lbadd [1501,format ["%1 Iron ore",_var]];
lbsetpicture [1501,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1501,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_GoldOre") then {
lbadd [1501,format ["%1 Gold ore",_var]];
lbsetpicture [1501,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1501,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_PlatinumOre") then {
lbadd [1501,format ["%1 Platinum ore",_var]];
lbsetpicture [1501,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1501,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_StoneGravel") then {
lbadd [1501,format ["%1 Stone gravel",_var]];
lbsetpicture [1501,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1501,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_WoolFiber") then {
lbadd [1501,format ["%1 Wool fiber",_var]];
lbsetpicture [1501,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1501,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_FlaxFiber") then {
lbadd [1501,format ["%1 Flax fiber",_var]];
lbsetpicture [1501,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1501,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_WoodPiece") then {
lbadd [1501,format ["%1 Wood piece(s)",_var]];
lbsetpicture [1501,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1501,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_Switchgrass") then {
lbadd [1501,format ["%1 switchgrass bundle(s)",_var]];
lbsetpicture [1501,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1501,_foreachIndex,[1,1,1,1]];
};
	//Processed
if (_x=="aph_IronBar") then {
lbadd [1501,format ["%1 Iron bar(s)",_var]];
lbsetpicture [1501,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1501,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_SteelBar") then {
lbadd [1501,format ["%1 Steel bar(s)",_var]];
lbsetpicture [1501,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1501,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_GoldBar") then {
lbadd [1501,format ["%1 Gold bar(s)",_var]];
lbsetpicture [1501,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1501,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_PlatinumBar") then {
lbadd [1501,format ["%1 Platinum bar(s)",_var]];
lbsetpicture [1501,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1501,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_StoneBrick") then {
lbadd [1501,format ["%1 Stone brick(s)",_var]];
lbsetpicture [1501,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1501,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_WoolCloth") then {
lbadd [1501,format ["%1 Wool cloth",_var]];
lbsetpicture [1501,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1501,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_FlaxCloth") then {
lbadd [1501,format ["%1 Flax cloth",_var]];
lbsetpicture [1501,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1501,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_WoodPlank") then {
lbadd [1501,format ["%1 Wood plank(s)",_var]];
lbsetpicture [1501,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1501,_foreachIndex,[1,1,1,1]];
};
if (_x=="aph_PlasticBar") then {
lbadd [1501,format ["%1 Plastic bar(s)",_var]];
lbsetpicture [1501,_foreachIndex,gettext (configfile >> "CfgWeapons" >> _x >> "picture")];
lbSetPictureColor [1501,_foreachIndex,[1,1,1,1]];
};
}
foreach _refineryItems; 
//REFRESH Refinery UI
};
aph_checkInventory={
_unit=_this select 0;

_playerList1=uniformitems _unit; 
_playerList2=vestitems _unit; 
_playerList3=backpackitems _unit;

_PlayerItemList=[];
_PlayerCountList=[];
{
	{
		if !(_x in _PlayerItemList) then 
			{
				_PlayerItemList pushback _x;
				_PlayerCountList pushback 1;
			} else 
				{
					_PlayerCountList set [(_PlayerItemList find _x),(_PlayerCountList select (_PlayerItemList find _x)) + 1];
				};
	}foreach _x;

}foreach [_playerList1,_playerList2,_playerList3];


[_PlayerItemList,_PlayerCountList];


};



aph_fixupRefinery={
_refinery=_this select 0;
_pos=getposasl _refinery;
_pos=[_pos select 0,_pos select 1,((_pos select 2) - 2.35)];
_refinery setposasl _pos;
};


//Ground Resources
aph_fnc_MineMineral={
_target= _this select 0;
_caller= _this select 1;
_Mineraltype= _target getVariable "MineralType";
_mineralClass="";
_count=1;
	switch (_Mineraltype) do 
		{
			case "Iron": {_mineralClass="aph_IronOre"};
			case "Gold": {_mineralClass="aph_goldore"};
			case "Stone": {_mineralClass="aph_StoneGravel"};
			case "Platinum": {_mineralClass="aph_PlatinumOre"};
			case "WoolFiber": {_mineralClass="aph_woolfiber"};
			case "FlaxFiber": {_mineralClass="aph_flaxfiber"};
			case "Woodpiece": {_mineralClass="aph_Woodpiece"};
			case "switchgrass": {_mineralClass="aph_switchgrass"};
			case "AirbaseJewel": {_mineralClass="aph_switchgrass"};
		};
//END variables
		
	//Do mining action in loop until toggled off
	while {(_caller	 getvariable ["CurrentlyMining",false])} do 
		{
		
		[[[_caller], {(_this select 0) playMove "AinvPknlMstpSnonWnonDr_medicUp1";}], "BIS_fnc_call", true, false] call BIS_fnc_MP;

		//bottom right display 
			disableserialization;		
			0 cutrsc ["BottomRightFrame","PLAIN"];
			_display= uiNameSpace getVariable "BottomRightFrame";
				_PicBox= _display displayCtrl 1200;
				_textbox=_display displayCtrl 1100;
			_textbox ctrlSetStructuredText (parsetext format ["<t color='#FFFFFF' align= 'center' size= '1.5' shadow='2'>'Mining'</t><br/>"]);
_pos = ctrlPosition _PicBox;
_vectorDirAndUp = ctrlModelDirAndUp _PicBox;
hint format ["%1",_vectorDirAndUp];
				_picbox ctrlsettext "JournalUI\Images\PAX60.paa";
			sleep 1;
				_picbox ctrlsettext "JournalUI\Images\PAX0.paa";
			sleep 1;
				_picbox ctrlsettext "JournalUI\Images\PAX30.paa";
			sleep 1;
				_picbox ctrlsettext "JournalUI\Images\PAX60.paa";
			sleep 1;
				_picbox ctrlsettext "JournalUI\Images\PAX90.paa";
			sleep 1;
		
		//check if still mining
		if !(_caller getvariable ["CurrentlyMining",false]) exitwith {};
		
		//add to inventory 
			if (_Caller canAdd _mineralClass) then {
				
				_caller additem _mineralClass;
				
				hint format ["Mined %1 %2 to inventory",_count,_Mineraltype];
			// or ground
			} else 
				{
					_pos= getpos _caller;
					_holder = createVehicle ["groundweaponholder",_pos, [],(random 3), "can_Collide"];
					_holder addweaponcargo [_mineralClass,1];
					hint format ["Mined %1 %2 to the ground",_count,_Mineraltype];
				};


		
		
		//adjust mineral amount in target
		_MinAmount=_target getvariable "MineralAmount";
		_MinAmount=_MinAmount-20;
		_target setVariable ["MineralAmount",_MinAmount,true];
		if (_MinAmount <=0) exitwith 
			{
			deleteVehicle _target;
			_caller setVariable ["CurrentlyMining",false,true];
			0 cutrsc ["Default","PLAIN"];
			[[[_caller], {(_this select 0) switchmove "AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon";}], "BIS_fnc_call", true, false] call BIS_fnc_MP;
			};
		
		_count=_count + 1;
		};



};
MiningBoxEH={

_box=_this select 0;

_box addEventHandler  ["ContainerOpened", {    

 _unit=_this select 1;   
 _container=_this select 0;      
 
	if (_unit getvariable ["OnMiningMission",false]) then {


	
		_PutIndex=_unit addEventHandler  ['Put',{      
			_unit=_this select 0;      
			_container=_this select 1;      
			_item=_this select 2;         
			
			_iron=_unit getvariable ['MiningMissionIron',0];      
			_gold=_unit getvariable ['MiningMissionGold',0];     
			_platinum=_unit getvariable ['MiningMissionPlatinum',0];     
			_stone=_unit getvariable ['MiningMissionStone',0];

			_ironColor=str HintColorRed;
			_goldColor=str HintColorRed;
			_platColor=str HintColorRed;
			_stonecolor=str HintColorRed;

			if (_item=='aph_Ironore') then {
				if ((_unit getvariable ['MiningMissionIron',0])>=5) exitwith {};
				_unit setvariable ['MiningMissionIron',(_iron + 1),true];
				clearitemcargoglobal _container;
				};
				
			if (_item=='aph_goldore') then {
				if ((_unit getvariable ['MiningMissionGold',0])>=5) exitwith {};
				_unit setvariable ['MiningMissionGold',(_gold + 1),true];
				clearitemcargoglobal _container;
				};
				
			if (_item=='aph_platinumore') then {
				if ((_unit getvariable ['MiningMissionPlatinum',0])>=5) exitwith {}; 
				_unit setvariable ['MiningMissionPlatinum',(_platinum + 1),true];
				clearitemcargoglobal _container;
				};
				
			if (_item=='aph_stonegravel') then {
				if ((_unit getvariable ['MiningMissionStone',0])>=5) exitwith {}; 
				_unit setvariable ['MiningMissionStone',(_stone + 1),true];
				clearitemcargoglobal _container;
				};
				
				if ((_unit getvariable ['MiningMissionIron',0])>=5) then {_ironColor=str HintColorBlue;};
				if ((_unit getvariable ['MiningMissionGold',0])>=5) then {_goldColor=str HintColorBlue;};
				if ((_unit getvariable ['MiningMissionPlatinum',0])>=5) then {_platColor=str HintColorBlue;};
				if ((_unit getvariable ['MiningMissionStone',0])>=5) then {_stonecolor=str HintColorBlue;};
				
				
			//Hint current progess
			hint parsetext format ['
				<br/>------------<br/>
				Iron ore: <t color=%5> %1</t>/5 <br/>
				Gold ore:  <t color=%6> %2</t>/5 <br/>
				Platinum ore: <t color=%7> %3</t>/5 <br/> 
				Stone ore:  <t color=%8> %4</t>/5 
				<br/>------------<br/><br/>',
				0 + (_unit getvariable ['MiningMissionIron',0]),
				0 + (_unit getvariable ['MiningMissionGold',0]),
				0 + (_unit getvariable ['MiningMissionPlatinum',0]),
				0 + (_unit getvariable ['MiningMissionStone',0]),
				_ironColor,			
				_goldColor,
				_platColor,
				_stonecolor];
				
					}];   
		
		//Eventhandler Index
		_unit setVariable ["MiningMiningEH",_putindex,true];
		
		
				
	} else { hint "Not mining" };     
	
	}];

 
_box addEventHandler ["ContainerClosed", {
 _unit=_this select 1;   
 _container=_this select 0;      
 
	if (_unit getvariable ["OnMiningMission",false]) then {
		_PutIndex=_unit getVariable "MiningMiningEH";
		_unit removeEventHandler ['Put',_PutIndex];
	};

}];

};

//Tasks/missions 
Assign_Mission={
_player=_this select 0;
_MissionTitle=_this select 1;
_MissionDescription=_this select 2;

// Check and add ID if needed
_missionsID=_player getVariable ["CurrentMissions_ID",[]];
_missions=_player getVariable ["CurrentMissions",[]];
	if !(_missionTitle in _missionsID) then {
		_missionsID pushback _MissionTitle;
		_missions pushback [_MissionTitle,_MissionDescription];
		_player setVariable ["CurrentMissions_ID",_missionsID,true];
		_player setVariable ["CurrentMissions",_missions,true];
	};

};
Complete_Mission={
_player=_this select 0;
_MissionTitle=_this select 1;

_player setVariable ["CompletedMissions",_NewCompleted];

//remove Mission from current list
_missionsID=_player getVariable ["CurrentMissions_ID",[]];
_missions=_player getVariable ["CurrentMissions",[]];

_missions=_missions - [(_missions select (_missionsID find _missiontitle))];
_missionsID=_missionsID - [_missionTitle];

_player setVariable ["CurrentMissions_ID",_missionsID];
_player setVariable ["CurrentMissions",_missions];

_Completed=(_player getvariable ["CompletedMissions",[]]);
_Completed pushback _MissionTitle;

_player setvariable ["CompletedMissions",_Completed];
};
aph_fnc_TuneSignal={


[["RadioAmbient2", "RadioAmbient3", "RadioAmbient4", "RadioAmbient5", "RadioAmbient6", "RadioAmbient7", "RadioAmbient8", "RadioAmbient9", "RadioAmbient10", "RadioAmbient11", "RadioAmbient12", "RadioAmbient13", "RadioAmbient14", "RadioAmbient15", "RadioAmbient16", "RadioAmbient17", "RadioAmbient18", "RadioAmbient19", "RadioAmbient20", "RadioAmbient21", "RadioAmbient22", "RadioAmbient23", "RadioAmbient24", "RadioAmbient25", "RadioAmbient26", "RadioAmbient27", "RadioAmbient28", "RadioAmbient29", "RadioAmbient30"], 10] spawn BIS_fnc_music;


};
aph_joinplayerMember={
_player=_this select 0;
_partner=_this select 1;

[_partner] join _player;
_partner enableai 'MOVE';

_Array=_player getvariable ['MemberArray',[]];
_Array=_Array + [_partner];
_player setVariable ['MemberArray',_Array,true];

_partner setVariable ['InMemberArray','Member',true];
};
aph_joinplayerSoldier={
_player=_this select 0;
_partner=_this select 1;

[_partner] join _player;
_partner enableai 'MOVE';

_Array=_player getvariable ['SoldierArray',[]];
_Array=_Array + [_partner];
_player setVariable ['SoldierArray',_Array,true];

_partner setVariable ['InMemberArray','Soldier',true];
};

/*
//Trader UI 
aph_Tfnc_OpenTraderUI={
_trader=_this select 0;
_caller=_this select 1;
_caller setVariable ["CurrentConversationPartner",_trader,true];

_dia=createdialog "TraderUI";
_WantedTrades=_trader getVariable ["CurrentWantedTrades",AP_TradesWants_Default];
_AvailableTrades=_trader getVariable ["CurrentAvailableTrades",AP_TradesHas_Default];
//spawn
_null=[] spawn {
waituntil {isnull (uiNamespace getVariable "TraderUI")};
player setVariable ["CurrentTradeOffer",[]];
};

{
_AmtWanted=(_x select 0);
_ItemWanted=(_x select 1);
_Value=(_x select 2);
	_ItemName="";
if ( isClass (configFile >> "CFGweapons" >> _ItemWanted)) then {
    //is weapon
	_ItemName=getText (configfile >> "CFGweapons" >> _ItemWanted >> "displayName");
}else{
    if ( isClass (configFile >> "CFGMagazines" >> _ItemWanted)) then {
        //is magazine
		_ItemName=getText (configfile >> "CFGMagazines" >> _ItemWanted >> "displayName");
    }else{
        //is some other class
		_ItemName=getText (configfile >> "CfgVehicles" >> _ItemWanted >> "displayName");
    };
}; 


_color="";


lbadd [1501,(str _Amtwanted)+ " " + _itemName + " " + "(" + (str _value) + ")"];



}foreach _WantedTrades;

};
aph_Tfnc_PlayerInventory={


};
aph_Tfnc_TraderInventory={
_trader=player getVariable "CurrentConversationPartner";
_WantedTrades=_trader getVariable ["CurrentWantedTrades",AP_Trades_Default];

_curTrade=_WantedTrades select (lbcursel 1501);
	_AmtWanted=(_curTrade select 0);
	_ItemWanted=(_curTrade select 1);
	_Value=(_curTrade select 2);

_PicIDC=0;
_TradingProgress=player getVariable ["CurrentTradeOffer",[]];
	switch (count _TradingProgress) do {
		case 0: {player setVariable ["CurrentTradeOffer",[[_AmtWanted,_ItemWanted]],true];_PicIDC=1203;};
		case 1: {player setVariable ["CurrentTradeOffer",[_TradingProgress select 0,[_AmtWanted,_ItemWanted]],true];_PicIDC=1204;};
		case 2: {player setVariable ["CurrentTradeOffer",[_TradingProgress select 0,_TradingProgress select 1,[_AmtWanted,_ItemWanted]],true];_PicIDC=1205;};
		case 3: {
			switch (player getVariable ["OverTakeCount",0]) do {
				case 0: {player setVariable ["CurrentTradeOffer",[[_AmtWanted,_ItemWanted],_TradingProgress select 1,_TradingProgress select 1],true];_PicIDC=1203;player setVariable ["OverTakeCount",1,true]};
				case 1: {player setVariable ["CurrentTradeOffer",[_TradingProgress select 1,[_AmtWanted,_ItemWanted],_TradingProgress select 1],true];_PicIDC=1204;player setVariable ["OverTakeCount",2,true]};
				case 2: {player setVariable ["CurrentTradeOffer",[_TradingProgress select 0,_TradingProgress select 1,[_AmtWanted,_ItemWanted]],true];_PicIDC=1205;player setVariable ["OverTakeCount",0,true]};
			};
			
		};
	};
hint format ["%1",player getVariable ["CurrentTradeOffer",[]]];
	_ItemName="";
if ( isClass (configFile >> "CFGweapons" >> _ItemWanted)) then {
    //is weapon
	ctrlSetText [_PicIDC,getText (configfile >> "CFGweapons" >> _ItemWanted >> "picture")];
}else{
    if ( isClass (configFile >> "CFGMagazines" >> _ItemWanted)) then {
        //is magazine
			ctrlSetText [_PicIDC,getText (configfile >> "CFGMagazines" >> _ItemWanted >> "picture")];;
    }else{
        //is some other class
			ctrlSetText [_PicIDC,getText (configfile >> "CfGVehicles" >> _ItemWanted >> "picture")];
    };
}; 	
	
};
aph_Tfnc_TraderButton={

};
*/


//TRADER Purchase/selling
aph_TDR_OpenUI={
disableSerialization;
_trader=_this select 0;
_caller=_this select 1;
_caller setVariable ["CurrentConversationPartner",_trader,true];

_dia=createdialog "MerchantUI";
_display= uiNameSpace getVariable "MerchantUI";
	_PlayerInvUI=_display displayCtrl 1500;
	_TraderInvUI=_display displayCtrl 1501;
	_PlayerOfferUI=_display displayCtrl 1502;
	_TraderOfferUI=_display displayCtrl 1503;
	

//Get inventory snapshots//

//o PLAYER
_playerList1=uniformitems player; 
_playerList2=vestitems player; 
_playerList3=backpackitems player;

_PlayerItemList=[];
_PlayerCountList=[];
{
	{
		if !(_x in _PlayerItemList) then {
			_PlayerItemList pushback _x;
			_PlayerCountList pushback 1;
				} else {
					_PlayerCountList set [(_PlayerItemList find _x),(_PlayerCountList select (_PlayerItemList find _x)) + 1];
				};
	}foreach _x;

}foreach [_playerList1,_playerList2,_playerList3];
//c

//o TRADER
_Trader=player getvariable ["CurrentConversationPartner",""];
_TraderInventory=_trader getvariable ["AvailableTrades",aph_DefaultTraderAvailableArray];

_TraderItems=[];
_TraderCounts=[];
_TraderPrices=[];
	{
	
	_TraderItems pushback (_x select 0);
	_TraderCounts pushback (_x select 1);
	_TraderPrices pushback (_x select 2);
	
	}foreach _traderInventory;
//c	
	
	
_PlayerUI=[["",0],["",0],["",0],["",0],["",0],["",0] ];
_TraderUI=[ ["",0],["",0],["",0],["",0],["",0],["",0]];	
	
	
player setvariable ["CurrentTradeArrays",[_PlayerItemList,_PlayerCountList,_TraderItems,_TraderCounts,_TraderPrices,_PlayerUI,_TraderUI]];
_null=[] spawn aph_TDR_RefreshPlayerInv;
_nullo=[] spawn aph_TDR_RefreshTraderInv;
[] spawn aph_TDR_CalculateCost;
};
aph_TDR_MinusButtonsTrader={
_index=_this select 0;
_Arrays=player getvariable ["CurrentTradeArrays",[]];
	_PlayerItems=_Arrays select 0;
	_PlayerCounts=_Arrays select 1;
	_TraderItems=_Arrays select 2;
	_TraderCounts=_Arrays select 3;
	_TradePrices=_Arrays select 4;
	_PlayerUIArray=_Arrays select 5;
	_TraderUIArray=_Arrays select 6;
	
_CurrentItem=(_TraderUIArray select _index) select 0;
_CurrentCount=(_TraderUIArray select _index) select 1;
_CurrentCount=_CurrentCount - 1;
if (_currentCount<0) exitwith {};
	if (_currentCount==0) then {
		_TraderUIArray set [_index,["",0]];
		player setvariable ["CurrentTradeArrays",[_PlayerItems,_PlayerCounts,_TraderItems,_TraderCounts,_TradePrices,_PlayerUIArray,_TraderUIArray],true];
		player setvariable ["MerchantTraderOvertake",_index];
		ctrlSetText [(1206 + _index),""];
		((uinamespace getvariable "MerchantUI") displayctrl (1106 + _index)) ctrlsetstructuredtext (parseText format ["<t align='center'>%1<t/>",""]);} 
			else {
				_TraderUIArray set [_index,[(_TraderUIArray select _index) select 0 ,((_TraderUIArray select _index) select 1) - 1]];
				 ((uinamespace getvariable "MerchantUI") displayctrl (1106 + _index)) ctrlsetstructuredtext (parseText format ["<t align='center'>%1<t/>",_currentCount]);
			};
		
_nulli=[] spawn aph_TDR_RefreshTraderInv;
_null=[] spawn aph_TDR_CalculateCost;
};
aph_TDR_MinusButtons={
_index=_this select 0;
_Arrays=player getvariable ["CurrentTradeArrays",[]];
	_PlayerItems=_Arrays select 0;
	_PlayerCounts=_Arrays select 1;
	_TraderItems=_Arrays select 2;
	_TraderCounts=_Arrays select 3;
	_TradePrices=_Arrays select 4;
	_PlayerUIArray=_Arrays select 5;
	_TraderUIArray=_Arrays select 6;
	
_CurrentItem=(_PlayerUIArray select _index) select 0;
_CurrentCount=(_PlayerUIArray select _index) select 1;
_CurrentCount=_CurrentCount - 1;
if (_currentCount<0) exitwith {systemchat "less than";};
	if (_currentCount==0) then {
		_PlayerUIArray set [_index,["",0]];
		ctrlSetText [(1200 + _index),""];
		((uinamespace getvariable "MerchantUI") displayctrl (1100 + _index)) ctrlsetstructuredtext (parseText format ["<t align='center'>%1<t/>",""]);} 
			else {
				_PlayerUIArray set [_index,[(_PlayerUIArray select _index) select 0 ,((_PlayerUIArray select _index) select 1) - 1]];
				 ((uinamespace getvariable "MerchantUI") displayctrl (1100 + _index)) ctrlsetstructuredtext (parseText format ["<t align='center'>%1<t/>",_currentCount]);
			};
		
//Adjust player inventory
if (_CurrentItem in _PlayerItems) then { 
	_thisindex=_PlayerItems find _CurrentItem;
	_valC=_PlayerCounts select _thisindex;
	_PlayerCounts set [_thisindex,_valC + 1];

} 
	else {
	_PlayerItems pushback _CurrentItem;
	_PlayerCounts pushback 1;	
	
	};
	
	
player setvariable ["CurrentTradeArrays",[_PlayerItems,_PlayerCounts,_TraderItems,_TraderCounts,_TradePrices,_PlayerUIArray,_TraderUIArray],true];
	
_null=[] spawn aph_TDR_RefreshPlayerInv;
_nullo=[] spawn aph_TDR_RefreshTraderInv;
_null=[] spawn aph_TDR_CalculateCost;
};
aph_TDR_CalculateCost={
disableSerialization;
//Create tradeitems and count lists
_Arrays=player getvariable ["CurrentTradeArrays",[]];
	_PlayerItems=_Arrays select 0;
	_PlayerCounts=_Arrays select 1;
	_TraderItems=_Arrays select 2;
	_TraderCounts=_Arrays select 3;
	_TradePrices=_Arrays select 4;
	_PlayerUIArray=_Arrays select 5;
	_TraderUIArray=_Arrays select 6;

//Get master array prices
_CostItems=[];
_CostPrices=[];
_BuyBackPrices=[];
{_CostItems pushback (_x select 0);_CostPrices pushback (_x select 1);_BuyBackPrices pushback (_x select 2);}foreach aph_ItemListCostArray;
	
//Player selling array
_PlayerSellItems=[];
_PlayerSellCounts=[];
{_PlayerSellItems pushback (_x select 0);_PlayerSellCounts pushback (_x select 1);}foreach _PlayerUIArray;

//Player buying array
_MerchantBuyItems=[];
_MerchantBuyCounts=[];
{_MerchantBuyItems pushback (_x select 0);_MerchantBuyCounts pushback (_x select 1);}foreach _TraderUIArray;


//Credit going to player
_Return=0;
{
	if (_x in _CostItems) then {
		_Return=_Return + ((_CostPrices select (_CostItems find _x)) * (_PlayerSellCounts select (_PlayerSellItems find _x)) );
	};

}foreach _PlayerSellItems;


//Credit going to merchant
_Cost=0;
{

	if (_x in _CostItems) then {
	
		_Cost=_Cost + ((_CostPrices select (_CostItems find _x)) * (_MerchantBuyCounts select (_MerchantBuyItems find _x)) );
	};

}foreach _MerchantBuyItems;



((uinamespace getvariable "MerchantUI") displayctrl 1112) ctrlsetstructuredtext (parseText format ["<t align='center' size='1.55'>Cost: %1<t/>",_Cost]);
((uinamespace getvariable "MerchantUI") displayctrl 1113) ctrlsetstructuredtext (parseText format ["<t align='center' size='1.55'>Return: %1<t/>",_Return]);


_total=_Return-_Cost;
player setvariable ["CurrentTraderCost",_total,true];

if (_total>=0) then {

((uinamespace getvariable "MerchantUI") displayctrl 1233) ctrlsetstructuredtext (parseText format ["<t align='center' size='1.60' color='#FFFFFF'>Total: <t color='#006600'>%1<t/><t/>",_total]);


} 
	else {
	
	((uinamespace getvariable "MerchantUI") displayctrl 1233) ctrlsetstructuredtext (parseText format ["<t align='center' size='1.60' color='#FFFFFF'>Total: <t color='#ff0000'>%1<t/><t/>",_total]);

	
	};



};

	//player
aph_TDR_RefreshPlayerInv={	
_Arrays=player getvariable ["CurrentTradeArrays",[]];
	_PlayerItems=_Arrays select 0;
	_PlayerCounts=_Arrays select 1;
	_TraderItems=_Arrays select 2;
	_TraderCounts=_Arrays select 3;
	_TradePrices=_Arrays select 4;
	_PlayerUIArray=_Arrays select 5;
	_TraderUIArray=_Arrays select 6;
	
//Clear and add new Listbox results
lbclear 1500;
	{
				_CFG="";
				if ( isClass (configFile >> "CFGweapons" >> _x)) then {
					//is weapon
					_CFG="CfgWeapons";
				}else{
					if ( isClass (configFile >> "CFGMagazines" >> _x)) then {
						//is magazine
						_CFG="CfgMagazines";
					}else{
						//is some other class
						_CFG="CfgVehicles";
					};
				}; 
			_DisplayText=gettext (configfile >> _CFG >> _x >> "displayName");
			_string=str (_PlayerCounts select _foreachIndex) +" "+ _DisplayText;
			
			lbadd [1500,_string];
			
			//Add picture to listbox selection
			_file=gettext (configfile >> _CFG >> _x >> "picture");
			lbSetPicture [1500,_foreachIndex,_file];
			lbSetPictureColor [1500,_foreachIndex,[1,1,1,1]];
		}foreach _PlayerItems;

};
aph_TDR_ClickPlayerInventory={
_index=lbcursel 1500;
//Inventories
_Arrays=player getvariable ["CurrentTradeArrays",[]];
	_PlayerItems=_Arrays select 0;
	_PlayerCounts=_Arrays select 1;
	_TraderItems=_Arrays select 2;
	_TraderCounts=_Arrays select 3;
	_TradePrices=_Arrays select 4;
	_PlayerUIArray=_Arrays select 5;
	_TraderUIArray=_Arrays select 6;

//selected item from array
_SelectedItem=(_PlayerItems select _index);
	
//Active for trade	
	_ActiveMerchantItems=[];
	_ActiveMerchantCounts=[];
	{_ActiveMerchantItems pushback (_x select 0);_ActiveMerchantCounts pushback (_x select 1);}foreach _PlayerUIArray;

_MerchantUIOvertake=0;

if ((_PlayerUIArray select 5) select 0=="") then {_MerchantUIOvertake=5;};
if ((_PlayerUIArray select 4) select 0=="") then {_MerchantUIOvertake=4;};
if ((_PlayerUIArray select 3) select 0=="") then {_MerchantUIOvertake=3;};
if ((_PlayerUIArray select 2) select 0=="") then {_MerchantUIOvertake=2;};
if ((_PlayerUIArray select 1) select 0=="") then {_MerchantUIOvertake=1;};
if ((_PlayerUIArray select 0) select 0=="") then {_MerchantUIOvertake=0;};

if ( !((_PlayerUIArray select 0) select 0=="") && !((_PlayerUIArray select 1) select 0=="") && !((_PlayerUIArray select 2) select 0=="") 
	&& !((_PlayerUIArray select 3) select 0=="") && !((_PlayerUIArray select 4) select 0=="") && !((_PlayerUIArray select 5) select 0=="") 
		&& !((_PlayerUIArray select 0) select 0==_SelectedItem)) then {
	
	//Adjust player inventory
_oldItem=((_PlayerUIArray select 0) select 0);
_oldCount=((_PlayerUIArray select 0) select 1);
		if (_oldItem in _PlayerItems) then { 
			_thisindex=_PlayerItems find _oldItem;
			_valC=_PlayerCounts select _thisindex;
			_PlayerCounts set [_thisindex,_valC + _oldCount];

		} 
			else {
			_PlayerItems pushback _oldItem;
			_PlayerCounts pushback _oldCount;	
			
			};
	};
	
player setvariable ["CurrentTradeArrays",[_PlayerItems,_PlayerCounts,_TraderItems,_TraderCounts,_TradePrices,_PlayerUIArray,_TraderUIArray],true];

	

	
//Set selected item into trade	
if (_SelectedItem in _ActiveMerchantItems) then {
	_ItemIndex=_ActiveMerchantItems find _SelectedItem;
	_AmtWanted=_ActiveMerchantCounts select _ItemIndex;
	_PlayerUIArray set [_ItemIndex,[_SelectedItem,_AmtWanted + 1]];
	((uinamespace getvariable "MerchantUI") displayctrl (1100 + _ItemIndex)) ctrlsetstructuredtext (parseText format ["<t align='center'>%1<t/>",_AmtWanted + 1]);
	} else {
	_PlayerUIArray set [_MerchantUIOvertake,[_SelectedItem,1]];
	((uinamespace getvariable "MerchantUI") displayctrl (1100 + _MerchantUIOvertake)) ctrlsetstructuredtext (parseText format ["<t align='center'>%1<t/>","1"]);
};
	
//Refresh picture images
_PicIDC=1200;
{	
_itemT=_x select 0;

if ( isClass (configFile >> "CFGweapons" >> _itemT)) then {
    //is weapon
	ctrlSetText [_PicIDC,getText (configfile >> "CFGweapons" >> _itemT >> "picture")];
}else{
    if ( isClass (configFile >> "CFGMagazines" >> _itemT)) then {
        //is magazine
			ctrlSetText [_PicIDC,getText (configfile >> "CFGMagazines" >> _itemT >> "picture")];;
    }else{
        //is some other class
			ctrlSetText [_PicIDC,getText (configfile >> "CfGVehicles" >> _itemT >> "picture")];
    };
}; 	
_PicIDC=_PicIDC+ 1;
} foreach _PlayerUIArray;	



//Adjust player inventory
_val=(_PlayerCounts select _index);
_val=_val-1;
_PlayerCounts set [_index,_val];
if (_val<=0) then {_PlayerItems deleteat _index;_PlayerCounts deleteat _index};
player setvariable ["CurrentTradeArrays",[_PlayerItems,_PlayerCounts,_TraderItems,_TraderCounts,_TradePrices,_PlayerUIArray,_TraderUIArray],true];


[] spawn aph_TDR_RefreshTraderInv;
[] spawn aph_TDR_RefreshPlayerInv;
[] spawn aph_TDR_CalculateCost;

};	

	//trader
aph_TDR_RefreshTraderInv={
_Arrays=player getvariable ["CurrentTradeArrays",[]];
	_PlayerItems=_Arrays select 0;
	_PlayerCounts=_Arrays select 1;
	_TraderItems=_Arrays select 2;
	_TraderCounts=_Arrays select 3;
	_TradePrices=_Arrays select 4;
	_PlayerUIArray=_Arrays select 5;
	_TraderUIArray=_Arrays select 6;
lbclear 1501;
	{
				_CFG="";
				if ( isClass (configFile >> "CFGweapons" >> _x)) then {
					//is weapon
					_CFG="CfgWeapons";
				}else{
					if ( isClass (configFile >> "CFGMagazines" >> _x)) then {
						//is magazine
						_CFG="CfgMagazines";
					}else{
						//is some other class
						_CFG="CfgVehicles";
					};
				}; 
			_DisplayText=gettext (configfile >> _CFG >> _x >> "displayName");
			_string=_DisplayText + " "+ str (_TradePrices select _foreachIndex) + "  (" + str (_TraderCounts select _foreachIndex) + ")";
			
			lbadd [1501,_string];
			
			//Add picture to listbox selection
			_file=gettext (configfile >> _CFG >> _x >> "picture");
			lbSetPicture [1501,_foreachIndex,_file];
			lbSetPictureColor [1501,_foreachIndex,[1,1,1,1]];
		}foreach _TraderItems;
};
aph_TDR_ClickTradersSales={
_index=lbcursel 1501;
//Inventories
_Arrays=player getvariable ["CurrentTradeArrays",[]];
	_PlayerItems=_Arrays select 0;
	_PlayerCounts=_Arrays select 1;
	_TraderItems=_Arrays select 2;
	_TraderCounts=_Arrays select 3;
	_TradePrices=_Arrays select 4;
	_PlayerUIArray=_Arrays select 5;
	_TraderUIArray=_Arrays select 6;

//selected item from array
_SelectedItem=(_TraderItems select _index);
	
//Active for trade	
	_ActiveMerchantItems=[];
	_ActiveMerchantCounts=[];
	{_ActiveMerchantItems pushback (_x select 0);_ActiveMerchantCounts pushback (_x select 1);}foreach _TraderUIArray;


_MerchantUIOvertake=0;

if ((_TraderUIArray select 5) select 0=="") then {_MerchantUIOvertake=5;};
if ((_TraderUIArray select 4) select 0=="") then {_MerchantUIOvertake=4;};
if ((_TraderUIArray select 3) select 0=="") then {_MerchantUIOvertake=3;};
if ((_TraderUIArray select 2) select 0=="") then {_MerchantUIOvertake=2;};
if ((_TraderUIArray select 1) select 0=="") then {_MerchantUIOvertake=1;};
if ((_TraderUIArray select 0) select 0=="") then {_MerchantUIOvertake=0;};
	
//Set selected item into trade	
if (_SelectedItem in _ActiveMerchantItems) then {
	_ItemIndex=_ActiveMerchantItems find _SelectedItem;
	_AmtWanted=_ActiveMerchantCounts select _ItemIndex;
	_TraderUIArray set [_ItemIndex,[_SelectedItem,_AmtWanted + 1]];
	player setvariable ["CurrentTradeArrays",[_PlayerItems,_PlayerCounts,_TraderItems,_TraderCounts,_TradePrices,_PlayerUIArray,_TraderUIArray],true];
	((uinamespace getvariable "MerchantUI") displayctrl (1106 + _ItemIndex)) ctrlsetstructuredtext (parseText format ["<t align='center'>%1<t/>",_AmtWanted + 1]);
	} else {
	_TraderUIArray set [_MerchantUIOvertake,[_SelectedItem,1]];
	((uinamespace getvariable "MerchantUI") displayctrl (1106 + _MerchantUIOvertake)) ctrlsetstructuredtext (parseText format ["<t align='center'>%1<t/>","1"]);

	};
	
//Refresh picture images
_PicIDC=1206;
{	
_itemT=_x select 0;

if ( isClass (configFile >> "CFGweapons" >> _itemT)) then {
    //is weapon
	ctrlSetText [_PicIDC,getText (configfile >> "CFGweapons" >> _itemT >> "picture")];
}else{
    if ( isClass (configFile >> "CFGMagazines" >> _itemT)) then {
        //is magazine
			ctrlSetText [_PicIDC,getText (configfile >> "CFGMagazines" >> _itemT >> "picture")];;
    }else{
        //is some other class
			ctrlSetText [_PicIDC,getText (configfile >> "CfGVehicles" >> _itemT >> "picture")];
    };
}; 	
_PicIDC=_PicIDC+ 1;
} foreach _TraderUIArray;	

[] spawn aph_TDR_RefreshTraderInv;
[] spawn aph_TDR_CalculateCost;
[] spawn aph_TDR_RefreshMerchantUI;

};

//Accept buttons
aph_TDR_AcceptSell={

//Change money
_CurrentCost=player getvariable ["CurrentTraderCost",0];
_pocketCash= player getvariable ["PocketCash",0];

player setvariable ["PocketCash",(_pocketcash + _currentCost),true];
player setvariable ["CurrentTraderCost",0,true];

//Remove items
_trades=player getvariable ["CurrentTraderOffers",[]];
	_TradeItems=[];
	_TradeCounts=[];
	{		
			
		_TradeItems pushback (_x select 0);
		_Tradecounts pushback (_x select 1);
			
	}foreach _trades;


	
player getvariable ["CurrentTraderOffers",[]];	
	
[] spawn aph_TDR_RefreshPlayerInv;
[] spawn aph_TDR_RefreshTraderInv;
[] spawn aph_TDR_CalculateCost;
};
aph_TDR_AcceptBuy={





};
aph_TDR_AcceptFull={
_Arrays=player getvariable ["CurrentTradeArrays",[]];
_trader=player getvariable ["CurrentConversationPartner",""];
	_PlayerItems=_Arrays select 0;
	_PlayerCounts=_Arrays select 1;
	_TraderItems=_Arrays select 2;
	_TraderCounts=_Arrays select 3;
	_TradePrices=_Arrays select 4;
	_PlayerUIArray=_Arrays select 5;
	_TraderUIArray=_Arrays select 6;
	
_cost=player getvariable ["CurrentTraderCost",0];

if ((_cost< -9)) exitwith {Hint "The trader will not make that trade";};

//hint the type of trade	
	if (_cost==0) then {
			hint "Made an even trade.";
			} else {
			
				if (_cost>0) then {
					hint format ["Made a trade worth %1 credit to you.\n",_cost];
				} else {
					hint format ["Made a trade worth %1 credit to the trader\n",abs(_cost)]
				};
		
		};
		

	
		
		

//take from inventory give to merchant
_TraderInventory=_trader getvariable ["AvailableTrades",aph_DefaultTraderAvailableArray];
	_TraderItems=[];
	_TraderCounts=[];
	_TraderPrices=[];
	{
		_TraderItems pushback (_x select 0);
		_TraderCounts pushback (_x select 1);
		_TraderPrices pushback (_x select 2);
	
	}foreach _traderInventory;	

	
	{
	_item= _x select 0;
	_skip=_x select 1;
	
	if (_item == "") exitwith {};
	//delete from inventory
	for "_i" from 1 to _skip do {
	[player,_item] execVM "JournalUI\deleteitem.sqf";
	};

	//add values to trader array
	if (_item in _TraderItems) then 
		{
		_index=(_TraderItems find _item);
			_TraderInventory set [_index,[_item,(_TraderCounts select _index) + 1,_TraderPrices select _index]];
		
		} else
			{
				//find cost
				_CostItems=[];
				_TraderPrices=[];
				_TraderBuyBack=[];
				{
					_CostItems pushback (_x select 0);
					_TraderPrices pushback (_x select 1);
					_TraderBuyBack pushback (_x select 2);
				
				}foreach aph_ItemListCostArray;	
				
					if (_item in _CostItems) then 
						{
							_cost=_TraderPrices select (_CostItems find _item);
						} else 
							{ 
								_cost=100;
							};
				
			//add to trader array
			_TraderInventory pushback [_item,1,_cost];
			_trader setvariable ["AvailableTrades",_TraderInventory,true];
			
			};
	}foreach _PlayerUIArray;

	
//take from merchant add to inventory
{

_item= _x select 0;
_skip=_x select 1;
for "_i" from 1 to _skip do {
[player,_item] execVM "JournalUI\additem.sqf";
};

}foreach _TraderUIArray;		

//refresh dialog	
	closedialog 0;
	[player getvariable "CurrentConversationPartner",player] spawn aph_TDR_OpenUI;
	
	
	

};
//end TRADER

//Auction House
aph_Dfnc_RefreshAHcomboBuy={
disableserialization;
_Listbox=1500;
lbclear _Listbox;
_thisP=_this select 0;
_idc=_thisP select 0;
_index=_thisP select 1;
_text = _idc lbText _index;

_FileName="AUCTIONHOUSE";  
_sectionTitle="All";
_AuctionHouseArray=([_FileName, _sectionTitle, "AvailableList","ARRAY"] call iniDB_read);
	//[	first item, amount, trade item, count]

_cur=0;
switch (_text) do {

	case "All": {
		//Add *ALL* selection to buy listbox from database available
		{ 
			
		_selling= (_x select 0);
			_CFG1="";
				if ( isClass (configFile >> "CFGweapons" >> _selling)) then {
					//is weapon
					_CFG1="CfgWeapons";
				}else{
					if ( isClass (configFile >> "CFGMagazines" >> _selling)) then {
						//is magazine
						_CFG1="CfgMagazines";
					}else{
						//is some other class
						_CFG1="CfgVehicles";
					};
				}; 
			_TextSelling=gettext (configfile >> _CFG1 >> _selling >> "displayName");
		_sellamt= (_x select 1);
		_wanting= (_x select 2);
			_CFG="";
				if ( isClass (configFile >> "CFGweapons" >> _wanting)) then {
					//is weapon
					_CFG="CfgWeapons";
				}else{
					if ( isClass (configFile >> "CFGMagazines" >> _wanting)) then {
						//is magazine
						_CFG="CfgMagazines";
					}else{
						//is some other class
						_CFG="CfgVehicles";
					};
				}; 
			_TextWanting=gettext (configfile >> _CFG >> _wanting >> "displayName");	
		_wantamt= (_x select 3);
		
		
	
		
		_textToAdd=str _sellamt+ " "+_TextSelling+ " for " +str _wantamt+ " " +_TextWanting;
		lbadd [_listbox,_textToAdd];
		
		_file=gettext (configfile >> _CFG1 >> _selling >> "picture");
		lbSetPicture [_listbox,_cur,_file];
		lbSetPictureColor [_listbox,_cur,[1,1,1,1]];
		_cur=_cur+1;
		}foreach _AuctionHouseArray;
	};
	case "": {};
	case "": {};


	}; //end switch

};
aph_Dfnc_RefreshAHcomboSellLeft={
disableserialization;
_Listbox=1501;
lbclear _Listbox;
_thisP=_this select 0;
_idc=_thisP select 0;
_index=_thisP select 1;
_text = _idc lbText _index;


_playerList1=uniformitems player; 
_playerList2=vestitems player; 
_playerList3=backpackitems player; 

_ItemList=[];
_countList=[];
{

{

	if !(_x in _ItemList) then {
		_itemlist pushback _x;_countlist pushback 1;
		} else {
		_countlist set [(_itemlist find _x),(_countlist select (_itemlist find _x)) + 1];
		
		
		};

}foreach _x;

}foreach [_playerList1,_playerList2,_playerList3];

copytoclipboard str (_itemlist + _countlist);
_cur=0;
switch (_text) do {
	case "All": {
		{
				_CFG="";
				if ( isClass (configFile >> "CFGweapons" >> _x)) then {
					//is weapon
					_CFG="CfgWeapons";
				}else{
					if ( isClass (configFile >> "CFGMagazines" >> _x)) then {
						//is magazine
						_CFG="CfgMagazines";
					}else{
						//is some other class
						_CFG="CfgVehicles";
					};
				}; 
			_DisplayText=gettext (configfile >> _CFG >> _x >> "displayName");
			_string=str (_countList select _cur) +" "+ _DisplayText;
			
			lbadd [_listbox,_string];
			
			//Add picture to listbox selection
			_file=gettext (configfile >> _CFG >> _x >> "picture");
			lbSetPicture [_listbox,_cur,_file];
			lbSetPictureColor [_listbox,_cur,[1,1,1,1]];
			_cur=_cur+1;	
		}foreach _ItemList;
	};
	case "": {};
	case "": {};

	
	}; //end switch

};
aph_Dfnc_AHSetAuction={
disableserialization;
_indexPI= lbCurSel 1501;
_indexCombo=lbCurSel 2102;
_indexPay=lbCurSel 1502;
_text=lbText [1501,_indexPI];
_textAH= lbText[2102,_indexCombo];
_textPay=APH_FULLitemList select _indexPay;
_value= parseNumber ctrlText 1400; 
_valueP= parseNumber ctrlText 1401;

if ( (_indexPI==-1) || (_indexPay==-1) ) exitwith { hint "make a selection"};

_Auctioneer=player getVariable "CurrentAuctionLocation";
_AHpos=name _Auctioneer;
_PlayName=name player;

_playerList1=uniformitems player; 
_playerList2=vestitems player; 
_playerList3=backpackitems player; 

_ItemList=[];
_countList=[];
{

{

	if !(_x in _ItemList) then {
		_itemlist pushback _x;_countlist pushback 1;
		} else {
		_countlist set [(_itemlist find _x),(_countlist select (_itemlist find _x)) + 1];
		
		
		};

}foreach _x;

}foreach [_playerList1,_playerList2,_playerList3];
	
_FileName="AUCTIONHOUSE";  
_sectionTitle=_textAH;
_AuctionHouseArray=([_FileName, _sectionTitle, "AvailableList","ARRAY"] call iniDB_read);
	
_selection=_itemlist select _indexPI;

	
_newRay=[[_selection,_value,_textPay,_valueP,getPlayerUID player,_AHpos]];
_AuctionHouseArray=_AuctionHouseArray+_newRay;
[_FileName, _sectionTitle, "AvailableList",_AuctionHouseArray,"ARRAY"] call iniDB_write;

for "_i" from 1 to _value do {
_script=[player,_selection] execVM "JournalUI\deleteitem.sqf";
};
closedialog 0; 

_nilli=execVM "Database\AuctionHouseSell.sqf";

};

	//listboxes
aph_Dfnc_SellPlayerInvLB={
_index=lbCurSel 1501;

_playerList1=uniformitems player; 
_playerList2=vestitems player; 
_playerList3=backpackitems player; 

_ItemList=[];
_countList=[];
{

{

	if !(_x in _ItemList) then {
		_itemlist pushback _x;_countlist pushback 1;
		} else {
		_countlist set [(_itemlist find _x),(_countlist select (_itemlist find _x)) + 1];
		
		
		};

}foreach _x;

}foreach [_playerList1,_playerList2,_playerList3];

_item=_itemlist select _index;
	_CFG="";
				if ( isClass (configFile >> "CFGweapons" >> _item)) then {
					//is weapon
					_CFG="CfgWeapons";
				}else{
					if ( isClass (configFile >> "CFGMagazines" >> _item)) then {
						//is magazine
						_CFG="CfgMagazines";
					}else{
						//is some other class
						_CFG="CfgVehicles";
					};
				}; 
				
_file=gettext (configfile >> _CFG >> _item >> "picture");				
		ctrlSetText [1200, _file];
	
};
aph_Dfnc_SellWantedItemsLB={
_index=lbCurSel 1502;

_item=APH_FULLitemList select _index;
	_CFG="";
				if ( isClass (configFile >> "CFGweapons" >> _item)) then {
					//is weapon
					_CFG="CfgWeapons";
				}else{
					if ( isClass (configFile >> "CFGMagazines" >> _item)) then {
						//is magazine
						_CFG="CfgMagazines";
					}else{
						//is some other class
						_CFG="CfgVehicles";
					};
				}; 
				
_file=gettext (configfile >> _CFG >> _item >> "picture");				
		ctrlSetText [1201, _file];
	
};
aph_Dfnc_HandleBuyBtn={
disableserialization;
_index=lbcursel 1500;
_text=lbtext [1500,_index];
_indexCombo=lbCurSel 2100;
_textAH= lbText[2100,_indexCombo];

_FileName="AUCTIONHOUSE";  
_sectionTitle=_textAH;
_AuctionHouseArray=([_FileName, _sectionTitle, "AvailableList","ARRAY"] call iniDB_read);

_selection=_AuctionHouseArray select _index;
	_item=_selection select 0;
		_TextItem=gettext (configfile >> "CfgWeapons" >> _item >> "displayName");
	_itemcount=_selection select 1;
	_cost=_selection select 2;
	_costcount=_selection select 3;

	
player setVariable ["CurrentAuctionHouseQuery",[_selection,_index,_textAH],true];
	
closedialog 0;	
	//POPUP DISPLAY
_handle=createdialog "AuctionHouseConfirmBuy";
_textToDisplay=parsetext (format ["
 
<t size='1.95' color='#66CCFF'>
Item: 			%1 %2<br/><br/>
Cost: 			%3 %4<br/><br/><br/>
<t  align='center' size='1.75' color='#FFFFFF'>
Do you accept this trade?
</t></t>",_itemcount,_TextItem,_costcount,_cost]);

_display = uiNameSpace getVariable "AuctionHouseConfirmBuy";
		_text= _display displayCtrl 1100;
_text ctrlSetStructuredText _textToDisplay;


};
aph_Dfnc_AHBuyNo={
closedialog 0;	
_Niull=[]execVM "Dialog\AuctionHouseBuy.sqf";
};
aph_Dfnc_AHBuyYes={
closedialog 0;
closedialog 1; 
//Get variables for player wanted Auctions
_itemsRefined=player getVariable "CurrentAuctionHouseQuery";
	_itemsInDebate=_itemsRefined select 0;
		_item=_itemsInDebate select 0;
		_itemcount=_itemsInDebate select 1;
		_cost=_itemsInDebate select 2;
		_costcount=_itemsInDebate select 3;
	_Arrayindex=_itemsRefined select 1;
	_ComboIndex=_itemsRefined select 2;
	
_FileName="AUCTIONHOUSE";  
_sectionTitle=_ComboIndex;	
_AuctionHouseArray=([_FileName, _sectionTitle, "AvailableList","ARRAY"] call iniDB_read);
	
	
//Check if player can afford trade
_playerList=itemcargo player; 
_count=0;
if ( _cost in _playerList ) then {

	
	{
		if (_x==_cost) then { _count=_count + 1 };
	} foreach _playerlist;
		if ( _count >= _costCount ) then {
			
			//if all is good
				for "_i" from 1 to _itemcount do { player additem _item; };
				_AuctionHouseArray deleteAt _Arrayindex;
				[_FileName, _sectionTitle, "AvailableList",_AuctionHouseArray,"ARRAY"] call iniDB_write;
					for "_i" from 1 to _costCount do {
					_script=[player,_cost] execVM "JournalUI\deleteitem.sqf";
					};
				
		} else { hint  format ["You do not have enough %1 to trade",_cost];	};

} else { hint "You do not have that item" };

_Niull=[]execVM "Database\AuctionHouseBuy.sqf";
	
};

	//Sort buttons
aph_Dfnc_SortByBuying={

hint "buying";

};
aph_Dfnc_SortBySelling={

hint "selling";

};

//Rust miner functions
aph_Rfnc_FindandMine={
sleep (random 30);
_unit=_this select 0;
_rock=position _unit nearestObject "AP_GroundRock"; 	
_storage=position _unit nearestObject "C_supplyCrate_F";
_unit forcewalk true;

while {(alive _unit) && (_unit getvariable ["OnAutopilot",true])} do {
	//move and mine rock, on sleep timer
	_unit domove (getpos _rock);
	
	waitUntil {_unit distance _rock<10};
	sleep 6;
		for "_i" from 1 to ((floor (random 9)) + 10) do {

			[[[_unit], {(_this select 0) playMove "AinvPknlMstpSnonWnonDr_medicUp1";}], "BIS_fnc_call", true, false] call BIS_fnc_MP;
			sleep 4.3;
		};
	[[[_unit], {(_this select 0) playMove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown";}], "BIS_fnc_call", true, false] call BIS_fnc_MP;

	
		//Move to store box
		_storage= Rust_DropBoxes call BIS_fnc_selectRandom;
		_unit domove (getpos _Storage);
		
		waitUntil {_unit distance _rock<10};
		sleep 6;
		[[[_unit], {(_this select 0) playMove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown";}], "BIS_fnc_call", true, false] call BIS_fnc_MP;
		sleep 2.3;
};




};

//Learn Blueprint
aph_fnc_learnBlueprint={
//Get object details
if (player getvariable ["IsLearningBP",false]) exitwith {hint "already learning"};
player setvariable ["IsLearningBP",true];
_object=_this select 0;
_objectType=(typeof _object);
_blueprintTypes=[];

	{
		_blueprintTypes pushback (gettext (Missionconfigfile >> "BluePrintInfo" >> _x >> "ItemCreated"));

	}foreach aph_Arr_Blueprints;

if (_objectType in _blueprintTypes) then {
  
	_blueprint=aph_Arr_Blueprints select (_blueprintTypes find _objectType);
	//Get player info
	_initialPOS=position player;
	_KnownBP=player getvariable ["KnownBlueprints",[]];
	_skill=1;

	//Get blueprint info
	_difficulty=getnumber (Missionconfigfile >> "BluePrintInfo" >> _blueprint >> "Difficulty");
	_name=gettext (Missionconfigfile >> "BluePrintInfo" >> _blueprint >> "Name");

	//
	_Types=[];
	{_Types pushback (_x select 0)}foreach _KnownBP;
	//If already have Blueprint
	if (_objectType in _Types) then 
	{
		_selection=_KnownBP select (_Types find _objectType);
		_Progress=_selection select 1;
			while {(_Progress<=99)} do 
			{
					if  !((position player) distance _initialPOS<=1) exitwith {hint "You need to stay still to concentrate";player setvariable ["IsLearningBP",false]};
				_progress=_progress + 1;
				_KnownBP set [(_Types find _objectType),[_objectType,_progress]];
				player setVariable ["KnownBlueprints",_knownBP,true];
				hint parsetext format ["Learning BP: %1 <br/> %2" + " percent",_name,_progress];
				sleep ((_difficulty*0.5)/_skill);
			};
		
			if (_Progress>=100) exitwith 
				{
					player setvariable ["IsLearningBP",false];
					hint "learned";
				};
	} else 
		{
		//Start new Blueprint
			_knownBP pushback [_objectType,0];
			_progress=0;
			_Types pushback _objectType;
			while {(_Progress<=99)} do 
				{
						if  !((position player) distance _initialPOS<=1) exitwith {hint "You need to stay still to concentrate";player setvariable ["IsLearningBP",false];};
					_progress=_progress + 1;
					_KnownBP set [(_Types find _objectType),[_objectType,_progress]];
					player setVariable ["KnownBlueprints",_knownBP,true];
					hint parsetext format ["Learning BP: %1 <br/> %2" + " percent",_name,_progress];
					sleep ((_difficulty*0.5)/_skill);
				};
				if (_Progress>=100) exitwith {
					player setvariable ["IsLearningBP",false];
						hint "learned";
					};
		};
} else {
	hint "cannot learn this object"
};
};

//AirBase Resource Collecting
aph_ResourceCollectorAddaction={
_object=_this select 0;
_unit=_this select 1;

[[_object,["Gather Resources",aph_fnc_MachineGatherResource,[_object], 0, false, false, "", ""]],"addAction",true,true] call BIS_fnc_MP;  

};

//delay abort
aph_fnc_delayAbort={
disableSerialization;
_abortButton = (findDisplay 49) displayCtrl 1010;
/*
_abortButton ctrlEnable false;
_countdown=10;
while {_countdown>=1} do
	{
		hint format ["%1",_countdown];
		_abortButton ctrlSetText format ["%1",_countdown];
		sleep 1;
		_countdown=_countdown-1;
	
	};

_abortButton ctrlEnable true;
*/
};

//Collect Resource
aph_fnc_MachineGatherResource={
_object=_this select 0;
_caller=_this select 1;

_Resource=(getpos _object) nearestObject "Land_spp_Transformer_F";

hint format ["%1  %2",_object,_caller];
	
if (_object getvariable ["TurnedOn",false]) then { 

	_object setvariable ["TurnedOn",false,true];
	hint "Turned off";
} else {
	if ((_resource distance _object) <=5) then {
	
		_object setvariable ["TurnedOn",true,true];
		_s=[_object,_caller] spawn {
			while {(_this select 0) getvariable ["TurnedOn",false]} do {
			(_this select 0) additemcargoglobal ["aph_AlienOre",1];
			sleep 5;
			};
		};
		
		hint "Turned on";
	
	} else {
	
		hint "No resource locations nearby";
		
	};
};
};
//OBJECTS Useable

//Knife
aph_StabAttack={
_obj=cursortarget;
if (_obj isKindOf "man") then {

_playerList1=itemcargo uniformcontainer player; 

	if (("aph_CombatKnife" in _playerList1) and (player distance _obj <=2.1) ) then {
	_knife= createVehicle ["aph_combatKnife", position player, [], 0, "none"] ;
	_knife attachto [player,[-0.18,0.07,-0.25],"lefthand"]; 
		sleep 0.4;
		[[[player], {(_this select 0) playMove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown";}], "BIS_fnc_call", true, false] call BIS_fnc_MP;
		sleep 1.0;
		
		_obj1=cursortarget;
			if ((_obj==_obj1) && (player distance _obj <=2.1)) then {
		_obj setdamage 1;
		};
	
	deleteVehicle _knife;	
};
};	

};

//Lantern
aph_fnc_HandLantern={
_target=_this select 0;
_unit=_this select 1;
_ID=_this select 2;
_onOff=_this select 3;
_unit removeAction _ID;
	_lamp=_unit getvariable "PersonalLamp";
	deleteVehicle _lamp;
player setvariable ["PersonalLamp",[],true];
};

//InitPlayerLocal EH
aph_fnc_KilledEH={
_unit=_this select 0;
_killer=_this select 1;
_NewGroup=(units group _unit) -[_unit];
if ((count _Newgroup)==0)exitwith {

		[[[],{
		
			_puid = getPlayerUID player;
			_profileName=profileName;
			[[[player,_profileName,_puid,true],"Database\PlayerSave.sqf"],"BIS_fnc_execVM",false,false] call BIS_fnc_MP;
			diag_log player;
		}], "BIS_fnc_spawn",(owner _unit), false] call BIS_fnc_MP;
		
		
		hint "Your whole team is dead."; 
		"LOSER" call BIS_fnc_endMission;
		
		
		};
_Newunit=(_NewGroup call BIS_fnc_selectRandom);


disableserialization;
1 cutRsc ["OnPlayerKilledUI","PLAIN"];
_Display=uiNameSpace getvariable "OnPlayerKilledUI";
_text=_Display displayCtrl 1100;
["<t color='#ffffff' size='1.35' align='center' shadow='1' shadowColor='#000000'>%1</t>",_ToTopText];
_text ctrlsetstructuredtext parsetext format ["<t size='1.35' align='center'>Your teammate %1 has died.</t>",name _unit];



_Newunit addMPEventHandler ["MPkilled",{[_this select 0,_this select 1] call aph_fnc_KilledEH;} ];
_variables=allvariables _unit;
{
	if (_x in aph_SavedVariables)
		then { 
			_var=_unit getvariable _x;
			if ((typeName _var)=="ARRAY" || (typeName _var)=="SCALAR" || (typeName _var)=="STRING" ) then {
			diag_log (typeName _var);
				_NewUnit setvariable [_x,_var,true];
				hint format ["%1 %2",_x, _var];};
		} else {	};
}foreach _variables;

sleep 1;

_CleanGroup=creategroup (side _unit);
{[_x] join _CleanGroup}foreach _NewGroup;
_CleanGroup selectLeader _Newunit;
selectplayer _Newunit;
};








/*
aph_Dfnc_RefreshAHcomboSellLeft={
disableserialization;
hint "AH COMBO sell left";
_Listbox=1500;
lbclear _Listbox;
_display=((uiNamespace getVariable "AuctionHouseSell") displayCtrl 2100);
_index=lbcursel _display;
_text= _display lbText _index;
_FileName="AUCTIONHOUSE";  
_sectionTitle=_text;
_AuctionHouseArray=([_FileName, _sectionTitle, "AvailableList","ARRAY"] call iniDB_read);
	//[	first item, amount, trade item, count,player who made, location of AH]
_cur=0;
switch (_text) do {
	case "All": {
		{ 
			_selling= (_x select 0);
				_TextSelling=gettext (configfile >> "CfgWeapons" >> _selling >> "displayName");
			_sellamt= (_x select 1);
			_wanting= (_x select 2);
			_wantamt= (_x select 3);
			
			_textToAdd=str _sellamt+" "+_TextSelling+ " for " +str _wantamt+" " +_wanting;
			
			lbadd [_listbox,_textToAdd];
			
			//Add picture to listbox selection
			_file=gettext (configfile >> "CfgWeapons" >> _selling >> "picture");
			lbSetPicture [_listbox,_cur,_file];
			_cur=_cur+1;
		}foreach _AuctionHouseArray;
	};
	case "": {};
	case "": {};


	}; //end switch

};

*/

