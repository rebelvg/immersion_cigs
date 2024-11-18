class CfgVehicles
{
    class Man;
    class CAManBase: Man
    {
        class ACE_SelfActions
        {
            class ACE_Equipment {
                class murshun_cigs_start_cig
                {
                    displayName = "$STR_murshun_cigs_start_cig";
                    condition = Q([_player] call FUNC(canStartSmoking));
                    statement = Q([_player] call FUNC(start_cig_your));
                    showDisabled = 0;
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    icon = PATH_TO_ADDON_3(data,ui,light_cig.paa);
                };
                class murshun_cigs_stop_cig
                {
                    displayName = "$STR_murshun_cigs_stop_cig";
                    condition = Q([_player] call FUNC(canStopSmoking));
                    statement = Q([_player] call FUNC(stop_cig));
                    showDisabled = 0;
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    icon = PATH_TO_ADDON_3(data,ui,light_cig.paa);
                };
                class murshun_cigs_take_cig_from_pack
                {
                    displayName = "$STR_murshun_cigs_take_cig_from_pack";
                    condition = Q([_player] call FUNC(canTakeCigFromPack));
                    statement = Q([_player] call FUNC(take_cig_from_pack));
                    showDisabled = 0;
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    icon = PATH_TO_ADDON_3(data,ui,take_cig.paa);
                };
            };
        };
    };

    class WeaponHolder_Single_limited_item_F;

    class murshun_cigs_matchesItem: WeaponHolder_Single_limited_item_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "$STR_murshun_cigs_matches";
        author = "$STR_murshun_cigs_author";
        vehicleClass = "Magazines";

        class TransportMagazines {
            class murshun_cigs_matches {
                magazine = "murshun_cigs_matches";
                count = 1;
            };
        };
    };

    class murshun_cigs_lighterItem: WeaponHolder_Single_limited_item_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "$STR_murshun_cigs_lighter";
        author = "$STR_murshun_cigs_author";
        vehicleClass = "Magazines";

        class TransportMagazines {
            class murshun_cigs_lighter {
                magazine = "murshun_cigs_lighter";
                count = 1;
            };
        };
    };

    class murshun_cigs_cigpackItem: WeaponHolder_Single_limited_item_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "$STR_murshun_cigs_cigpack";
        author = "$STR_murshun_cigs_author";
        vehicleClass = "Magazines";

        class TransportMagazines {
            class murshun_cigs_cigpack {
                magazine = "murshun_cigs_cigpack";
                count = 1;
            };
        };
    };
};