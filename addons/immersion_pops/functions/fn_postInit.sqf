if (!hasInterface) exitWith {};

if (!(isClass (configFile >> "CfgPatches" >> "ace_interact_menu"))) then {
    private _addVanillaActions = {
        player addAction [localize "STR_immersion_pops_start_cig", {
            params ["_target", "_caller"];
            [_caller] spawn immersion_pops_fnc_start_cig_your
        }, nil, 0, false, true, "", "if (_target != player) exitWith {false}; ((goggles _this) in immersion_pops_cigsArray) and (!(_this getVariable ['immersion_pops_cigLitUp', false]))", 5, false];
        player addAction [localize "STR_immersion_pops_stop_cig", {
            params ["_target", "_caller"];
            [_caller] spawn immersion_pops_fnc_stop_cig
        }, nil, 0, false, true, "", "if (_target != player) exitWith {false}; ((goggles _this) in immersion_pops_cigsArray) and ((_this getVariable ['immersion_pops_cigLitUp', false]))", 5, false];
        player addAction [localize "STR_immersion_pops_take_cig_from_pack", {
            params ["_target", "_caller"];
            [_caller] spawn immersion_pops_fnc_take_cig_from_pack
        }, nil, 0, false, true, "", "if (_target != player) exitWith {false}; 'immersion_pops_poppack' in (magazineCargo uniformContainer player)", 5, false];
    };

    call _addVanillaActions;

    player addEventHandler ["Respawn", _addVanillaActions];
};

player addEventHandler ["Respawn", {
    player setVariable ["immersion_pops_cigLitUp", false];
}];

if (!isMultiplayer && !is3DEN) then {
    player addItem "immersion_pops_poppack";
    player addItem "immersion_pops_poppack";
    player addItem "immersion_pops_poppack";
};
