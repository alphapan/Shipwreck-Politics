

if !(isServer) exitwith {};

//SERVER INFO
_MasterList= markerpos "AP_ServerMarker" nearObjects ["All",7500];

	_objectlist=[];
	_treelist=[];
	_boxList=[];
	
{
	_bool=_x getVariable ["APH_OBJECTBOOL",false];
	_tree=_x getVariable ["AP_Tree",false];
		if (_bool) then 
			{
			
				if (_tree) then { 
			
					_treelist pushback [typeof _x,getposasl _x,getdir _x,(_x getvariable ["CurrentGrowthSize",0])];
			
				} else {
				
					if (_x isKindOf "Aph_Boxes") then { 
						
					_boxList pushback [typeof _x,getposasl _x,getdir _x,(_x getvariable ["CurrentOwner","none"]),(_x getVariable ["AP_OPBY",[0,0,0]]),(getItemCargo _x),(getweaponCargo _x),(getMagazineCargo _x),_x getVariable ["MaterialCost",[0,0,0,0,0,0,0,0,0]]];	
					
					} else {
						
						if ( (_x isKindOf "Land") || (_x isKindOf "Air") || (_x isKindOf "Ship") ) then {
							
						_objectlist pushback [typeof _x,getposasl _x,getdir _x,(_x getvariable ["CurrentOwner","None"]),(_x getVariable ["AP_OPBY",[0,0,0]]),getObjectTextures _x,_x getVariable ["MaterialCost",[0,0,0,0,0,0,0,0,0]]];	
						
						} else {
			
						_objectlist pushback [typeof _x,getposasl _x,getdir _x,(_x getvariable ["CurrentOwner","None"]),(_x getVariable ["AP_OPBY",[0,0,0]]),_x getVariable ["MaterialCost",[0,0,0,0,0,0,0,0,0]]];
						
						};
					};
			};	

		};//end object bool
}foreach _MasterList;



//weather
_weatherarray=[date,overcast,rain,fog,nextWeatherChange];

_FileName="SERVERINFO";
_sectionTitle="STOREDOBJECTS";

[_FileName, _sectionTitle, "Weather",_weatherarray,"ARRAY"] call iniDB_write;
[_FileName, _sectionTitle, "ObjectList",_objectlist,"ARRAY"] call iniDB_write;
[_FileName, _sectionTitle, "TreeList",_treelist,"ARRAY"] call iniDB_write;
[_FileName, _sectionTitle, "BoxList",_boxList,"ARRAY"] call iniDB_write;


//		[[[],"Database\GatherServerObjects"],"BIS_fnc_execVM",false,false] call BIS_fnc_MP;