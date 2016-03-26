//o Cave sheep
ap_sheep=createAgent ["Goat_random_F",[4199.64,7264.88,15.1699],[],0,"FORM"];
ap_sheep setposasl [4199.64,7264.88,15.1699];     
_tr= createTrigger ["EmptyDetector",ap_sheep modelToWorld [0, 0, 0]];  
_tr setTriggerArea [3,3,0,true];  
_tr setTriggerActivation ["ANY","PRESENT",true]; 
_tr setTriggerStatements ["this and (count thislist >=2)","{[_x,'aph_fnc_sheepTrg',(owner _x),false] call BIS_fnc_MP;}foreach thislist",""]; 
_nul=ap_sheep spawn 
	{ sleep 3; 
	_this setVariable ["ConversationOptions",[(aph_dialogNodes select (aph_dialogNodes_ID find "Goat_Start"))],true]; 
	}; 
//c 

	
//o	Rust front gate
_tr= createTrigger ["EmptyDetector",[3144.82,1618,0]];  
_tr setTriggerArea [5,50,-89.0472,false];  
_tr setTriggerActivation ["ANY","PRESENT",true]; 
_tr setTriggerStatements ["this","{if !(isPlayer _x) then {} else {if (_x getvariable ['HasOpforPermission',false]) then {} else {[[thistrigger,_x],'RG_Trigger',(owner _x),false] call BIS_fnc_MP;};}; }foreach thislist;","
_list= (position thistrigger) nearEntities ['Man',25];
{_x enableAI 'ANIM'}foreach _list"]; 
//c 

//o Rust Front gate, top of hill
//trigger 3
_tr= createTrigger ["EmptyDetector",[2780.21,1645.11,0]];  
_tr setTriggerArea [5,100,85.7841,false];  
_tr setTriggerActivation ["ANY","PRESENT",true]; 
_tr setTriggerStatements ["this","{if !(isPlayer _x) then {} else {if (_x getvariable ['HasOpforPermission',false]) then {} else {[[thistrigger,_x],'RG_Trigger',(owner _x),false] call BIS_fnc_MP;};}; }foreach thislist;","
_list= (position thistrigger) nearEntities ['Man',25];
{_x enableAI 'ANIM'}foreach _list"]; 

//trigger 2
_tr= createTrigger ["EmptyDetector",[2939.28,1671.99,0]];  
_tr setTriggerArea [5,80,75.8685,false];  
_tr setTriggerActivation ["ANY","PRESENT",true]; 
_tr setTriggerStatements ["this","{if !(isPlayer _x) then {} else {if (_x getvariable ['HasOpforPermission',false]) then {} else {[[thistrigger,_x],'RG_Trigger',(owner _x),false] call BIS_fnc_MP;};}; }foreach thislist;","
_list= (position thistrigger) nearEntities ['Man',25];
{_x enableAI 'ANIM'}foreach _list"]; 

//trigger 1
_tr= createTrigger ["EmptyDetector",[3069.14,1739.64,0]];  
_tr setTriggerArea [5,75,-311.996,false];  
_tr setTriggerActivation ["ANY","PRESENT",true]; 
_tr setTriggerStatements ["this","{if !(isPlayer _x) then {} else {if (_x getvariable ['HasOpforPermission',false]) then {} else {[[thistrigger,_x],'RG_Trigger',(owner _x),false] call BIS_fnc_MP;};}; }foreach thislist;","
_list= (position thistrigger) nearEntities ['Man',25];
{_x enableAI 'ANIM'}foreach _list"]; 

//c 

//o Wild Dog Mission

//Loop walk around
for "_i" from 1 to 8 do {
_doggroup=creategroup civilian;
_dog=_doggroup createUnit ["Alsatian_Random_F", [2617.03,468.537,0.00151062], [], 0, "FORM"];

_distance = [5,15] call BIS_fnc_randomInt; // Random distance between 1 and 500m.

_direction= [0,359] call BIS_fnc_randomInt; // Random direction between 0 and 359 degrees.

_randomPos = [_dog, _distance, _direction] call BIS_fnc_relPos; 

_wp1=_doggroup addwaypoint [[2617.03,468.537,0.00151062],9];

sleep 1;
		
};



//c 
