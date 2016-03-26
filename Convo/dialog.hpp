//Conversation with AI
class ConversationSideChat
{
   idd = 1;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['ConversationSideChat', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "";
	x = 0.404016 * safezoneW + safezoneX;
	y = 0.636006 * safezoneH + safezoneY;
	w = 0.0959841 * safezoneW;
	h = 0.153007 * safezoneH;
};
class RscListbox_1500: RscListBoxBordered
{
	idc = 1000;
	x = 0.5 * safezoneW + safezoneX;
	y = 0.585004 * safezoneH + safezoneY;
	w = 0.343943 * safezoneW;
	h = 0.0340016 * safezoneH;
	onLBDblClick="call aph_characterConversation;";
	sizeEx = 0.03;
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,1};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0,0,0,0.3};
	colorSelectBackground2[] = {0,0,0,0.3};
	colorBackground[] = {0,0,0,0.2};
	colorShadow[] = {0, 0, 0, 0.99};
	color[] = {0, 0, 0, 0.5};
};
class RscListbox_1501: RscListBoxBordered
{
	idc = 1001;
	x = 0.523996 * safezoneW + safezoneX;
	y = 0.636006 * safezoneH + safezoneY;
	w = 0.343943 * safezoneW;
	h = 0.0340016 * safezoneH;
	onLBDblClick="call aph_characterConversation;";
	sizeEx = 0.03;
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,1};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0,0,0,0.3};
	colorSelectBackground2[] = {0,0,0,0.3};
	colorBackground[] = {0,0,0,0.2};
	colorShadow[] = {0,0,0,1};
	color[] = {0, 0, 0, 0.5};
};
class RscListbox_1502: RscListBoxBordered
{
	idc = 1002;
	x = 0.539993 * safezoneW + safezoneX;
	y = 0.687009 * safezoneH + safezoneY;
	w = 0.343943 * safezoneW;
	h = 0.0340016 * safezoneH;
	onLBDblClick="call aph_characterConversation;";
	sizeEx = 0.03;
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,1};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0,0,0,0.3};
	colorSelectBackground2[] = {0,0,0,0.3};
	colorBackground[] = {0,0,0,0.2};
	colorShadow[] = {0,0,0,1};
	color[] = {0, 0, 0, 0.5};
};
class RscListbox_1503: RscListBoxBordered
{
	idc = 1004;
	x = 0.507999 * safezoneW + safezoneX;
	y = 0.789013 * safezoneH + safezoneY;
	w = 0.343943 * safezoneW;
	h = 0.0340016 * safezoneH;
	onLBDblClick="call aph_characterConversation;";
	sizeEx = 0.03;
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,1};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0,0,0,0.3};
	colorSelectBackground2[] = {0,0,0,0.3};
	colorBackground[] = {0,0,0,0.2};
	colorShadow[] = {0,0,0,1};
	color[] = {0, 0, 0, 0.5};
};
class RscListbox_1504: RscListBoxBordered
{
	idc = 1003;
	x = 0.531995 * safezoneW + safezoneX;
	y = 0.738011 * safezoneH + safezoneY;
	w = 0.343943 * safezoneW;
	h = 0.0340016 * safezoneH;
	onLBDblClick="call aph_characterConversation;";
	sizeEx = 0.03;
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,1};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0,0,0,0.3};
	colorSelectBackground2[] = {0,0,0,0.3};
	colorBackground[] = {0,0,0,0.2};
	colorShadow[] = {0,0,0,1};
	color[] = {0, 0, 0, 0.5};
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "X"; //--- ToDo: Localize;
	x = 0.404016 * safezoneW + safezoneX;
	y = 0.772012 * safezoneH + safezoneY;
	w = 0.00799868 * safezoneW;
	h = 0.0170008 * safezoneH;
	action = "call aph_ConvoPartnerReset;";
};
class RscPicture_1201: RscPicture
{
	idc = 1201;
	x = 0.404016 * safezoneW + safezoneX;
	y = 0.789013 * safezoneH + safezoneY;
	w = 0.0159974 * safezoneW;
	h = 0.0340016 * safezoneH;
};
class RscPicture_1202: RscPicture
{
	idc = 1202;
	x = 0.404016 * safezoneW + safezoneX;
	y = 0.823015 * safezoneH + safezoneY;
	w = 0.0159974 * safezoneW;
	h = 0.0340016 * safezoneH;
};
class RscPicture_1203: RscProgress
{
	idc = 1301;
	x = 0.420013 * safezoneW + safezoneX;
	y = 0.840016 * safezoneH + safezoneY;
	w = 0.0799868 * safezoneW;
	h = 0.0170008 * safezoneH;
};
class RscPicture_1204: RscProgress
{
	idc = 1302;
	x = 0.420013 * safezoneW + safezoneX;
	y = 0.806014 * safezoneH + safezoneY;
	w = 0.0799868 * safezoneW;
	h = 0.0170008 * safezoneH;
};
class ChatPic: RscPicture
{
	idc = 1800;
	text="Convo\Images\NewBubble.paa";
	x = 0.0120807 * safezoneW + safezoneX;
	y = 0.335991 * safezoneH + safezoneY;
	w = 0.383936 * safezoneW;
	h = 0.340016 * safezoneH;
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	x = 0.0440754 * safezoneW + safezoneX;
	y = 0.396993 * safezoneH + safezoneY;
	w = 0.319947 * safezoneW;
	h = 0.255012 * safezoneH;
	size = 0.028; 
	colorBackground[] =	{0,0,0,0};
};




};
};

//Refinery UI
class LowRefineryUI
{	
	  idd = 2113;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['LowRefineryUI', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
class RscPicture_1210: RscPicture
{
	idc = 1210;
	text = "JournalUI\Images\RefinerySide.paa";
	x = -0.0119153 * safezoneW + safezoneX;
	y = -0.486045 * safezoneH + safezoneY;
	w = 1.02383 * safezoneW;
	h = 2.02309 * safezoneH;
};
class PlayerINV: RscListbox
{
	idc = 1500;
	x = 0.108065 * safezoneW + safezoneX;
	y = 0.227987 * safezoneH + safezoneY;
	w = 0.191968 * safezoneW;
	h = 0.204009 * safezoneH;
};
class RefineryINV: RscListbox
{
	idc = 1501;
	x = 0.108065 * safezoneW + safezoneX;
	y = 0.482999 * safezoneH + safezoneY;
	w = 0.191968 * safezoneW;
	h = 0.204009 * safezoneH;
	onLBSelChanged="[] spawn aph_fnc_refinery_RefinerySelChanged";
};
class MineralsPic: RscPicture
{
	idc = 1700;
	text="JournalUI\Images\belt.paa";
	x = 0.372021 * safezoneW + safezoneX;
	y = 0.489997 * safezoneH + safezoneY;
	w = 0.319947 * safezoneW;
	h = 0.255012 * safezoneH;
};
class InputItemPic: RscPicture
{
	idc = 1222;
	text = "";
	x = 0.39102 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0639894 * safezoneW;
	h = 0.0850039 * safezoneH;
};
class OutputItemPic: RscPicture
{
	idc = 1223;
	text = "";
	x = 0.614985 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0639894 * safezoneW;
	h = 0.0850039 * safezoneH;
};
class InventorySlider: RscSlider
{
	idc = 1900;
	x = 0.116061 * safezoneW + safezoneX;
	y = 0.448998 * safezoneH + safezoneY;
	w = 0.175971 * safezoneW;
	h = 0.0170008 * safezoneH;
	onSliderPosChanged = "[] spawn aph_fnc_Refinery_slidervalue;";
};
class PercentText: RscStructuredText
{
	idc = 1101;
	text = "'%'"; //--- ToDo: Localize;
	x = 0.0841472 * safezoneW + safezoneX;
	y = 0.446278 * safezoneH + safezoneY;
	w = 0.0559974 * safezoneW;
	h = 0.0340016 * safezoneH;
	size = 0.028; 
	colorBackground[] = {-1,-1,-1,0};
};
class AddtoQueButton: RscButton
{
	idc = 16133;
	text = "Add to que"; //--- ToDo: Localize;
	x = 0.308032 * safezoneW + safezoneX;
	y = 0.509005 * safezoneH + safezoneY;
	w = 0.0499999 * safezoneW;
	h = 0.0540016 * safezoneH;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 39) * 1)";
	action="[] spawn aph_fnc_refinery_AddtoQue";
};
class QuePic: RscPicture
{
	idc = 1207;
	text = "";
	x = 0.715964 * safezoneW + safezoneX;
	y = 0.465998 * safezoneH + safezoneY;
	w = 0.0719881 * safezoneW;
	h = 0.153007 * safezoneH;
};
class RscPicture_1200: RscPicture
{
	idc = 120000;
	text = "";
	x = 0.388019 * safezoneW + safezoneX;
	y = 0.295991 * safezoneH + safezoneY;
	w = 0.0639894 * safezoneW;
	h = 0.102005 * safezoneH;
};
class RscPicture_1201: RscPicture
{
	idc = 120001;
	text = "";
	x = 0.484003 * safezoneW + safezoneX;
	y = 0.295991 * safezoneH + safezoneY;
	w = 0.0639894 * safezoneW;
	h = 0.102005 * safezoneH;
};
class RscPicture_1203: RscPicture
{
	idc = 120002;
	text = "";
	x = 0.571988 * safezoneW + safezoneX;
	y = 0.295991 * safezoneH + safezoneY;
	w = 0.0639894 * safezoneW;
	h = 0.102005 * safezoneH;
};
class RscPicture_1204: RscPicture
{
	idc = 120003;
	text = "";
	x = 0.667972 * safezoneW + safezoneX;
	y = 0.295991 * safezoneH + safezoneY;
	w = 0.0639894 * safezoneW;
	h = 0.102005 * safezoneH;
};
		class ProgressBar_1: RscRefineryProgress
		{
			idc = 1600;
			text = "";
			x = 0.388019 * safezoneW + safezoneX;
			y = 0.295991 * safezoneH + safezoneY;
			w = 0.0639894 * safezoneW;
			h = 0.102005 * safezoneH;
		};
		class ProgressBar_2: RscRefineryProgress
		{
			idc = 1601;
			text = "";
			x = 0.484003 * safezoneW + safezoneX;
			y = 0.295991 * safezoneH + safezoneY;
			w = 0.0639894 * safezoneW;
			h = 0.102005 * safezoneH;
		};
		class ProgressBar_3: RscRefineryProgress
		{
			idc = 1602;
			text = "";
			x = 0.571988 * safezoneW + safezoneX;
			y = 0.295991 * safezoneH + safezoneY;
			w = 0.0639894 * safezoneW;
			h = 0.102005 * safezoneH;
		};
		class ProgressBar_4: RscRefineryProgress
		{
			idc = 1603;
			text = "";
			x = 0.667972 * safezoneW + safezoneX;
			y = 0.295991 * safezoneH + safezoneY;
			w = 0.0639894 * safezoneW;
			h = 0.102005 * safezoneH;
		};
			class QueText_1: RscStructuredText
			{
				idc = 1800;
				text = "";
				x = 0.388019 * safezoneW + safezoneX;
				y = 0.307991 * safezoneH + safezoneY;
				w = 0.0639894 * safezoneW;
				h = 0.142005 * safezoneH;
				colorBackground[] = {-1,-1,-1,0};
			};
			class QueText_2: RscStructuredText
			{
				idc = 1801;
				text = "";
				x = 0.484003 * safezoneW + safezoneX;
				y = 0.307991 * safezoneH + safezoneY;
				w = 0.0639894 * safezoneW;
				h = 0.142005 * safezoneH;
				colorBackground[] = {-1,-1,-1,0};
			};
			class QueText_3: RscStructuredText
			{
				idc = 1802;
				text = "";
				x = 0.571988 * safezoneW + safezoneX;
				y = 0.307991 * safezoneH + safezoneY;
				w = 0.0639894 * safezoneW;
				h = 0.142005 * safezoneH;
				colorBackground[] = {-1,-1,-1,0};
			};
			class QueText_4: RscStructuredText
			{
				idc = 1803;
				text = "";
				x = 0.667972 * safezoneW + safezoneX;
				y = 0.307991 * safezoneH + safezoneY;
				w = 0.0639894 * safezoneW;
				h = 0.142005 * safezoneH;
				colorBackground[] = {-1,-1,-1,0};
			};
				class ReturnButton_0: HiddenButton
				{
					idc = 120000;
					text = "";
					x = 0.388019 * safezoneW + safezoneX;
					y = 0.295991 * safezoneH + safezoneY;
					w = 0.0639894 * safezoneW;
					h = 0.102005 * safezoneH;
					action="[0] spawn aph_fnc_refinery_ReturnFromQue";
				};
				class ReturnButton_1: HiddenButton
				{
					idc = 120001;
					text = "";
					x = 0.484003 * safezoneW + safezoneX;
					y = 0.295991 * safezoneH + safezoneY;
					w = 0.0639894 * safezoneW;
					h = 0.102005 * safezoneH;
					action="[1] spawn aph_fnc_refinery_ReturnFromQue";
				};
				class ReturnButton_2: HiddenButton
				{
					idc = 120002;
					text = "";
					x = 0.571988 * safezoneW + safezoneX;
					y = 0.295991 * safezoneH + safezoneY;
					w = 0.0639894 * safezoneW;
					h = 0.102005 * safezoneH;
					action="[2] spawn aph_fnc_refinery_ReturnFromQue";
				};
				class ReturnButton_3: HiddenButton
				{
					idc = 120003;
					text = "";
					x = 0.667972 * safezoneW + safezoneX;
					y = 0.295991 * safezoneH + safezoneY;
					w = 0.0639894 * safezoneW;
					h = 0.102005 * safezoneH;
					action="[3] spawn aph_fnc_refinery_ReturnFromQue";
				};
			
class SliderAmount: RscStructuredText
{
	idc = 1100;
	x = 0.0593947 * safezoneW + safezoneX;
	y = 0.447376 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
	size = 0.028; 
};
class PutButton: RscButton
{
	idc = 1600;
	text = "Put"; //--- ToDo: Localize;
	x = 0.0600728 * safezoneW + safezoneX;
	y = 0.397995 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0340016 * safezoneH;
	action="[] spawn aph_fnc_PutButton";
};
class TakeButton: RscButton
{
	idc = 1601;
	text = "Take"; //--- ToDo: Localize;
	x = 0.0600728 * safezoneW + safezoneX;
	y = 0.482999 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0340016 * safezoneH;
	action="[] spawn aph_fnc_TakeButton";
};
class OnOffSwitch: RscPicture
{
	idc = 12505;
	text = "JournalUI\Images\OffSwitch.paa";
	x = 0.811948 * safezoneW + safezoneX;
	y = 0.568003 * safezoneH + safezoneY;
	w = 0.0639894 * safezoneW;
	h = 0.119005 * safezoneH;
};
	class OnOffSwitchButton: HiddenButton
	{
		idc = 12055;
		text = "";
		x = 0.811948 * safezoneW + safezoneX;
		y = 0.568003 * safezoneH + safezoneY;
		w = 0.0639894 * safezoneW;
		h = 0.119005 * safezoneH;
		action="[] spawn aph_fnc_Refinery_OnOffSwitch";
	};
class OnOffLight: RscPicture
{
	idc = 1206;
	text = "JournalUI\Images\OffLightRefinery.paa";
	x = 0.801955 * safezoneW + safezoneX;
	y = 0.451997 * safezoneH + safezoneY;
	w = 0.0799868 * safezoneW;
	h = 0.136006 * safezoneH;
};
};
};



//Introduction Screens
class IntroScreenSelect
{
   idd = 2113;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['IntroScreenSelect', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
class frame: RscFrame
{
	idc = 1800;
	x = 0.31603 * safezoneW + safezoneX;
	y = 0.108982 * safezoneH + safezoneY;
	w = 0.391935 * safezoneW;
	h = 0.510023 * safezoneH;
	colorBackground[] = {1,1,1,0.3};
};
class RscEdit_1400: RscEdit
{
	idc = 1400;
	x = 0.428012 * safezoneW + safezoneX;
	y = 0.517001 * safezoneH + safezoneY;
	w = 0.18397 * safezoneW;
	h = 0.0510023 * safezoneH;
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	text = "Name:"; //--- ToDo: Localize;
	x = 0.38002 * safezoneW + safezoneX;
	y = 0.517001 * safezoneH + safezoneY;
	w = 0.0639894 * safezoneW;
	h = 0.0510023 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
};
class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "#(argb,256,256,1)r2t(camrenderScreen,1.0)";
	x = 0.515997 * safezoneW + safezoneX;
	y = 0.125983 * safezoneH + safezoneY;
	w = 0.18397 * safezoneW;
	h = 0.272013 * safezoneH;
	
};
class RscStructuredText_1101: RscStructuredText
{
	idc = 1101;
	x = 0.324029 * safezoneW + safezoneX;
	y = 0.142984 * safezoneH + safezoneY;
	w = 0.175971 * safezoneW;
	h = 0.0850039 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
};
class RscStructuredText_1102: RscStructuredText
{
	idc = 1102;
	x = 0.324029 * safezoneW + safezoneX;
	y = 0.329992 * safezoneH + safezoneY;
	w = 0.175971 * safezoneW;
	h = 0.0850039 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
};
class RscCombo_2100: RscCombo
{
	idc = 2100;
	x = 0.324029 * safezoneW + safezoneX;
	y = 0.227987 * safezoneH + safezoneY;
	w = 0.175971 * safezoneW;
	h = 0.0340016 * safezoneH;
	onLBSelChanged="[] call aph_fnc_Introcombochanged";
};
class RscCombo_2101: RscCombo
{
	idc = 2101;
	x = 0.324029 * safezoneW + safezoneX;
	y = 0.414996 * safezoneH + safezoneY;
	w = 0.355971 * safezoneW;
	h = 0.0340016 * safezoneH;
	onLBSelChanged="[] call aph_fnc_StoryArchChanged";
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Begin"; //--- ToDo: Localize;
	x = 0.61998 * safezoneW + safezoneX;
	y = 0.517001 * safezoneH + safezoneY;
	w = 0.0639894 * safezoneW;
	h = 0.0510023 * safezoneH;
	action="[] spawn aph_fnc_StartSpawn;";
};
class exitbutton: RscButton
{
	idc = 1601;
	text = "Exit Game"; //--- ToDo: Localize;
	x = 0.324029 * safezoneW + safezoneX;
	y = 0.568003 * safezoneH + safezoneY;
	w = 0.0959841 * safezoneW;
	h = 0.0340016 * safezoneH;
	action= " closedialog 0; player setvariable ['PasswordNeeded',false];'LOSER' call BIS_fnc_endMission;";
};
	
};
};
class IntroScreen
{
   idd = 2113;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['IntroScreen', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
class Fullbackground: RscPicture
{
	idc = 1800;
	text = "#(argb,1,1,1)color(0,0,0,1)";
	x = 0.00008206 * safezoneW + safezoneX;
	y = -0.0610258 * safezoneH + safezoneY;
	w = 1.16382 * safezoneW;
	h = 1.12205 * safezoneH;
};
class LargePicture: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(0,0,0,1)";
	x = 0.172054 * safezoneW + safezoneX;
	y = 0.0239781 * safezoneH + safezoneY;
	w = 0.66389 * safezoneW;
	h = 0.680031 * safezoneH;
};
class Textbox: RscStructuredText
{
	idc = 1100;
	x = 0.172054 * safezoneW + safezoneX;
	y = 0.72101 * safezoneH + safezoneY;
	w = 0.66389 * safezoneW;
	h = 0.289013 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
};
class Nextbutton: RscButton
{
	idc = 1601;
	text = "Next"; //--- ToDo: Localize;
	x = 0.891935 * safezoneW + safezoneX;
	y = 0.806014 * safezoneH + safezoneY;
	w = 0.0479921 * safezoneW;
	h = 0.0340016 * safezoneH;
	action="[] spawn aph_NextButton";
};
};
};
class IntroScreenNoNext
{
   idd = 2113;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['IntroScreenNoNext', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
class Fullbackground: RscPicture
{
	idc = 1800;
	text = "#(argb,1,1,1)color(0,0,0,1)";
	x = 0.00008206 * safezoneW + safezoneX;
	y = -0.0610258 * safezoneH + safezoneY;
	w = 1.16382 * safezoneW;
	h = 1.12205 * safezoneH;
};
class LargePicture: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(0,0,0,1)";
	x = 0.172054 * safezoneW + safezoneX;
	y = 0.0239781 * safezoneH + safezoneY;
	w = 0.66389 * safezoneW;
	h = 0.680031 * safezoneH;
};
class Textbox: RscStructuredText
{
	idc = 1100;
	x = 0.172054 * safezoneW + safezoneX;
	y = 0.72101 * safezoneH + safezoneY;
	w = 0.66389 * safezoneW;
	h = 0.289013 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
};
class BeginButton: RscButton
{
	idc = 1600;
	text = "Begin!"; //--- ToDo: Localize;
	x = 0.867939 * safezoneW + safezoneX;
	y = 0.789013 * safezoneH + safezoneY;
	w = 0.103983 * safezoneW;
	h = 0.0850039 * safezoneH;
	action="[] spawn aph_IntroButton";
};
};
};



//Notebook UI
class PlayerUINotebook
{
   idd = 2113;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['PlayerUINotebook', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
	
class button: RscPicture
{
	idc = 1900;
	text = "JournalUI\Images\notebookBackgroundnewTabs.paa";
	x = 0.356024 * safezoneW + safezoneX;
	y = 0.00697734 * safezoneH + safezoneY;
	w = 0.639894 * safezoneW;
	h = 0.86704 * safezoneH;
};
class button1: HiddenButton
{
	idc = 1904;
	text = "Character";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.0919812 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenCharacterPage;";
	
};
class button2: HiddenButton
{
	idc = 1901;
	text = "Crafting";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.193986 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenCraftingPage;";
};
class button3: HiddenButton
{
	idc = 1902;
	text = "Influence";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.295991 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenInfluencePage;";
};
class button4: HiddenButton
{
	idc = 1903;
	text = "Group";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.397995 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenGroupPage;";
};
//LEFTSIDE
class InnerPageLeftList: RscStructuredText
{
	idc = 1100;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.0409789 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.64403 * safezoneH;
	colorBackground[] = { 0, 0, 0, 0 };
};
class LeftbottomButton: HiddenButton
{
	idc = 1905;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.3650089 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	sizeEx = 0.020;
	action = "";
};
class LeftButtonhalf: HiddenButton
{
	idc = 1908;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.5290389 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	sizeEx = 0.020;
	action = "";
};
class textboxtop: RscListbox
{
	idc = 1500;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.0609789 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	colorText[] = {0,0,0,1};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0.6,0.6,0.6,0.3};
	colorSelectBackground2[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.032;
	onLBSelChanged="[] spawn aph_fnc_BuildObjectsUIStart;";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="[] spawn aph_fnc_BuildObjectsUIStart;";//--- action/function to call when listbox or combobox has been double clicked
};
class textboxbottom: RscListbox
{
	idc = 1501;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.2273089 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	colorText[] = {0,0,0,1};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0.6,0.6,0.6,0.3};
	colorSelectBackground2[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.032;
	onLBSelChanged="[] spawn aph_fnc_BuildObjectUISingle";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="[] spawn aph_fnc_BuildObjectsUIEnd;";//--- action/function to call when listbox or combobox has been double clicked
};


//RIGHTSIDE
class InnerPageRightList: RscStructuredText
{
	idc = 1101;
	x = 0.687966 * safezoneW + safezoneX;
	y = 0.0409789 * safezoneH + safezoneY;
	w = 0.25395  * safezoneW;
	h = 0.64403 * safezoneH;
	colorBackground[] = { 0, 0, 0, 0 };
};
class RightLastPageButton: HiddenButton
{
	idc = 1906;
	text = "Last";
	font = "LucidaConsoleB";
	x = 0.687966 * safezoneW + safezoneX;
	y = 0.6400089 * safezoneH + safezoneY;
	w = 0.03395  * safezoneW;
	h = 0.02203 * safezoneH;
	sizeEx = 0.023;
	action = "";
};
class RightNextPageButton: HiddenButton
{
	idc = 1907;
	text = "Next";
	font = "LucidaConsoleB";
	x = 0.901916 * safezoneW + safezoneX;
	y = 0.6400089 * safezoneH + safezoneY;
	w = 0.03395  * safezoneW;
	h = 0.02203 * safezoneH;
	sizeEx = 0.023;
	action = "";
};

};
};
class PlayerUINotebookCharacter
{
   idd = 2113;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['PlayerUINotebookCharacter', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
	
class button: RscPicture
{
	idc = 1900;
	text = "JournalUI\Images\notebookBackgroundnewTabs.paa";
	x = 0.356024 * safezoneW + safezoneX;
	y = 0.00697734 * safezoneH + safezoneY;
	w = 0.639894 * safezoneW;
	h = 0.86704 * safezoneH;
};
class button1: HiddenButton
{
	idc = 1904;
	text = "Character";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.0919812 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenCharacterPage;";
	
};
class button2: HiddenButton
{
	idc = 1901;
	text = "Crafting";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.193986 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenCraftingPage;";
};
class button3: HiddenButton
{
	idc = 1902;
	text = "Influence";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.295991 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenInfluencePage;";
};
class button4: HiddenButton
{
	idc = 1903;
	text = "Group";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.397995 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenGroupPage;";
};

//LEFTSIDE
class InnerPageLeftList: RscStructuredText
{
	idc = 1100;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.0409789 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.64403 * safezoneH;
	colorBackground[] = { 0, 0, 0, 0 };
};
class textboxtop: RscListbox
{
	idc = 1500;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.0609789 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	colorText[] = {0,0,0,1};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0.6,0.6,0.6,0.3};
	colorSelectBackground2[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.032;
	onLBSelChanged="[] spawn aph_fnc_CharacterPageList";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="[] spawn aph_fnc_CharacterPageList;";//--- action/function to call when listbox or combobox has been double clicked
};
class textboxbottom: RscListbox
{
	idc = 1501;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.2273089 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	colorText[] = {0,0,0,1};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0.6,0.6,0.6,0.3};
	colorSelectBackground2[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.032;
	onLBSelChanged="[] spawn aph_fnc_CharacterBottomPage";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="[] spawn aph_fnc_CharacterBottomPage;";//--- action/function to call when listbox or combobox has been double clicked
};


//RIGHTSIDE
class InnerPageRightList: RscStructuredText
{
	idc = 1101;
	x = 0.687966 * safezoneW + safezoneX;
	y = 0.0409789 * safezoneH + safezoneY;
	w = 0.25395  * safezoneW;
	h = 0.64403 * safezoneH;
	colorBackground[] = { 0, 0, 0, 0 };
};
class textboxRighttop: RscListbox
{
	idc = 1700;
	x = 0.687966 * safezoneW + safezoneX;
	y = 0.0609789 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	colorText[] = {0,0,0,1};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0.6,0.6,0.6,0.3};
	colorSelectBackground2[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.032;
	onLBSelChanged="[] spawn aph_fnc_CharacterRightTopList;";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="[] spawn aph_fnc_CharacterRightTopList;";//--- action/function to call when listbox or combobox has been double clicked
};
class textboxRightbottom: RscListbox
{
	idc = 1701;
	x = 0.687966 * safezoneW + safezoneX;
	y = 0.2473089 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	colorText[] = {0,0,0,1};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0.6,0.6,0.6,0.3};
	colorSelectBackground2[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.032;
	onLBSelChanged="";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="[] spawn aph_fnc_CharacterRightBottomList;";//--- action/function to call when listbox or combobox has been double clicked
};
class RightLastPageButton: HiddenButton
{
	idc = 1906;
	text = "Last";
	font = "LucidaConsoleB";
	x = 0.687966 * safezoneW + safezoneX;
	y = 0.6400089 * safezoneH + safezoneY;
	w = 0.03395  * safezoneW;
	h = 0.02203 * safezoneH;
	sizeEx = 0.023;
	action = "";
};
class RightNextPageButton: HiddenButton
{
	idc = 1907;
	text = "Next";
	font = "LucidaConsoleB";
	x = 0.901916 * safezoneW + safezoneX;
	y = 0.6400089 * safezoneH + safezoneY;
	w = 0.03395  * safezoneW;
	h = 0.02203 * safezoneH;
	sizeEx = 0.023;
	action = "";
};

};
};
class PlayerUINotebookCrafting
{
   idd = 2113;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['PlayerUINotebookCrafting', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
	
class button: RscPicture
{
	idc = 1900;
	text = "JournalUI\Images\notebookBackgroundnewTabs.paa";
	x = 0.356024 * safezoneW + safezoneX;
	y = 0.00697734 * safezoneH + safezoneY;
	w = 0.639894 * safezoneW;
	h = 0.86704 * safezoneH;
};
class button1: HiddenButton
{
	idc = 1904;
	text = "Character";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.0919812 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenCharacterPage;";
	
};
class button2: HiddenButton
{
	idc = 1901;
	text = "Crafting";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.193986 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenCraftingPage;";
};
class button3: HiddenButton
{
	idc = 1902;
	text = "Influence";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.295991 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenInfluencePage;";
};
class button4: HiddenButton
{
	idc = 1903;
	text = "Group";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.397995 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenGroupPage;";
};
//LEFTSIDE
class InnerPageLeftList: RscStructuredText
{
	idc = 1100;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.0409789 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.64403 * safezoneH;
	colorBackground[] = { 0, 0, 0, 0 };
};
class LeftbottomButton: HiddenButton
{
	idc = 1905;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.3650089 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	sizeEx = 0.020;
	action = "";
};
class LeftButtonhalf: HiddenButton
{
	idc = 1908;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.5290389 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	sizeEx = 0.020;
	action = "";
};
class textboxtop: RscListbox
{
	idc = 1500;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.0609789 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	colorText[] = {0,0,0,1};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0.6,0.6,0.6,0.3};
	colorSelectBackground2[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.032;
	onLBSelChanged="[] spawn aph_fnc_JournalCraftingTopList;";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="[] spawn aph_fnc_JournalCraftingTopList;";//--- action/function to call when listbox or combobox has been double clicked
};
class textboxbottom: RscListbox
{
	idc = 1501;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.2273089 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	colorText[] = {0,0,0,1};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0.6,0.6,0.6,0.3};
	colorSelectBackground2[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.032;
	onLBSelChanged="";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="[] spawn aph_fnc_JournalCraftingBottomList;";//--- action/function to call when listbox or combobox has been double clicked
};


//RIGHTSIDE
class InnerPageRightList: RscStructuredText
{
	idc = 1101;
	x = 0.687966 * safezoneW + safezoneX;
	y = 0.0409789 * safezoneH + safezoneY;
	w = 0.25395  * safezoneW;
	h = 0.64403 * safezoneH;
	colorBackground[] = { 0, 0, 0, 0 };
};
class RightLastPageButton: HiddenButton
{
	idc = 1906;
	text = "Last";
	font = "LucidaConsoleB";
	x = 0.687966 * safezoneW + safezoneX;
	y = 0.6400089 * safezoneH + safezoneY;
	w = 0.03395  * safezoneW;
	h = 0.02203 * safezoneH;
	sizeEx = 0.023;
	action = "";
};
class RightNextPageButton: HiddenButton
{
	idc = 1907;
	text = "Next";
	font = "LucidaConsoleB";
	x = 0.901916 * safezoneW + safezoneX;
	y = 0.6400089 * safezoneH + safezoneY;
	w = 0.03395  * safezoneW;
	h = 0.02203 * safezoneH;
	sizeEx = 0.023;
	action = "";
};

};
};
class PlayerUINotebookGroup
{
   idd = 2113;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['PlayerUINotebookGroup', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
//BUTTTONS
class button: RscPicture
{
	idc = 1900;
	text = "JournalUI\Images\notebookBackgroundnewTabs.paa";
	x = 0.356024 * safezoneW + safezoneX;
	y = 0.00697734 * safezoneH + safezoneY;
	w = 0.639894 * safezoneW;
	h = 0.86704 * safezoneH;
};
class button1: HiddenButton
{
	idc = 1904;
	text = "Character";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.0919812 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenCharacterPage;";
	
};
class button2: HiddenButton
{
	idc = 1901;
	text = "Crafting";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.193986 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenCraftingPage;";
};
class button3: HiddenButton
{
	idc = 1902;
	text = "Influence";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.295991 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenInfluencePage;";
};
class button4: HiddenButton
{
	idc = 1903;
	text = "Group";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.397995 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenGroupPage;";
};

//LEFTSIDE
class InnerPageLeftList: RscStructuredText
{
	idc = 1100;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.0409789 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.64403 * safezoneH;
	colorBackground[] = { 0, 0, 0, 0 };
};
class LeftbottomButton: HiddenButton
{
	idc = 1905;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.3650089 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	sizeEx = 0.020;
	action = "";
};
class LeftButtonhalf: HiddenButton
{
	idc = 1908;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.5290389 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	sizeEx = 0.020;
	action = "";
};
class textboxtop: RscListbox
{
	idc = 1500;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.0609789 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	colorText[] = {0,0,0,1};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0.6,0.6,0.6,0.3};
	colorSelectBackground2[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.032;
	onLBSelChanged="[] spawn aph_fnc_JournalGroupTopList;";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="[] spawn aph_fnc_JournalGroupTopList;";//--- action/function to call when listbox or combobox has been double clicked
};
class textboxbottom: RscListbox
{
	idc = 1501;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.2473089 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	colorText[] = {0,0,0,1};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0.6,0.6,0.6,0.3};
	colorSelectBackground2[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.032;
	onLBSelChanged="[] spawn aph_fnc_JournalGroupBottomList";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="[] spawn aph_fnc_JournalGroupBottomList;";//--- action/function to call when listbox or combobox has been double clicked
};


//RIGHTSIDE
class InnerPageRightList: RscStructuredText
{
	idc = 1101;
	x = 0.687966 * safezoneW + safezoneX;
	y = 0.0409789 * safezoneH + safezoneY;
	w = 0.25395  * safezoneW;
	h = 0.64403 * safezoneH;
	colorBackground[] = { 0, 0, 0, 0 };
};
class textboxRighttop: RscListbox
{
	idc = 1700;
	x = 0.687966 * safezoneW + safezoneX;
	y = 0.0609789 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	colorText[] = {0,0,0,1};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0.6,0.6,0.6,0.3};
	colorSelectBackground2[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.032;
	onLBSelChanged="[] spawn aph_fnc_JournalGroupRightTopList;";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="[] spawn aph_fnc_JournalGroupRightTopList;";//--- action/function to call when listbox or combobox has been double clicked
};
class textboxRightbottom: RscListbox
{
	idc = 1701;
	x = 0.687966 * safezoneW + safezoneX;
	y = 0.2473089 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	colorText[] = {0,0,0,1};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0.6,0.6,0.6,0.3};
	colorSelectBackground2[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.032;
	onLBSelChanged="";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="[] spawn aph_fnc_JournalGroupRightBottomList;";//--- action/function to call when listbox or combobox has been double clicked
};
class RightLastPageButton: HiddenButton
{
	idc = 1906;
	text = "Last";
	font = "LucidaConsoleB";
	x = 0.687966 * safezoneW + safezoneX;
	y = 0.6400089 * safezoneH + safezoneY;
	w = 0.03395  * safezoneW;
	h = 0.02203 * safezoneH;
	sizeEx = 0.023;
	action = "";
};
class RightNextPageButton: HiddenButton
{
	idc = 1907;
	text = "Next";
	font = "LucidaConsoleB";
	x = 0.901916 * safezoneW + safezoneX;
	y = 0.6400089 * safezoneH + safezoneY;
	w = 0.03395  * safezoneW;
	h = 0.02203 * safezoneH;
	sizeEx = 0.023;
	action = "";
};

};
};
class PlayerUINotebookInfluence
{
   idd = 2113;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['PlayerUINotebookInfluence', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
	
class button: RscPicture
{
	idc = 1900;
	text = "JournalUI\Images\notebookBackgroundnewTabs.paa";
	x = 0.356024 * safezoneW + safezoneX;
	y = 0.00697734 * safezoneH + safezoneY;
	w = 0.639894 * safezoneW;
	h = 0.86704 * safezoneH;
};
class button1: HiddenButton
{
	idc = 1904;
	text = "Character";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.0919812 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenCharacterPage;";
	
};
class button2: HiddenButton
{
	idc = 1901;
	text = "Crafting";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.193986 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenCraftingPage;";
};
class button3: HiddenButton
{
	idc = 1902;
	text = "Influence";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.295991 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenInfluencePage;";
};
class button4: HiddenButton
{
	idc = 1903;
	text = "Group";
	x = 0.939927 * safezoneW + safezoneX;
	y = 0.397995 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0680031 * safezoneH;
	sizeEx = 0.020;
	action = "[] spawn aphU_fnc_OpenGroupPage;";
};
//LEFTSIDE
class InnerPageLeftList: RscStructuredText
{
	idc = 1100;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.0409789 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.64403 * safezoneH;
	colorBackground[] = { 0, 0, 0, 0 };
};
class LeftbottomButton: HiddenButton
{
	idc = 1905;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.3650089 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	sizeEx = 0.020;
	action = "";
};
class LeftButtonhalf: HiddenButton
{
	idc = 1908;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.5290389 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	sizeEx = 0.020;
	action = "";
};
class textboxtop: RscListbox
{
	idc = 1500;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.0609789 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	colorText[] = {0,0,0,1};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0.6,0.6,0.6,0.3};
	colorSelectBackground2[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.032;
	onLBSelChanged="[] spawn aph_fnc_JournalInfluenceTopList;";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="[] spawn aph_fnc_JournalInfluenceBottomList;";//--- action/function to call when listbox or combobox has been double clicked
};
class textboxbottom: RscListbox
{
	idc = 1501;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.2273089 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	colorText[] = {0,0,0,1};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0.6,0.6,0.6,0.3};
	colorSelectBackground2[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.032;
	onLBSelChanged="[] spawn aph_fnc_JournalInfluenceBottomList";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="[] spawn aph_fnc_JournalInfluenceBottomList;";//--- action/function to call when listbox or combobox has been double clicked
};


//RIGHTSIDE
class InnerPageRightList: RscStructuredText
{
	idc = 1101;
	x = 0.687966 * safezoneW + safezoneX;
	y = 0.0409789 * safezoneH + safezoneY;
	w = 0.25395  * safezoneW;
	h = 0.64403 * safezoneH;
	colorBackground[] = { 0, 0, 0, 0 };
};
class textboxRighttop: RscListbox
{
	idc = 1700;
	x = 0.687966 * safezoneW + safezoneX;
	y = 0.0609789 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	colorText[] = {0,0,0,1};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0.6,0.6,0.6,0.3};
	colorSelectBackground2[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.032;
	onLBSelChanged="[] spawn aph_fnc_JournalInfluenceRightTopList;";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="[] spawn aph_fnc_JournalInfluenceRightTopList;";//--- action/function to call when listbox or combobox has been double clicked
};
class textboxRightbottom: RscListbox
{
	idc = 1701;
	x = 0.687966 * safezoneW + safezoneX;
	y = 0.2473089 * safezoneH + safezoneY;
	w = 0.25395 * safezoneW;
	h = 0.16403 * safezoneH;
	colorText[] = {0,0,0,1};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0.6,0.6,0.6,0.3};
	colorSelectBackground2[] = {0,0,0,0};
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.032;
	onLBSelChanged="";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="[] spawn aph_fnc_JournalInfluenceRightBottomList;";//--- action/function to call when listbox or combobox has been double clicked
};
class RightLastPageButton: HiddenButton
{
	idc = 1906;
	text = "Last";
	font = "LucidaConsoleB";
	x = 0.687966 * safezoneW + safezoneX;
	y = 0.6400089 * safezoneH + safezoneY;
	w = 0.03395  * safezoneW;
	h = 0.02203 * safezoneH;
	sizeEx = 0.023;
	action = "";
};
class RightNextPageButton: HiddenButton
{
	idc = 1907;
	text = "Next";
	font = "LucidaConsoleB";
	x = 0.901916 * safezoneW + safezoneX;
	y = 0.6400089 * safezoneH + safezoneY;
	w = 0.03395  * safezoneW;
	h = 0.02203 * safezoneH;
	sizeEx = 0.023;
	action = "";
};


};
};
class SetGuardedLocationUI
{
   idd = 2113;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['SetGuardedLocationUI', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
class RscFrame_1800: RscFrame
{
	idc = 1800;
	x = 0.372021 * safezoneW + safezoneX;
	y = 0.414996 * safezoneH + safezoneY;
	w = 0.223963 * safezoneW;
	h = 0.156006 * safezoneH;
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	x = 0.372021 * safezoneW + safezoneX;
	y = 0.414996 * safezoneH + safezoneY;
	w = 0.215964 * safezoneW;
	h = 0.0680031 * safezoneH;
	text = "This will create a save guard post on your current position. The data will be stored in your journal."; //--- ToDo: Localize;
	colorText[] = {1,1,1,1};
	colorBackground[] = {-1,-1,-1,0};
};
class RscStructuredText_1101: RscStructuredText
{
	idc = 1101;
	x = 0.372021 * safezoneW + safezoneX;
	y = 0.482999 * safezoneH + safezoneY;
	w = 0.199967 * safezoneW;
	h = 0.0510023 * safezoneH;
	text = "Name this guarded position:"; //--- ToDo: Localize;
	colorText[] = {1,1,1,1};
	colorBackground[] = {-1,-1,-1,0};
};
class RscEdit_1400: RscEdit
{
	idc = 1400;
	x = 0.372021 * safezoneW + safezoneX;
	y = 0.517 * safezoneH + safezoneY;
	w = 0.151975 * safezoneW;
	h = 0.0340016 * safezoneH;
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Save"; //--- ToDo: Localize;
	x = 0.539993 * safezoneW + safezoneX;
	y = 0.482999 * safezoneH + safezoneY;
	w = 0.0479921 * safezoneW;
	h = 0.0340016 * safezoneH;
	action="[] spawn aph_dfnc_SetGuardLocation";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Cancel"; //--- ToDo: Localize;
	x = 0.539993 * safezoneW + safezoneX;
	y = 0.517001 * safezoneH + safezoneY;
	w = 0.0479921 * safezoneW;
	h = 0.0340016 * safezoneH;
	action="closedialog 0;createdialog 'PlayerUINotebookCharacter';[] spawn aphU_fnc_OpenCharacterPage;";
};
};
};


//Box UIs
class VehicleBuildTableUIOld
{	
	  idd = 2113;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['VehicleBuildTableUIOld', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
class frame: RscFrame
{
	idc = 1800;
	x = 0.252041 * safezoneW + safezoneX;
	y = 0.244988 * safezoneH + safezoneY;
	w = 0.503917 * safezoneW;
	h = 0.64603 * safezoneH;
};
class listboxbottom: RscListbox
{
	idc = 1500;
	x = 0.268038 * safezoneW + safezoneX;
	y = 0.517001 * safezoneH + safezoneY;
	w = 0.207966 * safezoneW;
	h = 0.340016 * safezoneH;
	onLBSelChanged="call aph_fnc_VehBuildtable_BottomList;";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="call aph_fnc_VehBuildtable_BottomList;";//--- action/function to call when listbox or combobox has been double clicked
};
class listboxtop: RscListbox
{
	idc = 1501;
	x = 0.268038 * safezoneW + safezoneX;
	y = 0.261989 * safezoneH + safezoneY;
	w = 0.207966 * safezoneW;
	h = 0.204009 * safezoneH;
	onLBSelChanged="call aph_fnc_VehBuildtable_topList;";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="call aph_fnc_VehBuildtable_topList;";//--- action/function to call when listbox or combobox has been double clicked
};
class text1: RscStructuredText
{
	idc = 1000;
	x = 0.523996 * safezoneW + safezoneX;
	y = 0.568003 * safezoneH + safezoneY;
	w = 0.199967 * safezoneW;
	h = 0.272013 * safezoneH;
	colorBackground[] =	{0,0,0,0.3};
};
class Previewwindow: RscPicture
{
	idc = 1200;
	text = "";
	x = 0.507999 * safezoneW + safezoneX;
	y = 0.261989 * safezoneH + safezoneY;
	w = 0.223963 * safezoneW;
	h = 0.272013 * safezoneH;
	
};
class button1: RscButton
{
	idc = 1600;
	x = 0.699967 * safezoneW + safezoneX;
	y = 0.823015 * safezoneH + safezoneY;
	w = 0.0639894 * safezoneW;
	h = 0.0510023 * safezoneH;
	action= "[] call aph_fnc_VehBuildtable_FinalObject";
};
};
};
class BuildTableUINew
{	
	idd = -1;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['BuildTableUINew', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
class RscPicture_1200: RscPicture
{
	idc = 1210;
	text = "JournalUI\Images\tt2.paa";
	x = 0.19605 * safezoneW + safezoneX;
	y = 0.142984 * safezoneH + safezoneY;
	w = 0.503917 * safezoneW;
	h = 0.697032 * safezoneH;
};
class RscListbox_1500: RscListbox
{
	idc = 1501;
	x = 0.236044 * safezoneW + safezoneX;
	y = 0.210987 * safezoneH + safezoneY;
	w = 0.143976 * safezoneW;
	h = 0.187009 * safezoneH;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1)";
	colorBackground[] =	{0,0,0,0};
	onLBSelChanged="call aph_fnc_Buildtable_UIChange;";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="call aph_fnc_Buildtable_UIChange;";//--- action/function to call when listbox or combobox has been double clicked
};
class RscListbox_1501: RscListbox
{
	idc = 1500;
	x = 0.24004 * safezoneW + safezoneX;
	y = 0.431997 * safezoneH + safezoneY;
	w = 0.175978 * safezoneW;
	h = 0.289013 * safezoneH;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1)";
	colorBackground[] =	{0,0,0,0};
	onLBSelChanged="call aph_fnc_Buildtable_UIChangeBottom;";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="call aph_fnc_Buildtable_UIChangeBottom;";//--- action/function to call when listbox or combobox has been double clicked
};
class RscPicture_1201: RscPicture
{
	idc = 1200;
	text = "JournalUI\Images\m5.jpg";
	x = 0.468005 * safezoneW + safezoneX;
	y = 0.176985 * safezoneH + safezoneY;
	w = 0.159974 * safezoneW;
	h = 0.204009 * safezoneH;
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1000;
	x = 0.485007 * safezoneW + safezoneX;
	y = 0.414996 * safezoneH + safezoneY;
	w = 0.159974 * safezoneW;
	h = 0.204009 * safezoneH;
	colorBackground[] =	{0,0,0,0};
};
class RscButton_1600: HiddenButton
{
	idc = 1600;
	x = 0.492001 * safezoneW + safezoneX;
	y = 0.704009 * safezoneH + safezoneY;
	w = 0.191968 * safezoneW;
	h = 0.102005 * safezoneH;
	text="Build";
	action= "[] call aph_fnc_Buildtable_BuildObject";
};
};
};

class VehicleBuildTableUI
{	
	idd = 21131;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['VehicleBuildTableUI', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
class RscPicture_12011: RscPicture
{
	idc = 12122;
	text = "JournalUI\Images\GarageBackground1.paa";
	x = -0.299868 * safezoneW + safezoneX;
	y = -0.996063 * safezoneH + safezoneY;
	w = 1.70372 * safezoneW;
	h = 3.00914 * safezoneH;
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 0.244042 * safezoneW + safezoneX;
	y = 0.568003 * safezoneH + safezoneY;
	w = 0.223963 * safezoneW;
	h = 0.204009 * safezoneH;
	onLBSelChanged="call aph_fnc_VehBuildtable_BottomList;";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="call aph_fnc_VehBuildtable_BottomList;";//--- action/function to call when listbox or combobox has been double clicked
};
class RscListbox_1501: RscListbox
{
	idc = 1501;
	x = 0.244042 * safezoneW + safezoneX;
	y = 0.346993 * safezoneH + safezoneY;
	w = 0.223963 * safezoneW;
	h = 0.204009 * safezoneH;
	onLBSelChanged="call aph_fnc_VehBuildtable_topList;";//--- action/function to call when listbox or combobox has been changed
    onLBDblClick="call aph_fnc_VehBuildtable_topList;";//--- action/function to call when listbox or combobox has been double clicked
};
class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "";
	x = 0.484003 * safezoneW + safezoneX;
	y = 0.568003 * safezoneH + safezoneY;
	w = 0.175971 * safezoneW;
	h = 0.204009 * safezoneH;
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Build"; //--- ToDo: Localize;
	x = 0.691968 * safezoneW + safezoneX;
	y = 0.704009 * safezoneH + safezoneY;
	w = 0.0799868 * safezoneW;
	h = 0.0680031 * safezoneH;
	action= "[] call aph_fnc_VehBuildtable_FinalObject";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Cancel build"; //--- ToDo: Localize;
	x = 0.651975 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0959841 * safezoneW;
	h = 0.0340016 * safezoneH;
	action= "[] call aph_fnc_VehBuildtable_CancelBuild";
};
class BuildProgress: RscProgress
{
	idc = 1800;
	x = 0.651975 * safezoneW + safezoneX;
	y = 0.465998 * safezoneH + safezoneY;
	w = 0.0959841 * safezoneW;
	h = 0.0170008 * safezoneH;
};
class BuildQuePic: RscPicture
{
	idc = 1202;
	text = "Convo\Images\BoxIcon.jpg";
	x = 0.651975 * safezoneW + safezoneX;
	y = 0.312991 * safezoneH + safezoneY;
	w = 0.0959841 * safezoneW;
	h = 0.136006 * safezoneH;
};
class ToBuildDescription: RscStructuredText
{
	idc = 1203;
	text = "Object Description";
	x = 0.484003 * safezoneW + safezoneX;
	y = 0.772012 * safezoneH + safezoneY;
	w = 0.175971 * safezoneW;
	h = 0.102005 * safezoneH;
	colorBackground[] =	{0,0,0,0.1};
};
class BuildQueDescription: RscStructuredText
{
	idc = 1204;
	text = "<br/><br/><br/><br/><br/>      Current object being built";
	x = 0.611981 * safezoneW + safezoneX;
	y = 0.176985 * safezoneH + safezoneY;
	w = 0.175971 * safezoneW;
	h = 0.102005 * safezoneH;
	colorBackground[] =	{0,0,0,0};
};
};
};


//Trader
class MerchantUI
{
   idd = 1;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['MerchantUI', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
class RscFrame_1800: RscFrame
{
	idc = 1800;
	x = 0.292034 * safezoneW + safezoneX;
	y = 0.0749806 * safezoneH + safezoneY;
	w = 0.511915 * safezoneW;
	h = 0.816037 * safezoneH;
};
class RscFrame_1801: RscFrame
{
	idc = 1801;
	x = 0.539993 * safezoneW + safezoneX;
	y = 0.517001 * safezoneH + safezoneY;
	w = 0.151975 * safezoneW;
	h = 0.357016 * safezoneH;
};
class RscFrame_1802: RscFrame
{
	idc = 1802;
	x = 0.539993 * safezoneW + safezoneX;
	y = 0.125983 * safezoneH + safezoneY;
	w = 0.151975 * safezoneW;
	h = 0.357016 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 0.31603 * safezoneW + safezoneX;
	y = 0.517001 * safezoneH + safezoneY;
	w = 0.215964 * safezoneW;
	h = 0.357016 * safezoneH;
	onLBSelChanged="[] spawn aph_TDR_ClickPlayerInventory;";
};
class RscListbox_1501: RscListbox
{
	idc = 1501;
	x = 0.31603 * safezoneW + safezoneX;
	y = 0.125983 * safezoneH + safezoneY;
	w = 0.207966 * safezoneW;
	h = 0.340016 * safezoneH;
	onLBSelChanged="[] spawn aph_TDR_ClickTradersSales;";
};
/*
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Sell Items"; //--- ToDo: Localize;
	x = 0.555991 * safezoneW + safezoneX;
	y = 0.789013 * safezoneH + safezoneY;
	w = 0.111981 * safezoneW;
	h = 0.0680031 * safezoneH;
	action="[] spawn aph_TDR_AcceptSell;";
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Buy Items"; //--- ToDo: Localize;
	x = 0.555991 * safezoneW + safezoneX;
	y = 0.397995 * safezoneH + safezoneY;
	w = 0.111981 * safezoneW;
	h = 0.0680031 * safezoneH;
	action="[] spawn aph_TDR_AcceptBuy;";
};
*/
class AcceptAllButton: RscButton
{
	idc = 16011;
	text = "Accept All"; //--- ToDo: Localize;
	x = 0.715964 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.0799868 * safezoneW;
	h = 0.0510023 * safezoneH;
	action="[] spawn aph_TDR_AcceptFull";
};

class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "";
	x = 0.547992 * safezoneW + safezoneX;
	y = 0.568003 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0680031 * safezoneH;
};
class RscPicture_1201: RscPicture
{
	idc = 1201;
	text = "";
	x = 0.595984 * safezoneW + safezoneX;
	y = 0.568003 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0680031 * safezoneH;
};
class RscPicture_1202: RscPicture
{
	idc = 1202;
	text = "";
	x = 0.643976 * safezoneW + safezoneX;
	y = 0.568003 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0680031 * safezoneH;
};
class RscPicture_1203: RscPicture
{
	idc = 1203;
	text = "";
	x = 0.547992 * safezoneW + safezoneX;
	y = 0.687009 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0680031 * safezoneH;
};
class RscPicture_1204: RscPicture
{
	idc = 1204;
	text = "";
	x = 0.595984 * safezoneW + safezoneX;
	y = 0.687009 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0680031 * safezoneH;
};
class RscPicture_1205: RscPicture
{
	idc = 1205;
	text = "";
	x = 0.643976 * safezoneW + safezoneX;
	y = 0.687009 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0680031 * safezoneH;
};

	class Rscbuttons_1900: HiddenButton
	{
		idc = 1900;
		text = "";
		x = 0.547992 * safezoneW + safezoneX;
		y = 0.568003 * safezoneH + safezoneY;
		w = 0.0399934 * safezoneW;
		h = 0.0680031 * safezoneH;
		action="[0] spawn aph_TDR_MinusButtons;";
	};
	class Rscbuttons_1901: HiddenButton
	{
		idc = 1901;
		text = "";
		x = 0.595984 * safezoneW + safezoneX;
		y = 0.568003 * safezoneH + safezoneY;
		w = 0.0399934 * safezoneW;
		h = 0.0680031 * safezoneH;
		action="[1] spawn aph_TDR_MinusButtons;";
	};
	class Rscbuttons_1902: HiddenButton
	{
		idc = 1902;
		text = "";
		x = 0.643976 * safezoneW + safezoneX;
		y = 0.568003 * safezoneH + safezoneY;
		w = 0.0399934 * safezoneW;
		h = 0.0680031 * safezoneH;
		action="[2] spawn aph_TDR_MinusButtons;";
	};
	class Rscbuttons_1903: HiddenButton
	{
		idc = 1903;
		text = "";
		x = 0.547992 * safezoneW + safezoneX;
		y = 0.687009 * safezoneH + safezoneY;
		w = 0.0399934 * safezoneW;
		h = 0.0680031 * safezoneH;
		action="[3] spawn aph_TDR_MinusButtons;";
	};
	class Rscbuttons_1904: HiddenButton
	{
		idc = 1904;
		text = "";
		x = 0.595984 * safezoneW + safezoneX;
		y = 0.687009 * safezoneH + safezoneY;
		w = 0.0399934 * safezoneW;
		h = 0.0680031 * safezoneH;
		action="[4] spawn aph_TDR_MinusButtons;";
	};
	class Rscbuttons_1905: HiddenButton
	{
		idc = 1905;
		text = "";
		x = 0.643976 * safezoneW + safezoneX;
		y = 0.687009 * safezoneH + safezoneY;
		w = 0.0399934 * safezoneW;
		h = 0.0680031 * safezoneH;
		action="[5] spawn aph_TDR_MinusButtons;";
	};
		
		class Rscbuttons_2200: RscFrame
		{
			idc = 1900;
			text = "";
			x = 0.547992 * safezoneW + safezoneX;
			y = 0.568003 * safezoneH + safezoneY;
			w = 0.0399934 * safezoneW;
			h = 0.0680031 * safezoneH;
		};
		class Rscbuttons_2201: RscFrame
		{
			idc = 1901;
			text = "";
			x = 0.595984 * safezoneW + safezoneX;
			y = 0.568003 * safezoneH + safezoneY;
			w = 0.0399934 * safezoneW;
			h = 0.0680031 * safezoneH;
		};
		class Rscbuttons_2202: RscFrame
		{
			idc = 1902;
			text = "";
			x = 0.643976 * safezoneW + safezoneX;
			y = 0.568003 * safezoneH + safezoneY;
			w = 0.0399934 * safezoneW;
			h = 0.0680031 * safezoneH;
		};
		class Rscbuttons_2203: RscFrame
		{
			idc = 1903;
			text = "";
			x = 0.547992 * safezoneW + safezoneX;
			y = 0.687009 * safezoneH + safezoneY;
			w = 0.0399934 * safezoneW;
			h = 0.0680031 * safezoneH;
		};
		class Rscbuttons_2204: RscFrame
		{
			idc = 1904;
			text = "";
			x = 0.595984 * safezoneW + safezoneX;
			y = 0.687009 * safezoneH + safezoneY;
			w = 0.0399934 * safezoneW;
			h = 0.0680031 * safezoneH;
		};
		class Rscbuttons_2205: RscFrame
		{
			idc = 1905;
			text = "";
			x = 0.643976 * safezoneW + safezoneX;
			y = 0.687009 * safezoneH + safezoneY;
			w = 0.0399934 * safezoneW;
			h = 0.0680031 * safezoneH;
		};

class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	x = 0.547992 * safezoneW + safezoneX;
	y = 0.534002 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class RscStructuredText_1101: RscStructuredText
{
	idc = 1101;
	x = 0.595984 * safezoneW + safezoneX;
	y = 0.534002 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class RscStructuredText_1102: RscStructuredText
{
	idc = 1102;
	x = 0.643976 * safezoneW + safezoneX;
	y = 0.534002 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class RscStructuredText_1103: RscStructuredText
{
	idc = 1103;
	x = 0.547992 * safezoneW + safezoneX;
	y = 0.653007 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class RscStructuredText_1104: RscStructuredText
{
	idc = 1104;
	x = 0.595984 * safezoneW + safezoneX;
	y = 0.653007 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class RscStructuredText_1105: RscStructuredText
{
	idc = 1105;
	x = 0.643976 * safezoneW + safezoneX;
	y = 0.653007 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {0,0,0,0};
};


class RscPicture_1206: RscPicture
{
	idc = 1206;
	text = "";
	x = 0.547992 * safezoneW + safezoneX;
	y = 0.176985 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0680031 * safezoneH;
};
class RscPicture_1207: RscPicture
{
	idc = 1207;
	text = "";
	x = 0.595984 * safezoneW + safezoneX;
	y = 0.176985 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0680031 * safezoneH;
};
class RscPicture_1208: RscPicture
{
	idc = 1208;
	text = "";
	x = 0.643976 * safezoneW + safezoneX;
	y = 0.176985 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0680031 * safezoneH;
};
class RscPicture_1209: RscPicture
{
	idc = 1209;
	text = "";
	x = 0.547992 * safezoneW + safezoneX;
	y = 0.295991 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0680031 * safezoneH;
};
class RscPicture_1210: RscPicture
{
	idc = 1210;
	text = "";
	x = 0.595984 * safezoneW + safezoneX;
	y = 0.295991 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0680031 * safezoneH;
};
class RscPicture_1211: RscPicture
{
	idc = 1211;
	text = "";
	x = 0.643976 * safezoneW + safezoneX;
	y = 0.295991 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0680031 * safezoneH;
};

	class RscPicture_1606: HiddenButton
	{
		idc = 1606;
		x = 0.547992 * safezoneW + safezoneX;
		y = 0.176985 * safezoneH + safezoneY;
		w = 0.0399934 * safezoneW;
		h = 0.0680031 * safezoneH;
		action="[0] spawn aph_TDR_MinusButtonsTrader";
	};
	class RscPicture_1607: HiddenButton
	{
		idc = 1607;
		x = 0.595984 * safezoneW + safezoneX;
		y = 0.176985 * safezoneH + safezoneY;
		w = 0.0399934 * safezoneW;
		h = 0.0680031 * safezoneH;
		action="[1] spawn aph_TDR_MinusButtonsTrader";
	};
	class RscPicture_1608: HiddenButton
	{
		idc = 1608;
		x = 0.643976 * safezoneW + safezoneX;
		y = 0.176985 * safezoneH + safezoneY;
		w = 0.0399934 * safezoneW;
		h = 0.0680031 * safezoneH;
		action="[2] spawn aph_TDR_MinusButtonsTrader";
	};
	class RscPicture_1609: HiddenButton
	{
		idc = 1609;
		x = 0.547992 * safezoneW + safezoneX;
		y = 0.295991 * safezoneH + safezoneY;
		w = 0.0399934 * safezoneW;
		h = 0.0680031 * safezoneH;
		action="[3] spawn aph_TDR_MinusButtonsTrader";
	};
	class RscPicture_1610: HiddenButton
	{
		idc = 1610;
		x = 0.595984 * safezoneW + safezoneX;
		y = 0.295991 * safezoneH + safezoneY;
		w = 0.0399934 * safezoneW;
		h = 0.0680031 * safezoneH;
		action="[4] spawn aph_TDR_MinusButtonsTrader";
	};
	class RscPicture_1611: HiddenButton
	{
		idc = 1611;
		x = 0.643976 * safezoneW + safezoneX;
		y = 0.295991 * safezoneH + safezoneY;
		w = 0.0399934 * safezoneW;
		h = 0.0680031 * safezoneH;
		action="[5] spawn aph_TDR_MinusButtonsTrader";
	};

		class RscPicture_12206: RscFrame
		{
			idc = 1606;
			x = 0.547992 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.0399934 * safezoneW;
			h = 0.0680031 * safezoneH;
		};
		class RscPicture_12207: RscFrame
		{
			idc = 1607;
			x = 0.595984 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.0399934 * safezoneW;
			h = 0.0680031 * safezoneH;
		};
		class RscPicture_12208: RscFrame
		{
			idc = 1608;
			x = 0.643976 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.0399934 * safezoneW;
			h = 0.0680031 * safezoneH;
		};
		class RscPicture_12209: RscFrame
		{
			idc = 1609;
			x = 0.547992 * safezoneW + safezoneX;
			y = 0.295991 * safezoneH + safezoneY;
			w = 0.0399934 * safezoneW;
			h = 0.0680031 * safezoneH;
		};
		class RscPicture_12210: RscFrame
		{
			idc = 1610;
			x = 0.595984 * safezoneW + safezoneX;
			y = 0.295991 * safezoneH + safezoneY;
			w = 0.0399934 * safezoneW;
			h = 0.0680031 * safezoneH;
		};
		class RscPicture_12211: RscFrame
		{
		idc = 1611;
		x = 0.643976 * safezoneW + safezoneX;
		y = 0.295991 * safezoneH + safezoneY;
		w = 0.0399934 * safezoneW;
		h = 0.0680031 * safezoneH;
		};
		
		/*
		class RscPicture_12212: RscFrame
		{
			idc = 1612;
			x = 0.547992 * safezoneW + safezoneX;
			y = 0.403886 * safezoneH + safezoneY;
			w = 0.0399934 * safezoneW;
			h = 0.0680031 * safezoneH;
		};
		class RscPicture_12213: RscFrame
		{
			idc = 1613;
			x = 0.595984 * safezoneW + safezoneX;
			y = 0.403886 * safezoneH + safezoneY;
			w = 0.0399934 * safezoneW;
			h = 0.0680031 * safezoneH;
		};
		class RscPicture_12214: RscFrame
		{
		idc = 1614;
		x = 0.643976 * safezoneW + safezoneX;
		y = 0.403886 * safezoneH + safezoneY;
		w = 0.0399934 * safezoneW;
		h = 0.0680031 * safezoneH;
		};
		*/
	
	
		
	
class RscStructuredText_1106: RscStructuredText
{
	idc = 1106;
	x = 0.547992 * safezoneW + safezoneX;
	y = 0.142984 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class RscStructuredText_1107: RscStructuredText
{
	idc = 1107;
	x = 0.595984 * safezoneW + safezoneX;
	y = 0.142984 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class RscStructuredText_1108: RscStructuredText
{
	idc = 1108;
	x = 0.643976 * safezoneW + safezoneX;
	y = 0.142984 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class RscStructuredText_1109: RscStructuredText
{
	idc = 1109;
	x = 0.547992 * safezoneW + safezoneX;
	y = 0.261989 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class RscStructuredText_1110: RscStructuredText
{
	idc = 1110;
	x = 0.595984 * safezoneW + safezoneX;
	y = 0.261989 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class RscStructuredText_1111: RscStructuredText
{
	idc = 1111;
	x = 0.643976 * safezoneW + safezoneX;
	y = 0.261989 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {0,0,0,0};
};

class RscStructuredText_1112: RscStructuredText
{
	idc = 1112;
	text = "Cost: "; //--- ToDo: Localize;
	x = 0.699967 * safezoneW + safezoneX;
	y = 0.329992 * safezoneH + safezoneY;
	w = 0.0959841 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class RscStructuredText_1113: RscStructuredText
{
	idc =  1113;
	text = "Return: "; //--- ToDo: Localize;
	x = 0.699967 * safezoneW + safezoneX;
	y = 0.704009 * safezoneH + safezoneY;
	w = 0.0959841 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class RscStructuredText_1114: RscStructuredText
{
	idc = 1114;
	text = "Player Inventory"; //--- ToDo: Localize;
	x = 0.31603 * safezoneW + safezoneX;
	y = 0.482999 * safezoneH + safezoneY;
	w = 0.215964 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class RscStructuredText_1115: RscStructuredText
{
	idc = 1115;
	text = "Merchant Inventory"; //--- ToDo: Localize;
	x = 0.31603 * safezoneW + safezoneX;
	y = 0.0919812 * safezoneH + safezoneY;
	w = 0.215964 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
class TotalText: RscStructuredText
{
	idc = 1233;
	x = 0.699967 * safezoneW + safezoneX;
	y = 0.448998 * safezoneH + safezoneY;
	w = 0.0949854 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorBackground[] = {0,0,0,0};
};
};
};

class AuctionHouseConfirmBuy
{
   idd = 2113;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['AuctionHouseConfirmBuy', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
class RscFrame_1800: RscFrame
{
	idc = 1800;
	x = 0.356024 * safezoneW + safezoneX;
	y = 0.27899 * safezoneH + safezoneY;
	w = 0.287952 * safezoneW;
	h = 0.272013 * safezoneH;
};
class RscButton_1600: RscButton
{
	text="Yes";
	idc = 1600;
	x = 0.412015 * safezoneW + safezoneX;
	y = 0.465998 * safezoneH + safezoneY;
	w = 0.0639894 * safezoneW;
	h = 0.0510023 * safezoneH;
	action="[]call aph_Dfnc_AHBuyYes;";
};
class RscButton_1601: RscButton
{
	text="No";
	idc = 1601;
	x = 0.531995 * safezoneW + safezoneX;
	y = 0.465998 * safezoneH + safezoneY;
	w = 0.0639894 * safezoneW;
	h = 0.0510023 * safezoneH;
	action="[]call aph_Dfnc_AHBuyNo;";
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	x = 0.364022 * safezoneW + safezoneX;
	y = 0.295991 * safezoneH + safezoneY;
	w = 0.271955 * safezoneW;
	h = 0.153007 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = { 0, 0, 0, 0.4 }; 
};
};
};

class AuctionHouseSell
{
   idd = 2113;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['AuctionHouseSell', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
class frame: RscFrame
{
	idc = 1800;
	x = 0.180053 * safezoneW + safezoneX;
	y = 0.0749805 * safezoneH + safezoneY;
	w = 0.639894 * safezoneW;
	h = 0.901041 * safezoneH;
};
class BuyOrderComboBox: RscCombo
{
	idc = 2100;
	x = 0.188052 * safezoneW + safezoneX;
	y = 0.0919812 * safezoneH + safezoneY;
	w = 0.167972 * safezoneW;
	h = 0.0340016 * safezoneH;
	onLBSelChanged ="[_this] call aph_Dfnc_RefreshAHcomboBuy;";
};
class SellAvailableComboBox: RscCombo
{
	idc = 2101;
	x = 0.188052 * safezoneW + safezoneX;
	y = 0.534002 * safezoneH + safezoneY;
	w = 0.167972 * safezoneW;
	h = 0.0340016 * safezoneH;
	onLBSelChanged ="[_this] call aph_Dfnc_RefreshAHcomboSellLeft;";
};
class SellWantingComboBox: RscCombo
{
	idc = 2102;
	x = 0.635978 * safezoneW + safezoneX;
	y = 0.534002 * safezoneH + safezoneY;
	w = 0.167972 * safezoneW;
	h = 0.0340016 * safezoneH;
	
};
class BuyOrderListbox: RscListbox
{
	idc = 1500;
	x = 0.188052 * safezoneW + safezoneX;
	y = 0.210987 * safezoneH + safezoneY;
	w = 0.615898 * safezoneW;
	h = 0.272013 * safezoneH;
};
class SellAvailableListBox: RscListbox
{
	idc = 1501;
	x = 0.188052 * safezoneW + safezoneX;
	y = 0.687009 * safezoneH + safezoneY;
	w = 0.295951 * safezoneW;
	h = 0.272013 * safezoneH;
	onLBSelChanged="[] call aph_Dfnc_SellPlayerInvLB";
};
class SellWantingListbox: RscListbox
{
	idc = 1502;
	x = 0.5 * safezoneW + safezoneX;
	y = 0.687009 * safezoneH + safezoneY;
	w = 0.295951 * safezoneW;
	h = 0.272013 * safezoneH;
	onLBSelChanged="[] call aph_Dfnc_SellWantedItemsLB";
};
class BuyButton: RscButton
{
	idc = 1600;
	text = "Buy"; 
	x = 0.132061 * safezoneW + safezoneX;
	y = 0.108982 * safezoneH + safezoneY;
	w = 0.0479921 * safezoneW;
	h = 0.0340016 * safezoneH;
	action="closedialog 0; null=[]execVM ""Database\AuctionHouseBuy.sqf"" ";
};
class SellButton: RscButton
{
	idc = 1601;
	text = "Sell"; 
	x = 0.132061 * safezoneW + safezoneX;
	y = 0.159984 * safezoneH + safezoneY;
	w = 0.0479921 * safezoneW;
	h = 0.0340016 * safezoneH;
	action="closedialog 0; null=[]execVM ""Database\AuctionHouseSell.sqf"" ";
};
class MyAuctButton: RscButton
{
	idc = 1601;
	text = "Mine"; 
	x = 0.132061 * safezoneW + safezoneX;
	y = 0.209984 * safezoneH + safezoneY;
	w = 0.0479921 * safezoneW;
	h = 0.0340016 * safezoneH;
	action="closedialog 0; null=[]execVM ""Database\AuctionHouseCheckAH.sqf"" ";
};
class SellAvailablePicture: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.404016 * safezoneW + safezoneX;
	y = 0.568003 * safezoneH + safezoneY;
	w = 0.0799868 * safezoneW;
	h = 0.119005 * safezoneH;
};
class SellWantingPicture: RscPicture
{
	idc = 1201;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.5 * safezoneW + safezoneX;
	y = 0.568003 * safezoneH + safezoneY;
	w = 0.0799868 * safezoneW;
	h = 0.119005 * safezoneH;
};
class SellAvailableEditBox: RscEdit
{
	idc = 1400;
	x = 0.348025 * safezoneW + safezoneX;
	y = 0.602005 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0340016 * safezoneH;
};
class SellWantEditBox: RscEdit
{
	idc = 1401;
	x = 0.603983 * safezoneW + safezoneX;
	y = 0.602005 * safezoneH + safezoneY;
	w = 0.0399934 * safezoneW;
	h = 0.0340016 * safezoneH;
};
class SellAvailableSlider: RscSlider
{
	idc = 1900;
	x = 0.340026 * safezoneW + safezoneX;
	y = 0.653007 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0170008 * safezoneH;
};
class SellWantingSlider: RscSlider
{
	idc = 1901;
	x = 0.595984 * safezoneW + safezoneX;
	y = 0.653007 * safezoneH + safezoneY;
	w = 0.0559907 * safezoneW;
	h = 0.0170008 * safezoneH;
};
class BuyOrderStructuredText: RscStructuredText
{
	idc = 1100;
	x = 0.188052 * safezoneW + safezoneX;
	y = 0.125983 * safezoneH + safezoneY;
	w = 0.615898 * safezoneW;
	h = 0.0850039 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
};
class SellAvailableStructuredText: RscStructuredText
{
	idc = 1101;
	x = 0.188052 * safezoneW + safezoneX;
	y = 0.585004 * safezoneH + safezoneY;
	w = 0.143976 * safezoneW;
	h = 0.102005 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
};
class SellingWantStructuredText: RscStructuredText
{
	idc = 1102;
	x = 0.659974 * safezoneW + safezoneX;
	y = 0.585004 * safezoneH + safezoneY;
	w = 0.135978 * safezoneW;
	h = 0.102005 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
};
class SellSummaryStructuredText: RscStructuredText
{
	idc = 1103;
	x = 0.364022 * safezoneW + safezoneX;
	y = 0.482999 * safezoneH + safezoneY;
	w = 0.263956 * safezoneW;
	h = 0.0850039 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
};
class SetAuctionButton: RscButton
{
	idc = 1600;
	text = "Set Auction"; //--- ToDo: Localize;
	x = 0.436011 * safezoneW + safezoneX;
	y = 0.908019 * safezoneH + safezoneY;
	w = 0.103983 * safezoneW;
	h = 0.0850039 * safezoneH;
	action="[] call aph_Dfnc_AHSetAuction;";
};

class RscButton_1600: HiddenButton
{
	idc = 1600;
	x = 0.212048 * safezoneW + safezoneX;
	y = 0.142984 * safezoneH + safezoneY;
	w = 0.0799868 * safezoneW;
	h = 0.0510023 * safezoneH;
	action="[] spawn aph_Dfnc_SortByBuying";
};
class RscButton_1601: HiddenButton
{
	idc = 1601;
	x = 0.420013 * safezoneW + safezoneX;
	y = 0.142984 * safezoneH + safezoneY;
	w = 0.0799868 * safezoneW;
	h = 0.0510023 * safezoneH;
	action="[] spawn aph_Dfnc_SortBySelling";
};
};
};

class AuctionHouseBuy
{
   idd = 2113;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['AuctionHouseBuy', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
class frame: RscFrame
{
	idc = 1800;
	x = 0.180053 * safezoneW + safezoneX;
	y = 0.0749805 * safezoneH + safezoneY;
	w = 0.639894 * safezoneW;
	h = 0.421041 * safezoneH;
};
class BuyOrderComboBox: RscCombo
{
	idc = 2100;
	x = 0.188052 * safezoneW + safezoneX;
	y = 0.0919812 * safezoneH + safezoneY;
	w = 0.167972 * safezoneW;
	h = 0.0340016 * safezoneH;
	onLBSelChanged ="[_this] call aph_Dfnc_RefreshAHcomboBuy;";
};
class BuyOrderStructuredText: RscStructuredText
{
	idc = 1100;
	x = 0.188052 * safezoneW + safezoneX;
	y = 0.125983 * safezoneH + safezoneY;
	w = 0.615898 * safezoneW;
	h = 0.0850039 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
};
class BuyOrderListbox: RscListbox
{
	idc = 1500;
	x = 0.188052 * safezoneW + safezoneX;
	y = 0.210987 * safezoneH + safezoneY;
	w = 0.615898 * safezoneW;
	h = 0.272013 * safezoneH;
};
class BuyButton: RscButton
{
	idc = 1600;
	text = "Buy"; 
	x = 0.132061 * safezoneW + safezoneX;
	y = 0.108982 * safezoneH + safezoneY;
	w = 0.0479921 * safezoneW;
	h = 0.0340016 * safezoneH;
	action="closedialog 0; null=[]execVM ""Database\AuctionHouseBuy.sqf"" ";
};
class SellButton: RscButton
{
	idc = 1601;
	text = "Sell"; 
	x = 0.132061 * safezoneW + safezoneX;
	y = 0.159984 * safezoneH + safezoneY;
	w = 0.0479921 * safezoneW;
	h = 0.0340016 * safezoneH;
	action="closedialog 0; null=[]execVM ""Database\AuctionHouseSell.sqf"" ";
};
class MyAuctButton: RscButton
{
	idc = 1601;
	text = "Mine"; 
	x = 0.132061 * safezoneW + safezoneX;
	y = 0.209984 * safezoneH + safezoneY;
	w = 0.0479921 * safezoneW;
	h = 0.0340016 * safezoneH;
	action="closedialog 0; null=[]execVM ""Database\AuctionHouseCheckAH.sqf"" ";
};
class AcceptButton: RscButton
{
	idc = 1603;
	text = "Accept"; //--- ToDo: Localize;
	x = 0.643976 * safezoneW + safezoneX;
	y = 0.108982 * safezoneH + safezoneY;
	w = 0.0959841 * safezoneW;
	h = 0.0850039 * safezoneH;
	action="[]call aph_Dfnc_HandleBuyBtn;";
};
class RscButton_1600: HiddenButton
{
	idc = 1600;
	x = 0.212048 * safezoneW + safezoneX;
	y = 0.142984 * safezoneH + safezoneY;
	w = 0.0799868 * safezoneW;
	h = 0.0510023 * safezoneH;
	action="[] spawn aph_Dfnc_SortByBuying";
};
class RscButton_1601: HiddenButton
{
	idc = 1601;
	x = 0.420013 * safezoneW + safezoneX;
	y = 0.142984 * safezoneH + safezoneY;
	w = 0.0799868 * safezoneW;
	h = 0.0510023 * safezoneH;
	action="[] spawn aph_Dfnc_SortBySelling";
};
};
};

class AuctionCheckAH
{
   idd = 2113;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['AuctionCheckAH', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
class frame: RscFrame
{
	idc = 1800;
	x = 0.180053 * safezoneW + safezoneX;
	y = 0.0749805 * safezoneH + safezoneY;
	w = 0.639894 * safezoneW;
	h = 0.391041 * safezoneH;
};
class BuyOrderStructuredText: RscStructuredText
{
	idc = 1100;
	x = 0.188052 * safezoneW + safezoneX;
	y = 0.125983 * safezoneH + safezoneY;
	w = 0.615898 * safezoneW;
	h = 0.0850039 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
};
class BuyOrderListbox: RscListbox
{
	idc = 1500;
	x = 0.188052 * safezoneW + safezoneX;
	y = 0.210987 * safezoneH + safezoneY;
	w = 0.615898 * safezoneW;
	h = 0.272013 * safezoneH;
};
class BuyButton: RscButton
{
	idc = 1600;
	text = "Buy"; 
	x = 0.132061 * safezoneW + safezoneX;
	y = 0.108982 * safezoneH + safezoneY;
	w = 0.0479921 * safezoneW;
	h = 0.0340016 * safezoneH;
	action="closedialog 0; null=[]execVM ""Database\AuctionHouseBuy.sqf"" ";
};
class SellButton: RscButton
{
	idc = 1601;
	text = "Sell"; 
	x = 0.132061 * safezoneW + safezoneX;
	y = 0.159984 * safezoneH + safezoneY;
	w = 0.0479921 * safezoneW;
	h = 0.0340016 * safezoneH;
	action="closedialog 0; null=[]execVM ""Database\AuctionHouseSell.sqf"" ";
};
class MyAuctButton: RscButton
{
	idc = 1601;
	text = "Mine"; 
	x = 0.132061 * safezoneW + safezoneX;
	y = 0.209984 * safezoneH + safezoneY;
	w = 0.0479921 * safezoneW;
	h = 0.0340016 * safezoneH;
	action="closedialog 0; null=[]execVM ""Database\AuctionHouseCheckAH.sqf"" ";
};
class AcceptButton: RscButton
{
	idc = 1603;
	text = "Edit"; //--- ToDo: Localize;
	x = 0.643976 * safezoneW + safezoneX;
	y = 0.108982 * safezoneH + safezoneY;
	w = 0.0959841 * safezoneW;
	h = 0.0450039 * safezoneH;
	action="";
};
class CancelButton: RscButton
{
	idc = 1603;
	text = "Cancel"; //--- ToDo: Localize;
	x = 0.643976 * safezoneW + safezoneX;
	y = 0.158982 * safezoneH + safezoneY;
	w = 0.0959841 * safezoneW;
	h = 0.0450039 * safezoneH;
	action="";
};

class RscButton_1600: HiddenButton
{
	idc = 1600;
	x = 0.212048 * safezoneW + safezoneX;
	y = 0.142984 * safezoneH + safezoneY;
	w = 0.0799868 * safezoneW;
	h = 0.0510023 * safezoneH;
	action="[] spawn aph_Dfnc_SortByBuying";
};
class RscButton_1601: HiddenButton
{
	idc = 1601;
	x = 0.420013 * safezoneW + safezoneX;
	y = 0.142984 * safezoneH + safezoneY;
	w = 0.0799868 * safezoneW;
	h = 0.0510023 * safezoneH;
	action="[] spawn aph_Dfnc_SortBySelling";
};
};
};


//Map Markers
class MapMarkerCheckbox
{
   idd = 2113;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['MapMarkerCheckbox', _this select 0];";
    fadein = 0;
    fadeout = 0;
	class controls 
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alphapan, v1.063, #Fydyso)
////////////////////////////////////////////////////////
class RscFrame_1800: RscFrame
{
	idc = 1800;
	x = 0.883937 * safezoneW + safezoneX;
	y = 0.585004 * safezoneH + safezoneY;
	w = 0.111981 * safezoneW;
	h = 0.357016 * safezoneH;
};
class RscCheckbox_2800: RscCheckbox
{
	idc = 2800;
	x = 0.891935 * safezoneW + safezoneX;
	y = 0.636006 * safezoneH + safezoneY;
	w = 0.0959841 * safezoneW;
	h = 0.0340016 * safezoneH;
	onCheckBoxesSelChanged="[_this] call aph_checkbox";
	strings[] = 
	{
		"HIDDEN"
	};
	checked_strings[] = 
	{
		"SHOWN"
	};
};
class RscCheckbox_2801: RscCheckbox
{
	idc = 2801;
	x = 0.891935 * safezoneW + safezoneX;
	y = 0.72101 * safezoneH + safezoneY;
	w = 0.0959841 * safezoneW;
	h = 0.0340016 * safezoneH;
	onCheckBoxesSelChanged="[_this] call aph_checkbox";
	strings[] = 
	{
		"HIDDEN"
	};
	checked_strings[] = 
	{
		"SHOWN"
	};
};
class RscCheckbox_2802: RscCheckbox
{
	idc = 2802;
	x = 0.891935 * safezoneW + safezoneX;
	y = 0.806014 * safezoneH + safezoneY;
	w = 0.0959841 * safezoneW;
	h = 0.0340016 * safezoneH;
	onCheckBoxesSelChanged="[_this] call aph_checkbox";
	strings[] = 
	{
		"HIDDEN"
	};
	checked_strings[] = 
	{
		"SHOWN"
	};
};
class RscCheckbox_2803: RscCheckbox
{
	idc = 2803;
	x = 0.891935 * safezoneW + safezoneX;
	y = 0.891018 * safezoneH + safezoneY;
	w = 0.0959841 * safezoneW;
	h = 0.0340016 * safezoneH;
	onCheckBoxesSelChanged="[_this] call aph_checkbox";
	strings[] = 
	{
		"HIDDEN"
	};
	checked_strings[] = 
	{
		"SHOWN"
	};
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	x = 0.891000 * safezoneW + safezoneX;
	y = 0.602005 * safezoneH + safezoneY;
	w = 0.0959841 * safezoneW;
	h = 0.0340016 * safezoneH;
};
class RscStructuredText_1101: RscStructuredText
{
	idc = 1101;
	x = 0.890500 * safezoneW + safezoneX;
	y = 0.687009 * safezoneH + safezoneY;
	w = 0.0959841 * safezoneW;
	h = 0.0340016 * safezoneH;
};
class RscStructuredText_1102: RscStructuredText
{
	idc = 1102;
	x = 0.891935 * safezoneW + safezoneX;
	y = 0.772012 * safezoneH + safezoneY;
	w = 0.0959841 * safezoneW;
	h = 0.0340016 * safezoneH;
};
class RscStructuredText_1103: RscStructuredText
{
	idc = 1103;
	x = 0.891935 * safezoneW + safezoneX;
	y = 0.857016 * safezoneH + safezoneY;
	w = 0.0959841 * safezoneW;
	h = 0.0340016 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};



//RSC
class RscTitles
{
//Default
//
    class Default 
    {
       idd = -1;
       fadein = 0;
       fadeout = 0;
       duration = 0;
    };

//Blueprints
class BlueprintDisplayUI
	{
		 idd = 1000004;
		movingEnable =  0;
		enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  0.1;
        fadeout      =  2;
        name = "BlueprintDisplayUI";
		onLoad = "with uiNameSpace do { BlueprintDisplayUI = _this select 0 }";
		class controls
		{

class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "";
	x = 0.00408206 * safezoneW + safezoneX;
	y = 0.0579797 * safezoneH + safezoneY;
	w = 0.127979 * safezoneW;
	h = 0.255012 * safezoneH;
};
class RscListbox_1500: RscStructuredText
{
	idc = 1500;
	x = 0.00408206 * safezoneW + safezoneX;
	y = 0.00697734 * safezoneH + safezoneY;
	w = 0.127979 * safezoneW;
	h = 0.0510023 * safezoneH;
};
class RscListbox_1501: RscStructuredText
{
	idc = 1501;
	x = 0.00408206 * safezoneW + safezoneX;
	y = 0.312991 * safezoneH + safezoneY;
	w = 0.127979 * safezoneW;
	h = 0.2150039 * safezoneH;
};

};
};
class BlueprintPictureOverlayUI
	{
		 idd = 1000004;
		movingEnable =  0;
		enableSimulation = 1;
        enableDisplay = 1;
        duration     =  99999;
        fadein       =  0.1;
        fadeout      =  2;
        name = "BlueprintPictureOverlayUI";
		onLoad = "with uiNameSpace do { BlueprintPictureOverlayUI = _this select 0 }";
		class controls
		{

class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "";
	x = 0.00408206 * safezoneW + safezoneX;
	y = 0.0579797 * safezoneH + safezoneY;
	w = 0.127979 * safezoneW;
	h = 0.255012 * safezoneH;
};
};
};
	
//Bottom Right Pic
class BottomRightFrame
	{
   idd = 2113;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['BottomRightFrame', _this select 0];";
    fadein = 0;
    fadeout = 0;
	duration=99999;
	class controls 
	{
class RscPicture_1200: RscPicture
{
	idc = 1200;
	text = "";
	x = 0.915931 * safezoneW + safezoneX;
	y = 0.874017 * safezoneH + safezoneY;
	w = 0.0799868 * safezoneW;
	h = 0.119005 * safezoneH;
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	text = "text"; //--- ToDo: Localize;
	x = 0.915931 * safezoneW + safezoneX;
	y = 0.840015 * safezoneH + safezoneY;
	w = 0.0799868 * safezoneW;
	h = 0.0340016 * safezoneH;
	colorText[] = {-1,-1,-1,1};
	colorBackground[] = { 0, 0, 0, 0 };
};

};
};

class RefineryProgressBar
	{
   idd = 2113;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['RefineryProgressBar', _this select 0];";
    fadein = 0;
    fadeout = 0;
	duration=99999;
	class controls 
	{
class ProgressBar: RscProgress
{
	idc = 1600;
	x = 0.372021 * safezoneW + safezoneX;
	y = 0.414996 * safezoneH + safezoneY;
	w = 0.42393 * safezoneW;
	h = 0.0170008 * safezoneH;
};
};
};
	
	

//Killed Screens
class OnPlayerKilledUI
{
   idd = 21155;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['OnPlayerKilledUI', _this select 0];";
    fadein = 0;
    fadeout = 0;
	duration=9;
	class controls 
	{
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	text = ""; //--- ToDo: Localize;
	x = 0.300033 * safezoneW + safezoneX;
	y = 0.346993 * safezoneH + safezoneY;
	w = 0.399934 * safezoneW;
	h = 0.119005 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
};
};
};

};//end RSC

