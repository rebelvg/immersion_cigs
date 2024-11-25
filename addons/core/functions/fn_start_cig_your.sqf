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
ZRN_LOG_1(_this);

params ["_player"];
if !( [_player] call FUNC(hasLighter) ) exitWith {};

[_player] call FUNC(useLighter);
[_player] call FUNC(start_smoking);

