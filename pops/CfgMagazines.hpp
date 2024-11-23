class CfgMagazines {
    class CA_Magazine;

    class immersion_pops_poppack: CA_Magazine {
        author = "$STR_immersion_pops_author";
        scope = 2;

        displayName = "$STR_immersion_pops_poppack";
        descriptionShort = "$STR_immersion_pops_poppack_desc";
        model = "\immersion_pops\cigpack.p3d";
        picture = "\immersion_pops\UI\gear_cigpack_x_ca";

        ammo = "";
        count = 1;
        initSpeed = 0;
        tracersEvery = 0;
        lastRoundsTracer = 0;
        mass = 0.2;
    };
};