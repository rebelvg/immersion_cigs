// NVG's are defined within CfgWeapons
// The Facewear Version is defined in CfgGoggles

class CfgWeapons {
	class NVGoggles;

    class GVAR(pop0_nv): NVGoggles {
        visionMode[] = {"Normal"};
		thermalMode[] = {0};
		modelOptics[] = {};
		opticsPPEffects[] = {};

        scope = 2;
        author = CSTRING(author);
        mass = 0.02;

        displayName = CSTRING(pop0_nv);
        descriptionShort = "";

        model = PATH_TO_ADDON_3(data,cigs,cig0.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig0_x_ca);

        PVAR(maxTime) = 330;
        PVAR(initStateTime) = 0;
        PVAR(nextState) = "";

        PVAR(isSuckable) = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,cigs,cig0.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigs,cig0.p3d);
            mass = 0.02;
        };

        KJW_Imposters_SuspicionAmount = 0;
    };
};