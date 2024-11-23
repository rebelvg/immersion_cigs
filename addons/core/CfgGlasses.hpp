class CfgGlasses {
    class None;

    class murshun_cigs_cig0: None {
        scope = 2;
        author = CSTRING(author);
        mass = 0.02;
        displayName = CSTRING(cigarette0);
        model = PATH_TO_ADDON_3(data,cigs,cig0.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig0_x_ca);
        identityTypes[] = {};

        immersion_cigs_type = "cigarette";
        immersion_cigs_maxTime = 330;
        immersion_cigs_initStateTime = 0;
        immersion_cigs_nextState = "murshun_cigs_cig1";
        immersion_cigs_isCig = 1;
    };

    class murshun_cigs_cig1: murshun_cigs_cig0 {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigarette (Stage 1)";
        model = PATH_TO_ADDON_3(data,cigs,cig1.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig1_x_ca);

        immersion_cigs_initStateTime = 6;
        immersion_cigs_nextState = "murshun_cigs_cig2";
        immersion_cigs_isCig = 1;
    };

    class murshun_cigs_cig2: murshun_cigs_cig0 {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigarette (Stage 2)";
        model = PATH_TO_ADDON_3(data,cigs,cig2.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig2_x_ca);

        immersion_cigs_initStateTime = 66;
        immersion_cigs_nextState = "murshun_cigs_cig3";
        immersion_cigs_isCig = 1;
    };

    class murshun_cigs_cig3: murshun_cigs_cig0 {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigarette (Stage 3)";
        model = PATH_TO_ADDON_3(data,cigs,cig3.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig3_x_ca);

        immersion_cigs_initStateTime = 126;
        immersion_cigs_nextState = "murshun_cigs_cig4";
        immersion_cigs_isCig = 1;
    };

    class murshun_cigs_cig4: murshun_cigs_cig0 {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigarette (Stage 4)";
        model = PATH_TO_ADDON_3(data,cigs,cig4.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig4_x_ca);

        immersion_cigs_initStateTime = 306;
        immersion_cigs_nextState = "";
        immersion_cigs_isCig = 1;
    };

    class immersion_cigs_cigar0: None {
        scope = 2;
        author = CSTRING(author);
        mass = 0.1;
        displayName = "Cigar";
        model = PATH_TO_ADDON_3(data,cigars,cigar0.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar0_x_ca);
        identityTypes[] = {};

        immersion_cigs_type = "cigar";
        immersion_cigs_maxTime = 660;
        immersion_cigs_initStateTime = 0;
        immersion_cigs_nextState = "immersion_cigs_cigar1";
        immersion_cigs_isCig = 1;
    };

    class immersion_cigs_cigar1: immersion_cigs_cigar0 {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigar (Stage 1)";
        model = PATH_TO_ADDON_3(data,cigars,cigar1.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar1_x_ca);

        immersion_cigs_initStateTime = 12;
        immersion_cigs_nextState = "immersion_cigs_cigar2";
        immersion_cigs_isCig = 1;
    };

    class immersion_cigs_cigar2: immersion_cigs_cigar0 {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigar (Stage 2)";
        model = PATH_TO_ADDON_3(data,cigars,cigar2.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar2_x_ca);

        immersion_cigs_initStateTime = 132;
        immersion_cigs_nextState = "immersion_cigs_cigar3";
        immersion_cigs_isCig = 1;
    };

    class immersion_cigs_cigar3: immersion_cigs_cigar0 {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigar (Stage 3)";
        model = PATH_TO_ADDON_3(data,cigars,cigar3.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar3_x_ca);

        immersion_cigs_initStateTime = 252;
        immersion_cigs_nextState = "immersion_cigs_cigar4";
        immersion_cigs_isCig = 1;
    };

    class immersion_cigs_cigar4: immersion_cigs_cigar0 {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigar (Stage 4)";
        model = PATH_TO_ADDON_3(data,cigars,cigar4.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar4_x_ca);

        immersion_cigs_initStateTime = 612;
        immersion_cigs_nextState = "";
        immersion_cigs_isCig = 1;
    };
};