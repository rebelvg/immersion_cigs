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
    localize "STR_murshun_cigs_start_cig",
    {
        params ["_target", "_caller"];
        [_caller] call FUNC(start_cig_your);    //murshun_cigs_fnc_start_cig_your
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
    localize "STR_murshun_cigs_stop_cig", 
    {
        params ["_target", "_caller"];
        [_caller] call FUNC(stop_cig)   //murshun_cigs_fnc_stop_cig
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
    localize "STR_murshun_cigs_take_cig_from_pack", 
    {
        params ["_target", "_caller"];
        [_caller] call FUNC(take_cig_from_pack);    //murshun_cigs_fnc_take_cig_from_pack
    }, 
    nil, 
    0, 
    false, 
    true, 
    "", 
    "if (_target != player) exitWith {false}; 'murshun_cigs_cigpack' in (magazineCargo uniformContainer player) || 'murshun_cigs_cigpack' in (magazineCargo vestContainer player)", 
    5, 
    false
];


player addAction [
    localize "STR_murshun_cigs_start_someones_cig", 
    {
        params ["_target", "_caller"];
        [cursorObject, _caller] call FUNC(start_cig_their);        //murshun_cigs_fnc_start_cig_their
    }, 
    nil, 
    0, 
    false, 
    true, 
    "", 
    "if !(cursorObject isKindOf 'Man') exitWith {false}; ((hmd cursorObject) in GVAR(cigsArray)) && !(cursorObject getVariable ['murshun_cigs_cigLitUp', false]) && (alive cursorObject)", 
    5, 
    false
];
