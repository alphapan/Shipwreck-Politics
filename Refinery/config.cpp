class CfgPatches
{
	class AP_refineries
	{
		units[] = {"Refineries"};
		weapons[] = {};
		requiredVersion = 1.0;
	};
};

class CfgVehicleClasses
{
	class AP_Refinery_OBJ
	{
		displayname= "Resource Processing";
	};
};	
	
class CfgVehicles
{
class NATO_Box_Base;
class Eventhandlers;
class AP_Refinery: NATO_Box_Base
	{
		scope = 2;
		vehicleClass = "AP_Refinery_OBJ";
		displayName = "Electronic Refinery";
		model = "\A3\Structures_F_EPC\Items\Electronics\Device_assembled_F.p3d";
		icon = "iconCrateWpns";
		class TransportMagazines{};
		class TransportWeapons{};
		class TransportItems{};
		class Eventhandlers: Eventhandlers	/// specific event handlers to handle variants - by default are all shown, event handlers hide them
		{
			scope=2;
			init = "(_this select 0) addaction ['Start Refinery',{[_this select 0,_this select 1] call aph_fnc_RefineryStartup},'',1.5,false]";
			
		};
	};
};


