disableserialization; 
_handle= createdialog "AuctionHouseBuy";

//SETUP
_textToDisplay=parsetext (format ["
 
<t size='1.85' color='#FFFFFF'>
<br/><br/><br/>
Buyer Offers || Buyer Wants
</t>" ]);

_display = uiNameSpace getVariable "AuctionHouseBuy";
_text= _display displayCtrl 1100;
	_text ctrlSetStructuredText _textToDisplay;
	
//Edit Box
lbadd [2100,"All"];
lbadd [2100,"Items"];
lbadd [2100,"Weapons"];
lbadd [2100,"Small Parts"];
lbadd [2100,"Large Parts"];
lbadd [2100,"Ammunition"];
lbSetCurSel [2100,0];

//picture
ctrlSetText [1200, "Convo\images\BoxIcon.jpg"];

