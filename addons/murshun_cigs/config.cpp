class CfgPatches
{
	class murshun_cigs
	{
		units[] = {"murshun_cigs_matchesItem", "murshun_cigs_lighterItem"};
		weapons[] = {"murshun_cigs_matches", "murshun_cigs_lighter"};
		requiredVersion = 1;
		requiredAddons[] = {"ace_main", "ace_common", "ace_interaction", "ace_interact_menu", "ewk_cigs"};
		version = "1.13";
	};
};

class CfgVehicles
{
	class Man;
	class CAManBase: Man
	{
		class ACE_SelfActions
		{
			class ACE_Equipment {
				class murshun_cigs_start_cig
				{
					displayName = "$STR_murshun_cigs_start_cig";
					condition = "((goggles _player) in murshun_cigs_cigsArray) and (!(_player getVariable ['murshun_cigs_cigLitUp', false])) and ((_player getVariable ['murshun_cigs_cigTime', 0]) <= 330) and (alive _player)";
					statement = "[_player, _player] spawn murshun_cigs_fnc_start_cig";
					showDisabled = 0;
					exceptions[] = {"isNotInside", "isNotSitting"};
					icon = "murshun_cigs\logo.paa";
				};
				class murshun_cigs_stop_cig
				{
					displayName = "$STR_murshun_cigs_stop_cig";
					condition = "((goggles _player) in murshun_cigs_cigsArray) and ((_player getVariable ['murshun_cigs_cigLitUp', false])) and (alive _player)";
					statement = "[_player] spawn murshun_cigs_fnc_stop_cig";
					showDisabled = 0;
					exceptions[] = {"isNotInside", "isNotSitting"};
					icon = "murshun_cigs\logo.paa";
				};
			};
		};
		
		class ACE_Actions
		{
			class ACE_Head {
				class murshun_cigs_start_someones_cig
				{
					displayName = "$STR_cigs_start_someones_cig";
					condition = "((goggles _target) in murshun_cigs_cigsArray) and (!(_target getVariable ['murshun_cigs_cigLitUp', false])) and (alive _target)";
					statement = "[_target, _player] spawn murshun_cigs_fnc_start_cig_MP";
					showDisabled = 0;
					icon = "murshun_cigs\logo.paa";
				};
			};
		};
	};
	
	class Item_Base_F;
	
	class murshun_cigs_matchesItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = "$STR_murshun_cigs_matches";
		author = "rebel / facel";
		vehicleClass = "Items";
		
		class TransportItems {
			class murshun_cigs_matches {
				name = "murshun_cigs_matches";
				count = "1";
			};
		};
	};
	
	class murshun_cigs_lighterItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = "$STR_murshun_cigs_lighter";
		author = "rebel / facel";
		vehicleClass = "Items";
		
		class TransportItems {
			class murshun_cigs_lighter {
				name = "murshun_cigs_lighter";
				count = "1";
			};
		};
	};
};

class CfgWeapons {
	class ACE_ItemCore;
	class InventoryItem_Base_F;
	
	class murshun_cigs_matches: ACE_ItemCore {
		author = "rebel / facel";
		scope = 2;
		scopeCurator = 2;
		displayName = "$STR_murshun_cigs_matches";
		descriptionShort = "Only 10 matches per box.";
		model = "\murshun_cigs\matches.p3d";
		picture = "\murshun_cigs\UI\gear_murshun_cigs_matches_x_ca";
		
		class ItemInfo: InventoryItem_Base_F {
			mass = 1;
			model = "\murshun_cigs\matches.p3d";
		};
	};
	
	class murshun_cigs_lighter: ACE_ItemCore {
		author = "rebel / facel";
		scope = 2;
		scopeCurator = 2;
		displayName = "$STR_murshun_cigs_lighter";
		descriptionShort = "Unlimited lighting possibilities.";
		model = "\murshun_cigs\lighter.p3d";
		picture = "\murshun_cigs\UI\gear_murshun_cigs_lighter_x_ca";
		
		class ItemInfo: InventoryItem_Base_F {
			mass = 1;
			model = "\murshun_cigs\lighter.p3d";
		};
	};
};

class CfgGlasses
{
	class None;
	
	class EWK_Cig1: None {
		mass = 0.4;
	};
	
	class EWK_Cig2: None {
		mass = 0.4;
	};
	
	class EWK_Cig3: None {
		mass = 0.4;
	};
	
	class EWK_Cig4: None {
		mass = 0.4;
	};
	
	class EWK_Cig5: None {
		mass = 0.4;
	};
	
	class EWK_Cig6: None {
		mass = 0.4;
	};
	
	class EWK_Cigar1: None {
		mass = 0.8;
	};
};

class CfgSounds
{
	sounds[] = {};
	
	class murshun_cigs_matches_01
	{
		name = "murshun_cigs_matches_01";
		sound[] = {"\murshun_cigs\matches_01.ogg", 2, 1, 15};
		titles[] = {};
	};
	
	class murshun_cigs_matches_02
	{
		name = "murshun_cigs_matches_02";
		sound[] = {"\murshun_cigs\matches_02.ogg", 2, 1, 15};
		titles[] = {};
	};
	
	class murshun_cigs_lighter_01
	{
		name = "murshun_cigs_lighter_01";
		sound[] = {"\murshun_cigs\lighter_01.ogg", 2, 1, 15};
		titles[] = {};
	};
};

class CfgFunctions
{
	class murshun_cigs
	{
		class murshun_cigs
		{
			file = "murshun_cigs\functions";
			class cigsInit
			{
				postInit = 1;
			};
		};
	};
};
