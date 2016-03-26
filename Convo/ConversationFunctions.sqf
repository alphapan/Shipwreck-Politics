
//o On Activation
HintColorRed="#ff0000";
HintColorBlue="#0066FF";
HintColorGold="#ffd700";
HintColorWhite="#FFFFFF";
HintAlignCenter="center";




//o Escalate Conversation
ap_fnc_EscalateConversation1="
_partner=(_this select 0) getvariable 'CurrentConversationPartner';
_personalHistory=(_this select 0) getvariable ['PersonalConversations',[]];
_HaveMetNames=[];	
{_HaveMetNames pushback (_x select 0)}foreach _personalHistory;
if ( (name _partner) in _HaveMetNames ) then {_personalHistory deleteat (_HaveMetNames find (name _partner))};
_personalHistory pushback [name _partner,1];
(_this select 0) setvariable ['PersonalConversations',_personalHistory,true];
";

ap_fnc_EscalateConversation2="
_partner=(_this select 0) getvariable 'CurrentConversationPartner';
_personalHistory=(_this select 0) getvariable ['PersonalConversations',[]];
_HaveMetNames=[];	
{_HaveMetNames pushback (_x select 0)}foreach _personalHistory;
if ( (name _partner) in _HaveMetNames ) then {_personalHistory deleteat (_HaveMetNames find (name _partner))};
_personalHistory pushback [name _partner,2];
(_this select 0) setvariable ['PersonalConversations',_personalHistory,true];
";
ap_fnc_EscalateConversation3="
_partner=(_this select 0) getvariable 'CurrentConversationPartner';
_personalHistory=(_this select 0) getvariable ['PersonalConversations',[]];
_HaveMetNames=[];	
{_HaveMetNames pushback (_x select 0)}foreach _personalHistory;
if ( (name _partner) in _HaveMetNames ) then {_personalHistory deleteat (_HaveMetNames find (name _partner))};
_personalHistory pushback [name _partner,3];
(_this select 0) setvariable ['PersonalConversations',_personalHistory,true];
";
ap_fnc_EscalateConversation4="
_partner=(_this select 0) getvariable 'CurrentConversationPartner';
_personalHistory=(_this select 0) getvariable ['PersonalConversations',[]];
_HaveMetNames=[];	
{_HaveMetNames pushback (_x select 0)}foreach _personalHistory;
if ( (name _partner) in _HaveMetNames ) then {_personalHistory deleteat (_HaveMetNames find (name _partner))};
_personalHistory pushback [name _partner,4];
(_this select 0) setvariable ['PersonalConversations',_personalHistory,true];
";
ap_fnc_EscalateConversation5="
_partner=(_this select 0) getvariable 'CurrentConversationPartner';
_personalHistory=(_this select 0) getvariable ['PersonalConversations',[]];
_HaveMetNames=[];	
{_HaveMetNames pushback (_x select 0)}foreach _personalHistory;
if ( (name _partner) in _HaveMetNames ) then {_personalHistory deleteat (_HaveMetNames find (name _partner))};
_personalHistory pushback [name _partner,5];
(_this select 0) setvariable ['PersonalConversations',_personalHistory,true];
";
//c 

//o Rust Farmer
ap_fnc_IC_openBox="
closedialog 0;
_player=_this select 0;
_partner=_player getvariable 'CurrentConversationPartner';
_wp=(group _partner) addWaypoint [position IntroLockBox, 0]; 
IntroLockBox additemcargoglobal ['hgun_Pistol_heavy_02_F',1];
IntroLockBox addmagazinecargoglobal ['6Rnd_45ACP_Cylinder',2];
waituntil {(_partner distance IntroLockBox) <=4};
_player setvariable ['IntroBoxKey',true,true];
sleep 2; 
_partner enableAi 'MOVE';
";

aph_F_catchRabbit={
(_this select 0) addaction ["Catch Rabbit",    
	{	
		_player=_this select 1;
		deleteVehicle (((position  _player) nearObjects ["Rabbit_F", 3])  select 0);
		[[[_player], {(_this select 0) switchmove "AinvPknlMstpSnonWnonDr_medicUp1";}], "BIS_fnc_call", true, false] call BIS_fnc_MP;
		sleep 4;
		
		_player additem "aph_rabbit";
		
	},true,0,false,true,"","(count ((position  player) nearObjects ['Rabbit_F', 3])) >=1"];
};

aph_Dfnc_catchRabbits="
closedialog 0;
_player=_this select 0;
_partner=_player getvariable 'CurrentConversationPartner';

[_player] spawn aph_F_catchRabbit;

[_player,'Catch Rabbits','A local Rust farmer is starting a rabbit farm. He wants me to catch three rabbits so he can start breeding more livestock.'] spawn Assign_Mission;
[_player] spawn (compile ap_fnc_EscalateConversation1);
";

aph_dfnc_TurninRabbits="
_player=_this select 0;
_partner=_player getvariable 'CurrentConversationPartner';
_count=_player getvariable ['Quest_CaughtRabbits',0];
_Inventory=[];
{
	if (_x=='aph_Rabbit') then {_count=_count + 1;[_player,'aph_Rabbit'] execVM 'JournalUI\deleteitem.sqf';_player setvariable ['Quest_CaughtRabbits',_count,true];};
}foreach (itemcargo _player);

if (_count >=3) then {
	
[_player] spawn (compile ap_fnc_EscalateConversation3);
[_partner,_player] execVM 'Convo\StartConversation.sqf';
[_player,'Catch Rabbits'] spawn Complete_Mission;
} else {

	hint 'less than'

};


";
//c 

//o Goat
ap_fnc_GoatHelp="
closedialog 0;
(_this select 0) setvariable ['ap_sheepBool',true,true];
_group=creategroup west;
_unit=_group createUnit ['C_man_p_fugitive_F',([4191.77,7272.7,15.5308]),[],0,'NONE'];
[_unit] join _group;
removeheadgear ap_unit; 

nul = _unit spawn {_this setVariable ['ConversationOptions',[(aph_dialogNodes select (aph_dialogNodes_ID find 'GoatSheperd_Friendly')),(aph_dialogNodes select (aph_dialogNodes_ID find 'GoatSecondMeeting'))], true]; }; 

_unit addaction ['Talk','Convo\StartConversation.sqf'];

_unit setposasl [4194.73,7268.87,15.4849];
_unit disableai 'MOVE';
_unit setdir 119.583;

sleep 1.5;

_val=315.664-(getdir (_this select 0));
(_this select 0) setdir (getdir (_this select 0) + (_val*0.125));
sleep 0.025;
(_this select 0) setdir (getdir (_this select 0) +(_val*0.125));
sleep 0.025;
(_this select 0) setdir (getdir (_this select 0) + (_val*0.125));
sleep 0.025;
(_this select 0) setdir (getdir (_this select 0) + (_val*0.125));
sleep 0.025;
(_this select 0) setdir (getdir (_this select 0) + (_val*0.125));
sleep 0.025;
(_this select 0) setdir (getdir (_this select 0) + (_val*0.125));
sleep 0.025;
(_this select 0) setdir (getdir (_this select 0) + (_val*0.125));

[_unit,(_this select 0)] execvm 'Convo\StartConversation.sqf';
";

ap_fnc_GoatEat="
closedialog 0;
(_this select 0) setvariable ['ap_sheepBool',true,true];
_group=creategroup east;
_unit=_group createUnit ['C_man_p_fugitive_F',([4191.77,7272.7,15.5308]),[],0,'NONE'];
[_unit] join _group;
removeheadgear _unit; 
_unit addMagazine '6Rnd_45ACP_Cylinder';
_unit addMagazine '6Rnd_45ACP_Cylinder';
_unit addWeapon 'hgun_Pistol_heavy_02_F';
_unit setposasl [4191.77,7272.7,15.5308];
_unit disableai 'MOVE';

sleep 0.05;

_unit setdir 119.583;
_unit disableai 'ANIM';

sleep 0.5;

_val=315.664-(getdir (_this select 0));
(_this select 0) setdir (getdir (_this select 0) + (_val*0.125));
sleep 0.025;
(_this select 0) setdir (getdir (_this select 0) +(_val*0.125));
sleep 0.025;
(_this select 0) setdir (getdir (_this select 0) + (_val*0.125));
sleep 0.025;
(_this select 0) setdir (getdir (_this select 0) + (_val*0.125));
sleep 0.025;
(_this select 0) setdir (getdir (_this select 0) + (_val*0.125));
sleep 0.025;
(_this select 0) setdir (getdir (_this select 0) + (_val*0.125));
sleep 0.025;
(_this select 0) setdir (getdir (_this select 0) + (_val*0.125));

nul = _unit spawn {_this setVariable ['ConversationOptions',[(aph_dialogNodes select (aph_dialogNodes_ID find 'GoatSheperd_Enemy'))], true]; }; 
 
[_unit,(_this select 0)] execvm 'Convo\StartConversation.sqf';

";

aph_Dfnc_GoatDefenderAttacks="
_player=_this select 0;
_partner=_this select 1;
_null= [] spawn {
sleep 2;
_partner enableAI 'ANIM';
};
";
//c 

//o Mining Mission
aph_dfnc_MiningMission="
_player=_this select 0;
_partner=_this select 1;

_player setvariable ['OnMiningMission',true,true];

[_player,'Gather ores','I need to gather 5 Iron, Gold, Platinum, and Stone ore. This mission will help me a positive reputation with the local rust.'] spawn Assign_Mission;
[_player,'Meet Foreman'] spawn Complete_Mission;
";

aph_dfnc_MiningTurnin="
_player=_this select 0;
_partner=_this select 1;

	_iron=_player getvariable ['MiningMissionIron',0];
	_gold=_player getvariable ['MiningMissionGold',0];
	_platinum=_player getvariable ['MiningMissionPlatinum',0];
	_stone=_player getvariable ['MiningMissionStone',0];
	
_ironcost= 0 + _iron;
_goldcost= 0 + _gold;
_platcost= 0 + _platinum;
_stonecost= 0 + _stone;


_RewardText= format ['
<br/>
 --Received:<br/>
<t align=%1 color=%2 > Rebel Dogtag</t> <br/>
<t align=%1 color=%3 > +10 Rust reputation</t>',str HintAlignCenter,str HintColorGold,str HintColorBlue];

	
if ( (_iron >=5) && (_gold >=5) && (_platinum >=5) && (_stone >=5) ) then {
 hint parsetext format ['Thanks for your help. You willingness to help us out will not go unnoticed. Take this Rebel Dogtag so others know your true loyalty.<br/> %1',_RewardText];
	
_player setVariable ['GUERRATING',(_player getvariable ['GUERRATING',0]) + 5,true];	
_player additem 'aph_rebeldogtag';
_player setvariable ['OnMiningMission',false,true];	
[_player,'Gather ores'] spawn Complete_Mission;
} else { 
	hint parsetext format ['You still need minerals<br/>------------<br/>Iron ore: <t color=%5> %1</t>/5 <br/>Gold ore:  <t color=%5> %2</t>/5 <br/>Platinum ore: <t color=%5> %3</t>/5 <br/> Stone ore:  <t color=%5> %4</t>/5 <br/>------------<br/><br/>',0 + (_player getvariable ['MiningMissionIron',0]),0 + (_player getvariable ['MiningMissionGold',0]),0 + (_player getvariable ['MiningMissionPlatinum',0]),0 + (_player getvariable ['MiningMissionStone',0]),str HintColorRed,str HintColorBlue];
if ((_player getvariable ['MiningMissionIron',0])>=5) then {hint parsetext format ['You still need minerals<br/>------------<br/>Iron ore: <t color=%6> %1</t>/5 <br/>Gold ore:  <t color=%5> %2</t>/5 <br/>Platinum ore: <t color=%5> %3</t>/5 <br/> Stone ore:  <t color=%5> %4</t>/5 <br/>------------<br/><br/>',0 + (_player getvariable ['MiningMissionIron',0]),0 + (_player getvariable ['MiningMissionGold',0]),0 + (_player getvariable ['MiningMissionPlatinum',0]),0 + (_player getvariable ['MiningMissionStone',0]),str HintColorRed,str HintColorBlue];};
if ((_player getvariable ['MiningMissionGold',0])>=5) then {hint parsetext format ['You still need minerals<br/>------------<br/>Iron ore: <t color=%5> %1</t>/5 <br/>Gold ore:  <t color=%6> %2</t>/5 <br/>Platinum ore: <t color=%5> %3</t>/5 <br/> Stone ore:  <t color=%5> %4</t>/5 <br/>------------<br/><br/>',0 + (_player getvariable ['MiningMissionIron',0]),0 + (_player getvariable ['MiningMissionGold',0]),0 + (_player getvariable ['MiningMissionPlatinum',0]),0 + (_player getvariable ['MiningMissionStone',0]),str HintColorRed,str HintColorBlue];};
if ((_player getvariable ['MiningMissionPlatinum',0])>=5) then {hint parsetext format ['You still need minerals<br/>------------<br/>Iron ore: <t color=%5> %1</t>/5 <br/>Gold ore:  <t color=%5> %2</t>/5 <br/>Platinum ore: <t color=%6> %3</t>/5 <br/> Stone ore:  <t color=%5> %4</t>/5 <br/>------------<br/><br/>',0 + (_player getvariable ['MiningMissionIron',0]),0 + (_player getvariable ['MiningMissionGold',0]),0 + (_player getvariable ['MiningMissionPlatinum',0]),0 + (_player getvariable ['MiningMissionStone',0]),str HintColorRed,str HintColorBlue];};
if ((_player getvariable ['MiningMissionStone',0])>=5) then {hint parsetext format ['You still need minerals<br/>------------<br/>Iron ore: <t color=%5> %1</t>/5 <br/>Gold ore:  <t color=%5> %2</t>/5 <br/>Platinum ore: <t color=%5> %3</t>/5 <br/> Stone ore:  <t color=%6> %4</t>/5 <br/>------------<br/><br/>',0 + (_player getvariable ['MiningMissionIron',0]),0 + (_player getvariable ['MiningMissionGold',0]),0 + (_player getvariable ['MiningMissionPlatinum',0]),0 + (_player getvariable ['MiningMissionStone',0]),str HintColorRed,str HintColorBlue];};


};


";
//c 

//o Rust uniform
ap_Cfnc_Uniform="
_weapon_holder = createVehicle ['groundWeaponHolder',[3279.06,1533.15,0.000972986], [], 0.5,'can_collide']; 
_weapon_holder addItemCargoGlobal ['U_O_CombatUniform_ocamo', 1];	

_partner=(_this select 0) getvariable 'CurrentConversationPartner';
_personalHistory=(_this select 0) getvariable ['PersonalConversations',[]];
_personalHistory=_personalHistory+ [[name _partner,2]];
(_this select 0) setvariable ['PersonalConversations',_personalHistory,true];
";



//c 

//o Ranger at the Wall
ap_fnc_RangerFA="
_player=_this select 0;
_partner=_this select 1;

[_player,'Ranger Contact','An injured soldier has given me a task to get a first aid kit. When he is healed up he has an important mission for me.'] spawn Assign_Mission;
_player setvariable ['OnRangerFAMission',true,true];
";


ap_fnc_CompleteRangerFA="
_player=_this select 0;
_partner=_this select 1;

[_player,'Ranger Contact'] spawn Complete_Mission;
_player setvariable ['OnRangerFAMission',false,true];
";
//c 

//o Lancer Intro mission
aph_Dfnc_LancerIntro="
_player=_this select 0;
_partner=_this select 1;

[player,'Meet Foreman','Lancer, who appears to be a leader around here, has asked me to put in some work in the mines. He tells me that mining is an essential part of life on the island and that the foreman has more information about this place.'] spawn Assign_Mission;


_personalHistory=(_this select 0) getvariable ['PersonalConversations',[]];
_personalHistory=_personalHistory+ [[name _partner,1]];
(_this select 0) setvariable ['PersonalConversations',_personalHistory,true];
";


aph_Dfnc_LancerExecute="
_player=_this select 0;
_partner=_this select 1;

_player disableAI 'MOVE';
_player setdamage 1;
";
//c 

//o Loyalty Join Group 
aph_Dfnc_joingroupMember="
_player=_this select 0;
_partner=_this select 1;

[_partner] join _player;
_partner enableai 'MOVE';

_Array=_player getvariable ['MemberArray',[]];
_Array=_Array + [_partner];
_player setVariable ['MemberArray',_Array,true];

_partner setVariable ['InMemberArray','Member',true];
";


aph_Dfnc_joingroupSoldier="
_player=_this select 0;
_partner=_this select 1;

[_partner] join _player;
_partner enableai 'MOVE';

_Array=_player getvariable ['SoldierArray',[]];
_Array=_Array + [_partner];
_player setVariable ['SoldierArray',_Array,true];

_partner setVariable ['InMemberArray','Soldier',true];
";
//c 

//o Independent representatives

aph_Dfnc_IndiRepsAssignTask="
_player=_this select 0;
_partner=_this select 1;


[] spawn aph_Efnc_IndiRepCallBoat;

[player,'Meet with the Guerillas','I have met some Guerilla representatives who want me to meet the recruiter. The representatives have a boat coming to the beach. I should wait and get a ride to their side of the island.'] spawn Assign_Mission;
player setvariable ['OnGuerRepMission',true,true];
";



//c 


//c 

//o Unique sentence conditions



//c 