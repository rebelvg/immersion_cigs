#include "../script_component.hpp"

/*
* Author: Zorn
* This function adds the CBA Context Menu for each item.
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

// array of all smokable classes
private _cigs_glasses = Q(getNumber (_x >> QQPVAR(isSmokeable)) == 1) configClasses (configFile >> "CfgGlasses") apply { configName _x };
private _cigs_hmd =     Q(getNumber (_x >> QQPVAR(isSmokeable)) == 1) configClasses (configFile >> "CfgWeapons") apply { configName _x };

// array of all suckable classes
private _pops_glasses = Q(getNumber (_x >> QQPVAR(isSuckable)) == 1) configClasses (configFile >> "CfgGlasses") apply { configName _x };
private _pops_hmd =     Q(getNumber (_x >> QQPVAR(isSuckable)) == 1) configClasses (configFile >> "CfgWeapons") apply { configName _x };

// array of all Package classes
private _packages = Q(getNumber (_x >> QQPVAR(isPack)) == 1) configClasses (configFile >> "CfgMagazines") apply { configName _x };


// Start Smoking

// Stop Smoking

// Start Sucking

// Stop Sucking

// Unpack Item


        ["#All", "ALL", ">DEBUG ACTION<", nil, nil, {true}, {
            params ["_unit", "_container", "_item", "_slot", "_params"];
            systemChat str [name _unit, typeOf _container, _item, _slot, _params];
            true
        }, false, [0,1,2]] call CBA_fnc_addItemContextMenuOption;