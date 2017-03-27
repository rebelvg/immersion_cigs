immersion_pops_cigsArray = ["immersion_pops_pop0"];
immersion_pops_cigsStatesArray = [];

immersion_pops_fnc_smoke = {};

immersion_pops_fnc_anim = {
    params ["_unit"];

    if (!alive _unit || vehicle _unit != _unit) exitWith {};

    if (_unit getVariable ["ACE_isUnconscious", false]) exitWith {};

    _animation = animationState _unit;

    _time = time;
    while {time < _time + 3} do {
        _unit playActionNow "Gear";
        sleep (1/60);
    };

    if (alive _unit && !(_unit getVariable ["ACE_isUnconscious", false])) then {
        [[_unit, _animation], "switchMove"] call BIS_fnc_MP;
    };
};

immersion_pops_removeItemFromMag = {
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

immersion_pops_playSound = {
    params ["_unit", "_path", "_class"];

    if (vehicle _unit == _unit) then {
        playSound3D [_path, _unit, false, ATLtoASL (_unit modelToWorldVisual (_unit selectionPosition "head")), 2, 1, 15];
    } else {
        [[_unit, _class], "say3d"] call BIS_fnc_MP;
    };
};

immersion_pops_fnc_useItem = {
    params ["_unit", "_player"];

    true
};

immersion_pops_fnc_start_cig_your = {
    params ["_player"];

    if !([_player, _player] call immersion_pops_fnc_useItem) exitWith {};

    [_player] spawn immersion_pops_fnc_start_cig;
};

immersion_pops_fnc_start_cig_his = {};

immersion_pops_fnc_start_cig = {
    params ["_unit"];

    if (!(local _unit)) exitWith {};

    _cigTime = 0;
    _goggles = goggles _unit;

    if !(_goggles in immersion_pops_cigsArray) exitWith {};

    _gogglesCurrent = _goggles;

    _states = immersion_pops_cigsStatesArray select {_x select 0 == _goggles};

    {
        _x params ["_cigState", "_cigStateTime", ["_cigStateNext", ""]];
        _cigTime = _cigStateTime;
    } forEach _states;

    if (_unit getVariable ["immersion_pops_cigLitUp", false]) exitWith {};
    _unit setVariable ["immersion_pops_cigLitUp", true, true];

    [_unit] spawn immersion_pops_fnc_anim;

    sleep (3.5 + random 2);
    [[_unit], "immersion_pops_fnc_smoke"] call BIS_fnc_MP;
    sleep (1 + random 1);
    [[_unit], "immersion_pops_fnc_smoke"] call BIS_fnc_MP;

    while ({alive _unit && _gogglesCurrent in immersion_pops_cigsArray && (_unit getVariable ["immersion_pops_cigLitUp", false]) && _cigTime <= 330}) do {
        _gogglesCurrent = goggles _unit;
        _gogglesNew = "";

        _states = immersion_pops_cigsStatesArray select {_x select 0 == _gogglesCurrent};

        {
            _x params ["_cigState", "_cigStateTime", ["_cigStateNext", ""]];
            _statesNew = immersion_pops_cigsStatesArray select {_x select 0 == _cigStateNext};

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

        _cigTime = _cigTime + 6;

        [[_unit], "immersion_pops_fnc_smoke"] call BIS_fnc_MP;
        _fatigue = getFatigue _unit;
        _unit setFatigue _fatigue + 0.01;

        sleep (5.5 + random 2);

        if (_gogglesCurrent != goggles _unit) exitWith {};
    };

    _unit setVariable ["immersion_pops_cigLitUp", false, true];
    if (_cigTime >= 330) then {
        removeGoggles _unit;
    };
};

immersion_pops_fnc_stop_cig = {
    params ["_player"];

    _player setVariable ["immersion_pops_cigLitUp", false, true];
};

immersion_pops_fnc_take_cig_from_pack = {
    params ["_player"];

    [_player, "immersion_pops_poppack"] call immersion_pops_removeItemFromMag;

    _player addItem "immersion_pops_pop0";
};
