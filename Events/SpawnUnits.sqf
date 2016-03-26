//OPFOR// o

//o AGIOS CEPHAS
OpforArray_CephasGuard=[[[2753.74,1692.24,0.00170898],200.022],[[2758.08,1692.49,0.00154114],166.433],[[2758.83,1691.78,0.00183105],168.312],[[2766.31,1690.88,-0.014328],157.388],
[[2773.36,1713.04,0.00169373],109.737],[[2761.03,1742.63,0.00143433],0],[[2764.18,1758.35,0.00143433],79.0682],[[2753.45,1748.39,0.00157166],234.012],[[2765.27,1736.16,0.00143433],55.9941],
[[2774.45,1771.27,0.00126648],349.787],[[2794.52,1749.79,0.00151062],28.7758],[[2796.38,1744.18,0.00143433],141.27],[[2785.9,1741.49,0.00125122],264.938],[[2816.94,1749.54,0.00137329],102.048],
[[2828.43,1747.3,0.00164795],75.7299],[[2836.71,1758.76,0.00189209],114.011],[[2823.27,1761.6,0.00224304],118.613],[[2873.56,1747.51,0.00166321],90.4259],[[2866.69,1747.51,0.00170898],90.1859],
[[2859.81,1747.52,0.00164795],90.3546],[[2853.16,1747.52,0.00170898],90.3704],[[2903.25,1726.51,0.00134277],119.185],[[2909.68,1727.51,0.00210571],148.341],[[2901.42,1725.48,0.00141907],155.222],
[[2898.36,1729.66,0.000762939],268.229],[[2889.42,1730.41,0.00234985],161.994],[[2904.23,1746,0.0015564],89.0718],[[2924.04,1746.52,0.00158691],88.7559],[[3038.85,1727.95,0.00176239],181.545],
[[3064.18,1724.89,0.00167847],128.408],[[3043.38,1728.68,0.00172424],148.174],[[3045.84,1735.62,0.00166321],135.496],[[3058.62,1728.35,0.00119019],168.424],[[3066.16,1796.27,0.00213623],172.002],
[[3069.31,1803.9,0.00167847],152.72],[[3062.43,1803.37,0.00195313],182.333],[[3075,1799.07,0.00135803],170.278],[[3129.02,1610.13,0.00157166],199.769],[[3125.81,1616.76,0.00159454],202.531]
];
Opfor_CephasGuard=[];

_n=0;
{
_pos=_x select 0;
_dir= _x select 1;

_group=creategroup east;
_unit = _group createUnit ["O_Soldier_F", _pos, [], 0, "NONE"];
_unit lookat [2975.65,1438.12,0.00109863];
_unit additem "aph_opfordogtag";
Opfor_CephasGuard pushback (_unit);
_n=_n + 1;
} 
foreach OpforArray_CephasGuard;

//Special unit
_group=creategroup east;
_GuardUnit = _group createUnit ["O_Soldier_F", [3144.48,1594.56,0.0014801], [], 0, "NONE"];
_GuardUnit lookat [3148.57,1587.62,0.00125885];
_GuardUnit setVariable ["ConversationOptions",[(aph_dialogNodes select (aph_dialogNodes_ID find "RG_NiceGuy")),
												(aph_dialogNodes select (aph_dialogNodes_ID find "RG_MeanGuy")),
												(aph_dialogNodes select (aph_dialogNodes_ID find "RG_FriendGuy"))], true];

//Base gamelogic
_group=creategroup east;
ap_GuardUnit = _group createUnit ["LocationBase_F", [2794.52,1749.79,0.00151062], [], 0, "NONE"];
	ap_GuardUnit setvariable ["Base",true,true];
		
												
												
												
//Vehicles
Cephas_Armedtruck= createVehicle ["B_G_Offroad_01_armed_F",[2804.77,1768.44,0.00201416], [], 0, "NONE"];  Cephas_Armedtruck setdir 129.489;
Cephas_Armedtruck_1= createVehicle ["B_G_Offroad_01_armed_F", [3028.25,1738.43,0.00177002], [], 0, "NONE"];  Cephas_Armedtruck_1 setdir 110.21;
Cephas_CoveredTruck= createVehicle ["O_Truck_02_covered_F", [2775.14,1748.54,0.00134277], [], 0, "NONE"];  Cephas_CoveredTruck setdir 38.8937;
Cephas_DeviceTruck= createVehicle ["O_Truck_03_device_F", [2768.7,1780.63,0.118484], [], 0, "NONE"];  Cephas_DeviceTruck setdir 44.434;
Cephas_CivTruck= createVehicle ["C_Offroad_01_F", [2764.85,1770.88,-0.00874329], [], 0, "NONE"];  Cephas_CivTruck setdir 38.7735;

//c end AGIOS CEPHAS

//o Guards at border with Rust
OpforArray_BorderGuardSW=[
[2213,1284.08,18.7014],
[2214.28,1275.82,19.5511],
[2224.5,1276.58,17.634],
[2222.37,1287.59,17.1979],
[2212.77,1275.97,17.5372],

[2213.11,1280.9,14.035],
[2222.69,1287.07,12.3136],

[2222.82,1277.4,12.9318],
[2213.73,1276.55,14.4154],
[2223.23,1278.47,8.24933],
[2214.57,1279.39,5.62083],


[2219.16,1252.7,0.000967979],
[2218.85,1257.51,2.06494],

[2223.44,1282.56,14.5395],
[2219.27,1282.33,15.1964],
[2218.53,1287.05,15.4218],
[2222.17,1287.23,14.9157],
[2223.38,1284.56,14.4845]
// table location [2221.65,1284.25,14.7383]
];

OpforArray_BGSWBoatLaunch=[
[2237.62,1341.92,0.302748],
[2233.96,1339.91,0.138982],
[2237.97,1344.44,0.595244],
[2242.07,1347.5,0.00191116]
];

Opfor_BorderGuardSW=[];
{
_pos=_x;

_group=creategroup east;
_unit = _group createUnit ["O_Soldier_F", _pos, [], 0, "NONE"];
_unit setposatl _pos;
//_unit lookat [2975.65,1438.12,0.00109863];
_unit additem "aph_opfordogtag";
Opfor_BorderGuardSW pushback (_unit);
} 
foreach OpforArray_BorderGuardSW;

Opfor_BGSWBoatLaunch=[];
{
_pos=_x;

_group=creategroup east;
_unit = _group createUnit ["O_Soldier_F", _pos, [], 0, "NONE"];
_unit setposatl _pos;
//_unit lookat [2975.65,1438.12,0.00109863];
_unit additem "aph_opfordogtag";
Opfor_BGSWBoatLaunch pushback (_unit);
} 
foreach OpforArray_BGSWBoatLaunch;

//Vehicles
OpBG_Assaultboat1=createVehicle ["O_Boat_Transport_01_F",[2197.74,1353.27,0.00139803], [], 0, "NONE"];  OpBG_Assaultboat1 setdir 282.136;



//c


//o Guards at Border with Blufor
_StaticMG= createVehicle ["O_HMG_01_high_F",[2447.02,3831.58,0.00147247], [], 0, "NONE"];  
_StaticMG setpos [2447.02,3831.58,0.00147247];
_StaticMG setdir 7.00905;

_group=creategroup east;
_GuardUnit = _group createUnit ["O_Soldier_F", [2447.66,3830.62,0.00150299], [], 0, "NONE"];
_Guardunit moveingunner _StaticMG;





//c end
//c

//INDEPENDENT// o

//o Reps  with Rust
Indi_KaminoBase=[
[[2939.2,1048.33,0.00217438],[2943.7,1050.35,0.00117159]],
[[2940.78,1042.01,0.00269032],[2942.22,1048.04,0.00233531]],
[[6563.6,5413.06,0.00123262],[6564.93,5410.35,0.00176215]],
[[6563.78,5413.13,0.00177217],[6561.34,5411.44,0.00146198]],
[[6562.69,5418.67,0.00233114],[6561.03,5420.91,0.00214922]],
[[6534.88,5415.18,0.000911474],[6537.15,5410.77,0.00144887]]
];
//Infantry
{
_pos=_x select 0;
_lookAT=_x select 1;

_group=creategroup resistance;
_GuardUnit = _group createUnit ["I_soldier_F",_pos, [], 0, "NONE"];
_Guardunit setpos _pos;
_GuardUnit lookat _lookAT;

}foreach Indi_KaminoBase;

//Vehicles
Kamino_TransportBoat= createVehicle ["I_Boat_Armed_01_minigun_F",[6557.51,5436.89,-1.48492], [], 0, "NONE"];  
Kamino_TransportBoat setdir 2.27286;


//Special Units
_group=creategroup resistance;
Indi_RustRep= _group createUnit ["I_soldier_F",[2940.49,1045.42,0.00278282], [], 0, "NONE"];
Indi_RustRep setpos [2940.49,1045.42,0.00278282];
Indi_RustRep lookat [2942.61,1049.82,0.00210714];
Indi_RustRep setVariable ["ConversationOptions",[(aph_dialogNodes select (aph_dialogNodes_ID find "IR_Greet")),
												(aph_dialogNodes select (aph_dialogNodes_ID find "IR_Return"))], true];
_group=creategroup resistance;
Indi_KaminoBoatDriver= _group createUnit ["I_soldier_F",[6559.09,5425.18,-0.0414286], [], 0, "NONE"];
Indi_KaminoBoatDriver setpos [6559.09,5425.18,-0.0414286];
Indi_KaminoBoatDriver lookat [6553.95,5429.27,-0.385242];

												
//c 

 
//c 

//BLUFOR// o 

//o Blufor AirBase
AirBase_TransportHeli= createVehicle ["B_Heli_Light_01_F",[1729.28,5262.48,0.00143862], [], 0, "NONE"];  
AirBase_TransportHeli setdir 281.898;



//Special Units
_group=creategroup WEST;
Blufor_HeliPilot= _group createUnit ["B_Soldier_F",[1735.95,5251.83,0.00143862], [], 0, "NONE"];
Blufor_HeliPilot setpos [1735.95,5251.83,0.00143862];
Blufor_HeliPilot lookat [1733.27,5252.25,0.00143862];





//c 

//c 

//CIVILIANS/// o

//o Special Conversation Units

	//Ranger at Wall
_group=creategroup civilian;
CIV_RangerSven= _group createUnit ["C_man_1",[2408.62,1176.37,0.00143623], [], 0, "NONE"];
CIV_RangerSven setpos [2408.62,1176.37,0.00143623];
CIV_RangerSven lookat [2407.24,1173.27,0.001441];
_nullo= CIV_RangerSven spawn {
	sleep 3; 
	_this setVariable ["ConversationOptions",[(aph_dialogNodes select (aph_dialogNodes_ID find "Ranger_Start")),(aph_dialogNodes select (aph_dialogNodes_ID find "Ranger_Friendly"))], true]; 
	}; 
CIV_RangerSven adduniform "U_BG_leader";
CIV_RangerSven setunitpos "MIDDLE";


	//Rust Mining Foreman
_group=creategroup civilian;
CIV_MinerWilco= _group createUnit ["C_man_1",[2609.85,383.839,0.00110245], [], 0, "NONE"];
CIV_MinerWilco setpos [2609.85,383.839,0.00110245];
CIV_MinerWilco lookat [2606.84,384.779,0.0010891];
CIV_MinerWilco disableAI "MOVE";
_nilli= CIV_MinerWilco spawn { 
	sleep 3; 
	_this setVariable ["ConversationOptions",[(aph_dialogNodes select (aph_dialogNodes_ID find "MC_FirstStart"))],true]; 
	};


	//Cattle Farmer
_group=creategroup civilian;
CIV_CattleFarmer= _group createUnit ["C_man_1",[2450.63,834.324,0.00123215], [], 0, "NONE"];
CIV_CattleFarmer setpos [2450.63,834.324,0.00123215];
CIV_CattleFarmer lookat [2453.56,833.112,0.00122023]	;
CIV_CattleFarmer disableAI "MOVE";
_nilli= CIV_CattleFarmer spawn { 
	sleep 3;
	_this setVariable ["ConversationOptions",[(aph_dialogNodes select (aph_dialogNodes_ID find "FR_Start")),(aph_dialogNodes select (aph_dialogNodes_ID find "FR_RabbitQuestReturn")),(aph_dialogNodes select (aph_dialogNodes_ID find "FR_Return")),(aph_dialogNodes select (aph_dialogNodes_ID find "FR_CompleteQuest")),(aph_dialogNodes select (aph_dialogNodes_ID find "FR_CompletedQuestReturning"))], true]; 
	};	
CIV_CattleFarmer setVariable ["BIS_enableRandomization", false];
CIV_CattleFarmer addUniform "U_C_Poloshirt_blue"; 	
//c 

//o Rust tip miners
Rust_ActiveMiners=[];
{
_group=creategroup civilian;
_unit = _group createUnit ["C_man_1_1_F", _x, [], 0, "NONE"];
Rust_ActiveMiners pushback (_unit);
_unit addbackpack "B_Bergen_blk";
[_unit] spawn aph_Rfnc_FindandMine;
_nilli= _unit spawn { 
	sleep 3;
	_this setVariable ["ConversationOptions",[(aph_dialogNodes select (aph_dialogNodes_ID find "MR_intro"))], true]; 
	};	
} 
foreach [
[2554.92,489.684,0.00151443],[2542.46,485.528,-0.000421524],[2569.16,400.418,-0.00210571],[2577.27,408.534,0.000875473],[2579.24,434.661,0.000963211],
[2573.9,428.129,0.000852585],[2567.76,422.99,0.00102425],[2560.46,430.504,0.00100613],[2571.73,417.243,0.000944138],[2582.41,453.661,0.000530243],
[2590.52,461.777,0.000585556],[2584.98,470.485,3.24249e-005],[2594.28,354.895,0.00137806],[2602.38,363.011,0.00191784],[2596.85,371.719,0.00171089],
[2616.03,479.589,0.00163841],[2620.97,448.515,0.00243187],[2623.55,465.339,0.0016613],[2618.6,496.414,0.00269508],[2629.08,456.63,0.00221443],[2624.14,487.705,0.00211525]
];


//Create Miner unload boxes and put them into global arrays
Rust_DropBoxes=[];
{
_box= createVehicle ["C_supplyCrate_F", _x, [], 0, "NONE"];
clearweaponcargoglobal _box;    clearmagazinecargoglobal _box;   clearitemcargoglobal _box;  clearbackpackcargoglobal _box; 
Rust_DropBoxes pushback _box;
} foreach [[2596.71,447.631,0.00107193],[2593.52,488.92,0.00258446],[2598.53,466.116,0.00180054]];


//Create local mining rock arrays
_listI=[2584.98,470.485,3.24249e-005] nearObjects ["Iron_rock", 100];
_listG=[2584.98,470.485,3.24249e-005] nearObjects ["Gold_rock", 100];
_listP=[2584.98,470.485,3.24249e-005] nearObjects ["Platinum_rock", 100];
_listS=[2584.98,470.485,3.24249e-005] nearObjects ["Stone_rock", 100];
Peak_OrePositionsList=_listI + _listG + _listP + _listS;

//c

//c 

//OBJECTS// o 

//o Mining Mission Box

Rust_MiningMissionBox= createVehicle ["B_supplyCrate_F",[2611.28,385.249,0.0403318], [], 0, "NONE"];  
Rust_MiningMissionBox setpos [2611.28,385.249,0.0403318];
Rust_MiningMissionBox setdir 294.196;
clearweaponcargoglobal Rust_MiningMissionBox;  
clearmagazinecargoglobal Rust_MiningMissionBox; 
clearitemcargoglobal Rust_MiningMissionBox;
clearbackpackcargoglobal Rust_MiningMissionBox;
_Nular= Rust_MiningMissionBox spawn {
	sleep 3;
	_script=[_this] spawn MiningBoxEH;
	};
//c 


//o Airbase 


//Dome Doors
AirBase_interior="Land_Dome_Small_F" createvehicle [0,0,1000];
AirBase_interior setpos [4359.64,3865.58,1000];
[[AirBase_interior,[0,0,1]],"setVectorUp",true,FALSE] spawn BIS_fnc_MP;

sleep 0.02;
AirBase_ground1="Land_Pier_F" createvehicle [0,0,1000];
AirBase_ground2="Land_Pier_F" createvehicle [0,0,1000];
AirBase_ground3="Land_Pier_F" createvehicle [0,0,1000];
	Airbase_ground1 attachto [Airbase_interior,[0,15,-11.5]];
	Airbase_ground2 attachto [Airbase_interior,[0,0,-11.5]];
	Airbase_ground3 attachto [Airbase_interior,[0,-15,-11.5]];

AirBase_Exit="Land_InfoStand_V1_F" createvehicle [0,0,1000];
AirBase_Exit attachto [Airbase_ground1,[2.5,-3,5.2]];
AirBase_Exit addaction ["Exit Airbase",{(_this select 1) setposatl [4357.07,3880.56,8]; },nil,1.5,true,true,"",""];

Airbase_MainObject =[4357.07,3880.56,8] nearestObject 122613; 
Airbase_MainObject addaction ["Open Airbase Door",{(_this select 1) setposasl [4360.49,3851.83,1233.89];(_this select 1) setdir 4.91596;(_this select 1) playmove "AmovPpneMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"},nil,1.5,true,true,"","((_this distance [4357.07,3880.56,8])<=3.5)"];


//Energy Collectors
_Collector1=[4357.07,3880.56,8] nearestObject 122931; 
_Collector1 setvariable ["IsResourceFilled",true,true];
_Collector1 setvariable ["MineralType","AirbaseJewel",true];
_Collector1 setvariable ["MineralAmount",500,true];

//c



//o Example Rust Guards 
/*
this adduniform "U_C_HunterBody_grn"; 
this addmagazine "20Rnd_762x51_Mag";  
this addmagazine "20Rnd_762x51_Mag"; 
this addweapon "srifle_DMR_06_olive_F";
*/

//c
	
	
//c 

//o Town Logics with Markers
_TownArray=[
	[[4323.77,6844.15,0.00109863],"Kill Farm Hills"],
	[[2891.44,1216.12,0.00225067],"Sanqua Crest"]
	];
	
	{
		_Town= createAgent ["LocationBase_F",_x select 0, [], 0, "NONE"];	
		_Town setvariable ["LocalMilitia",(nearestObjects [(_x select 0),["FlagCarrier"],1000]) select 0,true];
		_Town spawn aph_fnc_FlagReinforcements;
			_marker=createMarker [format ["Mkr_Towns_%1",_foreachindex],_x select 0];
			_marker setMarkerType "hd_dot";
			_marker setMarkerColor "ColorUNKNOWN";
			_marker setMarkerText (_x select 1);
			_marker setMarkerAlpha 0;
		
	}foreach _TownArray;
//c 	


//o Markers
	
	//Flags
	_ar=[0,0,0] nearobjects ["FlagCarrier",10000];
		{
		_debug=createMarker [format ["Mkr_Flags_%1",_foreachindex],getpos _x];
		_debug setMarkerType "hd_objective";
			
			_color="";
			switch (typeof _x) do 
				{
					case "Flag_Blue_F": {_color="ColorWEST"};
					case "Flag_CSAT_F":{_color="ColorEAST"};
					case "Flag_AAF_F": {_color="ColorGUER"};
					default {_color="ColorCIV"};
				};
		_debug setMarkerColor _color;
		
		_debug setMarkerAlpha 0;
		}foreach _ar;
	
	



//c 