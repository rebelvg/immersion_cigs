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
                statement = "";
                insertChildren = Q([_player] call FUNC(action_cigPack_children));
                showDisabled = 0;
                exceptions[] = {"isNotInside", "isNotSitting"};
                icon = PATH_TO_ADDON_3(data,ui,take_cig.paa);
            };
        };
    };
};
