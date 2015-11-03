class CfgPatches
{
	class murshun_cigs
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = {"ace_common", "ace_interaction", "ace_interact_menu", "ewk_cigs"};
		author[] = {"rebel"};
		authorUrl = "http://podkolpakom.net/";
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
					displayName = "Light Up a Cig";
					condition = "((goggles _player) in murshun_cigs_cigsArray) and (!(_player getVariable ['murshun_cigs_cigLitUp', false])) and ((_player getVariable ['murshun_cigs_cigTime', 0]) <= 330)";
					statement = "[_player, _player] spawn murshun_cigs_fnc_start_cig";
					showDisabled = 0;
					exceptions[] = {"isNotInside"};
					icon = "murshun_cigs\logo.paa";
				};
				class murshun_cigs_stop_cig
				{
					displayName = "Put Out a Cig";
					condition = "((goggles _player) in murshun_cigs_cigsArray) and ((_player getVariable ['murshun_cigs_cigLitUp', false]))";
					statement = "[_player] spawn murshun_cigs_fnc_stop_cig";
					showDisabled = 0;
					exceptions[] = {"isNotInside"};
					icon = "murshun_cigs\logo.paa";
				};
			};
		};
		
		class ACE_Actions
		{
			class ACE_Head {
				class murshun_cigs_start_someones_cig
				{
					displayName = "Light His Cig Up";
					condition = "((goggles _target) in murshun_cigs_cigsArray) and (!(_target getVariable ['murshun_cigs_cigLitUp', false])) and ((_target getVariable ['murshun_cigs_cigTime', 0]) <= 330) and (alive _target)";
					statement = "[_target, _player] spawn murshun_cigs_fnc_start_cig_MP";
					showDisabled = 0;
					icon = "murshun_cigs\logo.paa";
				};
			};
		};
	};
};

class CfgWeapons {
	class ACE_ItemCore;
	class InventoryItem_Base_F;
	
	class murshun_cigs_matches: ACE_ItemCore {
        author = "rebel";
        scope = 2;
        displayName = "Matches";
        descriptionShort = "Only 10 matches per box.";
        model = "\A3\weapons_F\ammo\mag_univ.p3d";
        picture = "\murshun_cigs\UI\gear_murshun_cigs_matches_x_ca";
		
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
			model = "\A3\weapons_F\ammo\mag_univ.p3d";
        };
    };
	
	class murshun_cigs_lighter: ACE_ItemCore {
        author = "rebel";
        scope = 2;
        displayName = "Lighter";
        descriptionShort = "Unlimited lighting possibilities.";
        model = "\A3\weapons_F\ammo\mag_univ.p3d";
        picture = "\murshun_cigs\UI\gear_murshun_cigs_lighter_x_ca";
		
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
			model = "\A3\weapons_F\ammo\mag_univ.p3d";
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
			class init
			{
				postInit = 1;
			};
		};
	};
};
