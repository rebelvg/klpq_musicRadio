if (!klpq_musicRadio_enable) exitWith {};

[] spawn {
    if (!hasInterface) exitWith {};

    waitUntil {!isNull player};

    player addEventHandler ["Respawn", {
        playMusic "";
    }];
};

[] spawn {
    if (!isServer) exitWith {};

    waitUntil {time > 0};

    _musicArray = klpq_musicRadio_radioSongs;

    if (count _musicArray == 0) then {
        {
            _searchString = format ["getText (_x >> 'theme') == '%1'", _x];
            _musicArray = _musicArray + (_searchString configClasses (configFile >> "CfgMusic"));
        } forEach klpq_musicRadio_radioThemes;

        _musicArray = _musicArray apply {configName _x};
    };

    if (count _musicArray == 0) then {
        _musicArray = "true" configClasses (configFile >> "CfgMusic");

        _musicArray = _musicArray apply {configName _x};
    };

    _musicArray = _musicArray select {getText (configFile >> "CfgMusic" >> _x >> "tag") == "klpq_musicRadio"};

    if (count _musicArray == 0) exitWith {};

    while {true} do {
        klpq_musicRadio_radioSongs = [_musicArray, 4 * count _musicArray] call KK_fnc_arrayShufflePlus;

        {
            klpq_musicRadio_nowPlaying = _x;
            klpq_musicRadio_timeStarted = CBA_missionTime;

            publicVariable "klpq_musicRadio_nowPlaying";
            publicVariable "klpq_musicRadio_timeStarted";

            _songLength = getNumber (configFile >> "CfgMusic" >> klpq_musicRadio_nowPlaying >> "duration");

            [[], "klpq_musicRadio_fnc_startNewSong"] call BIS_fnc_MP;

            {
                deleteVehicle (_x getVariable ["klpq_musicRadio_hiddenRadio", objNull]);

                if (alive _x && _x getVariable ["klpq_musicRadio_loudRadioIsOn", false]) then {
                    [_x] spawn klpq_musicRadio_fnc_startLoudRadio;
                };
            } forEach klpq_musicRadio_loudRadios;

            sleep _songLength;
        } forEach klpq_musicRadio_radioSongs;
    };
};
