class CfgPatches
{
	class AP_groundmodels
	{
		units[] = {"Ground resources"};
		weapons[] = {};
		requiredVersion = 1.0;
	};
};

class CfgVehicleClasses
{
	class Ground_Rocks
	{
		displayname= "Ground Resources";
	};
	class Ground_Crops
	{
		displayname= "Ground Crops";
	};
};	
	

class CfgVehicles
{	
	class Thing;
	class Eventhandlers;
	
class AP_GroundCrop: Thing
	{
		scope=2;
		mapsize= 0.7;
		accuracy=0.2;
		destrtype="DestructNo";
	};		
class AP_GroundRock: Thing
	{
		scope=2;
		mapsize= 0.7;
		accuracy=0.2;
		destrtype="DestructNo";
	};	
	
	//Rocks	
	class Iron_rock: AP_GroundRock
	{
		model="Models\LandResources\ironstone.p3d";
		icon="Models\LandResources\Images\ironoreicon.paa";
		displayname="Iron Stone";
		vehicleclass="Ground_Rocks";
		class Eventhandlers: Eventhandlers	/// specific event handlers to handle variants - by default are all shown, event handlers hide them
		{
			scope=2;
			init = "(_this select 0) setvariable ['MineralType','Iron',true];(_this select 0) setvariable ['MineralAmount',500,true];";
		};
	};
	class Gold_rock: AP_GroundRock
	{
		model="Models\LandResources\goldstone.p3d";
		icon="Models\LandResources\Images\goldoreicon.paa";
		displayname="Gold Stone";
		vehicleclass="Ground_Rocks";
		class Eventhandlers: Eventhandlers	/// specific event handlers to handle variants - by default are all shown, event handlers hide them
		{
			scope=2;
			init = "(_this select 0) setvariable ['MineralType','Gold',true];(_this select 0) setvariable ['MineralAmount',500,true];";
		};
		 
	};
	class Platinum_rock: AP_GroundRock
	{
		model="Models\LandResources\platinumstone.p3d";
		icon="Models\LandResources\Images\platoreicon.paa";
		displayname="Platinum Stone";
		vehicleclass="Ground_Rocks";
		class Eventhandlers: Eventhandlers	/// specific event handlers to handle variants - by default are all shown, event handlers hide them
		{
			scope=2;
			init = "(_this select 0) setvariable ['MineralType','Platinum',true];(_this select 0) setvariable ['MineralAmount',500,true];";
		};
	};
	class Stone_rock: AP_GroundRock
	{
		model="Models\LandResources\stoneore.p3d";
		icon="Models\LandResources\Images\stoneoreicon.paa";
		displayname="Ground Stone";
		vehicleclass="Ground_Rocks";
		class Eventhandlers: Eventhandlers	/// specific event handlers to handle variants - by default are all shown, event handlers hide them
		{
			scope=2;
			init = "(_this select 0) setvariable ['MineralType','Stone',true];(_this select 0) setvariable ['MineralAmount',500,true];";
		};
	};

	
//Small versions of Rocks
	class SmallGold_rock: AP_GroundRock
	{
		model="Models\LandResources\smallgoldstone.p3d";
		icon="Models\LandResources\Images\goldoreicon.paa";
		displayname="Small Gold Stone";
		vehicleclass="Ground_Rocks";
		
		 
	};
	class SmallPlatinum_rock: AP_GroundRock
	{
		model="Models\LandResources\smallplatinumstone.p3d";
		icon="Models\LandResources\Images\platoreicon.paa";
		displayname="Small Platinum Stone";
		vehicleclass="Ground_Rocks";
		
	};
	class SmallStone_rock: AP_GroundRock
	{
		model="Models\LandResources\smallstoneore.p3d";
		icon="Models\LandResources\Images\stoneoreicon.paa";
		displayname="Small Ground Stone";
		vehicleclass="Ground_Rocks";
		
	};
	class SmallIron_rock: AP_GroundRock
	{
		model="Models\LandResources\smallironstone.p3d";
		icon="Models\LandResources\Images\ironoreicon.paa";
		displayname="Small Iron Stone";
		vehicleclass="Ground_Rocks";
	};
	

//Ground Crops	
	class Wheat_Stalk: AP_GroundCrop
	{
		model="Models\LandResources\wheatstalk.p3d";
		icon="Models\LandResources\wheatstalkicon.paa";
		displayname="Wheat Stalk";
		vehicleclass="Ground_Crops";
	};	
};

class cfgWeapons
{
	class Toolkit;	
//Raw Minerals
	class aph_IronOre: Toolkit
	{
		displayName = "Iron Ore";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=2; type=620;UniformModel="";
        	};
		model="Models\LandResources\smallironstone.p3d";
		picture = "\Models\LandResources\Images\ironore.paa";
		descriptionShort = "Iron Ore <br/> Can be processed into Iron Bar";
		
	};
	class aph_GoldOre: Toolkit
	{
		displayName = "Gold Ore";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=2; type=620;UniformModel="";
        	};
		model="Models\LandResources\smallgoldstone.p3d";
		picture = "\Models\LandResources\Images\Goldore.paa";
		descriptionShort = "";
		
	};
	class aph_PlatinumOre: Toolkit
	{
		displayName = "Platinum Ore";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=2; type=620;UniformModel="";
        	};
		model="Models\LandResources\smallplatinumstone.p3d";
		picture = "\Models\LandResources\Images\PlatinumOre.paa";
		descriptionShort = "";
		
	};
	class aph_StoneGravel: Toolkit
	{
		displayName = "Stone Gravel";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=2; type=620;UniformModel="";
        	};
		model="Models\LandResources\smallstoneore.p3d";
		picture = "\Models\LandResources\Images\StoneGravel.paa";
		descriptionShort = "";
		
	};
	class aph_WoolFiber: Toolkit
	{
		displayName = "Wool Fiber";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=2; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\LandResources\Images\WoolFiber.paa";
		descriptionShort = "";
		
	};
	class aph_FlaxFiber: Toolkit
	{
		displayName = "Flax Fiber";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=2; type=620;UniformModel="";
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\LandResources\Images\FlaxFiber.paa";
		descriptionShort = "";
		
	};
	class aph_WoodPiece: Toolkit
	{
		displayName = "Wood Piece";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=2; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\LandResources\Images\WoodImage.paa";
		descriptionShort = "";
		
	};
	class aph_Switchgrass: Toolkit
	{
		displayName = "Switchgrass Bundle";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=2; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\LandResources\Images\switchgrass.paa";
		descriptionShort = "";
		
	};
	
	//Processed minerals 
	class aph_FlaxCloth: Toolkit
	{
		displayName = "Flax cloth";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=2; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\LandResources\Images\flaxcloth.paa";
		descriptionShort = "";
		
	};
	class aph_IronBar: Toolkit
	{
		displayName = "Iron bar";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=2; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\LandResources\Images\Ironbar.paa";
		descriptionShort = "";
		
	};
	class aph_Goldbar: Toolkit
	{
		displayName = "Gold Bar";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=2; type=620;UniformModel="";
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\LandResources\Images\Goldbar.paa";
		descriptionShort = "";
		
	};
	class aph_SteelBar: Toolkit
	{
		displayName = "Steel bar";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=2; type=620;UniformModel="";
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\LandResources\Images\steelbar.paa";
		descriptionShort = "";
		
	};
	class aph_PlasticBar: Toolkit
	{
		displayName = "Plastic bar";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=2; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\LandResources\Images\plasticbar.paa";
		descriptionShort = "";
		
	};
	class aph_PlatinumBar: Toolkit
	{
		displayName = "Platinum bar";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=2; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\LandResources\Images\platinumbar.paa";
		descriptionShort = "";
		
	};
	class aph_StoneBrick: Toolkit
	{
		displayName = "Stone brick";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=2; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\LandResources\Images\stonebrick.paa";
		descriptionShort = "";
		
	};
	class aph_WoodPlank: Toolkit
	{
		displayName = "Wood plank";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=2; type=620;UniformModel="";
        	};
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\LandResources\Images\woodplank.paa";
		descriptionShort = "";
		
	};
	class aph_WoolCloth: Toolkit
	{
		displayName = "Wool cloth";
		count = 1;
		class ItemInfo
        	{
            		 allowedSlots[]= {701,801,901}; mass =1; scope=2; type=620;UniformModel="";
        	}; 
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture = "\Models\LandResources\Images\woolcloth.paa";
		descriptionShort = "";
		
	};


	
};

