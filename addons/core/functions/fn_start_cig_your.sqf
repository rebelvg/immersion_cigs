// Need to unschedule murshun_cigs_fnc_start_cig first
//murshun_cigs_fnc_start_cig_your

params ["_player"];
if !([_player, _player] call murshun_cigs_fnc_useItem) exitWith {};
[_player] call murshun_cigs_fnc_start_cig;
