// NVG's are defined within CfgWeapons
// The Facewear Version is defined in CfgGlasses

class CfgGlasses {
    class None;

    class PVAR(cig0): None {
        scope = 2;
        author = CSTRING(author);
        mass = 0.02;
        displayName = CSTRING(cigarette0);
        model = PATH_TO_ADDON_3(data,cigs,cig0.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig0_x_ca);
        identityTypes[] = {};

        PVAR(type) = "cigarette";
        PVAR(maxTime) = 330;
        PVAR(initStateTime) = 0;
        PVAR(nextState) = QPVAR(cig1);
        PVAR(isSmokeable) = 1;
    };

    class PVAR(cig1): PVAR(cig0) {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigarette (Stage 1)";
        model = PATH_TO_ADDON_3(data,cigs,cig1.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig1_x_ca);

        PVAR(initStateTime) = 6;
        PVAR(nextState) = QPVAR(cig2);
        PVAR(isSmokeable) = 1;
    };

    class PVAR(cig2): PVAR(cig0) {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigarette (Stage 2)";
        model = PATH_TO_ADDON_3(data,cigs,cig2.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig2_x_ca);

        PVAR(initStateTime) = 66;
        PVAR(nextState) = QPVAR(cig3);
        PVAR(isSmokeable) = 1;
    };

    class PVAR(cig3): PVAR(cig0) {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigarette (Stage 3)";
        model = PATH_TO_ADDON_3(data,cigs,cig3.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig3_x_ca);

        PVAR(initStateTime) = 126;
        PVAR(nextState) = QPVAR(cig4);
        PVAR(isSmokeable) = 1;
    };

    class PVAR(cig4): PVAR(cig0) {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigarette (Stage 4)";
        model = PATH_TO_ADDON_3(data,cigs,cig4.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cig4_x_ca);

        PVAR(initStateTime) = 306;
        PVAR(nextState) = "";
        PVAR(isSmokeable) = 1;
    };

    class PVAR(cigar0): None {
        scope = 2;
        author = CSTRING(author);
        mass = 0.1;
        displayName = "Cigar";
        model = PATH_TO_ADDON_3(data,cigars,cigar0.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar0_x_ca);
        identityTypes[] = {};

        PVAR(type) = "cigar";
        PVAR(maxTime) = 660;
        PVAR(initStateTime) = 0;
        PVAR(nextState) = QPVAR(cigar1);
        PVAR(isSmokeable) = 1;
    };

    class PVAR(cigar1): PVAR(cigar0) {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigar (Stage 1)";
        model = PATH_TO_ADDON_3(data,cigars,cigar1.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar1_x_ca);

        PVAR(initStateTime) = 12;
        PVAR(nextState) = QPVAR(cigar2);
        PVAR(isSmokeable) = 1;
    };

    class PVAR(cigar2): PVAR(cigar0) {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigar (Stage 2)";
        model = PATH_TO_ADDON_3(data,cigars,cigar2.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar2_x_ca);

        PVAR(initStateTime) = 132;
        PVAR(nextState) = QPVAR(cigar3);
        PVAR(isSmokeable) = 1;
    };

    class PVAR(cigar3): PVAR(cigar0) {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigar (Stage 3)";
        model = PATH_TO_ADDON_3(data,cigars,cigar3.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar3_x_ca);

        PVAR(initStateTime) = 252;
        PVAR(nextState) = QPVAR(cigar4);
        PVAR(isSmokeable) = 1;
    };

    class PVAR(cigar4): PVAR(cigar0) {
        scope = 1;
        author = CSTRING(author);
        displayName = "Cigar (Stage 4)";
        model = PATH_TO_ADDON_3(data,cigars,cigar4.p3d);
        picture = PATH_TO_ADDON_3(data,ui,gear_cigar4_x_ca);

        PVAR(initStateTime) = 612;
        PVAR(nextState) = "";
        PVAR(isSmokeable) = 1;
    };
};