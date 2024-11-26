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
private _cigTypeGear = switch (true) do {
    case (getNumber (configFile >> "CfgGlasses" >> goggles _unit >> QPVAR(isSmokeable)) == 1): { "GOGGLES" };
    case (getNumber (configFile >> "CfgWeapons" >>     hmd _unit >> QPVAR(isSmokeable)) == 1): { "HMD" };
    default { "" };
};
if (_cigTypeGear == "") exitWith {};


////////////////////////////////////////
// Identify CigClass
////////////////////////////////////////
private _cigConfig = switch (_cigTypeGear) do {
    case ("GOGGLES"):   { (configFile >> "CfgGlasses" >> goggles _unit ); };
    case ("HMD"):       { (configFile >> "CfgWeapons" >>     hmd _unit ); };
};


////////////////////////////////////////
// Identify cigarette Time
////////////////////////////////////////
private _cigTime = getNumber (_cigConfig >> QPVAR(initStateTime));


////////////////////////////////////////
// Play Animation
////////////////////////////////////////
[_unit, QEGVAR(anim,cig_in), 3] call FUNC(anim);

private _maxTime = getNumber (_cigConfig >> QPVAR(maxTime));

if (_maxTime == 0) then { _maxTime = 330; };


////////////////////////////////////////
// Initial Smoke Puffs
////////////////////////////////////////
private _sleep_total = 3.5;
private _puffs = 1 + ceil random 4;


for "_i" from 1 to _puffs do {
    private _rnd = 1 + random 2;
    _sleep_total = _sleep_total + _rnd;
    [{ [QGVAR(EH_smoke), _this] call CBA_fnc_globalEvent; }, [_unit, _cigConfig], _sleep_total] call CBA_fnc_waitAndExecute;
};


////////////////////////////////////////
// Start Recursive Loop
////////////////////////////////////////
[ FUNC(smoking), [_unit,_cigTime,_cigTypeGear,_maxTime], _sleep_total + 2] call CBA_fnc_waitAndExecute;