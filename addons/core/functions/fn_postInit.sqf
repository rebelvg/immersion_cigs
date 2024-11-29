#include "../script_component.hpp"


/*
* Author: Zorn
* post Init Function
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/


// CBA Events
[QGVAR(EH_start_cig), FUNC(start_smoking)] call CBA_fnc_addEventHandler;

[QGVAR(EH_notify), CBA_fnc_notify] call CBA_fnc_addEventHandler;

[QGVAR(EH_sound), FUNC(sound)] call CBA_fnc_addEventHandler;
[QGVAR(EH_smoke), FUNC(smoke)] call CBA_fnc_addEventHandler;

// I dont remember why this waits for cba settings :harold:

if (!hasInterface) exitWith {};
private _code = {

    if !(isClass (configFile >> "CfgPatches" >> "ace_interact_menu")) then {

        // Add Vanilla Actions when ace not loaded
        [] call FUNC(addVanillaActions);
        player addEventHandler ["Respawn", FUNC(addVanillaActions)];

    } else {


        // Add Ace Interactions when ace loaded
        // TODO: Could be moved into config?

        private _action = [
            QGVAR(start_someones_cig),
            LLSTRING(start_someones_cig),
            PATH_TO_ADDON_3(data,ui,light_cig.paa),
            {
                params ["_target", "_player"];
                [_target, _player] call FUNC(start_cig_their);
            },
            {
                params ["_target", "_player"];
                (((goggles _target) in GVAR(array_cigs)) || ((hmd _target) in GVAR(array_cigs))) && !(_target getVariable [QPVAR(isSmoking), false]) && (alive _target)
            }
        ] call ace_interact_menu_fnc_createAction;

        ["CAManBase", 0, ["ACE_Head"], _action, true] call ace_interact_menu_fnc_addActionToClass;
    };

    // reset isSmoking/isSucking variable on respawn
    player addEventHandler ["Respawn", {
        player setVariable [QPVAR(isSmoking), false];
        player setVariable [QPVAR(isSucking), false];
    }];

    // if 2 suckable/smokable items are equipped, it will put the nvg one back in the inventory.
    player addEventHandler ["InventoryClosed", {
        params ["_unit", "_container"];
        if (
            (
                getNumber (configFile >> "CfgGlasses" >> goggles _unit >> QPVAR(isSmokable)) == 1
                ||
              { getNumber (configFile >> "CfgGlasses" >> goggles _unit >> QPVAR(isSuckable)) == 1 }
            )
            &&
            {
                getNumber (configFile >> "CfgWeapons" >> hmd     _unit >> QPVAR(isSmokable)) == 1
                ||
              { getNumber (configFile >> "CfgWeapons" >> hmd     _unit >> QPVAR(isSuckable)) == 1 }
            }
        ) then {
            _unit addItem (hmd _unit);
            _unit unlinkItem (hmd _unit);
        };
    }];
};

if (missionNamespace getVariable ["cba_settings_ready",false]) then _code else { ["CBA_settingsInitialized",_code,[]] call CBA_fnc_addEventHandler; };

