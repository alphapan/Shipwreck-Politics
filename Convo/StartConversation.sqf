//Get Variables
_target=_this select 0;
_unit= _this select 1;
if !(alive _target) exitwith {};

_faction=faction _target;
_LoyaltyFaction=(str side _target) + "Rating";
_Loyalty=_unit getVariable [_LoyaltyFaction,0];

	
//Personal Conversation
_convo=[];
_Progress=0;
//get list of met people
_personalConversations=_unit getvariable ["PersonalConversations",[]];
_HaveMetNames=[];	
{_HaveMetNames pushback (_x select 0)}foreach _personalConversations;
//If has conversation then start there
if ( (name _target) in _HaveMetNames ) then {
_Progress= (_personalConversations select (_HaveMetNames find (name _target)) ) select 1;
};
//Check for conversation
_convoPrime=_target getvariable ["ConversationOptions","none"];

//If loyal add join group option
	if (typename _convoPrime=="String") then {
	
	_convoPrime=[(aph_dialogNodes select (aph_dialogNodes_ID find "Aph_Default"))];
	if (isPlayer (leader group _target)) exitwith {};
		if (_loyalty >=75) then {		
			_convoPrime=[(aph_dialogNodes select (aph_dialogNodes_ID find "Aph_LoyalDefault"))];
		};

};



_convo=_convoPrime select _progress;

//Set
_unit setvariable ["ConversationOptions",_convo,true];
_unit setvariable ["CurrentConversationPartner",_target,true];

//Create Dialog
_cUI= createdialog "ConversationSideChat";

	//Character say text
((uiNamespace getVariable 'ConversationSideChat')displayCtrl 1100) ctrlSetStructuredText (parsetext format ["<t size='1' color='#000000'>%1</t>",(_convo select 0)]);
	
	//Add listbox choices
	_display=1000;
{
	_condition=(_x select 1);
if (_condition=="") then {_condition="true";};	
	if ([_unit,_target] call compile _condition) then {
	_text= (_x select 0);
			_run=[_text,_display] call {
				if ((_this select 0)=="") exitwith {};
				((uiNamespace getVariable "ConversationSideChat") displayctrl (_this select 1)) lbAdd (_this select 0);
				};	
				
	} else {
			
		}; //end condition	
_display=_display+1;		
}foreach (_Convo select 1);

//set Unit camera in UI
((uiNamespace getVariable 'ConversationSideChat')displayCtrl 1200) ctrlsettext format ["#(argb,256,256,1)r2t(camrender%1,1.0)",str name _target];
_target lookat _unit;


//create camera
_attachToValues=[0, 1, 1.7];
_camera= "camera" camCreate (getPos _target);
	_camera camPrepareTarget _target;
	_camera camPrepareFOV 0.25;
	_camera attachTo [_target, _attachToValues];		
	_camera camCommitPrepared 0.03;
	_camera cameraEffect ["INTERNAL", "BACK",format ["camrender%1",str name _target]];

//Set progress bars and pictures
ctrlSetText [1201,gettext (configfile >> "CfgFactionClasses" >> _faction >>"icon")];
ctrlSetText [1202,gettext (configfile >> "CfgFactionClasses" >> _faction >>"flag")];
call aph_ConversationInfluenceSynth;

