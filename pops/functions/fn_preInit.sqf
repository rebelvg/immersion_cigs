immersion_pops_fnc_anim = {
    params ["_unit"];

    if (!alive _unit || vehicle _unit != _unit) exitWith {};

    if (_unit getVariable ["ACE_isUnconscious", false]) exitWith {};

    private _animation = animationState _unit;

    private _time = time;
    while {time < _time + 3} do {
        _unit playActionNow "Gear";
        sleep (1/60);
    };

    if (alive _unit && !(_unit getVariable ["ACE_isUnconscious", false])) then {
        [_unit, _animation] remoteExec ["switchMove"];
    };
};


immersion_pops_fnc_start_cig_your = {
    params ["_player"];

    [_player] spawn immersion_pops_fnc_start_cig;
};  // lacks the can use item chat

immersion_pops_fnc_start_cig = {
    params ["_unit"];

    private _cigTime = 0;
    private _goggles = goggles _unit;

    if !(_goggles in immersion_pops_cigsArray) exitWith {};

    private _gogglesCurrent = _goggles;

    if (_unit getVariable ["immersion_pops_cigLitUp", false]) exitWith {};
    _unit setVariable ["immersion_pops_cigLitUp", true, true];

    [format ["It seems to have %1 flavour.", selectRandom immersion_pops_flavours], 2.5, _unit] spawn ace_common_fnc_displayTextStructured;

    [_unit] spawn immersion_pops_fnc_anim;

    while ({alive _unit && _gogglesCurrent in immersion_pops_cigsArray && (_unit getVariable ["immersion_pops_cigLitUp", false]) && _cigTime <= 330}) do {
        _gogglesCurrent = goggles _unit;
        private _gogglesNew = "";

        if (_gogglesNew != "") then {
            removeGoggles _unit;
            _unit addGoggles _gogglesNew;
            _gogglesCurrent = _gogglesNew;
        };

        private _time = (20 + random 10);

        _cigTime = _cigTime + _time;

        [_unit, selectRandom immersion_pops_eatSounds] call immersion_pops_playSound;
        sleep (2 + random 2);
        [_unit, selectRandom immersion_pops_eatSounds] call immersion_pops_playSound;

        sleep _time;

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


immersion_pops_cigsArray = ["immersion_pops_pop0"];
immersion_pops_eatSounds = ["immersion_pops_eat_01", "immersion_pops_eat_02", "immersion_pops_eat_03", "immersion_pops_eat_04", "immersion_pops_eat_05", "immersion_pops_eat_06", "immersion_pops_eat_07"];
immersion_pops_flavours = ["banana", "cherry", "strawberry", "raspberry", "bacon", "nicotine", "tomato", "chocolate", "lemon", "cola"];
