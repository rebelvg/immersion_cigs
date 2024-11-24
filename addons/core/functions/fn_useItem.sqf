#include "../script_component.hpp"

/*
* Author: Zorn
* Function to check if the unit can light a cig. If yes, play sound and remove 1 unit from "magazine"
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


/*
TODO:
A: I can use a switch statement to check for these two specific classes, 
B: or i check all inventory items if they have a new class property, like GVAR(isLighter).
--> This way, a compat can be very easily achieved by simply adding the class property to any item
---> likely will need to get the parent classes or something so i can get the right path?
*/

// ["aRifle_AK12_F"] call CBA_fnc_getItemConfig to get the config path of any item
// isNumber
// getNumber 

if (!("murshun_cigs_matches" in (magazines _player)) && !("murshun_cigs_lighter" in (magazines _player))) exitWith {
    [QGVAR(EH_notify), [LLSTRING(no_matches_or_lighter), 2.5], _player] call CBA_fnc_targetEvent;
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
 
