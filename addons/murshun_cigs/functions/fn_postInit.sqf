if (!(isClass (configFile >> "CfgPatches" >> "ace_interact_menu"))) then {
    private _addVanillaActions = {
        player addAction [localize "STR_murshun_cigs_start_cig", {
            params ["_target", "_caller"];
            [_caller] spawn murshun_cigs_fnc_start_cig_your
            }, nil, 0, false, true, "", "if (_target != player) exitWith {false}; ((goggles _this) in murshun_cigs_cigsArray) and (!(_this getVariable ['murshun_cigs_cigLitUp', false]))", 5, false];
        player addAction [localize "STR_murshun_cigs_stop_cig", {
            params ["_target", "_caller"];
            [_caller] spawn murshun_cigs_fnc_stop_cig
            }, nil, 0, false, true, "", "if (_target != player) exitWith {false}; ((goggles _this) in murshun_cigs_cigsArray) and ((_this getVariable ['murshun_cigs_cigLitUp', false]))", 5, false];
        player addAction [localize "STR_murshun_cigs_take_cig_from_pack", {
            params ["_target", "_caller"];
            [_caller] spawn murshun_cigs_fnc_take_cig_from_pack
            }, nil, 0, false, true, "", "if (_target != player) exitWith {false}; 'murshun_cigs_cigpack' in (magazineCargo uniformContainer player)", 5, false];
    };

    call _addVanillaActions;

    player addEventHandler ["Respawn", _addVanillaActions];

    ace_common_fnc_displayTextStructured = {
        params ["_string"];

        hintSilent _string;
    };
} else {
    private _action = ["murshun_cigs_start_someones_cig", localize "STR_murshun_cigs_start_someones_cig", "murshun_cigs\UI\light_cig.paa", {
        params ["_target", "_player"];
        [_target, _player] spawn murshun_cigs_fnc_start_cig_his
    }, {
        params ["_target", "_player"];
        ((goggles _target) in murshun_cigs_cigsArray) && (!(_target getVariable ['murshun_cigs_cigLitUp', false])) && (alive _target)
    }] call ace_interact_menu_fnc_createAction;
    ["CAManBase", 0, ["ACE_Head"], _action, true] call ace_interact_menu_fnc_addActionToClass;
};

player addEventHandler ["Respawn", {
    player setVariable ["murshun_cigs_cigLitUp", false];
}];

if (!isMultiplayer) then {
    player addItem "murshun_cigs_cigpack";
    player addItem "murshun_cigs_lighter";
};
