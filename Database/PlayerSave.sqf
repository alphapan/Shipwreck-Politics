//Character INFO
_unitP = _this select 0;
_unit=leader (group _unitP);
_profileName=_this select 1;
_puid=_this select 2;
_bool=false; 
	if ( (count _this)==4) then {_bool=_this select 3;};

_unitFileName = format["%1_%2",_puid,(_profileName call iniDB_CRC32)];
_sectionTitle="PlayerSavedInfo";

//Current Variables
_VarList=[];
_variables=allvariables _unit;
{
	if (_x in aph_SavedVariables)
		then { 
			_var=_unit getvariable _x;
			if ((typeName _var)=="ARRAY" || (typeName _var)=="SCALAR" || (typeName _var)=="STRING" ) then {
			_varlist=_varlist+[[_x,_var]]} else { _varlist=_varlist+[[_x,str _var]]};
		} else {	};
}foreach _variables;
[_unitFileName, _sectionTitle, "variables", _varlist,"ARRAY"] call iniDB_write;

// save position/Loadout data
[_unitFileName, _sectionTitle, "pos", [getposasl _unit,direction _unit,name _unit]] call iniDB_write;
[_unitFileName, _sectionTitle, "loadout",([_unit] call getLoadout)] call iniDB_write;
	if (_bool) then {
		[_unitFileName, _sectionTitle, "pos", [[2603.47,366.211,0.0016098],357.313,name _unit]] call iniDB_write;
		[_unitFileName, _sectionTitle, "loadout",[[],"",["","","",""],"",["","","",""],"",["","","",""],"U_C_Poloshirt_redwhite",[],"",[],"",[],[[],[],[],[]],"HandGrenade_Stone","HandGrenade_Stone"]] call iniDB_write;
	};



//SAVE group info

//count 
_count=(count (units group _unit)) - 1;
[_unitFileName, _sectionTitle, "GroupCount", _count] call iniDB_write;

_units=(units (group _unit)) - [_unit];
_groupInfo=[];	
{
_name=name _x;
_string=_name;
_array=toarray _string;
while {39 in _array} do {
	_index=_array find 39;
	_array set [_index,32];
	_string=tostring _array;
};
_newArray= [([_x] call getLoadout),(_x getVariable 'InMemberArray'),_string];
_groupInfo pushback _newArray;


}foreach _units;
[_unitFileName, _sectionTitle, "GroupInfo", _groupInfo,"ARRAY"] call iniDB_write;





diag_log format ["Player Saved: %1 %2 %3",_unit,_profileName,_puid];

