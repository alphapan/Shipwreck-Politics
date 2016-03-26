_obj=cursortarget;
_HoldingBool=player getVariable ["HoldingObject",false];
disableSerialization;

//Already Holding Object
if (_holdingBool) then {
	_obj=player getvariable "AP_CurrentCarryObject";
	
	//If the object needs to be built
	if (_obj getvariable ["NeedsBuilt",false]) exitwith {
	[] spawn aph_fnc_setBuildObject;
	0 cutrsc ["Default","PLAIN"];
	player setVariable ["HoldingObject",false,true];
		};
		
		
	//If the object already has been built  then drop	
	[[_obj,true],"AP_EnableSim",false,true] spawn BIS_fnc_MP;
	detach _obj;
	[[_obj,true],"AP_EnableSim",false,true] spawn BIS_fnc_MP;
	_obj setdamage ((damage _obj) - 0.01);
	sleep 0.01;
	_obj setdamage ((damage _obj) + 0.01);;
	(findDisplay 46) displaySetEventHandler ["MouseZchanged",""];
	player setvariable ["AP_CurrentCarryObject","none",true];
	player setvariable ["HoldingObject",false,true];
	_obj setvariable ["APH_OBJECTBOOL",true,true];
	_obj setVariable ["BeingCarried",false,true];
	hint "Dropped";
	0 cutrsc ["Default","PLAIN"];
	
	
	
	
	} else {
	
	
	
//If player is not holding anything than attempt pickup

	//get obj info only pickup certain types
	if (isnull _obj) exitwith {};
	if ((player distance _obj) > 4.5) exitwith {};
	if (_obj isKindOf "house") exitwith {};
	if (_obj isKindOf "man") exitwith {};
	if ((_obj isKindOf "Iron_rock")||(_obj isKindOf "Gold_rock")||(_obj isKindOf "Platinum_rock")||(_obj isKindOf "Stone_rock")||(_obj isKindOf "AP_Refinery")) exitwith {};
	if ((getmass _obj) >= 600) exitwith {hint "Too heavy, need more people"};
	if ( (_obj getvariable ["BeingCarried",false]) ) exitwith {hint "Someone is holding that object";};
	if (_obj getvariable ["LockedObject",false]) exitwith {};
	
	//If object can be picked up
	_type=typeof _obj;
	_originalPos=getpos _obj;
	_dirP=getdir _obj;
	_dist=player distance _obj;
	//attach and addaction
	_obj attachto [player, [0,2,0.5]];
	_dirC=getdir player;
	_dirA=_dirP-_dirC;
	_obj setdir _dirA;
	//[_obj,[0,0,0]] call fnc_SetPitchBankYaw;
	(findDisplay 46) displaySetEventHandler ["MouseZchanged","_this call AP_AdjustAttached"];
	(findDisplay 46) displaySetEventHandler ["KeyDown","_this call AP_key;false;"];
			/*
				//Icon UI
				0 cutrsc ["BottomRightFrame","PLAIN"];
				_display= uiNameSpace getVariable "BottomRightFrame";
				_PicBox= _display displayCtrl 1200;
				_textbox=_display displayCtrl 1100;
				_textbox ctrlSetStructuredText (parsetext format ["<t color='#FFFFFF' align= 'center' size= '1.5' shadow='2'>'Vertical'</t><br/>"]);
				_picbox ctrlsettext "JournalUI\Images\vertical.paa";
			*/
	player setvariable ["AP_CurrentCarryObject",_obj,true];
	_obj setVariable ["AP_BeenBuilt",true,true];
	player setvariable ["HoldingObject",true,true];
	_obj setVariable ["BeingCarried",true,true];
	};		