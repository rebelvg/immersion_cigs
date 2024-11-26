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

(_unit getVariable [QGVAR(cigLitUp), false])
&& 
{
    getNumber (configFile >> "CfgGlasses" >> goggles _unit >> QPVAR(isSmokeable)) == 1
    ||
    {
        getNumber (configFile >> "CfgWeapons" >> hmd _unit >> QPVAR(isSmokeable)) == 1
    }
}