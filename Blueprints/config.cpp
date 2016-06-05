
#define _ARMA_

class CfgPatches
{
	class AP_notepad
	{
		units[] = {"Blueprints"};
		weapons[] = {};
		requiredVersion = 1.0;
	};
};

	
class CfgVehicles
{
	class NATO_Box_Base;
	class ThingX;
	class House_Small_F;
	
	class ap_box_BP: NATO_Box_Base
	{
		scope = 2;
		vehicleClass = "Ammo";
		displayName = "[AA] Objective Items";
		model = "\A3\weapons_F\AmmoBoxes\AmmoBox_F";
		icon = "iconCrateWpns";
		class TransportMagazines{};
		class TransportWeapons{};
		class TransportItems
		{
			//Rifles
			class _xx_aph_BpM14
			{
				name = "aph_bp_m14";
				count = 3;
			};
			
			//Pistols
			class _xx_aph_6sPistol
			{
				name = "aph_bp_6sHgun";
				count = 3;
			};
			
			//ammo bp
			class _xx_aph_Bp762x51
			{
				name = "aph_bp_762x51";
				count = 3;
			};
			class _xx_aph_Bp6rAmmo
			{
				name = "aph_bp_6r45";
				count = 3;
			};
			
	
			//Gear BP
			class _xx_aph_BpUhunter
			{
				name = "aph_bp_UHunter";
				count = 3;
			};
			class _xx_aph_BpVPlater
			{
				name = "aph_bp_VPlateCarrier";
				count = 3;
			};
			class _xx_aph_BpBergenWC
			{
				name = "aph_bp_BergenWC";
				count = 3;
			};
			
			
			//Explosive BP
			class _xx_aph_BpExpCharge
			{
				name = "aph_bp_ExplCharge";
				count = 3;
			};
			class _xx_aph_BpSatchelCharge
			{
				name = "aph_bp_SatchelCharge";
				count = 3;
			};
			//Vehicle bp
			class _xx_aph_TanuTransport
			{
				name = "aph_bp_TanuTransport";
				count = 13;
			};
			class _xx_aph_ZamakTransportTruck
			{
				name = "aph_bp_ZamakTransportTruck";
				count = 13;
			};
			class _xx_aph_Hummingbird
			{
				name = "aph_bp_Hummingbird";
				count = 13;
			};
			
			//Furniture
			
			class _xx_aph_LargeWoodenTable
			{
				name = "aph_bp_LargeWoodenTable";
				count = 13;
			};
			class _xx_aph_SmallShelf
			{
				name = "aph_bp_SmallShelf";
				count = 13;
			};
			class _xx_aph_LargeShelf
			{
				name = "aph_bp_LargeShelf";
				count = 13;
			};
			class _xx_aph_DeskChair
			{
				name = "aph_bp_DeskChair";
				count = 13;
			};
		
			
			//Extra
			class _xx_aph_PersonalGarage
			{
				name = "aph_bp_PersonalGarage";
				count = 13;
			};
			class _xx_aph_BuildingTable
			{
				name = "aph_bp_BuildingTable";
				count = 13;
			};
			//Seeds
			class _xx_aph_PineSapling
			{
				name = "aph_PineSapling";
				count = 13;
			};
			class _xx_aph_PalmSapling
			{
				name = "aph_PalmSapling";
				count = 13;
			};
			class _xx_aph_MulberrySapling
			{
				name = "aph_MulberrySapling";
				count = 13;
			};
			//Dogtags
			class _xx_aph_dogtagOpfor
			{
				name = "aph_OpforDogtag";
				count = 13;
			};
			class _xx_aph_dogtagBlufor
			{
				name = "aph_BluforDogtag";
				count = 13;
			};
			class _xx_aph_dogtagIndi
			{
				name = "aph_IndiDogtag";
				count = 13;
			};
			class _xx_aph_dogtagRebel
			{
				name = "aph_RebelDogtag";
				count = 13;
			};
			//Coin
			class _xx_aph_IronCoin
			{
				name = "aph_IronCoin";
				count = 13;
			};
			class _xx_aph_PlatCoin
			{
				name = "aph_PlatCoin";
				count = 13;
			};
			
			
		};
	};
	class ap_BuildTable: ThingX
	{
		scope = 2;
		vehicleClass = "Ammo";
		displayName = "AA BuildingTable";
		model = "\A3\Structures_F_EPA\Civ\Camping\WoodenTable_large_F.p3d";
		icon = "iconCrateWpns";
	};
	class ap_BuildGarage: House_Small_F
	{
		scope = 2;
		vehicleClass = "Ammo";
		displayName = "AA BuildingGarage";
		model = "\A3\Structures_f\Households\Slum\cargo_addon02_V2_F.p3d";
		icon = "iconCrateWpns";
	};
};
	
class cfgWeapons
{
	class Default;
	class Toolkit;
	class Itemwatch;
	
	//Rifle blueprints
	class aph_bp_m14: Toolkit
	{
		displayName = "Blueprints (Rifle: M14)";
		count = 1;
		class ItemInfo
        	{
            allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Blueprints\images\BlueprintBackground.paa";	
		ammo= "srifle_DMR_06_olive_F";
		descriptionshort="Iron: 20<br />Wood: 15<br/>Steel: 3";
		author="Olive M14 Rifle";
	};
	
	//Pistols
	class aph_bp_6sHgun: Toolkit
	{
		displayName = "Blueprints (.45 Six Cylinder Pistol)";
		count = 1;
		class ItemInfo
        	{
            allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Blueprints\images\BlueprintBackground.paa";	
		ammo= "hgun_Pistol_heavy_02_F";
		descriptionshort="";
		author=".45 Six Cylinder Pistol";
	};
	
	//Ammunition blueprints
	class aph_bp_762x51: Toolkit
	{
		displayName = "Blueprints (Ammunition: 7.62x51mm)";
		count = 1;
		class ItemInfo
        	{
            allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Blueprints\images\BlueprintBackground.paa";	
		ammo= "20Rnd_762x51_Mag";
		descriptionshort="Iron: 5<br />Steel: 1";
		author="7.62 x 51mm Ammunition";
	};
	
	class aph_bp_6r45: Toolkit
	{
		displayName = "Blueprints (Ammunition: 6 Round Cylinder .45)";
		count = 1;
		class ItemInfo
        	{
            allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Blueprints\images\BlueprintBackground.paa";	
		ammo= "6Rnd_45ACP_Cylinder";
		descriptionshort="";
		author="6 Round Cylinder .45";
	};
	
	
	//Explosives
	class aph_bp_ExplCharge: Toolkit
	{
		displayName = "Blueprints (Explosive Charge)";
		count = 1;
		class ItemInfo
        	{
            allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Blueprints\images\BlueprintBackground.paa";	
		ammo= "DemoCharge_Remote_Mag";
		descriptionshort="Iron: 5<br />Steel: 1";
		author="Explosive Charge";
	};
	class aph_bp_SatchelCharge: Toolkit
	{
		displayName = "Blueprints (Satchel Charge)";
		count = 1;
		class ItemInfo
        	{
            allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Blueprints\images\BlueprintBackground.paa";	
		ammo= "SatchelCharge_Remote_Mag";
		descriptionshort="Iron: 5<br />Steel: 1";
		author="Satchel Charge";
	};
	
	//vehicles
	class aph_bp_TanuTransport: Toolkit
	{
		displayName = "Blueprints (Helicopter: Tanu Transport)";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Blueprints\images\BlueprintBackground.paa";
		descriptionShort = "Steel: 150<br/>Platinum: 125<br/>Gold: 75<br/>Plastic: 45";
		ammo="O_Heli_Transport_04_F";
		author="Taru Transport Helicopter";
	};
	class aph_bp_ZamakTransportTruck: Toolkit
	{
		displayName = "Blueprints (Truck: Zamak Transport)";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Blueprints\images\BlueprintBackground.paa";
		descriptionShort = "Steel: 75<br/>Platinum: 75<br/>Gold: 25<br/>Plastic: 65";
		ammo="O_Truck_02_transport_F";
		author="Zamak Transport Truck";
	};
	class aph_bp_Hummingbird: Toolkit
	{
		displayName = "Blueprints (Helicopter: Hummingbird)";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Blueprints\images\BlueprintBackground.paa";
		descriptionShort = "Steel: 125<br/>Platinum: 55<br/>Gold: 25<br/>Plastic: 70";
		ammo="C_Heli_Light_01_civil_F";
		author="Closed-Cockpit Hummingbird";
	};
	
	
	//Furniture
	class aph_bp_LargeWoodenTable: Toolkit
	{
		displayName = "Blueprints (Large Wooden table)";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Blueprints\images\BlueprintBackground.paa";
		descriptionShort = "";
		ammo="Land_WoodenTable_large_F";
		author="Large Wooden Table";
	};
	class aph_bp_SmallShelf: Toolkit
	{
		displayName = "Blueprints (Small shelf)";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Blueprints\images\BlueprintBackground.paa";
		descriptionShort = "";
		ammo="Land_ShelvesWooden_F";
		author="Small Shelf";
	};
	class aph_bp_LargeShelf: Toolkit
	{
		displayName = "Blueprints (Large shelf)";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Blueprints\images\BlueprintBackground.paa";
		descriptionShort = "";
		ammo="Land_Rack_F";
		author="Large Shelf";
	};
	class aph_bp_DeskChair: Toolkit
	{
		displayName = "Blueprints (Desk chair)";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Blueprints\images\BlueprintBackground.paa";
		descriptionShort = "";
		ammo="Land_ChairWood_F";
		author="Desk Chair";
	};
	
	
	//Uniforms
	class aph_bp_UHunter: Toolkit
	{
		displayName = "Blueprints (Hunter's Outfit)";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Blueprints\images\BlueprintBackground.paa";
		descriptionShort = "";
		ammo="U_C_HunterBody_grn";
		author="Hunter's Outfit";
	};
	
	
	//Vests
	class aph_bp_VPlateCarrier: Toolkit
	{
		displayName = "Blueprints (Plate Carrier Vest)";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Blueprints\images\BlueprintBackground.paa";
		descriptionShort = "";
		ammo="V_PlateCarrierGL_rgr";
		author="Plate Carrier Vest";
	};
	
	
	//Backpacks
	class aph_bp_BergenWC: Toolkit
	{
		displayName = "Blueprints (Woodland Camo Backpack)";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Blueprints\images\BlueprintBackground.paa";
		descriptionShort = "";
		ammo="B_Bergen_mcamo";
		author="Woodland Camo Backpack";
	};
	
	
	
	//Other
	class aph_bp_PersonalGarage: Toolkit
	{
		displayName = "Blueprints (Personal Garage)";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Blueprints\images\BlueprintBackground.paa";
		descriptionShort = "";
		ammo="ap_BuildGarage";
		author="Personal Building Garage";
	};
	class aph_bp_BuildingTable: Toolkit
	{
		displayName = "Blueprints (Building table)";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Blueprints\images\BlueprintBackground.paa";
		descriptionShort = "";
		ammo="ap_BuildTable";
		author="Personal Building Table";
	};

	

	};

	
	








