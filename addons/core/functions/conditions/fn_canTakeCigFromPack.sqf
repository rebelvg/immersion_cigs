#include "../../script_component.hpp"

/*
* Author: Zorn
* Checks if the unit can takea a cig from a pack
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
QPVAR(cigpack) in (magazines _unit)
