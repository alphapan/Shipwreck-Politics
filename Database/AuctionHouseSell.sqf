disableserialization; 
_handle= createdialog "AuctionHouseSell";
//lbclear 2101;
//lbclear 2102;
//lbclear 2103;

//Buy Orders
lbadd [2100,"All"];
lbadd [2100,"Items"];
lbadd [2100,"Weapons"];
lbadd [2100,"Small Parts"];
lbadd [2100,"Large Parts"];
lbadd [2100,"Ammunition"];


//User inventory
lbadd [2101,"All"];
lbadd [2101,"Items"];
lbadd [2101,"Weapons"];
lbadd [2101,"Small Parts"];
lbadd [2101,"Large Parts"];
lbadd [2101,"Ammunition"];

//Auction House items
lbadd [2102,"All"];
lbadd [2102,"Items"];
lbadd [2102,"Weapons"];
lbadd [2102,"Small Parts"];
lbadd [2102,"Large Parts"];
lbadd [2102,"Ammunition"];

//Payment Options
{
		_CFG="";
				if ( isClass (configFile >> "CFGweapons" >> _x)) then {
					//is weapon
					_CFG="CfgWeapons";
				}else{
					if ( isClass (configFile >> "CFGMagazines" >> _x)) then {
						//is magazine
						_CFG="CfgMagazines";
					}else{
						//is some other class
						_CFG="CfgVehicles";
					};
				}; 
	_Text=gettext (configfile >> _CFG >> _x >> "displayName");
	if (_text=="") then {_text=_x};
	 lbadd [1502,_Text]; 
	 //Add picture to listbox selection
			_file=gettext (configfile >> _CFG >> _x >> "picture");
			lbSetPicture [1502,_foreachIndex,_file];
			lbSetPictureColor [1502,_foreachIndex,[1,1,1,1]];
 } foreach APH_FULLitemList;

lbSetCurSel [2101,0];
lbSetCurSel [2102,0];
lbSetCurSel [2100,0];
//lbSetCurSel [1501,0];
//lbSetCurSel [1502,0];
ctrlSetText [1400,"1"]; 
ctrlSetText [1401,"1"]; 
_textToDisplay=parsetext (format ["
 
<t size='1.85' color='#FFFFFF'>
<br/><br/><br/>
Buyer Offers || Buyer Wants
</t>" ]);

_display = uiNameSpace getVariable "AuctionHouseSell";
		_text= _display displayCtrl 1100;
_text ctrlSetStructuredText _textToDisplay;

ctrlSetText [1200, "Convo\images\BoxIcon.jpg"];
ctrlSetText [1201, "Convo\images\BoxIcon.jpg"];
