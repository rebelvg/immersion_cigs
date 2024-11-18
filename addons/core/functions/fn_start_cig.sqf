#include "../script_component.hpp"

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

params ["_unit"];

////////////////////////////////////////
// Initial Check
////////////////////////////////////////
if (!(local _unit)) exitWith {};

////////////////////////////////////////
// Check if smoking & set flag
////////////////////////////////////////
if (_unit getVariable [QGVAR(cigLitUp), false]) exitWith {};
_unit setVariable [QGVAR(cigLitUp), true, true];



////////////////////////////////////////
// Identify current used Cig and Type
////////////////////////////////////////
private _gogglesCurrent = goggles _unit;
private _hmdCurrent = hmd _unit;
private _cigTypeGear = "";
if (_gogglesCurrent in GVAR(cigsArray)) then { _cigTypeGear = "GOGGLES"; };
if (_hmdCurrent     in GVAR(cigsArray)) then { _cigTypeGear = "HMD";     };
if (_cigTypeGear == "") exitWith {};


////////////////////////////////////////
// Identify CigClass
////////////////////////////////////////
private _cigClass = configFile;
switch (_cigTypeGear) do {
    case ("GOGGLES"):   {_cigClass = configFile >> "CfgGlasses" >> _gogglesCurrent; };
    case ("HMD"):       {_cigClass = configFile >> "CfgWeapons" >> _hmdCurrent;     };
};

////////////////////////////////////////
// Identify cigarette Time
////////////////////////////////////////

private _cigTime = 0;
_cigTime = getNumber (_cigClass >> "immersion_cigs_initStateTime");


////////////////////////////////////////
// Play Animation
////////////////////////////////////////
[_unit, "immersion_cigs_cig_in", 3] call FUNC(anim);

private _cigType = getText   (_cigClass >> "immersion_cigs_type"   );
private _maxTime = getNumber (_cigClass >> "immersion_cigs_maxTime");

if (_maxTime == 0) then { _maxTime = 330; };


////////////////////////////////////////
// Initial Smoke Puffs
////////////////////////////////////////
private _sleep1 =           (3.5 + random 2);
private _sleep2 = _sleep1 + (1.0 + random 1);

[{
    [QGVAR(EH_smoke), _this] call CBA_fnc_globalEvent;
}, [_unit, _cigType], _sleep1] call CBA_fnc_waitAndExecute;

[{
    [QGVAR(EH_smoke), _this] call CBA_fnc_globalEvent;
}, [_unit, _cigType], _sleep2] call CBA_fnc_waitAndExecute;

////////////////////////////////////////
// Start Recursive Loop
////////////////////////////////////////


private _code = {
    params  ["_unit","_cigTime","_gogglesCurrent","_hmdCurrent","_cigTypeGear","_cigClass","_cigType","_maxTime"];
    [_unit,_cigTime,_gogglesCurrent,_hmdCurrent,_cigTypeGear,_cigClass,_cigType,_maxTime] call FUNC(start_cig_recursive);
};

[_code, [_unit,_cigTime,_gogglesCurrent,_hmdCurrent,_cigTypeGear,_cigClass,_cigType,_maxTime], _sleep2] call CBA_fnc_waitAndExecute;