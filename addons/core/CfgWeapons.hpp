// NVG's are defined within CfgWeapons
// The Facewear Version is defined in CfgGoggles

class CfgWeapons {
	class NVGoggles;

    class PVAR(cig0_nv): NVGoggles {
        scope = 2;
        author = CSTRING(author);
        mass = 0.02;
        displayName = CSTRING(cigarette0_nv);
        descriptionShort = "";
        model = PATH_TO_ADDON_3(data,cigs,cig0.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig0_x_ca);
        visionMode[] = {"Normal"};
		thermalMode[] = {0};
		modelOptics[] = {};
		opticsPPEffects[] = {};

        PVAR(type) = "cigarette";
        PVAR(maxTime) = 330;
        PVAR(initStateTime) = 0;
        PVAR(nextState) = QPVAR(cig1_nv);

        PVAR(isSmokeable) = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,cigs,cig0.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigs,cig0.p3d);
            mass = 0.02;
        };
    };



    class PVAR(cig1_nv): PVAR(cig0_nv) {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigarette (Stage 1)";
        model = PATH_TO_ADDON_3(data,cigs,cig1.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig1_x_ca);

        PVAR(initStateTime) = 6;
        PVAR(nextState) = QPVAR(cig2_nv);
        PVAR(isSmokeable) = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,cigs,cig1.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigs,cig1.p3d);
        };
    };

    class PVAR(cig2_nv): PVAR(cig0_nv) {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigarette (Stage 2)";
        model = PATH_TO_ADDON_3(data,cigs,cig2.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig2_x_ca);

        PVAR(initStateTime) = 66;
        PVAR(nextState) = QPVAR(cig3_nv);
        PVAR(isSmokeable) = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,cigs,cig2.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigs,cig2.p3d);
        };
    };

    class PVAR(cig3_nv): PVAR(cig0_nv) {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigarette (Stage 3)";
        model = PATH_TO_ADDON_3(data,cigs,cig3.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig3_x_ca);

        PVAR(initStateTime) = 126;
        PVAR(nextState) = QPVAR(cig4_nv);
        PVAR(isSmokeable) = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,cigs,cig3.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigs,cig3.p3d);
        };
    };

    class PVAR(cig4_nv): PVAR(cig0_nv) {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigarette (Stage 4)";
        model = PATH_TO_ADDON_3(data,cigs,cig4.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig4_x_ca);

        PVAR(initStateTime) = 306;
        PVAR(nextState) = "";
        PVAR(isSmokeable) = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,cigs,cig4.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigs,cig4.p3d);
        };
    };

    class PVAR(cigar0)_nv: NVGoggles {
        scope = 2;
        author = CSTRING(author);
        mass = 0.1;
        displayName = "Cigar (NVG Slot)";
        model = PATH_TO_ADDON_3(data,cigars,cigar0.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar0_x_ca);
        visionMode[] = {"Normal"};
		thermalMode[] = {0};
		modelOptics[] = {};
		opticsPPEffects[] = {};

        PVAR(type) = "cigar";
        PVAR(maxTime) = 660;
        PVAR(initStateTime) = 0;
        PVAR(nextState) = QPVAR(cigar1_nv);
        PVAR(isSmokeable) = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,cigars,cigar0.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigars,cigar0.p3d);
        };
    };

    class PVAR(cigar1_nv): PVAR(cigar0_nv) {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigar (Stage 1)";
        model = PATH_TO_ADDON_3(data,cigars,cigar1.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar1_x_ca);

        PVAR(initStateTime) = 12;
        PVAR(nextState) = QPVAR(cigar2_nv);
        PVAR(isSmokeable) = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,cigars,cigar1.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigars,cigar1.p3d);
        };
    };

    class PVAR(cigar2_nv): PVAR(cigar0_nv) {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigar (Stage 2)";
        model = PATH_TO_ADDON_3(data,cigars,cigar2.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar2_x_ca);

        PVAR(initStateTime) = 132;
        PVAR(nextState) = QPVAR(cigar3_nv);
        PVAR(isSmokeable) = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,cigars,cigar2.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigars,cigar2.p3d);
        };
    };

    class PVAR(cigar3_nv): PVAR(cigar0_nv) {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigar (Stage 3)";
        model = PATH_TO_ADDON_3(data,cigars,cigar3.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar3_x_ca);

        PVAR(initStateTime) = 252;
        PVAR(nextState) = QPVAR(cigar4_nv);
        PVAR(isSmokeable) = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,cigars,cigar3.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigars,cigar3.p3d);
        };
    };

    class PVAR(cigar4_nv): PVAR(cigar0_nv) {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigar (Stage 4)";
        model = PATH_TO_ADDON_3(data,cigars,cigar4.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar4_x_ca);

        PVAR(initStateTime) = 612;
        PVAR(nextState) = "";
        PVAR(isSmokeable) = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,cigars,cigar4.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigars,cigar4.p3d);
        };
    };
};