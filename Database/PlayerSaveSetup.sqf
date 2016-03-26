_puid = getPlayerUID player;
_profileName=profileName;
[[[player,_profileName,_puid],"Database\PlayerSave.sqf"],"BIS_fnc_execVM",false,false] call BIS_fnc_MP;