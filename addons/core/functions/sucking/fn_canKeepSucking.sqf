#include "../../script_component.hpp"

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

params ["_unit", "_itemType", "_currentItem", "_currentTime", "_maxTime"];


// Fail/Break/Exit Conditions => If this Function will return false, it will interrupt the smoking
_return = (
    // if the unit is dead
    alive _unit
    &&
    {
        ZRN_LOG_MSG(unit alive);
        // if the unit isnt sucking
        (_unit getVariable [QPVAR(isSucking), false])

        &&
        {
            ZRN_LOG_MSG(unit is sucking);
            // If current item is consumable
            switch (_itemType) do {
                case "GOGGLES": { getNumber (configFile >> "CfgGlasses" >> _currentItem >> QPVAR(isSuckable)) == 1 };
                case "HMD": { getNumber (configFile >> "CfgWeapons" >> _currentItem >> QPVAR(isSuckable)) == 1 };
                default { false };
            }
            &&
            {
                ZRN_LOG_MSG(item consumable);
                // If the suckingTime exeeced max succ time
                _currentTime <= _maxTime
                &&
                {
                    ZRN_LOG_MSG(still consuming);
                    // if the actual gear still the indented item
                    _isItem = switch (_itemType) do {
                        case "GOGGLES": { _currentItem == goggles _unit };
                        case "HMD":     { _currentItem == hmd     _unit };
                        default { false };
                    };
                    ZRN_LOG_1(_isItem);
                    _isItem
                }
            }
        }
    }
)

ZRN_LOG_1(_return);

_return