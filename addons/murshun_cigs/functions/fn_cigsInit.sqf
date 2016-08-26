murshun_cigs_cigsArray = ["EWK_Cigar1", "EWK_Cigar2", "EWK_Cig1", "EWK_Cig2", "EWK_Cig3", "EWK_Cig4", "EWK_Glasses_Cig1", "EWK_Glasses_Cig2", "EWK_Glasses_Cig3", "EWK_Glasses_Cig4", "EWK_Glasses_Shemag_GRE_Cig6", "EWK_Glasses_Shemag_NB_Cig6", "EWK_Glasses_Shemag_tan_Cig6", "EWK_Cig5", "EWK_Glasses_Cig5", "EWK_Cig6", "EWK_Glasses_Cig6", "EWK_Shemag_GRE_Cig6", "EWK_Shemag_NB_Cig6", "EWK_Shemag_tan_Cig6", "murshun_cigs_cig0", "murshun_cigs_cig1", "murshun_cigs_cig2", "murshun_cigs_cig3", "murshun_cigs_cig4"];

murshun_cigs_standingAnimationsArray = ["amovpercmstpsraswrfldnon", "amovpercmstpslowwrfldnon", "amovpercmstpsraswpstdnon", "amovpercmstpslowwpstdnon", "amovpercmstpsnonwnondnon", "amovpercmstpsraswlnrdnon", "amovpercmstpsoptwbindnon"];

murshun_cigs_fnc_smoke = {
	_unit = _this select 0;

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

	_source attachTo [_unit,[0,0.06,0], "head"];
	sleep 0.4;
	deleteVehicle _source;
};

murshun_cigs_fnc_anim = {
	_unit = _this select 0;

	if (!alive _unit || vehicle _unit != _unit) exitWith {};

	if (_unit getVariable ["ACE_isUnconscious", false]) exitWith {};

	_animation = animationState _unit;

	if (animationState _unit in murshun_cigs_standingAnimationsArray && isClass (configFile >> "CfgPatches" >> "ewk_cigs")) then {
		[[_unit, "EWK_CIGS_SMOKING_ERC_CTS"], "switchMove"] call BIS_fnc_MP;
		
		sleep 3;
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
	_unit = _this select 0;
	_player = _this select 1;
	
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
	_unit = _this select 0;
	_player = _this select 1;

	if (!("murshun_cigs_matches" in (magazines _player)) && !("murshun_cigs_lighter" in (magazines _player))) exitWith {
		[localize "STR_murshun_cigs_no_matches_or_lighter_his", 2.5, _player] spawn ace_common_fnc_displayTextStructured;
	};
	
	[_unit, _player] spawn murshun_cigs_fnc_item;

	_player playActionNow "PutDown";

	[[_unit, _player], "murshun_cigs_fnc_start_cig", _unit] call BIS_fnc_MP;
};

murshun_cigs_fnc_start_cig_your = {
	_player = _this select 0;
	
	if (!("murshun_cigs_matches" in (magazines _player)) && !("murshun_cigs_lighter" in (magazines _player))) exitWith {
		[localize "STR_murshun_cigs_no_matches_or_lighter_your", 2.5, _player] spawn ace_common_fnc_displayTextStructured;
	};
	
	[_player, _player] spawn murshun_cigs_fnc_item;
	
	[_player] spawn murshun_cigs_fnc_start_cig;
};

murshun_cigs_fnc_start_cig = {
	_unit = _this select 0;

	if (!(local _unit)) exitWith {};

	_cigTime = 0;
	_goggles = goggles _unit;

	if (_goggles in murshun_cigs_cigsArray) then {
		_goggles_current = _goggles;

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

		[_unit] spawn murshun_cigs_fnc_anim;

		_unit setVariable ["murshun_cigs_cigLitUp", true, true];
		sleep (3.5 + random 2);
		[[_unit], "murshun_cigs_fnc_smoke"] call BIS_fnc_MP;
		sleep (1 + random 1);
		[[_unit], "murshun_cigs_fnc_smoke"] call BIS_fnc_MP;

		while ({alive _unit and _goggles_current in murshun_cigs_cigsArray and (_unit getVariable ["murshun_cigs_cigLitUp", false]) and _cigTime <= 330}) do {
			_goggles_current = goggles _unit;
			_newGoggles = "";
			
			if (_goggles_current == "EWK_Cig1" && _cigTime >= 60) then {
				_newGoggles = "EWK_Cig4";
			};
			if (_goggles_current == "EWK_Cig4" && _cigTime >= 120) then {
				_newGoggles = "EWK_Cig6";
			};
			if (_goggles_current == "EWK_Cig6" && _cigTime >= 300) then {
				_newGoggles = "EWK_Cig3";
			};
			if (_goggles_current == "murshun_cigs_cig0" && _cigTime >= 6) then {
				_newGoggles = "murshun_cigs_cig1";
			};
			if (_goggles_current == "murshun_cigs_cig1" && _cigTime >= 60) then {
				_newGoggles = "murshun_cigs_cig2";
			};
			if (_goggles_current == "murshun_cigs_cig2" && _cigTime >= 120) then {
				_newGoggles = "murshun_cigs_cig3";
			};
			if (_goggles_current == "murshun_cigs_cig3" && _cigTime >= 300) then {
				_newGoggles = "murshun_cigs_cig4";
			};
			
			if (_newGoggles != "") then {
				removeGoggles _unit;
				_unit addGoggles _newGoggles;
				_goggles_current = _newGoggles;
			};
			
			_cigTime = _cigTime + 6;

			[[_unit], "murshun_cigs_fnc_smoke"] call BIS_fnc_MP;
			_fatigue = getFatigue _unit;
			_unit setFatigue _fatigue + 0.01;
			
			sleep (5.5 + random 2);

			_goggles = goggles _unit;
			if (_goggles_current != _goggles) exitWith {};
		};
		
		_unit setVariable ["murshun_cigs_cigLitUp", false, true];
		if (_cigTime >= 330) then {
			removeGoggles _unit;
		};
	};
};

murshun_cigs_fnc_take_cig_from_pack = {
	_player = _this select 0;
	
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
	_player = _this select 0;

	_player setVariable ["murshun_cigs_cigLitUp", false, true];
};
