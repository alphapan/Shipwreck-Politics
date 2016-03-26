null=this spawn {
sleep 2; 
[[_this,[0,0,1]],"setVectorUp",true,FALSE] spawn BIS_fnc_MP;
ap_veh="Land_i_House_Big_01_V1_F" createvehicle position _this;
ap_veh attachto [_this,[13,3,3.5]];
ap_mill="Land_wpp_Turbine_V2_F" createvehicle position _this; 
ap_mill1="Land_wpp_Turbine_V2_F" createvehicle position _this;    
ap_mill setposatl [4364.17,3812.03,2499.98];  
ap_mill1 setposatl [4373.17,3824.02,2499.5];    
ap_mill attachto [_this, [3,12,0]];  
ap_mill1 attachto [ap_mill, [0,0,-28]];      
[ap_mill,[-90,25,0]] call fnc_SetPitchBankYaw;  
[ap_mill1,[0,180,0]] call fnc_SetPitchBankYaw;

ap_shop="Land_i_Shop_01_V1_F" createvehicle position _this;
ap_shop attachto [_this,[-11,4,3.8]]; 
ap_shop setdir 90;

ap_light= "#lightpoint" createvehicle position _this;
ap_light setlightbrightness 0.5;
ap_light setlightcolor [1,1,1];
ap_light setlightambient [1,1,1];
ap_light setposatl[4353.8,3830.02,2501.79];

_this setposatl [4373.17,3824.02,2499.5];
};