#include "../script_component.hpp"

/*
* Author: Zorn
* Function to use an item ?
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

params ["_unit", "_player"];

if (!("murshun_cigs_matches" in (magazines _player)) && !("murshun_cigs_lighter" in (magazines _player))) exitWith {
    [QGVAR(EH_notify), [localize "STR_murshun_cigs_no_matches_or_lighter", 2.5], _player] call CBA_fnc_targetEvent;
    false
};

switch (true) do {
case ("murshun_cigs_lighter" in (magazines _player)): {
        [_player, "murshun_cigs_lighter"] call FUNC(removeItemFromMag);
        [QGVAR(EH_sound), [QGVAR(lighter_01),_player]] call CBA_fnc_globalEvent;
    };
case ("murshun_cigs_matches" in (magazines _player)): {
        [_player, "murshun_cigs_matches"] call FUNC(removeItemFromMag);
        [QGVAR(EH_sound), [QGVAR(matches_01),_player]] call CBA_fnc_globalEvent;
    };
};
true

