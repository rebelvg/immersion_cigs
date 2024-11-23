class CfgMagazines {
    class CA_Magazine;
    class murshun_cigs_matches: CA_Magazine {
        author = LSTRING(author);
        scope = 2;

        displayName = LSTRING(matches);
        descriptionShort = LSTRING(matches_desc);
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
        author = LSTRING(author);
        scope = 2;

        displayName = LSTRING(lighter);
        descriptionShort = LSTRING(lighter_desc);
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
        author = LSTRING(author);
        scope = 2;

        displayName = LSTRING(cigpack);
        descriptionShort = LSTRING(cigpack_desc);
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