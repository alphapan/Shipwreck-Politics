_player=_this select 0;
disableSerialization;
_dia=createdialog "IntroScreenSelect";

_setupUI={
_player=_this;
disableSerialization;
_display= uiNameSpace getVariable "IntroScreenSelect";
		_TopText=_display displayCtrl 1101;
		_bottomText=_display displayCtrl 1102;
		_comboTop= _display displayCtrl 2100;
		_comboBottom= _display displayCtrl 2101;
		_pic= _display displayCtrl 1200;
	
_TopText ctrlSetStructuredText (parsetext format ["<t color='#FFFFFF' align= 'LEFT' size= '1.5' shadow='2'><br/><br/><br/><br/>Choose a face"]);
_bottomText ctrlSetStructuredText (parsetext format ["<t color='#FFFFFF' align= 'LEFT' size= '1.5' shadow='2'><br/><br/><br/><br/>Choose a background story"]);
	
_ARRAY=[
"whiteHead_01",
"whiteHead_02",
"whiteHead_03",
"whiteHead_04",
"whiteHead_05",
"whiteHead_06",
"whiteHead_07",
"whiteHead_08",
"whiteHead_18",
"AfricanHead_01",
"AfricanHead_02",
"AfricanHead_03",
"Kerry_C_F",
"Kerry_A_F",
"Kerry_B1_F",
"Miller",
"IG_Leader",
"Nikos",
"GreekHead_A3_03",
"PersianHead_A3_02"];

	{
		_comboTop lbAdd _x;
	}FOREACH _Array;
 
_attachToValues=[0, 0.9, 1.3];
_camera= "camera" camCreate (getPos _player);
	_camera camPrepareTarget _player;
	_camera camPrepareFOV 0.45;
	_camera attachTo [_player, _attachToValues];		
	_camera camCommitPrepared 0.03;
	_camera cameraEffect ["INTERNAL", "BACK","camrenderScreen"];

_comboBottom lbAdd "Criminal shipped to island as exile.";
_comboBottom lbAdd "Ship captain marooned after sunk vessel.";
_comboBottom lbAdd "Special forces sent on recon.";
_comboBottom lbAdd "With a hazy memory you are unsure.";

lbSetCurSel [2100, 0];
lbSetCurSel [2101, 0];
};

_player spawn _setupUI;
//Keep UI open until ready
[_player,_setupUI] spawn {
	_player=_this select 0;
	_setupUI=_this select 1;
	
		while {_player getvariable ["PasswordNeeded",true]} do {
			
			
			if ( isnull (uiNamespace getvariable "IntroScreenSelect") ) then {
			
				_diag=createdialog "IntroScreenSelect";
				_player spawn _setupUI;
			
			};
			
			sleep 0.25;
		
		
		};
		

		};



