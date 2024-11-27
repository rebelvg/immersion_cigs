class CfgGlasses {
    class None;

    class GVAR(pop0): None {
        author = CSTRING(author);
        mass = 0.2;
        displayName = CSTRING(pop0);
        model = PATH_TO_ADDON_3(data,pop,pop.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_pop0_x_ca.paa);
        identityTypes[] = {};

        PVAR(isSuckable) = 1;

        KJW_Imposters_SuspicionAmount = 0;
    };
};