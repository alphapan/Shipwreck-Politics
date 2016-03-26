_miningBool=player getvariable ["CurrentlyMining",false];

if (_miningBool) then 
	{
	//Turn off mining
	player setVariable ["CurrentlyMining",false,true];
	0 cutrsc ["Default","PLAIN"];
	[[[player], {(_this select 0) switchmove "AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon";}], "BIS_fnc_call", true, false] call BIS_fnc_MP;
	} else {
		//If not mining then..
		_obj=cursortarget;
			if ((player distance _obj) > 2.5) exitwith {};
			if ((_obj isKindOf "Iron_rock")||(_obj isKindOf "Gold_rock")||(_obj isKindOf "Platinum_rock")||(_obj isKindOf "Stone_rock") 
				//|| ( ((typeof _obj )=="Land_fs_feed_F") && ((Airbase_MainObject getvariable ["CurrentOwner",""])==(str side player)) ) 
				) exitwith 
				{
					player setVariable ["CurrentlyMining",true,true];
					[_obj,player] spawn {
					
//mining action					
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
						
				};

 };
	
