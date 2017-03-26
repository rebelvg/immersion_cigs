if (!(isClass (configFile >> "CfgPatches" >> "ace_interact_menu"))) then {
    player addAction [localize "STR_immersion_pops_start_cig", {[_this select 1, _this select 1] spawn immersion_pops_fnc_start_cig_your}, nil, 0, false, true, "", "((goggles _this) in immersion_pops_cigsArray) and (!(_this getVariable ['immersion_pops_cigLitUp', false]))", 5, false];
    player addAction [localize "STR_immersion_pops_stop_cig", {[_this select 1] spawn immersion_pops_fnc_stop_cig}, nil, 0, false, true, "", "((goggles _this) in immersion_pops_cigsArray) and ((_this getVariable ['immersion_pops_cigLitUp', false]))", 5, false];
    player addAction [localize "STR_immersion_pops_take_cig_from_pack", {[_this select 1] spawn immersion_pops_fnc_take_cig_from_pack}, nil, 0, false, true, "", "'immersion_pops_cigpack' in (magazineCargo uniformContainer player)", 5, false];

    ace_common_fnc_displayTextStructured = {
        params ["_string"];

        hintSilent _string;
    };
};
