#include "../script_component.hpp"

/*
* Author: Zorn
* [Description]
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

params ["_player"];
if !([_player, _player] call FUNC(useItem)) exitWith {};
[_player] call FUNC(_start_cig);
