params ["_unit", "_type"];

private _multiplier = 1;

switch (_type) do {
    case "cigarette": { _multiplier = 1 };
    case "cigar": { _multiplier = 2 };
};

//private _source = "logic" createVehicleLocal (getPosATL _unit);
private _fog = "#particleSource" createVehicleLocal getPosATL _unit;

_fog setParticleParams [
        "\A3\data_f\cl_basic",
    "",
    "Billboard",
    0.5,
    2,
    [0, 0, 0],
    [0, 0.1, -0.1],
    1,
    1.2,
    1,
    0.1,
    [0.1 * _multiplier, 0.2 * _multiplier, 0.1 * _multiplier],
    [[0.2 * _multiplier, 0.2 * _multiplier, 0.2 * _multiplier, 0.3 * _multiplier], [0, 0, 0, 0.01], [1, 1, 1, 0]],
    [500],
    1,
    0.04,
    "",
    "",
    _fog
];
_fog setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
_fog setDropInterval 0.005;

_fog attachTo [_unit, [0, 0.06, 0], "head"];

[{
    params ["_source"];
    deleteVehicle _source;
}, [_fog], 0.5] call CBA_fnc_waitAndExecute;
