#include "basicdefines_A3.hpp"

class CfgPatches
{
	class AP_CreaturesSpider
	{
		units[] = {"Spider"};
		weapons[] = {};
		requiredVersion = 1.0;
	};
};

class CfgVehicleClasses
{
	class AP_Creatures_Spider
	{
		displayname= "Creatures";
	};
};	
	
class CfgVehicles
{
class Animal_Base_F;
class AP_CreatureSpider: Animal_Base_F
	{
		scope = 2;
		vehicleClass = "AP_Creatures_Spider";
		displayName = "Spider";
		model = "Models\Spider\anonymous_simon_creature_spider.p3d";
		
		side = 3;	/// 3 stands for civilians, 0 is OPFOR, 1 is BLUFOR, 2 means guerrillas

		moves = CfgMovesRabbit_F;	/// what set (class) of moves is going the animal use

		fsmFormation 	= "";		/// resets the formation behaviour of animal
		fsmDanger 		= "";		/// resets how does the animal react to danger (it would go prone otherwise)

		maxTurnAngularVelocity 	= 30;		/// how fast is the animal able to turn around and how much does it turn between animation switches
		costTurnCoef 			= 0.00001;	/// turning around should not be considered as an obstacle

		boneHead 			= "head";	/// what selection in model is moved when the head turns around
		bonePrimaryWeapon 	= "head";	/// what selection in model is moved when the weapon should move, could be empty for animals
		weaponBone 			= "head";	/// what selection in model is moved when the launcher/pistol should move, could be empty for animals
		triggerAnim 		= "";		/// what RTM file should be played when the animal pulls the trigger (obviously none)

		class VariablesScalar
		{	// when using this class in derived configs copy all variables below (.fsm can read from top config only)
			// randomization of sart internal values

			_threatMaxRadius 	= 20;		// Radius for minimal thread
			_runDistanceMax 	= 50;		// How far agent want to move
			_movePrefer 		= 0.7;		// Probability of moving (instead of standing)
			_formationPrefer 	= 0.2;		// Probability of joining to other agent
			_scareLimit 		= 0.2;		// How many nearby agents have to be scared to switch to danger level
			_dangerLimit 		= 1.0;		// How many nearby enemies have to be present for unit to be scared
			_walkSpeed 			= 0.9;		// Speed of walking (slow movement) in m/s, set to -1 when there is no slow movement for animal
		};

		class VariablesString
		{	// when using this class in derived configs copy all variables below (.fsm can read from top config only)
			_expSafe = "(0.5 * meadow) * (0.5 *  trees) * (1 - forest) * (1 - houses) * (1 - sea)";
			_expDanger = "(trees) * (forest) * (1 - meadow) * (1 - houses) * (1 - sea)";
		};

		class Wounds
		{
			tex[]={};
			mat[]=
			{
					/// material mapped in model
					/// changes to this one once damage of the part reaches 0.5
					/// changes to this one once damage of the part reaches 1
			};
		};

	};
};


