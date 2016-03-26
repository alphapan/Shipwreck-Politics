//fix for missing UI at times
createdialog "PlayerUINotebook";
closedialog 0;

//Load Conversations
_nulla=execVM "Convo\ConversationFunctions.sqf";
_nulli=execVM "Convo\ConversationArchive.sqf";

//Functions
_nullF=[]execVM "ActiveFunctions.sqf";
_null=execvm "JournalUI\UIEventhandlers.sqf";
_nullT=execVM "Convo\TradesArchive.sqf";
getLoadout = compile preprocessFileLineNumbers 'database\get_loadout.sqf';
setLoadout = compile preprocessFileLineNumbers 'database\set_loadout.sqf';
_masters=[]execVM "database\ArraysMASTER.sqf";


//Setup 
player additem "aph_Rarestone";
_index =player createDiarySubject ["Controls","Controls"];
player createDiaryRecord ["Controls",["Controls", "Open Journal : 'T'  <br/>Start Conversation : 'H'<br/>Pickup/Drop Object: 'F'<br/>		Vertical: 'ctrl + T'<br/>		Rotate: 'shift + T'<br/>		Tilt:'alt + T' <br/>Learn Blueprint: 'ctrl+F'</br> "]];
player addMPEventHandler ["MPkilled",{[_this select 0,_this select 1] call aph_fnc_KilledEH;} ];





//Key bindings 
waituntil {(!isnull (finddisplay 46)) && (scriptDone _nullF)};
//sleep 2.5;
diag_log ((findDisplay 46) displayAddEventHandler ["KeyDown","_this call AP_key;false;"]);

_puid = getPlayerUID player;
_profileName=profileName;
[[[player,_profileName,_puid],"Database\SetPlayerInfo.sqf"],"BIS_fnc_execVM",false,false] call BIS_fnc_MP;


player addEventHandler ["Fired",{
    _unit=_this select 0;
    _weapon=_this select 1;
    _muzzle=_this select 2;
	_mode=_this select 3;
    _ammo=_this select 4;
    _magazine=_this select 5;
	_bullet=_this select 6;

	if ( (_weapon=="arifle_Mk20_GL_F") && (_magazine=="1Rnd_SmokeRed_Grenade_shell") ) then {

_this spawn
	{
		_bullet = _this select 6;
		_unit=(_this select 0);
		_pos= getPosATL _bullet;
		_Run=true;
		while {_Run} do {
			_pos = getPosATL _bullet;
	
			if ((_pos select 2) <= 0.7) then {hint format ["%1",_pos];_Run=false;sleep 0.05;_unit setpos _pos;};
			
			};
	};
} else {};
}];


addMissionEventHandler ["Draw3D", {
	drawLine3D [[(getpos ap_gen) select 0,(getpos ap_gen) select 1,((getpos ap_gen) select 2) + 0.2],[(getpos firstpost) select 0,(getpos firstpost) select 1,((getpos firstpost) select 2) + 0.2], [1,0,0,1]];
	drawLine3D [[(getpos firstpost) select 0,(getpos firstpost) select 1,((getpos firstpost) select 2) + 0.2] ,[(getpos secondpost) select 0,(getpos secondpost) select 1,((getpos secondpost) select 2) + 0.2], [1,0,0,1]];
	drawLine3D [[(getpos secondpost) select 0,(getpos secondpost) select 1,((getpos secondpost) select 2) + 0.2],[(getpos thirdpost) select 0,(getpos thirdpost) select 1,((getpos thirdpost) select 2) + 0.2], [1,0,0,1]];
}];
//Diary Links 
/*

IDD-12
IDC-1001 First group
IDC-1002  First sub group

