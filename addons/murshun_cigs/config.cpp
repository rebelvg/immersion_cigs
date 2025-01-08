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
                    condition = "[_player] call immersion_cigs_canStartSmoking";
                    statement = "[_player] spawn murshun_cigs_fnc_start_cig_your";
                    showDisabled = 0;
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    icon = "murshun_cigs\UI\light_cig.paa";
                };
                class murshun_cigs_stop_cig
                {
                    displayName = "$STR_murshun_cigs_stop_cig";
                    condition = "[_player] call immersion_cigs_canStopSmoking";
                    statement = "[_player] spawn murshun_cigs_fnc_stop_cig";
                    showDisabled = 0;
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    icon = "murshun_cigs\UI\light_cig.paa";
                };
                class murshun_cigs_take_cig_from_pack
                {
                    displayName = "$STR_murshun_cigs_take_cig_from_pack";
                    condition = "[_player] call immersion_cigs_canTakeCigFromPack";
                    statement = "[_player] spawn murshun_cigs_fnc_take_cig_from_pack";
                    showDisabled = 0;
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    icon = "murshun_cigs\UI\take_cig.paa";
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
        displayName = "$STR_murshun_cigs_cigpack";
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
        descriptionShort = "$STR_murshun_cigs_matches_descr";
        model = "\murshun_cigs\matches.p3d";
        picture = "\murshun_cigs\UI\gear_matches_x_ca";

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
        descriptionShort = "$STR_murshun_cigs_lighter_descr";
        model = "\murshun_cigs\lighter.p3d";
        picture = "\murshun_cigs\UI\gear_lighter_x_ca";

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

        displayName = "$STR_murshun_cigs_cigpack";
        descriptionShort = "$STR_murshun_cigs_cigpack_descr";
        model = "\murshun_cigs\cigpack.p3d";
        picture = "\murshun_cigs\UI\gear_cigpack_x_ca";

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
        scope = 2;
        author = "$STR_murshun_cigs_author";
        mass = 0.02;
        displayName = "$STR_murshun_cigs_cigarette0";
        model = "\murshun_cigs\cig0.p3d";
        picture = "\murshun_cigs\UI\gear_cig0_x_ca";
        identityTypes[] = {};

        immersion_cigs_type = "cigarette";
        immersion_cigs_maxTime = 330;
        immersion_cigs_initStateTime = 0;
        immersion_cigs_nextState = "murshun_cigs_cig1";
        immersion_cigs_isCig = 1;
    };

    class murshun_cigs_cig1: murshun_cigs_cig0 {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigarette (Stage 1)";
        model = "\murshun_cigs\cig1.p3d";
        picture = "\murshun_cigs\UI\gear_cig1_x_ca";

        immersion_cigs_initStateTime = 6;
        immersion_cigs_nextState = "murshun_cigs_cig2";
        immersion_cigs_isCig = 1;
    };

    class murshun_cigs_cig2: murshun_cigs_cig0 {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigarette (Stage 2)";
        model = "\murshun_cigs\cig2.p3d";
        picture = "\murshun_cigs\UI\gear_cig2_x_ca";

        immersion_cigs_initStateTime = 66;
        immersion_cigs_nextState = "murshun_cigs_cig3";
        immersion_cigs_isCig = 1;
    };

    class murshun_cigs_cig3: murshun_cigs_cig0 {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigarette (Stage 3)";
        model = "\murshun_cigs\cig3.p3d";
        picture = "\murshun_cigs\UI\gear_cig3_x_ca";

        immersion_cigs_initStateTime = 126;
        immersion_cigs_nextState = "murshun_cigs_cig4";
        immersion_cigs_isCig = 1;
    };

    class murshun_cigs_cig4: murshun_cigs_cig0 {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigarette (Stage 4)";
        model = "\murshun_cigs\cig4.p3d";
        picture = "\murshun_cigs\UI\gear_cig4_x_ca";

        immersion_cigs_initStateTime = 306;
        immersion_cigs_nextState = "";
        immersion_cigs_isCig = 1;
    };

    class immersion_cigs_cigar0: None {
        scope = 2;
        author = "$STR_murshun_cigs_author";
        mass = 0.1;
        displayName = "Cigar";
        model = "\murshun_cigs\cigars\cigar0.p3d";
        picture = "\murshun_cigs\UI\gear_cigar0_x_ca";
        identityTypes[] = {};

        immersion_cigs_type = "cigar";
        immersion_cigs_maxTime = 660;
        immersion_cigs_initStateTime = 0;
        immersion_cigs_nextState = "immersion_cigs_cigar1";
        immersion_cigs_isCig = 1;
    };

    class immersion_cigs_cigar1: immersion_cigs_cigar0 {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigar (Stage 1)";
        model = "\murshun_cigs\cigars\cigar1.p3d";
        picture = "\murshun_cigs\UI\gear_cigar1_x_ca";

        immersion_cigs_initStateTime = 12;
        immersion_cigs_nextState = "immersion_cigs_cigar2";
        immersion_cigs_isCig = 1;
    };

    class immersion_cigs_cigar2: immersion_cigs_cigar0 {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigar (Stage 2)";
        model = "\murshun_cigs\cigars\cigar2.p3d";
        picture = "\murshun_cigs\UI\gear_cigar2_x_ca";

        immersion_cigs_initStateTime = 132;
        immersion_cigs_nextState = "immersion_cigs_cigar3";
        immersion_cigs_isCig = 1;
    };

    class immersion_cigs_cigar3: immersion_cigs_cigar0 {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigar (Stage 3)";
        model = "\murshun_cigs\cigars\cigar3.p3d";
        picture = "\murshun_cigs\UI\gear_cigar3_x_ca";

        immersion_cigs_initStateTime = 252;
        immersion_cigs_nextState = "immersion_cigs_cigar4";
        immersion_cigs_isCig = 1;
    };

    class immersion_cigs_cigar4: immersion_cigs_cigar0 {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigar (Stage 4)";
        model = "\murshun_cigs\cigars\cigar4.p3d";
        picture = "\murshun_cigs\UI\gear_cigar4_x_ca";

        immersion_cigs_initStateTime = 612;
        immersion_cigs_nextState = "";
        immersion_cigs_isCig = 1;
    };
};

class CfgSounds
{
    sounds[] = {};

    class murshun_cigs_unwrap
    {
        sound[] = {"\murshun_cigs\murshun_cigs_unwrap.ogg", 2, 1, 15};
        titles[] = {};
    };
    class murshun_cigs_matches_01
    {
        sound[] = {"\murshun_cigs\murshun_cigs_matches_01.ogg", 2, 1, 15};
        titles[] = {};
    };
    class murshun_cigs_lighter_01
    {
        sound[] = {"\murshun_cigs\murshun_cigs_lighter_01.ogg", 2, 1, 15};
        titles[] = {};
    };
};

class CfgFunctions
{
    class murshun_cigs
    {
        class functions
        {
            file = "murshun_cigs\functions";
            class preInit
            {
                preInit = 1;
                recompile = 1;
            };
            class postInit
            {
                postInit = 1;
                recompile = 1;
            };
        };
    };
};

class CfgWeapons {
	class NVGoggles;

    class murshun_cigs_cig0_nv: NVGoggles {
        scope = 2;
        author = "$STR_murshun_cigs_author";
        mass = 0.02;
        displayName = "$STR_murshun_cigs_cigarette0_nv";
        descriptionShort = "";
        model = "\murshun_cigs\cig0.p3d";
        picture = "\murshun_cigs\UI\gear_cig0_x_ca";
        visionMode[] = {"Normal"};
		thermalMode[] = {0};
		modelOptics[] = {};
		opticsPPEffects[] = {};

        immersion_cigs_type = "cigarette";
        immersion_cigs_maxTime = 330;
        immersion_cigs_initStateTime = 0;
        immersion_cigs_nextState = "murshun_cigs_cig1_nv";
        immersion_cigs_isCig = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = "\murshun_cigs\cig0.p3d";
	    	modelOff = "\murshun_cigs\cig0.p3d";
            mass = 0.02;
        };
    };



    class murshun_cigs_cig1_nv: murshun_cigs_cig0_nv {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigarette (Stage 1)";
        model = "\murshun_cigs\cig1.p3d";
        picture = "\murshun_cigs\UI\gear_cig1_x_ca";

        immersion_cigs_initStateTime = 6;
        immersion_cigs_nextState = "murshun_cigs_cig2_nv";
        immersion_cigs_isCig = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = "\murshun_cigs\cig1.p3d";
	    	modelOff = "\murshun_cigs\cig1.p3d";
        };
    };

    class murshun_cigs_cig2_nv: murshun_cigs_cig0_nv {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigarette (Stage 2)";
        model = "\murshun_cigs\cig2.p3d";
        picture = "\murshun_cigs\UI\gear_cig2_x_ca";

        immersion_cigs_initStateTime = 66;
        immersion_cigs_nextState = "murshun_cigs_cig3_nv";
        immersion_cigs_isCig = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = "\murshun_cigs\cig2.p3d";
	    	modelOff = "\murshun_cigs\cig2.p3d";
        };
    };

    class murshun_cigs_cig3_nv: murshun_cigs_cig0_nv {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigarette (Stage 3)";
        model = "\murshun_cigs\cig3.p3d";
        picture = "\murshun_cigs\UI\gear_cig3_x_ca";

        immersion_cigs_initStateTime = 126;
        immersion_cigs_nextState = "murshun_cigs_cig4_nv";
        immersion_cigs_isCig = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = "\murshun_cigs\cig3.p3d";
	    	modelOff = "\murshun_cigs\cig3.p3d";
        };
    };

    class murshun_cigs_cig4_nv: murshun_cigs_cig0_nv {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigarette (Stage 4)";
        model = "\murshun_cigs\cig4.p3d";
        picture = "\murshun_cigs\UI\gear_cig4_x_ca";

        immersion_cigs_initStateTime = 306;
        immersion_cigs_nextState = "";
        immersion_cigs_isCig = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = "\murshun_cigs\cig4.p3d";
	    	modelOff = "\murshun_cigs\cig4.p3d";
        };
    };

    class immersion_cigs_cigar0_nv: NVGoggles {
        scope = 2;
        author = "$STR_murshun_cigs_author";
        mass = 0.1;
        displayName = "Cigar (NVG Slot)";
        model = "\murshun_cigs\cigars\cigar0.p3d";
        picture = "\murshun_cigs\UI\gear_cigar0_x_ca";
        visionMode[] = {"Normal"};
		thermalMode[] = {0};
		modelOptics[] = {};
		opticsPPEffects[] = {};

        immersion_cigs_type = "cigar";
        immersion_cigs_maxTime = 660;
        immersion_cigs_initStateTime = 0;
        immersion_cigs_nextState = "immersion_cigs_cigar1_nv";
        immersion_cigs_isCig = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = "\murshun_cigs\cigars\cigar0.p3d";
	    	modelOff = "\murshun_cigs\cigars\cigar0.p3d";
        };
    };

    class immersion_cigs_cigar1_nv: immersion_cigs_cigar0_nv {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigar (Stage 1)";
        model = "\murshun_cigs\cigars\cigar1.p3d";
        picture = "\murshun_cigs\UI\gear_cigar1_x_ca";

        immersion_cigs_initStateTime = 12;
        immersion_cigs_nextState = "immersion_cigs_cigar2_nv";
        immersion_cigs_isCig = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = "\murshun_cigs\cigars\cigar1.p3d";
	    	modelOff = "\murshun_cigs\cigars\cigar1.p3d";
        };
    };

    class immersion_cigs_cigar2_nv: immersion_cigs_cigar0_nv {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigar (Stage 2)";
        model = "\murshun_cigs\cigars\cigar2.p3d";
        picture = "\murshun_cigs\UI\gear_cigar2_x_ca";

        immersion_cigs_initStateTime = 132;
        immersion_cigs_nextState = "immersion_cigs_cigar3_nv";
        immersion_cigs_isCig = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = "\murshun_cigs\cigars\cigar2.p3d";
	    	modelOff = "\murshun_cigs\cigars\cigar2.p3d";
        };
    };

    class immersion_cigs_cigar3_nv: immersion_cigs_cigar0_nv {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigar (Stage 3)";
        model = "\murshun_cigs\cigars\cigar3.p3d";
        picture = "\murshun_cigs\UI\gear_cigar3_x_ca";

        immersion_cigs_initStateTime = 252;
        immersion_cigs_nextState = "immersion_cigs_cigar4_nv";
        immersion_cigs_isCig = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = "\murshun_cigs\cigars\cigar3.p3d";
	    	modelOff = "\murshun_cigs\cigars\cigar3.p3d";
        };
    };

    class immersion_cigs_cigar4_nv: immersion_cigs_cigar0_nv {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigar (Stage 4)";
        model = "\murshun_cigs\cigars\cigar4.p3d";
        picture = "\murshun_cigs\UI\gear_cigar4_x_ca";

        immersion_cigs_initStateTime = 612;
        immersion_cigs_nextState = "";
        immersion_cigs_isCig = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = "\murshun_cigs\cigars\cigar4.p3d";
	    	modelOff = "\murshun_cigs\cigars\cigar4.p3d";
        };
    };
};
