class CfgVehicles
{
    class Man;
    class CAManBase: Man
    {
        class ACE_SelfActions
        {
            class ACE_Equipment {
                class immersion_pops_start_cig
                {
                    displayName = "$STR_immersion_pops_start_cig";
                    condition = "((goggles _player) in immersion_pops_cigsArray) && !(_player getVariable ['immersion_pops_cigLitUp', false])";
                    statement = "[_player] spawn immersion_pops_fnc_start_cig_your";
                    showDisabled = 0;
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    icon = "immersion_pops\UI\light_cig.paa";
                };

                class immersion_pops_stop_cig
                {
                    displayName = "$STR_immersion_pops_stop_cig";
                    condition = "((goggles _player) in immersion_pops_cigsArray) && (_player getVariable ['immersion_pops_cigLitUp', false])";
                    statement = "[_player] spawn immersion_pops_fnc_stop_cig";
                    showDisabled = 0;
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    icon = "immersion_pops\UI\light_cig.paa";
                };

                class immersion_pops_take_cig_from_pack
                {
                    displayName = "$STR_immersion_pops_take_cig_from_pack";
                    condition = "'immersion_pops_poppack' in (magazines _player)";
                    statement = "[_player] spawn immersion_pops_fnc_take_cig_from_pack";
                    showDisabled = 0;
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    icon = "immersion_pops\UI\take_cig.paa";
                };
            };
        };
    };

    class WeaponHolder_Single_limited_item_F;

    class GVAR(poppackItem): WeaponHolder_Single_limited_item_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(poppack);
        author = CSTRING(author);
        vehicleClass = "Magazines";

        class TransportMagazines {
            class GVAR(poppack) {
                magazine = QGVAR(poppack);
                count = 1;
            };
        };
    };
};