murshun_cigs_cigsArray = ["EWK_Cigar1", "EWK_Cigar2", "EWK_Cig1", "EWK_Cig2", "EWK_Cig3", "EWK_Cig4", "EWK_Glasses_Cig1", "EWK_Glasses_Cig2", "EWK_Glasses_Cig3", "EWK_Glasses_Cig4", "EWK_Glasses_Shemag_GRE_Cig6", "EWK_Glasses_Shemag_NB_Cig6", "EWK_Glasses_Shemag_tan_Cig6", "EWK_Cig5", "EWK_Glasses_Cig5", "EWK_Cig6", "EWK_Glasses_Cig6", "EWK_Shemag_GRE_Cig6", "EWK_Shemag_NB_Cig6", "EWK_Shemag_tan_Cig6"];

murshun_standingAnimationsArray = ["amovpercmstpsraswrfldnon", "amovpercmstpslowwrfldnon", "amovpercmstpsraswpstdnon", "amovpercmstpslowwpstdnon", "amovpercmstpsnonwnondnon", "amovpercmstpsraswlnrdnon", "amovpercmstpsoptwbindnon"];

murshun_cigs_fnc_smoke = {
	_target = _this select 0;
 
	_source = "logic" createVehicleLocal (getpos _target);
    _fog = "#particlesource" createVehicleLocal getpos _source;
    _fog setParticleParams ["\A3\data_f\cl_basic" ,
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
 
	_source attachto [_target,[0,0.06,0], "head"];
    sleep 0.4;
    deletevehicle _source;
};

murshun_cigs_anim_fnc = {
_unit = _this select 0;

if (!alive _unit || vehicle _unit != _unit) exitWith {};

if (_unit getVariable ["ACE_isUnconscious", false]) exitWith {};

_animation = animationState _unit;

if (animationState _unit in murshun_standingAnimationsArray) then {
[[_unit, "EWK_CIGS_SMOKING_ERC_CTS"], "switchMove"] call BIS_fnc_MP;
_time = time;
while {true} do {
if ((_unit getVariable ["ACE_isUnconscious", false])) exitWith {[[_unit, "unconscious"], "switchMove"] call BIS_fnc_MP;};
if (!alive _unit) exitWith {[[_unit, ""], "switchMove"] call BIS_fnc_MP;};
if (time >= _time + 3) exitWith {[[_unit, _animation], "switchMove"] call BIS_fnc_MP;};
};
} else {
_unit playActionNow "Gear";
_time = time;
while {true} do {
_unit playActionNow "Gear";
if (time >= _time + 3) exitWith {};
};
};
};

murshun_cigs_fnc_start_cig_MP = {
_unit = _this select 0;
_player = _this select 1;

if (!("murshun_cigs_matches" in (items _player)) && !("murshun_cigs_lighter" in (items _player))) exitWith {
["You don't have matches or lighter to light his cig up.", 2.5, _player] spawn ace_common_fnc_displayTextStructured;
};

_player playActionNow "PutDown";

[[_unit, _player], "murshun_cigs_fnc_start_cig"] call BIS_fnc_MP;
};

murshun_cigs_fnc_start_cig = {
_unit = _this select 0;
_player = _this select 1;

if (!(local _unit)) exitWith {};

if (!("murshun_cigs_matches" in (items _player)) && !("murshun_cigs_lighter" in (items _player))) exitWith {
["You don't have matches or lighter to light your cig up.", 2.5, _player] spawn ace_common_fnc_displayTextStructured;
};

_goggles = goggles _unit;

if (_goggles in murshun_cigs_cigsArray) then {
_goggles_current = _goggles;

switch (_goggles) do {
	case "EWK_Cig1": {
	_unit setVariable ["murshun_cigs_cigTime", 6];
	};
	case "EWK_Cig4": {
	_unit setVariable ["murshun_cigs_cigTime", 66];
	};
	case "EWK_Cig6": {
	_unit setVariable ["murshun_cigs_cigTime", 126];
	};
	case "EWK_Cig3": {
	_unit setVariable ["murshun_cigs_cigTime", 306];
	};
};

if ((_unit getVariable ["murshun_cigs_cigTime", 0]) <= 330) then {
[_unit] spawn murshun_cigs_anim_fnc;
if (("murshun_cigs_lighter" in (items _player))) then {
if (vehicle _unit == _unit) then {
playSound3D ["murshun_cigs\lighter_01.ogg", _unit, false, ATLtoASL (_unit modelToWorldVisual (_unit selectionPosition "head")), 2, 1, 15];
} else {
[[_unit, "murshun_cigs_lighter_01"], "say3d"] call BIS_fnc_MP;
};
} else {
_player setVariable ["murshun_cigs_usedMatches", (_player getVariable ["murshun_cigs_usedMatches", 0]) + 1];
if (_player getVariable ["murshun_cigs_usedMatches", 0] >= 10) then {
_player removeItem "murshun_cigs_matches";
_player setVariable ["murshun_cigs_usedMatches", 0];
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

_unit setVariable ["murshun_cigs_cigLitUp", true, true];
sleep (3.5 + random 2);
[[_unit], "murshun_cigs_fnc_smoke"] call BIS_fnc_MP;
sleep (1 + random 1);
[[_unit], "murshun_cigs_fnc_smoke"] call BIS_fnc_MP;
};

while ({alive _unit and _goggles_current in murshun_cigs_cigsArray and (_unit getVariable ["murshun_cigs_cigLitUp", false]) and (_unit getVariable ["murshun_cigs_cigTime", 0]) <= 330}) do {
_goggles_current = goggles _unit;
if (_goggles_current == "EWK_Cig1" && (_unit getVariable ["murshun_cigs_cigTime", 0]) >= 60) then {
removeGoggles _unit;
_unit addGoggles "EWK_Cig4";
_goggles_current = "EWK_Cig4";
};
if (_goggles_current == "EWK_Cig4" && (_unit getVariable ["murshun_cigs_cigTime", 0]) >= 120) then {
removeGoggles _unit;
_unit addGoggles "EWK_Cig6";
_goggles_current = "EWK_Cig6";
};
if (_goggles_current == "EWK_Cig6" && (_unit getVariable ["murshun_cigs_cigTime", 0]) >= 300) then {
removeGoggles _unit;
_unit addGoggles "EWK_Cig3";
_goggles_current = "EWK_Cig3";
};

_unit setVariable ["murshun_cigs_cigTime", (_unit getVariable ["murshun_cigs_cigTime", 0]) + 6];

[[_unit], "murshun_cigs_fnc_smoke"] call BIS_fnc_MP;
_fatigue = getFatigue _unit;
_unit setFatigue _fatigue + 0.01;

_time = time;
_futureTime = _time + (5.5+ random 2);
waitUntil {
time >= _futureTime or !(_unit getVariable ["murshun_cigs_cigLitUp", false])
};

_goggles = goggles _unit;
if (_goggles_current != _goggles) exitWith {};
};
_unit setVariable ["murshun_cigs_cigLitUp", false, true];
if ((_unit getVariable ["murshun_cigs_cigTime", 0]) >= 330) then {
removeGoggles _unit;
_unit setVariable ["murshun_cigs_cigTime", 0];
};
};
};

murshun_cigs_fnc_stop_cig = {
_unit = _this select 0;

_unit setVariable ["murshun_cigs_cigLitUp", false, true];
};
