murshun_cigs_cigsArray = ["EWK_Cigar1", "EWK_Cigar2", "EWK_Cig1", "EWK_Cig2", "EWK_Cig3", "EWK_Cig4", "EWK_Glasses_Cig1", "EWK_Glasses_Cig2", "EWK_Glasses_Cig3", "EWK_Glasses_Cig4", "EWK_Glasses_Shemag_GRE_Cig6", "EWK_Glasses_Shemag_NB_Cig6", "EWK_Glasses_Shemag_tan_Cig6", "EWK_Cig5", "EWK_Glasses_Cig5", "EWK_Cig6", "EWK_Glasses_Cig6", "EWK_Shemag_GRE_Cig6", "EWK_Shemag_NB_Cig6", "EWK_Shemag_tan_Cig6", "murshun_cigs_cig0", "murshun_cigs_cig1", "murshun_cigs_cig2", "murshun_cigs_cig3", "murshun_cigs_cig4"];

murshun_cigs_fnc_smoke = {
    params ["_unit"];

    _source = "logic" createVehicleLocal (getpos _unit);
    _fog = "#particlesource" createVehicleLocal getpos _source;
    _fog setParticleParams ["\A3\data_f\cl_basic",
    "",
    "Billboard",
    0.5,
    2,
    [0,0,0],
    [0, 0.1, -0.1],
    1, 1.2, 1, 0.1,
    [0.1, 0.2,0.1],
    [[0.2,0.2,0.2, 0.3], [0,0,0, 0.01], [1,1,1, 0]],
    [500],
    1,
    0.04,
    "",
    "",
    _source];
    _fog setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
    _fog setDropInterval 0.005;

    _source attachTo [_unit, [0,0.06,0], "head"];
    sleep 0.4;

    deleteVehicle _source;
};

murshun_cigs_fnc_anim = {
    params ["_unit"];

    if (!alive _unit || vehicle _unit != _unit) exitWith {};

    if (_unit getVariable ["ACE_isUnconscious", false]) exitWith {};

    _animation = animationState _unit;

    if (stance _unit == "STAND" && isClass (configFile >> "CfgPatches" >> "ewk_cigs")) then {
        [[_unit, "EWK_CIGS_SMOKING_ERC_CTS"], "switchMove"] call BIS_fnc_MP;

        _time = time;
        while {time < _time + 3} do {
            if (!alive _unit) exitWith {[[_unit, ""], "switchMove"] call BIS_fnc_MP;};
            sleep (1/60);
        };
    } else {
        _time = time;
        while {time < _time + 3} do {
            _unit playActionNow "Gear";
            sleep (1/60);
        };
    };

    if (alive _unit && !(_unit getVariable ["ACE_isUnconscious", false])) then {
        [[_unit, _animation], "switchMove"] call BIS_fnc_MP;
    };
};

murshun_cigs_fnc_item = {
    params ["_unit", "_player"];

    switch (true) do {
    case ("murshun_cigs_lighter" in (magazines _player)): {
            _matchesMags = magazinesAmmo _player select {_x select 0 == "murshun_cigs_lighter"};

            _player removeMagazineGlobal "murshun_cigs_lighter";

            _oldMag = _matchesMags select 0;

            if ((_oldMag select 1) > 1) then {
                _player addMagazine ["murshun_cigs_lighter", (_oldMag select 1) - 1];
            } else {
                ["Lighter is now empty.", 2.5, _player] spawn ace_common_fnc_displayTextStructured;
            };

            if (vehicle _unit == _unit) then {
                playSound3D ["murshun_cigs\lighter_01.ogg", _unit, false, ATLtoASL (_unit modelToWorldVisual (_unit selectionPosition "head")), 2, 1, 15];
            } else {
                [[_unit, "murshun_cigs_lighter_01"], "say3d"] call BIS_fnc_MP;
            };
        };
    case ("murshun_cigs_matches" in (magazines _player)): {
            _matchesMags = magazinesAmmo _player select {_x select 0 == "murshun_cigs_matches"};

            _player removeMagazineGlobal "murshun_cigs_matches";

            _oldMag = _matchesMags select 0;

            if ((_oldMag select 1) > 1) then {
                _player addMagazine ["murshun_cigs_matches", (_oldMag select 1) - 1];
            } else {
                ["Matches box is now empty.", 2.5, _player] spawn ace_common_fnc_displayTextStructured;
            };

            if (vehicle _unit == _unit) then {
                playSound3D ["murshun_cigs\matches_01.ogg", _unit, false, ATLtoASL (_unit modelToWorldVisual (_unit selectionPosition "head")), 2, 1, 15];
                sleep 1.5;
                playSound3D ["murshun_cigs\matches_02.ogg", _unit, false, ATLtoASL (_unit modelToWorldVisual (_unit selectionPosition "head")), 2, 1, 15];
            } else {
                [[_unit, "murshun_cigs_matches_01"], "say3d"] call BIS_fnc_MP;
                sleep 1.5;
                [[_unit, "murshun_cigs_matches_02"], "say3d"] call BIS_fnc_MP;
            };
        };
    };
};

murshun_cigs_fnc_start_cig_his = {
    params ["_unit", "_player"];

    if (!("murshun_cigs_matches" in (magazines _player)) && !("murshun_cigs_lighter" in (magazines _player))) exitWith {
        [localize "STR_murshun_cigs_no_matches_or_lighter_his", 2.5, _player] spawn ace_common_fnc_displayTextStructured;
    };

    [_unit, _player] spawn murshun_cigs_fnc_item;

    _player playActionNow "PutDown";

    [[_unit, _player], "murshun_cigs_fnc_start_cig", _unit] call BIS_fnc_MP;
};

murshun_cigs_fnc_start_cig_your = {
    params ["_player"];

    if (!("murshun_cigs_matches" in (magazines _player)) && !("murshun_cigs_lighter" in (magazines _player))) exitWith {
        [localize "STR_murshun_cigs_no_matches_or_lighter_your", 2.5, _player] spawn ace_common_fnc_displayTextStructured;
    };

    [_player, _player] spawn murshun_cigs_fnc_item;

    [_player] spawn murshun_cigs_fnc_start_cig;
};

murshun_cigs_fnc_start_cig = {
    params ["_unit"];

    if (!(local _unit)) exitWith {};

    _cigTime = 0;
    _goggles = goggles _unit;

    if (_goggles in murshun_cigs_cigsArray) then {
        _gogglesCurrent = _goggles;

        switch (_goggles) do {
        case "EWK_Cig1": {
                _cigTime = 6;
            };
        case "EWK_Cig4": {
                _cigTime = 66;
            };
        case "EWK_Cig6": {
                _cigTime = 126;
            };
        case "EWK_Cig3": {
                _cigTime = 306;
            };
        case "murshun_cigs_cig0": {
                _cigTime = 6;
            };
        case "murshun_cigs_cig1": {
                _cigTime = 12;
            };
        case "murshun_cigs_cig2": {
                _cigTime = 66;
            };
        case "murshun_cigs_cig3": {
                _cigTime = 126;
            };
        case "murshun_cigs_cig4": {
                _cigTime = 306;
            };
        };

        _unit setVariable ["murshun_cigs_cigLitUp", true, true];

        [_unit] spawn murshun_cigs_fnc_anim;

        sleep (3.5 + random 2);

        [[_unit], "murshun_cigs_fnc_smoke"] call BIS_fnc_MP;
        sleep (1 + random 1);
        [[_unit], "murshun_cigs_fnc_smoke"] call BIS_fnc_MP;

        while ({alive _unit and _gogglesCurrent in murshun_cigs_cigsArray and (_unit getVariable ["murshun_cigs_cigLitUp", false]) and _cigTime <= 330}) do {
            _gogglesCurrent = goggles _unit;
            _gogglesNew = "";

            if (_gogglesCurrent == "EWK_Cig1" && _cigTime >= 60) then {
                _gogglesNew = "EWK_Cig4";
            };
            if (_gogglesCurrent == "EWK_Cig4" && _cigTime >= 120) then {
                _gogglesNew = "EWK_Cig6";
            };
            if (_gogglesCurrent == "EWK_Cig6" && _cigTime >= 300) then {
                _gogglesNew = "EWK_Cig3";
            };
            if (_gogglesCurrent == "murshun_cigs_cig0" && _cigTime >= 6) then {
                _gogglesNew = "murshun_cigs_cig1";
            };
            if (_gogglesCurrent == "murshun_cigs_cig1" && _cigTime >= 60) then {
                _gogglesNew = "murshun_cigs_cig2";
            };
            if (_gogglesCurrent == "murshun_cigs_cig2" && _cigTime >= 120) then {
                _gogglesNew = "murshun_cigs_cig3";
            };
            if (_gogglesCurrent == "murshun_cigs_cig3" && _cigTime >= 300) then {
                _gogglesNew = "murshun_cigs_cig4";
            };

            if (_gogglesNew != "") then {
                removeGoggles _unit;
                _unit addGoggles _gogglesNew;
                _gogglesCurrent = _gogglesNew;
            };

            _cigTime = _cigTime + 6;

            [[_unit], "murshun_cigs_fnc_smoke"] call BIS_fnc_MP;
            _fatigue = getFatigue _unit;
            _unit setFatigue _fatigue + 0.01;

            sleep (5.5 + random 2);

            _goggles = goggles _unit;
            if (_gogglesCurrent != _goggles) exitWith {};
        };

        _unit setVariable ["murshun_cigs_cigLitUp", false, true];
        if (_cigTime >= 330) then {
            removeGoggles _unit;
        };
    };
};

murshun_cigs_fnc_take_cig_from_pack = {
    params ["_player"];

    _matchesMags = magazinesAmmo _player select {_x select 0 == "murshun_cigs_cigpack"};

    _player removeMagazineGlobal "murshun_cigs_cigpack";

    _oldMag = _matchesMags select 0;

    if ((_oldMag select 1) > 1) then {
        _player addMagazine ["murshun_cigs_cigpack", (_oldMag select 1) - 1];
        _player addItem "murshun_cigs_cig0";
    } else {
        _player addItem "murshun_cigs_cig0";
        ["Cig pack is now empty.", 2.5, _player] spawn ace_common_fnc_displayTextStructured;
    };
};

murshun_cigs_fnc_stop_cig = {
    params ["_player"];

    _player setVariable ["murshun_cigs_cigLitUp", false, true];
};

if (!(isClass (configFile >> "CfgPatches" >> "ace_interact_menu"))) then {
    player addAction [localize "STR_murshun_cigs_start_cig", {[_this select 1, _this select 1] spawn murshun_cigs_fnc_start_cig_your}, nil, 0, false, true, "", "((goggles _this) in murshun_cigs_cigsArray) and (!(_this getVariable ['murshun_cigs_cigLitUp', false]))", 5, false];
    player addAction [localize "STR_murshun_cigs_stop_cig", {[_this select 1] spawn murshun_cigs_fnc_stop_cig}, nil, 0, false, true, "", "((goggles _this) in murshun_cigs_cigsArray) and ((_this getVariable ['murshun_cigs_cigLitUp', false]))", 5, false];
    player addAction ["Take Cig from Pack", {[_this select 1] spawn murshun_cigs_fnc_take_cig_from_pack}, nil, 0, false, true, "", "count ((uniformMagazines player) select {_x find 'Cig Pack' == 0}) > 0", 5, false];

    ace_common_fnc_displayTextStructured = {
        params ["_string"];

        hintSilent _string;
    };
} else {
    _action = ["murshun_cigs_start_someones_cig", localize "STR_cigs_start_someones_cig", "murshun_cigs\UI\light_cig.paa", {[_target, _player] spawn murshun_cigs_fnc_start_cig_his}, {((goggles _target) in murshun_cigs_cigsArray) and (!(_target getVariable ['murshun_cigs_cigLitUp', false])) and (alive _target)}] call ace_interact_menu_fnc_createAction;
    ["CAManBase", 0, ["ACE_Head"], _action, true] call ace_interact_menu_fnc_addActionToClass;
};
