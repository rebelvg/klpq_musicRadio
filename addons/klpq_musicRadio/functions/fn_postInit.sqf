if (!klpq_musicRadio_enable) exitWith {};

[] spawn {
    if (!hasInterface) exitWith {};

    waitUntil {!isNull player};

    player addEventHandler ["Respawn", {
        playMusic "";
    }];

    player addEventHandler ["GetInMan", {
        params ["_vehicle"];

        _backpack = backpackContainer _vehicle;

        [_backpack] spawn klpq_musicRadio_fnc_stopLoudRadio;
    }];

    _action = ["klpq_musicRadio_action_turnLoudRadioOff", "Turn Backpack Speaker Off", "klpq_musicRadio\loud_off.paa", {
        params ["_vehicle"];

        _backpack = backpackContainer _vehicle;

        [_backpack] spawn klpq_musicRadio_fnc_stopLoudRadio;
    }, {
        params ["_vehicle", "_player"];

        _backpack = backpackContainer _vehicle;

        _isPlaying = _backpack getVariable ["klpq_musicRadio_loudRadioIsOn", false];

        _isPlaying
    }] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToObject;

    _action = ["klpq_musicRadio_action_turnLoudRadioOn", "Turn Backpack Speaker On", "klpq_musicRadio\loud_on.paa", {
        params ["_vehicle"];

        _backpack = backpackContainer _vehicle;

        [_backpack] spawn klpq_musicRadio_fnc_startLoudRadio;
    }, {
        params ["_vehicle", "_player"];

        _backpack = backpackContainer _vehicle;

        _isPlaying = _backpack getVariable ["klpq_musicRadio_loudRadioIsOn", false];

        !_isPlaying && _backpack getVariable ["klpq_musicRadio_actionAdded", false] && vehicle _vehicle == _vehicle
    }] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToObject;

    [
    "klpq_musicRadio_loudspeakerVolume",
    "LIST",
    "Loudspeaker Volume",
    "KLPQ Music Radio",
    [[-1, 0, 1, 2], ["Disabled", "Low", "Normal", "High"], 3],
    nil,
    {}
    ] call CBA_Settings_fnc_init;
};

[] spawn {
    if (!isServer) exitWith {};

    waitUntil {time > 0};

    _musicArray = klpq_musicRadio_radioSongs;

    _musicArray = _musicArray select {getText (configFile >> "CfgMusic" >> _x >> "tag") == "klpq_musicRadio"};

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

    klpq_musicRadio_radioSongs = _musicArray;

    klpq_musicRadio_startRadioSongs = klpq_musicRadio_startRadioSongs select {getText (configFile >> "CfgMusic" >> _x >> "tag") == "klpq_musicRadio"};

    while {true} do {
        _shuffledMusicArray = [_musicArray, 4 * count _musicArray] call KK_fnc_arrayShufflePlus;
        _shuffledMusicArray = klpq_musicRadio_startRadioSongs + _shuffledMusicArray;

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
        } forEach _shuffledMusicArray;
    };
};
