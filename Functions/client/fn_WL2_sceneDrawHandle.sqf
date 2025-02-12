addMissionEventHandler ["Draw3D", {
	if !(isNull (missionNamespace getVariable format ["BIS_WL_currentTarget_%1", BIS_WL_playerSide])) then {
		drawIcon3D [
			BIS_WL_currentTargetData # 0,
			BIS_WL_currentTargetData # 1,
			BIS_WL_currentTargetData # 2,
			1,
			1,
			0,
			"",
			0,
			0,
			"RobotoCondensedBold",
			"center",
			TRUE
		];
		_droneView = getConnectedUAVUnit player;
		_pos = getPosVisual (if (isNull(_droneView)) then { player } else { _droneView });
		_dist = _pos distance (missionNamespace getVariable format ["BIS_WL_currentTarget_%1", BIS_WL_playerSide]);
		_units = "m";
		_dist = ceil _dist;
		if (_dist > 1000) then {_dist = _dist / 100; _dist = round _dist; _dist = _dist / 10; _units = "km"};
		drawIcon3D [
			"",
			[1, 1, 1, 0.5],
			BIS_WL_currentTargetData # 2,
			0,
			0.75,
			0,
			format ["%1%2 %3", _dist, if (_dist % 1 == 0 && _units == "km") then {".0"} else {""}, if (_units == "m") then {BIS_WL_localized_m} else {BIS_WL_localized_km}],
			2,
			0.03,
			"RobotoCondensedBold"
		];
	};

	private _displayedPlayers = allPlayers select {
		private _eligible = _x != player && BIS_WL_playerSide == side group _x && alive _x;
		if (_eligible) then {
			private _isInMySquad = ["isInMySquad", [getPlayerID _x]] call SQD_fnc_client;
			private _distance = _x distanceSqr player;
			if (_isInMySquad) then {
				_distance < (1000 * 1000);
			} else {
				_distance < (100 * 100);
			};
		} else {
			false;
		};
	};
	{
		private _isInMySquad = ["isInMySquad", [getPlayerID _x]] call SQD_fnc_client;
		_color = if (_isInMySquad) then { [0.5, 0.5, 1, 0.8] } else { [1, 1, 1, 0.8] };
		_size = if (_isInMySquad) then { 0.04 } else { 0.03 };

		drawIcon3D [
			"A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa",
			_color,
			if (vehicle _x == _x) then {
				(_x modelToWorldVisual (_x selectionPosition "head")) vectorAdd [0,0,0.6];
			} else {
				getPosATLVisual _x
			},
			0,
			0,
			0,
			name _x,
			2,
			_size,
			"RobotoCondensedBold",
			"center"
		];
	} forEach _displayedPlayers;
}];