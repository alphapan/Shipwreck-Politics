class CfgPatches
{
	class AP_HandWeapons
	{
		units[] = {"Combat Knife"};
		weapons[] = {};
		requiredVersion = 1.0;
	};
};
class CfgVehicleClasses
{
	class AP_Melee
	{
		displayname= "Melee Weapons";
	};
};	

class CfgVehicles
{	
	class Thing;
	class AP_CombatKnife: Thing
	{
		displayName = "Combat Knife";
		scope=2;
		model = "\Models\Knife\CombatKnife.p3d";
		picture = "\Models\Knife\CombatKnife.paa";
		descriptionShort = "";
		mapsize= 0.7;
		accuracy=0.2;
		vehicleclass="AP_Melee";
		destrtype="DestructNo";
		
	};
};	
	
	
		
class cfgWeapons
{
	class Toolkit;
	class AP_CombatKnife: Toolkit
	{
		displayName = "Combat Knife";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	};
		model = "\Models\Knife\CombatKnife.p3d";
		picture = "\Models\Knife\CombatKnife.paa";
		descriptionShort = "";
		
	};
};


