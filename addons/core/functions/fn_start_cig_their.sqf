// murshun_cigs_fnc_start_cig_their
params ["_unit", "_player"];

if !([_unit, _player] call murshun_cigs_fnc_useItem) exitWith {};
_player playActionNow "PutDown";

["murshun_cigs_start_cig", [_unit],_unit] call CBA_fnc_targetEvent; // raises event local