handle=[] spawn {
fnc_test = {
disableserialization;
        _idc = (_this select 0);
        _Index = _this select 1;
		_text=_this select 2;
		
		_playerList=[];
		switch (_idc) do
			{
				case 633:{_playerList=getitemCargo uniformContainer player;};
				case 638:{_playerList=getitemCargo vestContainer player; };
				case 619:{_playerList=getitemCargo backpackContainer player;};
			};
			
		_selection=(_playerlist select 0) select _Index;
		
	if !(_selection in aph_Arr_Blueprints) exitwith {hint "Not a blueprint"};
		
	_CFG=gettext (Missionconfigfile >> "BluePrintInfo" >> _selection >> "CFG");
	_Name=gettext (Missionconfigfile >> "BluePrintInfo" >> _selection >> "name");
	_ItemMade=gettext (Missionconfigfile >> "BluePrintInfo" >> _selection >> "ItemCreated");
	_cost=getarray (Missionconfigfile >> "BluePrintInfo" >> _selection >> "cost");
	_BuildList=gettext (Missionconfigfile >> "BluePrintInfo" >> _selection >> "type");
	_description=gettext (Missionconfigfile >> "BluePrintInfo" >> _selection >> "description");
		
	
	//o MISC Useables	
		if (_text=="Log") exitwith 
			{
					closeDialog 0; 
					_fire = createVehicle ["Land_Campfire_F", player modeltoworld [0,2,0], [], 0, "can_collide"];
					_pos=getpos _fire;
					_fire setpos [_pos select 0,_pos select 1,0];
					_fire addaction ["Destroy fire",{deleteVehicle (_this select 0);}];
					_script=[player,"aph_Singlelog"] execVM "JournalUI\deleteitem.sqf";
					};
		if (_text=="Rare stone") exitwith 
			{
					closeDialog 0; 
					player setposatl [4358.47,3825.86,2501.66];
					player setdir 274.313;
					};
		if (_text=="Disassembled Tent") exitwith 
			{
					closeDialog 0; 
					_tent = createVehicle ["aph_AFrameTent", player modeltoworld [0,1.5,0], [], 0, "can_collide"];
					_tent setDir (([_tent, player] call BIS_fnc_dirTo) - 180 );
					[[_tent,["Disassemble",{deleteVehicle (_this select 0); _this select 1 additem "aph_DisassembledTent";},[], 0, false, false, "", ""]],"addAction",true,true] call BIS_fnc_MP; 
					_pos=getpos _tent;
					_tent setpos [_pos select 0,_pos select 1,0];	
					_tent setVariable ["APH_OBJECTBOOL",true,true];
					_script=[player,"aph_DisassembledTent"] execVM "JournalUI\deleteitem.sqf";		
					};
		if (_text=="Lantern") exitwith 
			{
			if (typename (player getVariable ["PeronalLamp",[]])=="OBJECT") exitwith {};
				closeDialog 0;
				_lamp=createVehicle ["Land_Camping_Light_F", position player, [], 0, "CAN_COLLIDE"]; 
				_lamp attachto [player,[0.4,0.5,1.4]];
				player setvariable ["PersonalLamp",_lamp,true];
				player addaction ["Turn off",{[_this select 0,_this select 1, _this select 2,_this select 3] call aph_fnc_HandLantern},"Off",1.5,false,true];
			};
	//c End MISC Useables
		
//check if player already knows blueprint		
	_list=player getVariable [_BuildList,[]];
	_names=[];
	{_names=_names+[(_x select 0)]}foreach _list;
if (_Name in _names) exitwith {hint "You already know this blueprint."};			
	
	//Remove Blueprint
	_script=[player,_selection] execVM "JournalUI\deleteitem.sqf";				
					
		//variables for UI
			0 cutRsc ["BlueprintPictureOverlayUI","PLAIN"];			
			1 cutRsc ["BlueprintDisplayUI","PLAIN"];
			_Overlay = uiNameSpace getVariable "BlueprintPictureOverlayUI";
				_underpic=_Overlay displayctrl 1200;
			_display = uiNameSpace getVariable "BlueprintDisplayUI";
			_pic= _display displayCtrl 1200;
			_toptext=_display displayctrl 1500;
			_btmtext=_display displayctrl 1501;
			
			if ((isnull (finddisplay 602))) then {
				player action ["Gear", player];
				};
					
				_Picture=(gettext (configfile >> _CFG >> _ItemMade >> "picture"));
					_pic ctrlSetText _Picture;
					_underpic ctrlSetText "\Models\Blueprints\images\BlueprintBackground.paa";
					//set the top text	
				_toptext ctrlSetStructuredText parseText format ["<t color='#ffffff' size='1.35' align='center' shadow='1' shadowColor='#000000'>%1</t>",_Name];
					//set the bottom text
				_btmtext ctrlSetStructuredText parseText format ["<t color='#ffffff' size='1.25' align='center' shadow='1' shadowColor='#000000'>%1<br/></t> 
																<t color='#ffffff' size='1.25' align='center' shadow='1' shadowColor='#000000' underline='true'>Cost<br/></t>
Iron: %2 <br/>
Steel: %3 <br/>
Gold: %4 <br/>
Platinum: %5 <br/>
Plastic: %6 <br/>
Wood: %7 <br/>
Wool: %8 <br/>
Flax: %9 <br/>
																",_description,str (_cost select 0),str (_cost select 1),str (_cost select 2),str (_cost select 3),str (_cost select 4),str (_cost select 5),str (_cost select 6),str (_cost select 7)];	
						
						
					//Alpha background
				_toptext ctrlSetBackgroundColor [0, 0, 0, 0];
				_btmtext ctrlSetBackgroundColor [0, 0, 0, 0];	
						
					//set variables//["Display Name","Item Created",IRONcost,steel,Plat,Stone,Wool,Flax,Wood,Grass,"imagepath",blueprint learned amount]
				_list=player getVariable [_BuildList,[]];
				_list=_list+[[_Name,_ItemMade,_cost,"",0]];
				player setVariable [_BuildList,_list,true];
			
				_KnownBP=player getVariable ["KnownBlueprints",[]];
				_BPnames=[];
				{_BPnames pushback (_x select 0)}foreach _knownBP;
			if (_ItemMade in _BPnames) then {
			_KnownBP deleteAt (_BPnames find _ItemMade);
			_knownBP pushback [_ItemMade,100];
			player setVariable ["KnownBlueprints",_knownBP,true];
					} else {
					_KnownBP pushback [_ItemMade,100];
					player setVariable ["KnownBlueprints",_knownBP,true];
			};
		true;
};		
		while {true} do {
			waituntil {!(isnull (finddisplay 602))};
			//uniform
		   ((findDisplay 602) displayCtrl 633 ) ctrlSetEventHandler ["LBDblClick", "
				_idc = ctrlIDC (_this select 0);
				_selectedIndex = _this select 1;
				_text=lbText [_idc, _selectedIndex];
				[_idc,_selectedIndex,_text] call fnc_test"];
			//vest 
			((findDisplay 602) displayCtrl 638 ) ctrlSetEventHandler ["LBDblClick", "
				_idc = ctrlIDC (_this select 0);
				_selectedIndex = _this select 1;
				_text=lbText [_idc, _selectedIndex];
				[_idc,_selectedIndex,_text] call fnc_test"];
			//backpack
			((findDisplay 602) displayCtrl 619 ) ctrlSetEventHandler ["LBDblClick", "
				_idc = ctrlIDC (_this select 0);
				_selectedIndex = _this select 1;
				_text=lbText [_idc, _selectedIndex];
				[_idc,_selectedIndex,_text] call fnc_test"];
			waituntil {isnull (finddisplay 602)};
			0 cutRsc ["Default","PLAIN"];
			1 cutRsc ["Default","PLAIN"];
			
    };
};
