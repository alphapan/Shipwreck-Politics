_FileName="SERVERINFO";
_sectionTitle="STOREDOBJECTS";

_weather=([_FileName, _sectionTitle, "Weather","ARRAY"] call iniDB_read);
_objectRay=([_FileName, _sectionTitle, "ObjectList","ARRAY"] call iniDB_read);
_TreeList=([_FileName, _sectionTitle, "TreeList","ARRAY"] call iniDB_read);
_BoxList=([_FileName, _sectionTitle, "BoxList","ARRAY"] call iniDB_read);

//Weather
_date=_weather select 0;
_overcast=_weather select 1;
_rain=_weather select 2;
_fog=_weather select 3;
_NWC=_weather select 4;

setdate _date;
0 setOvercast _overcast;
0 setRain _rain; 
0 setFog _fog;
forceWeatherChange; 


_count=count _objectRay;
_countT=count _TreeList;
_countB=count _BoxList;


{
_type=_x select 0;
_pos=_x select 1;
_dir=_x select 2;
_owner=_x select 3;
_PBY=_x select 4; 
_Cost=_x select 5;

_object=createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
_add=0;
if (_type=="Land_Obstacle_Ramp_F") then {_add=0.30};
_object setposasl [_pos select 0,_pos select 1,(_pos select 2) + _add];
_object setdir _dir;
[_object,_PBY select 0, 0] call BIS_fnc_setPitchBank;
_object setVariable ["APH_OBJECTBOOL",true,true];
_object setVariable ["AP_OPBY",_PBY,true];
_object setVariable ["MaterialCost",_Cost,true];

if ((_object isKindOf "Land") || (_object isKindOf "Air") || (_object isKindOf "Ship")) then {
	
	_object setObjectTextureGlobal [0,(_x select 5) select 0];

};

_object allowdamage true;
_object enableSimulation true;

		if (_type=="ap_BuildTable") then {
		[_object,_owner] spawn aph_spawnBuildingTable;
		};


		if (_type=="ap_BuildGarage") then {
		//create 
		[_object] spawn aph_spawnPersonalGarage;
		};
		

}
foreach _objectRay;

{
_type=_x select 0;
_pos=_x select 1;
_dir=_x select 2;
_growthSize=_x select 3;
_PBY=_x select 4; 
_object=createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
_object setposasl _pos;
_object setdir _dir;
_object setVariable ["APH_OBJECTBOOL",true,true];
_object setVariable ["AP_TREE",true,true];	
_object setVariable ["CurrentGrowthSize",(_growthSize + 1),true];
_object setOwner 0;
//wil break with edits
[_object] spawn aph_fnc_GrowPlant;

}
foreach _treelist;

{
_type=_x select 0;
_pos=_x select 1;
_dir=_x select 2;
_owner=_x select 3;
_PBY=_x select 4; 
_cost=_x select 5;
_ItemCargo=_x select 5;
	_items=(_ItemCargo select 0);
	_itemsCount=(_ItemCargo select 1);
_WeaponCargo=_x select 6;
	_weapons=(_WeaponCargo select 0);
	_weaponsCount=(_WeaponCargo select 1);
_MagazineCargo=_x select 7;
	_Magazines=(_MagazineCargo select 0);
	_MagazinesCount=(_MagazineCargo select 1);
	
_object=createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
_object setposasl _pos;
_object setdir _dir;
_object setVariable ["APH_OBJECTBOOL",true,true];
_object setVariable ["MaterialCost",_cost,true];

_i=0;{_object addItemCargoGlobal [_x,(_itemsCount select _i)];_i=_i+1;}foreach _items;
_w=0;{_object addWeaponCargoGlobal [_x,(_weaponsCount select _w)];_w=_w+1;}foreach _weapons;
_m=0;{_object addMagazineCargoGlobal [_x,(_MagazinesCount select _m)];_m=_m+1;}foreach _magazines;

}
foreach _BoxList;

hint format ["created \n %1 objects \n %2 tree \n %3 boxes",_count,_countT,_countB];

