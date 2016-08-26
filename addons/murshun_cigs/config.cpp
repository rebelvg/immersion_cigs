#include "CfgPatches.hpp"

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
					condition = "((goggles _player) in murshun_cigs_cigsArray) and (!(_player getVariable ['murshun_cigs_cigLitUp', false]))";
					statement = "[_player, _player] spawn murshun_cigs_fnc_start_cig_your";
					showDisabled = 0;
					exceptions[] = {"isNotInside", "isNotSitting"};
					icon = "murshun_cigs\UI\light_cig.paa";
				};
				class murshun_cigs_stop_cig
				{
					displayName = "$STR_murshun_cigs_stop_cig";
					condition = "((goggles _player) in murshun_cigs_cigsArray) and ((_player getVariable ['murshun_cigs_cigLitUp', false]))";
					statement = "[_player] spawn murshun_cigs_fnc_stop_cig";
					showDisabled = 0;
					exceptions[] = {"isNotInside", "isNotSitting"};
					icon = "murshun_cigs\UI\light_cig.paa";
				};
				class murshun_cigs_take_cig_from_pack
				{
					displayName = "Take Cig from Pack";
					condition = "'murshun_cigs_cigpack' in (magazines _player)";
					statement = "[_player] spawn murshun_cigs_fnc_take_cig_from_pack";
					showDisabled = 0;
					exceptions[] = {"isNotInside", "isNotSitting"};
					icon = "murshun_cigs\UI\take_cig.paa";
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
					statement = "[_target, _player] spawn murshun_cigs_fnc_start_cig_his";
					showDisabled = 0;
					icon = "murshun_cigs\UI\light_cig.paa";
				};
			};
		};
	};

	class WeaponHolder_Single_limited_item_F;
	class murshun_cigs_matchesItem: WeaponHolder_Single_limited_item_F {
		scope = 2;
		scopeCurator = 2;
		displayName = "$STR_murshun_cigs_matches";
		author = "$STR_murshun_cigs_author";
		vehicleClass = "Magazines";
		
		class TransportMagazines {
			class murshun_cigs_matches {
				magazine = "murshun_cigs_matches";
				count = 1;
			};
		};
	};

	class murshun_cigs_lighterItem: WeaponHolder_Single_limited_item_F {
		scope = 2;
		scopeCurator = 2;
		displayName = "$STR_murshun_cigs_lighter";
		author = "$STR_murshun_cigs_author";
		vehicleClass = "Magazines";
		
		class TransportMagazines {
			class murshun_cigs_lighter {
				magazine = "murshun_cigs_lighter";
				count = 1;
			};
		};
	};
	
	class murshun_cigs_cigpackItem: WeaponHolder_Single_limited_item_F {
		scope = 2;
		scopeCurator = 2;
		displayName = "Cig Pack";
		author = "$STR_murshun_cigs_author";
		vehicleClass = "Magazines";
		
		class TransportMagazines {
			class murshun_cigs_cigpack {
				magazine = "murshun_cigs_cigpack";
				count = 1;
			};
		};
	};
};

class CfgMagazines {
	class CA_Magazine;
	class murshun_cigs_matches: CA_Magazine {
		author = "$STR_murshun_cigs_author";
		scope = 2;
		
		displayName = "$STR_murshun_cigs_matches";
		descriptionShort = "Contains 10 matches.";
		model = "\murshun_cigs\matches.p3d";
		picture = "\murshun_cigs\UI\gear_murshun_cigs_matches_x_ca";
		
		ammo = "";
		count = 10;
		initSpeed = 0;
		tracersEvery = 0;
		lastRoundsTracer = 0;
		mass = 1;
	};
	
	class murshun_cigs_lighter: CA_Magazine {
		author = "$STR_murshun_cigs_author";
		scope = 2;
		
		displayName = "$STR_murshun_cigs_lighter";
		descriptionShort = "Can light up 100 cigarettes.";
		model = "\murshun_cigs\lighter.p3d";
		picture = "\murshun_cigs\UI\gear_murshun_cigs_lighter_x_ca";
		
		ammo = "";
		count = 100;
		initSpeed = 0;
		tracersEvery = 0;
		lastRoundsTracer = 0;
		mass = 2;
	};
	
	class murshun_cigs_cigpack: CA_Magazine {
		author = "$STR_murshun_cigs_author";
		scope = 2;
		
		displayName = "Cig Pack";
		descriptionShort = "Contains 20 cigarettes.<br />Warning: Smoking is hazardous to your health.";
		model = "\murshun_cigs\cigpack.p3d";
		picture = "\murshun_cigs\UI\gear_murshun_cigs_cigpack_x_ca";
		
		ammo = "";
		count = 20;
		initSpeed = 0;
		tracersEvery = 0;
		lastRoundsTracer = 0;
		mass = 2;
	};
};

class CfgGlasses {
	class None;
	
	class murshun_cigs_cig0: None {
		author="$STR_murshun_cigs_author";
		mass = 0.02;
		displayname = "Cigarette";
		model = "\murshun_cigs\cig0.p3d";
		picture = "\murshun_cigs\UI\gear_murshun_cigs_cig0_x_ca";
		identityTypes[]={};
	};
	
	class murshun_cigs_cig1: murshun_cigs_cig0 {
		author="$STR_murshun_cigs_author";
		displayname = "Cigarette Lit-Up (Stage 1)";
		model = "\murshun_cigs\cig1.p3d";
		picture = "\murshun_cigs\UI\gear_murshun_cigs_cig1_x_ca";
	};
	
	class murshun_cigs_cig2: murshun_cigs_cig0 {
		author="$STR_murshun_cigs_author";
		displayname = "Cigarette Lit-Up (Stage 2)";
		model = "\murshun_cigs\cig2.p3d";
		picture = "\murshun_cigs\UI\gear_murshun_cigs_cig2_x_ca";
	};
	
	class murshun_cigs_cig3: murshun_cigs_cig0 {
		author="$STR_murshun_cigs_author";
		displayname = "Cigarette Lit-Up (Stage 3)";
		model = "\murshun_cigs\cig3.p3d";
		picture = "\murshun_cigs\UI\gear_murshun_cigs_cig3_x_ca";
	};
	
	class murshun_cigs_cig4: murshun_cigs_cig0 {
		author="$STR_murshun_cigs_author";
		displayname = "Cigarette Lit-Up (Stage 4)";
		model = "\murshun_cigs\cig4.p3d";
		picture = "\murshun_cigs\UI\gear_murshun_cigs_cig4_x_ca";
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
