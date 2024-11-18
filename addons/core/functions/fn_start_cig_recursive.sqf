#include "../script_component.hpp"

/*
* Author: Zorn
* Main, recursive Function to handle the smoking of the Cigs. Triggers Smoke Particles
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

params ["_unit","_cigTime","_gogglesCurrent","_hmdCurrent","_cigTypeGear","_cigClass","_cigType","_maxTime"];

////////////////////////////////////////
// Smoke Particles & Effects
////////////////////////////////////////
[QGVAR(EH_smoke), [_unit, _cigType]] call CBA_fnc_globalEvent;
_unit setFatigue (getFatigue _unit + 0.01);


////////////////////////////////////////
// Update Current variables
////////////////////////////////////////

switch (_cigTypeGear) do {
    case ("GOGGLES"): { _gogglesCurrent = goggles _unit; _cigClass = configFile >> "CfgGlasses" >> _gogglesCurrent; };
    case ("HMD"):     {     _hmdCurrent = hmd     _unit; _cigClass = configFile >> "CfgWeapons" >> _hmdCurrent;     };
};

////////////////////////////////////////
// Get NextCigState
////////////////////////////////////////

private _gogglesNew = "";
private _nextCigState = getText (_cigClass >> "immersion_cigs_nextState");

private _nextCigStateTime = 0;

switch (_cigTypeGear) do {
    case ("GOGGLES"): { _nextCigStateTime = getNumber (configFile >> "CfgGlasses" >> _nextCigState >> "immersion_cigs_initStateTime");  };
    case ("HMD"):     { _nextCigStateTime = getNumber (configFile >> "CfgWeapons" >> _nextCigState >> "immersion_cigs_initStateTime");  };
};

if (_cigTime >= _nextCigStateTime) then {    _gogglesNew = _nextCigState;   };

if (_gogglesNew != "") then {
    switch (_cigTypeGear) do {
        case ("GOGGLES"): { removeGoggles _unit;            _unit addGoggles _gogglesNew;    };
        case ("HMD"):     { _unit removeWeapon _hmdCurrent; _unit addWeapon  _gogglesNew;    };
    };

    _gogglesCurrent = _gogglesNew;
    _hmdCurrent = _gogglesNew;
};

////////////////////////////////////////
// Define Delay and Timers
////////////////////////////////////////


private _delay = (5.5 + random 2);
_cigTime = _cigTime + _delay;



_code = {

    params ["_unit","_cigTime","_gogglesCurrent","_hmdCurrent","_cigTypeGear","_cigClass","_cigType","_maxTime"];


    // Fail/Break/Exit Conditions
    private _condition1 = (!(alive _unit && (_gogglesCurrent in GVAR(cigsArray) || _hmdCurrent in GVAR(cigsArray)) && (_unit getVariable [QGVAR(cigLitUp), false]) && _cigTime <= _maxTime));
    private _condition2 = (_cigTypeGear == "GOGGLES" && _gogglesCurrent != goggles _unit);
    private _condition3 = (_cigTypeGear == "HMD" && _hmdCurrent != hmd _unit);


    // Check for Fail Conditions

    if (  _condition1 ||_condition2 || _condition3 ) then {
        // IF fail condition detected
        [_unit, "immersion_cigs_cig_out", 1] call FUNC(anim);
        _unit setVariable [QGVAR(cigLitUp), false, true];

        if (_cigTime >= _maxTime) then {
            switch (_cigTypeGear) do {
                case ("GOGGLES"): { removeGoggles _unit; };
                case ("HMD"):     { _unit removeWeapon (hmd _unit); };
            };
        };
    } else {
        [_unit,_cigTime,_gogglesCurrent,_hmdCurrent,_cigTypeGear,_cigClass,_cigType,_maxTime] call FUNC(start_cig_recursive);
    };
};

[_code, [_unit,_cigTime,_gogglesCurrent,_hmdCurrent,_cigTypeGear,_cigClass,_cigType,_maxTime], _delay] call CBA_fnc_waitAndExecute;