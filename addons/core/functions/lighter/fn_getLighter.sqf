#include "../../script_component.hpp"

/*
* Author: Zorn
* Function to get the first found Lighter Classname and Type (magazine(finite) or Item(infinite))
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

private "_index";

// Check for Finite Lighters
private _magazines = magazines _player;
_index = _magazines findIf { getNumber (configFile >> "CfgMagazines" >> _x >> QPVAR(isLighter) ) == 1};
if (_index > -1) exitWith { [_magazines select _index, "typeMagazine"] };

// Check for Infinite Lighters
private _items = items _player;
_index = _items findIf { getNumber (configFile >> "CfgWeapons" >> _x >> QPVAR(isLighter) ) == 1};
if (_index > -1) exitWith { [_items select _index, "typeItem"] };

// return when no lighter found
[false, false]