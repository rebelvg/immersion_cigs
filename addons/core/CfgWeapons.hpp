class CfgWeapons {
	class NVGoggles;

    class murshun_cigs_cig0_nv: NVGoggles {
        scope = 2;
        author = "$STR_murshun_cigs_author";
        mass = 0.02;
        displayName = "$STR_murshun_cigs_cigarette0_nv";
        descriptionShort = "";
        model = PATH_TO_ADDON_3(data,cigs,cig0.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig0_x_ca);
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
    		uniformModel = PATH_TO_ADDON_3(data,cigs,cig0.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigs,cig0.p3d);
            mass = 0.02;
        };
    };



    class murshun_cigs_cig1_nv: murshun_cigs_cig0_nv {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigarette (Stage 1)";
        model = PATH_TO_ADDON_3(data,cigs,cig1.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig1_x_ca);

        immersion_cigs_initStateTime = 6;
        immersion_cigs_nextState = "murshun_cigs_cig2_nv";
        immersion_cigs_isCig = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,cigs,cig1.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigs,cig1.p3d);
        };
    };

    class murshun_cigs_cig2_nv: murshun_cigs_cig0_nv {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigarette (Stage 2)";
        model = PATH_TO_ADDON_3(data,cigs,cig2.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig2_x_ca);

        immersion_cigs_initStateTime = 66;
        immersion_cigs_nextState = "murshun_cigs_cig3_nv";
        immersion_cigs_isCig = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,cigs,cig2.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigs,cig2.p3d);
        };
    };

    class murshun_cigs_cig3_nv: murshun_cigs_cig0_nv {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigarette (Stage 3)";
        model = PATH_TO_ADDON_3(data,cigs,cig3.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig3_x_ca);

        immersion_cigs_initStateTime = 126;
        immersion_cigs_nextState = "murshun_cigs_cig4_nv";
        immersion_cigs_isCig = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,cigs,cig3.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigs,cig3.p3d);
        };
    };

    class murshun_cigs_cig4_nv: murshun_cigs_cig0_nv {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigarette (Stage 4)";
        model = PATH_TO_ADDON_3(data,cigs,cig4.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig4_x_ca);

        immersion_cigs_initStateTime = 306;
        immersion_cigs_nextState = "";
        immersion_cigs_isCig = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,cigs,cig4.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigs,cig4.p3d);
        };
    };

    class immersion_cigs_cigar0_nv: NVGoggles {
        scope = 2;
        author = "$STR_murshun_cigs_author";
        mass = 0.1;
        displayName = "Cigar (NVG Slot)";
        model = PATH_TO_ADDON_3(data,cigars,cigar0.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar0_x_ca);
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
    		uniformModel = PATH_TO_ADDON_3(data,cigars,cigar0.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigars,cigar0.p3d);
        };
    };

    class immersion_cigs_cigar1_nv: immersion_cigs_cigar0_nv {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigar (Stage 1)";
        model = PATH_TO_ADDON_3(data,cigars,cigar1.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar1_x_ca);

        immersion_cigs_initStateTime = 12;
        immersion_cigs_nextState = "immersion_cigs_cigar2_nv";
        immersion_cigs_isCig = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,cigars,cigar1.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigars,cigar1.p3d);
        };
    };

    class immersion_cigs_cigar2_nv: immersion_cigs_cigar0_nv {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigar (Stage 2)";
        model = PATH_TO_ADDON_3(data,cigars,cigar2.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar2_x_ca);

        immersion_cigs_initStateTime = 132;
        immersion_cigs_nextState = "immersion_cigs_cigar3_nv";
        immersion_cigs_isCig = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,cigars,cigar2.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigars,cigar2.p3d);
        };
    };

    class immersion_cigs_cigar3_nv: immersion_cigs_cigar0_nv {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigar (Stage 3)";
        model = PATH_TO_ADDON_3(data,cigars,cigar3.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar3_x_ca);

        immersion_cigs_initStateTime = 252;
        immersion_cigs_nextState = "immersion_cigs_cigar4_nv";
        immersion_cigs_isCig = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,cigars,cigar3.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigars,cigar3.p3d);
        };
    };

    class immersion_cigs_cigar4_nv: immersion_cigs_cigar0_nv {
        scope = 1;
        author = "$STR_murshun_cigs_author";
        displayName = "Cigar (Stage 4)";
        model = PATH_TO_ADDON_3(data,cigars,cigar4.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar4_x_ca);

        immersion_cigs_initStateTime = 612;
        immersion_cigs_nextState = "";
        immersion_cigs_isCig = 1;

        class ItemInfo
        {
            type = 616;
            hmdType = 0;
    		uniformModel = PATH_TO_ADDON_3(data,cigars,cigar4.p3d);
	    	modelOff = PATH_TO_ADDON_3(data,cigars,cigar4.p3d);
        };
    };
};