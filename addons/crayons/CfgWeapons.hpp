// NVG's are defined within CfgWeapons
// The Facewear Version is defined in CfgGoggles

class CfgWeapons {
	class NVGoggles;

    class GVAR(crayon_black_nv): NVGoggles {
        // NVG Data
        visionMode[] = {"Normal"};
		thermalMode[] = {0};
		modelOptics[] = {};
		opticsPPEffects[] = {};

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,crayon,crayon.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,crayon,crayon.p3d);
            mass = 0.02;
        };

        //Vanilla Data
        scope = 2;
        author = CSTRING(author);
        mass = 0.02;

        displayName = CSTRING(crayon);
        descriptionShort = "";

        model = PATH_TO_ADDON_3(data,crayon,crayon.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_crayon_black_ca.paa);

        // Common Data
        PVAR(maxTime) = 330;
        PVAR(initStateTime) = 0;
        PVAR(nextState) = "";

        // Specific Data
        PVAR(isSuckable) = 1;

        PVAR(flavour) =  "existential anguish"; 
        PVAR(sounds)[] = {QPVAR(eat_01), QPVAR(eat_02), QPVAR(eat_03), QPVAR(eat_04), QPVAR(eat_05), QPVAR(eat_06), QPVAR(eat_07)};


        // Compat Data
        KJW_Imposters_SuspicionAmount = 0;
    };


    class GVAR(crayon_blue_nv): GVAR(crayon_black_nv) {
        picture = PATH_TO_ADDON_3(data,ui,gear_crayon_blue_ca.paa);
        PVAR(flavour) =  "blue on blue"; 
    };

    class GVAR(crayon_brown_nv): GVAR(crayon_black_nv) {
        picture = PATH_TO_ADDON_3(data,ui,gear_crayon_brown_ca.paa);
        PVAR(flavour) =  "flesh"; 
    };

    class GVAR(crayon_gray_nv): GVAR(crayon_black_nv) {
        picture = PATH_TO_ADDON_3(data,ui,gear_crayon_gray_ca.paa);
        PVAR(flavour) =  "moral ambiguity gray"; 
    };

    class GVAR(crayon_green_nv): GVAR(crayon_black_nv) {
        picture = PATH_TO_ADDON_3(data,ui,gear_crayon_green_ca.paa);
        PVAR(flavour) =  "gan green"; 
    };

    class GVAR(crayon_orange_nv): GVAR(crayon_black_nv) {
        picture = PATH_TO_ADDON_3(data,ui,gear_crayon_orange_ca.paa);
        PVAR(flavour) =  "agent orange"; 
    };

    class GVAR(crayon_pink_nv): GVAR(crayon_black_nv) {
        picture = PATH_TO_ADDON_3(data,ui,gear_crayon_pink_ca.paa);
        PVAR(flavour) =  "pink mist"; 
    };

    class GVAR(crayon_purple_nv): GVAR(crayon_black_nv) {
        picture = PATH_TO_ADDON_3(data,ui,gear_crayon_purple_ca.paa);
        PVAR(flavour) =  "purple heart"; 
    };

    class GVAR(crayon_red_nv): GVAR(crayon_black_nv) {
        picture = PATH_TO_ADDON_3(data,ui,gear_crayon_red_ca.paa);
        PVAR(flavour) =  "danger close"; 
    };

    class GVAR(crayon_white_nv): GVAR(crayon_black_nv) {
        picture = PATH_TO_ADDON_3(data,ui,gear_crayon_white_ca.paa);
        PVAR(flavour) =  "white phosphorus"; 
    };

    class GVAR(crayon_yellow_nv): GVAR(crayon_black_nv) {
        picture = PATH_TO_ADDON_3(data,ui,gear_crayon_yellow_ca.paa);
        PVAR(flavour) =  "hazard pay"; 
    };
};