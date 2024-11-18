class CfgMagazines {
    class CA_Magazine;
    class murshun_cigs_matches: CA_Magazine {
        author = "$STR_murshun_cigs_author";
        scope = 2;

        displayName = "$STR_murshun_cigs_matches";
        descriptionShort = "$STR_murshun_cigs_matches_descr";
        model = PATH_TO_ADDON_3(data,matches,matches.paa);
        picture = PATH_TO_ADDON_3(data,ui,gear_matches_x_ca.paa);

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
        model = PATH_TO_ADDON_3(data,lighter,lighter.paa);
        picture = PATH_TO_ADDON_3(data,ui,gear_lighter_x_ca.paa);

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
        model = PATH_TO_ADDON_3(data,cigpack,cigpack.paa);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigpack_x_ca.paa);

        ammo = "";
        count = 20;
        initSpeed = 0;
        tracersEvery = 0;
        lastRoundsTracer = 0;
        mass = 2;
    };
};