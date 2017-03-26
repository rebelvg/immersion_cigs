if (!(isClass (configFile >> "CfgPatches" >> "ace_interact_menu"))) then {
    player addAction [localize "STR_murshun_cigs_start_cig", {[_this select 1, _this select 1] spawn murshun_cigs_fnc_start_cig_your}, nil, 0, false, true, "", "((goggles _this) in murshun_cigs_cigsArray) and (!(_this getVariable ['murshun_cigs_cigLitUp', false]))", 5, false];
    player addAction [localize "STR_murshun_cigs_stop_cig", {[_this select 1] spawn murshun_cigs_fnc_stop_cig}, nil, 0, false, true, "", "((goggles _this) in murshun_cigs_cigsArray) and ((_this getVariable ['murshun_cigs_cigLitUp', false]))", 5, false];
    player addAction [localize "STR_murshun_cigs_take_cig_from_pack", {[_this select 1] spawn murshun_cigs_fnc_take_cig_from_pack}, nil, 0, false, true, "", "'murshun_cigs_cigpack' in (magazineCargo uniformContainer player)", 5, false];

    ace_common_fnc_displayTextStructured = {
        params ["_string"];

        hintSilent _string;
    };
} else {
    _action = ["murshun_cigs_start_someones_cig", localize "STR_murshun_cigs_start_someones_cig", "murshun_cigs\UI\light_cig.paa", {[_target, _player] spawn murshun_cigs_fnc_start_cig_his}, {((goggles _target) in murshun_cigs_cigsArray) and (!(_target getVariable ['murshun_cigs_cigLitUp', false])) and (alive _target)}] call ace_interact_menu_fnc_createAction;
    ["CAManBase", 0, ["ACE_Head"], _action, true] call ace_interact_menu_fnc_addActionToClass;
};
