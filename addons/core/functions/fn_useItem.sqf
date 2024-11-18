// Done
// murshun_cigs_fnc_useItem
params ["_unit", "_player"];

if (!("murshun_cigs_matches" in (magazines _player)) && !("murshun_cigs_lighter" in (magazines _player))) exitWith {
    [localize "STR_murshun_cigs_no_matches_or_lighter", 2.5, _player] call ace_common_fnc_displayTextStructured;
    false
};

switch (true) do {
case ("murshun_cigs_lighter" in (magazines _player)): {
        [_player, "murshun_cigs_lighter"] call murshun_cigs_fnc_removeItemFromMag;
        ["murshun_cigs_sound", ["murshun_cigs_lighter_01",_player]] call CBA_fnc_globalEvent;
    };
case ("murshun_cigs_matches" in (magazines _player)): {
        [_player, "murshun_cigs_matches"] call murshun_cigs_fnc_removeItemFromMag;
        ["murshun_cigs_sound", ["murshun_cigs_matches_01",_player]] call CBA_fnc_globalEvent;
    };
};
true

