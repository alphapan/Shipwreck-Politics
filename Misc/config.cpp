class CfgPatches
{
	class AP_MISCmodels
	{
		units[] = {"Misc"};
		weapons[] = {};
		requiredVersion = 1.0;
	};
};

class CfgVehicleClasses
{
	class AP_MiscItems
	{
		displayname= "Assorted Items";
	};
};	
	
class CfgVehicles
{	
	class Thing;

};

class cfgWeapons
{
	class Toolkit;	
	class Itemwatch;

//Dogtags
	class aph_OpforDogtag: Itemwatch
	{
		displayName = "Dogtag (Opfor)";
		count = 1;
		class ItemInfo
        	{
            		mass = 1;
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Misc\Images\dogtagred.paa";
		descriptionShort = "";
	};
	class aph_BluforDogtag: Itemwatch
	{
		displayName = "Dogtag (Blufor)";
		count = 1;
		class ItemInfo
        	{
            		mass = 1;
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Misc\Images\dogtagblue.paa";
		descriptionShort = "";
	};
	class aph_IndiDogtag: Itemwatch
	{
		displayName = "Dogtag (Independent)";
		count = 1;
		class ItemInfo
        	{
            		mass = 1;
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Misc\Images\dogtaggreen.paa";
		descriptionShort = "";
	};
	class aph_RebelDogtag: Itemwatch
	{
		displayName = "Dogtag (Rebel)";
		count = 1;
		class ItemInfo
        	{
            		mass = 1;
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Misc\Images\dogtagblack.paa";
		descriptionShort = "";
	};
	
	
//Coin	
class aph_IronCoin: Toolkit
	{
		displayName = "Iron Coin";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Misc\Images\ironcoin.paa";
		descriptionShort = "";
	};
class aph_PlatCoin: Toolkit
	{
		displayName = "Platinum Coin";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Misc\Images\platinumcoin.paa";
		descriptionShort = "";
	};

//Seeds
class aph_PineSapling: Toolkit
	{
		displayName = "Pine Sapling";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =3; scope=0; type=620;UniformModel="";
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Misc\Images\saplingpine.paa";
		descriptionShort = "";
		ammo="Pine_1";
		author="Small Pine Tree";
		
	};
class aph_PalmSapling: Toolkit
	{
		displayName = "Palm Sapling";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =3; scope=0; type=620;UniformModel="";
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Misc\Images\saplingpalm.paa";
		descriptionShort = "";
		ammo="Palm_1";
		author="Palm Tree";
		
	};	
class aph_MulberrySapling: Toolkit
	{
		displayName = "Paper Mulberry Sapling";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =3; scope=0; type=620;UniformModel="";
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Misc\Images\saplingmulberry.paa";
		descriptionShort = "";
		ammo="Paper_Mulberry";
		author="Paper Mulberry Tree";
		
	};		
class aph_WheatSeed: Toolkit
	{
		displayName = "Wheat Seed";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =3; scope=0; type=620;UniformModel="";
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Misc\Images\wheatseed.paa";
		descriptionShort = "";
		ammo="Wheat_Stalk";
		author="Wheat stalk";
		
	};		

//Inventory useable
class aph_Singlelog: Toolkit
	{
		displayName = "Log";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =3; scope=0; type=620;UniformModel="";
        	}; 
		model = "\A3\Structures_F_EPA\Civ\Camping\WoodenLog_F.p3d";
		picture = "\Models\Misc\Images\singlelog.paa";
		descriptionShort = "Immediately create a small campfire two meters in front of you.";
		ammo="";
		author="";
		
	};		
class aph_Rarestone: Toolkit
	{
		displayName = "Rare stone";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =3; scope=0; type=620;UniformModel="";
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\Misc\Images\rarestone.paa";
		descriptionShort = "A stone unlike any other.";
		ammo="";
		author="";
		
	};		
class aph_DisassembledTent: Toolkit
	{
		displayName = "Disassembled Tent";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=0; type=620;UniformModel="";
        	};
		model="\Models\LandResources\smallironstone.p3d";
		picture = "\Models\Misc\Images\DAtent.paa";
		descriptionShort = "Can be assembled to allow sleeping and storage.";
		
	};
class aph_Lantern: Toolkit	
	{
		displayName = "Lantern";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =2; scope=0; type=620;UniformModel="";
        	};
		model="\Models\LandResources\smallironstone.p3d";
		picture = "\Models\Misc\Images\lantern.paa";
		descriptionShort = "Use as a light while moving around.";
		
	};
	
	
};

