disableserialization;
_handle= createdialog "AuctionCheckAH";

//SETUP
_textToDisplay=parsetext (format [" 
	<t size='1.85' color='#FFFFFF'>
	<br/><br/><br/>
	Trades I have currently placed
	</t>" 
	]);

_display = uiNameSpace getVariable "AuctionCheckAH";
_text= _display displayCtrl 1100;
	_text ctrlSetStructuredText _textToDisplay;

_FileName="AUCTIONHOUSE";  
_sectionTitle="All";
_AuctionHouseArray=([_FileName, _sectionTitle, "AvailableList","ARRAY"] call iniDB_read);	
	

_Auctions=[];
{ if ((_x select 4) == (getPlayerUID player)) then { _Auctions pushback _x;}; }foreach _AuctionHouseArray;

{ 
			
		_selling= (_x select 0);
			_CFG1="";
				if ( isClass (configFile >> "CFGweapons" >> _selling)) then {
					//is weapon
					_CFG1="CfgWeapons";
				}else{
					if ( isClass (configFile >> "CFGMagazines" >> _selling)) then {
						//is magazine
						_CFG1="CfgMagazines";
					}else{
						//is some other class
						_CFG1="CfgVehicles";
					};
				}; 
			_TextSelling=gettext (configfile >> _CFG1 >> _selling >> "displayName");
		_sellamt= (_x select 1);
		_wanting= (_x select 2);
			_CFG="";
				if ( isClass (configFile >> "CFGweapons" >> _wanting)) then {
					//is weapon
					_CFG="CfgWeapons";
				}else{
					if ( isClass (configFile >> "CFGMagazines" >> _wanting)) then {
						//is magazine
						_CFG="CfgMagazines";
					}else{
						//is some other class
						_CFG="CfgVehicles";
					};
				}; 
			_TextWanting=gettext (configfile >> _CFG >> _wanting >> "displayName");	
		_wantamt= (_x select 3);
		
		_textToAdd=str _sellamt+" "+_TextSelling+ " for " +str _wantamt+" " +_TextWanting;
		
		lbadd [1500,_textToAdd];
		
		_file=gettext (configfile >> _CFG1 >> _selling >> "picture");
		lbSetPicture [1500,_foreachIndex,_file];
		lbSetPictureColor [1500,_foreachIndex,[1,1,1,1]];
		}foreach _Auctions;



_selection=_Auctions select (lbcursel 1500);
	_item=_selection select 0;
	_itemcount=_selection select 1;
	_cost=_selection select 2;
	_costcount=_selection select 3;	
	_player=_selection select 4;
	_location=_selection select 5;
	



	
	
	
