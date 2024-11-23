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

private _code = {
    [QGVAR(EH_sound), {
        params ["_sound", "_source"];
        diag_log _this;
        _source say3D _sound;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(EH_start_cig), {
        _this call FUNC(start_cig);
        diag_log _this;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(EH_notify), CBA_fnc_notify] call CBA_fnc_addEventHandler;


    if (!hasInterface) exitWith {};

    [QGVAR(EH_smoke), {
        diag_log _this;
        _this call FUNC(smoke);
    }] call CBA_fnc_addEventHandler;

    if !(isClass (configFile >> "CfgPatches" >> "ace_interact_menu")) then {

        // Add Vanilla Actions when ace not loaded
        [] call FUNC(addVanillaActions);
        player addEventHandler ["Respawn", FUNC(addVanillaActions)];

    } else {

        // Add Ace Interactions when ace loaded
        private _action = [
            "murshun_cigs_start_someones_cig",
            LLSTRING(start_someones_cig),
            "murshun_cigs\UI\light_cig.paa",
            {
                params ["_target", "_player"];
                [_target, _player] call FUNC(start_cig_their);
            },
            {
                params ["_target", "_player"];
                (((goggles _target) in GVAR(cigsArray)) || ((hmd _target) in GVAR(cigsArray))) && !(_target getVariable ['murshun_cigs_cigLitUp', false]) && (alive _target)
            }
        ] call ace_interact_menu_fnc_createAction;

        ["CAManBase", 0, ["ACE_Head"], _action, true] call ace_interact_menu_fnc_addActionToClass;
    };

    player addEventHandler ["Respawn", { player setVariable [QGVAR(cigLitUp), false]; }];

    player addEventHandler ["InventoryClosed", {
        params ["_unit", "_container"];

        if (goggles _unit in GVAR(cigsArray) && hmd _unit in GVAR(cigsArray)) then {
            _unit addItem (hmd _unit);
            _unit unlinkItem (hmd _unit);
        };
    }];

    ["unit", {
        params ["_player"];
        if (!isMultiplayer && !is3DENPreview && GVAR(giveItems_SP)) then {
            _player addItem "murshun_cigs_cigpack";
            _player addItem "murshun_cigs_lighter";
        };
    },true] call CBA_fnc_addPlayerEventHandler;
};

if (missionNamespace getVariable ["cba_settings_ready",false]) then _code else { ["CBA_settingsInitialized",_code,[]] call CBA_fnc_addEventHandler; };

