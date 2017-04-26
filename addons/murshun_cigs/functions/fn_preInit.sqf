murshun_cigs_cigsArray = ["EWK_Cigar1", "EWK_Cigar2", "EWK_Cig1", "EWK_Cig2", "EWK_Cig3", "EWK_Cig4", "EWK_Glasses_Cig1", "EWK_Glasses_Cig2", "EWK_Glasses_Cig3", "EWK_Glasses_Cig4", "EWK_Glasses_Shemag_GRE_Cig6", "EWK_Glasses_Shemag_NB_Cig6", "EWK_Glasses_Shemag_tan_Cig6", "EWK_Cig5", "EWK_Glasses_Cig5", "EWK_Cig6", "EWK_Glasses_Cig6", "EWK_Shemag_GRE_Cig6", "EWK_Shemag_NB_Cig6", "EWK_Shemag_tan_Cig6", "murshun_cigs_cig0", "murshun_cigs_cig1", "murshun_cigs_cig2", "murshun_cigs_cig3", "murshun_cigs_cig4"];
murshun_cigs_cigsStatesArray = [["EWK_Cig1", 0, "EWK_Cig4"], ["EWK_Cig4", 66, "EWK_Cig6"], ["EWK_Cig6", 126, "EWK_Cig3"], ["EWK_Cig3", 306], ["murshun_cigs_cig0", 0, "murshun_cigs_cig1"], ["murshun_cigs_cig1", 12, "murshun_cigs_cig2"], ["murshun_cigs_cig2", 66, "murshun_cigs_cig3"], ["murshun_cigs_cig3", 126, "murshun_cigs_cig4"], ["murshun_cigs_cig4", 306]];

murshun_cigs_fnc_smoke = {
    params ["_unit"];

    _source = "logic" createVehicleLocal (getPos _unit);
    _fog = "#particleSource" createVehicleLocal getPos _source;
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
        [_unit, "EWK_CIGS_SMOKING_ERC_CTS"] remoteExec ["switchMove"];

        _time = time;
        while {time < _time + 3} do {
            if (!alive _unit) exitWith {
                [_unit, ""] remoteExec ["switchMove"];
            };
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
        [_unit, _animation] remoteExec ["switchMove"];
    };
};

murshun_cigs_removeItemFromMag = {
    params ["_player", "_mag"];

    _matchesMags = magazinesAmmo _player select {_x select 0 == _mag};

    _player removeMagazineGlobal _mag;

    _oldMag = _matchesMags select 0;

    if ((_oldMag select 1) > 1) then {
        _player addMagazine [_mag, (_oldMag select 1) - 1];
    } else {
        [format ["%1 is now empty.", getText (configFile >> "CfgMagazines" >> _mag >> "displayName")], 2.5, _player] spawn ace_common_fnc_displayTextStructured;
    };
};

murshun_cigs_playSound = {
    params ["_unit", "_class"];

    [_unit, _class] remoteExec ["say3D"];
};

murshun_cigs_fnc_useItem = {
    params ["_unit", "_player"];

    if (!("murshun_cigs_matches" in (magazines _player)) && !("murshun_cigs_lighter" in (magazines _player))) exitWith {
        [localize "STR_murshun_cigs_no_matches_or_lighter", 2.5, _player] spawn ace_common_fnc_displayTextStructured;
        false
    };

    switch (true) do {
    case ("murshun_cigs_lighter" in (magazines _player)): {
            [_player, "murshun_cigs_lighter"] call murshun_cigs_removeItemFromMag;

            [_unit, "murshun_cigs_lighter_01"] call murshun_cigs_playSound;
        };
    case ("murshun_cigs_matches" in (magazines _player)): {
            [_player, "murshun_cigs_matches"] call murshun_cigs_removeItemFromMag;

            [_unit, "murshun_cigs_matches_01"] call murshun_cigs_playSound;
        };
    };

    true
};

murshun_cigs_fnc_start_cig_your = {
    params ["_player"];

    if !([_player, _player] call murshun_cigs_fnc_useItem) exitWith {};

    [_player] spawn murshun_cigs_fnc_start_cig;
};

murshun_cigs_fnc_start_cig_his = {
    params ["_unit", "_player"];

    if !([_unit, _player] call murshun_cigs_fnc_useItem) exitWith {};

    _player playActionNow "PutDown";

    [_unit] remoteExec ["murshun_cigs_fnc_start_cig", _unit];
};

murshun_cigs_fnc_start_cig = {
    params ["_unit"];

    if (!(local _unit)) exitWith {};

    _cigTime = 0;
    _goggles = goggles _unit;

    if !(_goggles in murshun_cigs_cigsArray) exitWith {};

    _gogglesCurrent = _goggles;

    _states = murshun_cigs_cigsStatesArray select {_x select 0 == _goggles};

    {
        _x params ["_cigState", "_cigStateTime", ["_cigStateNext", ""]];
        _cigTime = _cigStateTime;
    } forEach _states;

    if (_unit getVariable ["murshun_cigs_cigLitUp", false]) exitWith {};
    _unit setVariable ["murshun_cigs_cigLitUp", true, true];

    [_unit] spawn murshun_cigs_fnc_anim;

    sleep (3.5 + random 2);
    [_unit] remoteExec ["murshun_cigs_fnc_smoke"];
    sleep (1 + random 1);
    [_unit] remoteExec ["murshun_cigs_fnc_smoke"];

    while ({alive _unit && _gogglesCurrent in murshun_cigs_cigsArray && (_unit getVariable ["murshun_cigs_cigLitUp", false]) && _cigTime <= 330}) do {
        _gogglesCurrent = goggles _unit;
        _gogglesNew = "";

        _states = murshun_cigs_cigsStatesArray select {_x select 0 == _gogglesCurrent};

        {
            _x params ["_cigState", "_cigStateTime", ["_cigStateNext", ""]];
            _statesNew = murshun_cigs_cigsStatesArray select {_x select 0 == _cigStateNext};

            {
                _x params ["_cigState", "_cigStateTime", ["_cigStateNext", ""]];
                if (_cigTime >= _cigStateTime) then {
                    _gogglesNew = _cigState;
                };
            } forEach _statesNew;
        } forEach _states;

        if (_gogglesNew != "") then {
            removeGoggles _unit;
            _unit addGoggles _gogglesNew;
            _gogglesCurrent = _gogglesNew;
        };

        _time = (5.5 + random 2);

        _cigTime = _cigTime + _time;

        [_unit] remoteExec ["murshun_cigs_fnc_smoke"];
        _fatigue = getFatigue _unit;
        _unit setFatigue _fatigue + 0.01;

        sleep _time;

        if (_gogglesCurrent != goggles _unit) exitWith {};
    };

    _unit setVariable ["murshun_cigs_cigLitUp", false, true];
    if (_cigTime >= 330) then {
        removeGoggles _unit;
    };
};

murshun_cigs_fnc_stop_cig = {
    params ["_player"];

    _player setVariable ["murshun_cigs_cigLitUp", false, true];
};

murshun_cigs_fnc_take_cig_from_pack = {
    params ["_player"];

    [_player, "murshun_cigs_cigpack"] call murshun_cigs_removeItemFromMag;

    [_player, "murshun_cigs_unwrap"] call immersion_pops_playSound;

    _player addItem "murshun_cigs_cig0";
};
