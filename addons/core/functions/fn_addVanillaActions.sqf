#include "../script_component.hpp"

/*
* Author: Zorn
* Function to add the Vanilla Actions
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', 
player] call prefix_component_fnc_functionname
*
* Public: No
*/


player addAction [
    LLSTRING(start_cig),
    {
        params ["_target", "_caller"];
        [_caller] call FUNC(start_cig_your);
    },
    nil,
    0,
    false,
    true, 
    "", 
    Q(if (_target != player) exitWith {false}; [_this] call FUNC(canStartSmoking);), 
    5, 
    false
];


player addAction [
    LLSTRING(stop_cig), 
    {
        params ["_target", "_caller"];
        [_caller] call FUNC(stop_cig);
    }, 
    nil, 
    0, 
    false, 
    true, 
    "", 
    Q(if (_target != player) exitWith {false}; [_this] call FUNC(canStopSmoking);), 
    5, 
    false
];


player addAction [
    LLSTRING(take_cig_from_pack), 
    {
        params ["_target", "_caller"];
        [_caller] call FUNC(take_cig_from_pack);
    }, 
    nil, 
    0, 
    false, 
    true, 
    "",
    Q(if (_target != player) exitWith {false}; QQEGVAR(morley,cigpack) in (magazineCargo uniformContainer player) || QQEGVAR(morley,cigpack) in (magazineCargo vestContainer player)), 
    5, 
    false
];


player addAction [
    LLSTRING(start_someones_cig), 
    {
        params ["_target", "_caller"];
        [cursorObject, _caller] call FUNC(start_cig_their);
    }, 
    nil, 
    0, 
    false, 
    true, 
    "",
    "", //QUOTE(if !(cursorObject isKindOf 'Man') exitWith {false}; ((hmd cursorObject) in GVAR(array_cigs)) && !(cursorObject getVariable [QQPVAR(cigLitUp), false]) && (alive cursorObject)), // TO DO LATER
    5, 
    false
];
