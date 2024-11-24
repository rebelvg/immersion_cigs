class CfgVehicles
{
    class Man;
    class CAManBase: Man
    {
        class ACE_SelfActions
        {
            class ACE_Equipment {
                class PVAR(start_cig)
                {
                    displayName = CSTRING(start_cig);
                    condition = Q([_player] call FUNC(canStartSmoking));
                    statement = Q([_player] call FUNC(start_cig_your));
                    showDisabled = 0;
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    icon = PATH_TO_ADDON_3(data,ui,light_cig.paa);
                };
                class PVAR(stop_cig)
                {
                    displayName = CSTRING(stop_cig);
                    condition = Q([_player] call FUNC(canStopSmoking));
                    statement = Q([_player] call FUNC(stop_cig));
                    showDisabled = 0;
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    icon = PATH_TO_ADDON_3(data,ui,light_cig.paa);
                };
                class PVAR(take_cig_from_pack)
                {
                    displayName = CSTRING(take_cig_from_pack);
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

    class PVAR(matchesItem): WeaponHolder_Single_limited_item_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(matches);
        author = CSTRING(author);
        vehicleClass = "Magazines";

        class TransportMagazines {
            class PVAR(matches) {
                magazine = QPVAR(matches);
                count = 1;
            };
        };
    };

    class PVAR(lighterItem): WeaponHolder_Single_limited_item_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(lighter);
        author = CSTRING(author);
        vehicleClass = "Magazines";

        class TransportMagazines {
            class PVAR(lighter) {
                magazine = QPVAR(lighter);
                count = 1;
            };
        };
    };

    class PVAR(cigpackItem): WeaponHolder_Single_limited_item_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(cigpack);
        author = CSTRING(author);
        vehicleClass = "Magazines";

        class TransportMagazines {
            class PVAR(cigpack) {
                magazine = QPVAR(cigpack);
                count = 1;
            };
        };
    };
};