#include "CfgPatches.hpp"

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
    class immersion_pops_poppackItem: WeaponHolder_Single_limited_item_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "$STR_immersion_pops_poppack";
        author = "$STR_immersion_pops_author";
        vehicleClass = "Magazines";

        class TransportMagazines {
            class immersion_pops_poppack {
                magazine = "immersion_pops_poppack";
                count = 1;
            };
        };
    };
};

class CfgMagazines {
    class CA_Magazine;
    class immersion_pops_poppack: CA_Magazine {
        author = "$STR_immersion_pops_author";
        scope = 2;

        displayName = "$STR_immersion_pops_poppack";
        descriptionShort = "$STR_immersion_pops_poppack_descr";
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

class CfgGlasses {
    class None;

    class immersion_pops_pop0: None {
        author = "$STR_immersion_pops_author";
        mass = 0.2;
        displayName = "$STR_immersion_pops_cigarette0";
        model = "\immersion_pops\cig0.p3d";
        picture = "\immersion_pops\UI\gear_cig0_x_ca";
        identityTypes[] = {};
    };
};

class CfgSounds
{
    sounds[] = {};

    class immersion_pops_unwrap
    {
        sound[] = {"\immersion_pops\immersion_pops_unwrap.ogg", 2, 1, 15};
        titles[] = {};
    };
    class immersion_pops_eat_01
    {
        sound[] = {"\immersion_pops\immersion_pops_eat_01.ogg", 2, 1, 15};
        titles[] = {};
    };
    class immersion_pops_eat_02
    {
        sound[] = {"\immersion_pops\immersion_pops_eat_02.ogg", 2, 1, 15};
        titles[] = {};
    };
    class immersion_pops_eat_03
    {
        sound[] = {"\immersion_pops\immersion_pops_eat_03.ogg", 2, 1, 15};
        titles[] = {};
    };
    class immersion_pops_eat_04
    {
        sound[] = {"\immersion_pops\immersion_pops_eat_04.ogg", 2, 1, 15};
        titles[] = {};
    };
    class immersion_pops_eat_05
    {
        sound[] = {"\immersion_pops\immersion_pops_eat_05.ogg", 2, 1, 15};
        titles[] = {};
    };
    class immersion_pops_eat_06
    {
        sound[] = {"\immersion_pops\immersion_pops_eat_06.ogg", 2, 1, 15};
        titles[] = {};
    };
    class immersion_pops_eat_07
    {
        sound[] = {"\immersion_pops\immersion_pops_eat_07.ogg", 2, 1, 15};
        titles[] = {};
    };
};

class CfgFunctions
{
    class immersion_pops
    {
        class functions
        {
            file = "immersion_pops\functions";
            class preInit
            {
                preInit = 1;
            };
            class postInit
            {
                postInit = 1;
            };
        };
    };
};
