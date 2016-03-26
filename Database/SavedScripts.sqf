

	//loadout
	_wanted=
		[
		//wearing
		uniform _unit,
		vest _unit,
		backpack _unit,
		headgear _unit,
		assigneditems _unit,

		//ammo
		primaryWeaponMagazine _unit,
		secondaryWeaponMagazine _unit,
		handgunMagazine _unit,
		
		//Weapons
		primaryWeapon _unit,
		primaryWeaponItems _unit,
		secondaryWeapon _unit,
		secondaryWeaponItems _unit,
		handgunWeapon _unit,
		handgunItems _unit,
		
		//cargo
		uniformItems _unit,
		vestitems _unit,
		backpackitems _unit
		];
		
		
_wanted=
		[
		//wearing
		uniform _x,
		vest _x,
		backpack _x,
		headgear _x,
		assigneditems _x,

		//ammo
		primaryWeaponMagazine _x,
		secondaryWeaponMagazine _x,
		handgunMagazine _x,
		
		//Weapons
		primaryWeapon _x,
		primaryWeaponItems _x,
		secondaryWeapon _x,
		secondaryWeaponItems _x,
		handgunWeapon _x,
		handgunItems _x,

		//cargo
		uniformItems _x,
		vestitems _x,
		backpackitems _x,
		name _x,
		(_x getVariable "InMemberArray")
		];
		
		
		//wearing
		_unit addUniform (_loadout select 0);
		_unit addvest (_loadout select 1);
		_unit addBackpack  (_loadout select 2);
		_unit addHeadgear (_loadout select 3);
		{_unit additem _x; _unit assignitem _x}foreach (_loadout select 4);
		
		//Initial Ammo
		_unit addItemToUniform ((_loadout select 5) select 0);
		_unit addItemToUniform ((_loadout select 6) select 0);
		_unit addItemToUniform ((_loadout select 7) select 0);
		
		//Weapons
		_unit addWeapon (_loadout select 8);
		{_unit addPrimaryWeaponItem _x }foreach (_loadout select 9);
		_unit addWeapon (_loadout select 10);
		{_unit addSecondaryWeaponItem _x}foreach   (_loadout select 11);
		_unit addWeapon (_loadout select 12);
		{_unit addHandgunItem _x}foreach (_loadout select 13);
		
		
		//cargo
		{_unit addItemToUniform _x} foreach (_loadout select 14);
		{_unit addItemToVest _x}foreach (_loadout select 15);
		{_unit addItemToBackpack _x} foreach (_loadout select 16);
		
		
_toLoad=_loadoutPrime select _n;
	_Nunit = (group _unit) createUnit ["C_man_1", Position _unit, [], 0, "FORM"];
	_Nunit setname (_toLoad select 17);
	removeAllWeapons _Nunit; 
	removeAllItems _Nunit;
	removeHeadgear _Nunit; 
	removevest _Nunit; 
	removeUniform _Nunit; 
	_Nunit setVariable ["BIS_enableRandomization", false];
		//wearing
		_Nunit addUniform (_toLoad select 0);
		_Nunit addvest (_toLoad select 1);
		_Nunit addBackpack  (_toLoad select 2);
		_Nunit addHeadgear (_toLoad select 3);
		{_Nunit additem _x; _Nunit assignitem _x}foreach (_toLoad select 4);
		
		//Initial Ammo
		_Nunit addItemToUniform ((_toLoad select 5) select 0);
		_Nunit addItemToUniform ((_toLoad select 6) select 0);
		_Nunit addItemToUniform ((_toLoad select 7) select 0);
		
		//Weapons
		_Nunit addWeapon (_toLoad select 8);
		{_Nunit addPrimaryWeaponItem _x }foreach (_toLoad select 9);
		_Nunit addWeapon (_toLoad select 10);
		{_Nunit addSecondaryWeaponItem _x}foreach   (_toLoad select 11);
		_Nunit addWeapon (_toLoad select 12);
		{_Nunit addHandgunItem _x}foreach (_toLoad select 13);
		
		
		//cargo
		{_Nunit addItemToUniform _x} foreach (_toLoad select 14);
		{_Nunit addItemToVest _x}foreach (_toLoad select 15);
		{_Nunit addItemToBackpack _x} foreach (_toLoad select 16);
		