#include "../script_component.hpp"

/*
* Author: Zorn
* Recursive Function to handle the smoking of the Cigs. Triggers Smoke Particles
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

params ["_unit","_cigTime","_cigTypeGear","_maxTime"];

////////////////////////////////////////
// Update Current variables
////////////////////////////////////////
private ["_current_cig", "_cigConfig"];

switch (_cigTypeGear) do {
    case ("GOGGLES"): {
        _current_cig = goggles _unit;
        _cigConfig = configFile >> "CfgGlasses" >> _current_cig;
    };
    case ("HMD"): {
        _current_cig = hmd _unit;
        _cigConfig = configFile >> "CfgWeapons" >> _current_cig;
    };
};
////////////////////////////////////////
// Smoke Particles & Effects
////////////////////////////////////////
[QGVAR(EH_smoke), [_unit, _cigConfig]] call CBA_fnc_globalEvent;
_unit setFatigue (getFatigue _unit + 0.01);



////////////////////////////////////////
// Get NextCigState
////////////////////////////////////////

private _gogglesNew = "";
private _nextCigState = getText (_cigConfig >> QPVAR(nextState));


private _nextCigStateTime = 0;

switch (_cigTypeGear) do {
    case ("GOGGLES"): { _nextCigStateTime = getNumber (configFile >> "CfgGlasses" >> _nextCigState >> QPVAR(initStateTime));  };
    case ("HMD"):     { _nextCigStateTime = getNumber (configFile >> "CfgWeapons" >> _nextCigState >> QPVAR(initStateTime));  };
};


if (_cigTime >= _nextCigStateTime) then { _gogglesNew = _nextCigState; };

if (_gogglesNew != "") then {
    switch (_cigTypeGear) do {
        case ("GOGGLES"): {
            removeGoggles _unit;
            _unit addGoggles _gogglesNew;
            _cigConfig = configFile >> "CfgGlasses" >> _gogglesNew;
        };
        case ("HMD"): {
            _unit removeWeapon _current_cig;
            _unit addWeapon  _gogglesNew;
            _cigConfig = configFile >> "CfgWeapons" >> _gogglesNew;
        };
    };
    _current_cig = _gogglesNew;
};

////////////////////////////////////////
// Define Delay and Timers
////////////////////////////////////////


private _delay = (5.5 + random 2);
_cigTime = _cigTime + _delay;



_code = {

    params ["_unit","_cigTime","_current_cig","_cigTypeGear","_maxTime","_cigConfig"];


    // Fail/Break/Exit Conditions
    private _condition1 = (!(alive _unit && (_current_cig in GVAR(array_cigs)) && (_unit getVariable [QGVAR(cigLitUp), false]) && _cigTime <= _maxTime));
    private _condition2 = (_cigTypeGear == "GOGGLES" && _current_cig != goggles _unit);
    private _condition3 = (_cigTypeGear == "HMD"     && _current_cig != hmd     _unit);

    // Check for Fail Conditions

    if (  _condition1 ||_condition2 || _condition3 ) then {
        // IF fail condition detected
        [_unit, QEGVAR(anim,cig_out), 1] call FUNC(anim);
        _unit setVariable [QGVAR(cigLitUp), false, true];

        if (_cigTime >= _maxTime) then {
            switch (_cigTypeGear) do {
                case ("GOGGLES"): { removeGoggles _unit; };
                case ("HMD"):     { _unit removeWeapon (hmd _unit); };
            };
        };
    } else {
        [_unit,_cigTime,_cigTypeGear,_maxTime] call FUNC(smoking);
    };
};

[_code, [_unit,_cigTime,_current_cig,_cigTypeGear,_maxTime,_cigConfig], _delay] call CBA_fnc_waitAndExecute;

