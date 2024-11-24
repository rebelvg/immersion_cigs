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

// I dont remember why this waits for cba settings :harold:

private _code = {

    [QGVAR(EH_sound), FUNC(sound)] call CBA_fnc_addEventHandler;
    [QGVAR(EH_start_cig), FUNC(start_cig)] call CBA_fnc_addEventHandler;
    [QGVAR(EH_notify), CBA_fnc_notify] call CBA_fnc_addEventHandler;
    [QGVAR(EH_smoke), FUNC(smoke)] call CBA_fnc_addEventHandler;


    if (!hasInterface) exitWith {};

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
                (((goggles _target) in GVAR(cigsArray)) || ((hmd _target) in GVAR(cigsArray))) && !(_target getVariable [QGVAR(cigLitUp), false]) && (alive _target)
            }
        ] call ace_interact_menu_fnc_createAction;

        ["CAManBase", 0, ["ACE_Head"], _action, true] call ace_interact_menu_fnc_addActionToClass;
    };

    // reset cigLitUp variable on respawn
    player addEventHandler ["Respawn", { player setVariable [QGVAR(cigLitUp), false]; }];

    // why? :sus:
    player addEventHandler ["InventoryClosed", {
        params ["_unit", "_container"];
        if (goggles _unit in GVAR(cigsArray) && hmd _unit in GVAR(cigsArray)) then {
            _unit addItem (hmd _unit);
            _unit unlinkItem (hmd _unit);
        };
    }];


    // Add items to Player in SP
    ["unit", {
        params ["_player"];
        if (!isMultiplayer && !is3DENPreview && GVAR(giveItems_SP)) then {
            _player addItem "murshun_cigs_cigpack";
            _player addItem "murshun_cigs_lighter";
        };
    },true] call CBA_fnc_addPlayerEventHandler;
};

if (missionNamespace getVariable ["cba_settings_ready",false]) then _code else { ["CBA_settingsInitialized",_code,[]] call CBA_fnc_addEventHandler; };

