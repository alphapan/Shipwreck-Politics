_unit = _this select 0;
_profileName=_this select 1;
_puid=_this select 2;
	
_unitFileName = format["%1_%2", _puid, (_profileName call iniDB_CRC32)];
_sectionTitle="PlayerSavedInfo";

//Set Variables
_variables=([_unitFileName, _sectionTitle, "variables", "ARRAY"] call iniDB_read);
{  
_variable=_x select 0;
_value=_x select 1;


		//o Special Variables

			//o Quests
			if (_variable=="Quest_CaughtRabbits") exitwith {
			
				if (_value <=2) then {
					[_unit] spawn aph_F_catchRabbit;
					_unit setVariable [_variable,_value,true];
					};
			};
			//c

		//c	


//Standard Assign
_unit setVariable [_variable,_value,true];

if (typeName _value == "STRING") then {
		if (_value=="true") then {_unit setVariable [_variable,true,true];};
		if (_value=="false") then {_unit setVariable [_variable,false,true];};
	};
	

}foreach _variables;


if (!(_unit getVariable ["HasSeenIntro",false])) then {

	[[[_unit],"Cinematics\IntroScreenSelect.sqf"],"BIS_fnc_execVM",(owner _unit),false] call BIS_fnc_MP;
	[_unit,[[],"",["","","",""],"",["","","",""],"",["","","",""],"U_C_Poloshirt_redwhite",[],"",[],"",[],[[],[],[],[]],"HandGrenade_Stone","HandGrenade_Stone"]] spawn setLoadout
	};


//loadout
_loadout= ([_unitFileName, _sectionTitle, "loadout", "ARRAY"] call iniDB_read);
		[[[_unit,_loadout],{	
			[(_this select 0),(_this select 1)] spawn setLoadout;
		}],"BIS_fnc_spawn",(owner _unit),false] call BIS_fnc_MP;
		
//set position
_posArray= ([_unitFileName, _sectionTitle, "pos", "ARRAY"] call iniDB_read);
_unit setdir (_posArray select 1);
_unit setposasl (_posArray select 0);
_unit setName (_posArray select 2);





_face=_unit getvariable ["SelectedFace","whiteHead_01"];
_unit setFace _face;

	
_groupNumber=([_unitFileName, _sectionTitle, "GroupCount", "SCALAR"] call iniDB_read);
_groupInfo=([_unitFileName, _sectionTitle, "GroupInfo", "ARRAY"] call iniDB_read);

sleep 5;
_n=0;
for "_s" from 1 to _groupNumber do {
		
		_current=_groupInfo select _n;
		
		[[[_unit,_current],{
			_unit=_this select 0;
			_current=_this select 1;
			_Nunit = (group _unit) createUnit ["C_man_1", Position _unit, [], 0, "FORM"];
			_nUnit setname (_current select 2);
			[_nUnit] join (group _unit);		
			[_Nunit,(_current select 0)] spawn setLoadout;
			_Nunit setVariable ['InMemberArray',(_current select 1),true];
			_Nunit setVariable ['GroupMaster',_unit,true];
			_groupArray=_unit getVariable [(_current select 1)+"Array",[]];
			_groupArray=_groupArray + [_Nunit];
			_unit setVariable [(_current select 1)+"Array",_groupArray,true];
		}],"BIS_fnc_spawn",(owner _unit),false] call BIS_fnc_MP;

_n=_n+1;
};


