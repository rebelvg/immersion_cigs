#include "../../script_component.hpp"

/*
* Author: Zorn
* Checks if the unit can stop smoking
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

params ["_unit"];

(((goggles _unit) in GVAR(cigsArray)) || ((hmd _unit) in GVAR(cigsArray))) && (_unit getVariable [QGVAR(cigLitUp), false])
