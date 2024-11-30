class CfgMagazines {

    class vn_prop_base;

    // Convert to CigPack
    class vn_b_item_cigs_01: vn_prop_base {

        displayName = CSTRING(cigpack);
        descriptionShort = CSTRING(cigpack_desc);

        count = 16;

        PVAR(isPack) = 1;
        PVAR(unpackSound) = QPVAR(unwrap);
        PVAR(item_glasses) = QEGVAR(lucky_strike,cig0); // Can be replaced with sog specific cig texture and model later
        PVAR(item_hmd) = QEGVAR(lucky_strike,cig0_nv); // Can be replaced with sog specific cig texture and model later

        ACE_asItem = 1;
    };

    // Convert to Lighter
    class vn_b_item_lighter_01: vn_prop_base {

        count = 100;

        PVAR(isLighter) = 1;
        PVAR(LighterSound) = QPVAR(lighter_01);     // CfgSounds Class

        ACE_asItem = 1;
    };
};