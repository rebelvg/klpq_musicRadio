if (!klpq_musicRadio_enable) exitWith {};

[] spawn {
    if (!hasInterface) exitWith {};

    waitUntil {!isNull player};

    player addEventHandler ["Respawn", {
        playMusic "";
    }];

    player addEventHandler ["GetInMan", {
        params ["_vehicle"];

        private _backpack = backpackContainer _vehicle;

        [_backpack] spawn klpq_musicRadio_fnc_stopLoudRadio;
    }];

    private _action = ["klpq_musicRadio_action_turnLoudRadioOff", "Turn Backpack Speaker Off", "klpq_musicRadio\loud_off.paa", {
        params ["_vehicle"];

        private _backpack = backpackContainer _vehicle;

        [_backpack] spawn klpq_musicRadio_fnc_stopLoudRadio;
    }, {
        params ["_vehicle", "_player"];

        private _backpack = backpackContainer _vehicle;

        private _isPlaying = _backpack getVariable ["klpq_musicRadio_loudRadioIsOn", false];

        _isPlaying && !visibleMap
    }] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToObject;

    _action = ["klpq_musicRadio_action_turnLoudRadioOn", "Turn Backpack Speaker On", "klpq_musicRadio\loud_on.paa", {
        params ["_vehicle"];

        private _backpack = backpackContainer _vehicle;

        [_backpack] spawn klpq_musicRadio_fnc_startLoudRadio;

        [_backpack] remoteExec ["klpq_musicRadio_fnc_addLoudRadio", 2];
    }, {
        params ["_vehicle", "_player"];

        private _backpack = backpackContainer _vehicle;

        private _isPlaying = _backpack getVariable ["klpq_musicRadio_loudRadioIsOn", false];

        !_isPlaying && !isNull _backpack && (_backpack getVariable ["klpq_musicRadio_actionAdded", false] || klpq_musicRadio_enableBackpackRadioMP || (klpq_musicRadio_enableBackpackRadioSP && !isMultiplayer)) && vehicle _vehicle == _vehicle && !visibleMap
    }] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToObject;

    [
    "klpq_musicRadio_radioVolumePercent",
    "SLIDER",
    "Radio Volume",
    "KLPQ Music Radio",
    [0, 100, 100, 0],
    nil,
    {
        params ["_value"];
        0 fadeMusic (_value / 100);
    }
    ] call CBA_Settings_fnc_init;

    [
    "klpq_musicRadio_loudspeakerVolume",
    "LIST",
    "Loudspeaker Volume",
    "KLPQ Music Radio",
    [[-1, 0, 1, 2], ["Disabled", "Low", "Normal", "High"], 3],
    nil,
    {}
    ] call CBA_Settings_fnc_init;

    [
    "klpq_musicRadio_enableBackpackRadioSP",
    "CHECKBOX",
    "All Backpacks Can Play Radio (SP Only)",
    "KLPQ Music Radio",
    false,
    nil,
    {}
    ] call CBA_Settings_fnc_init;

    [
    "klpq_musicRadio_displayTilesOnLoudRadio",
    "CHECKBOX",
    "Display Song Tiles For Loudspeakers",
    "KLPQ Music Radio",
    true,
    nil,
    {}
    ] call CBA_Settings_fnc_init;
};

[] spawn {
    if (!isServer) exitWith {};

    waitUntil {time > 0};

    private _allMusic = "true" configClasses (configFile >> "CfgMusic");
    _allMusic append ("true" configClasses (missionConfigFile >> "CfgMusic"));
    _allMusic = _allMusic select {(getText (_x >> "tag")) == klpq_musicRadio_configTag};

    private _musicArray = _allMusic select {(configName _x) in klpq_musicRadio_radioSongs};

    if (count _musicArray == 0) then {
        _musicArray = _allMusic select {(getText (_x >> "theme")) in klpq_musicRadio_radioThemes};
    };

    if (count _musicArray == 0) then {
        _musicArray = _allMusic select {(getNumber (_x >> "klpq_ignoreTrack")) == 0};
    };

    if (count _musicArray == 0) exitWith {};

    klpq_musicRadio_radioSongs = _musicArray;

    klpq_musicRadio_startRadioSongs = (_allMusic select {(configName _x) in klpq_musicRadio_startRadioSongs});

    while {true} do {
        private _shuffledMusicArray = [_musicArray, 4 * count _musicArray] call KK_fnc_arrayShufflePlus;
        _shuffledMusicArray = klpq_musicRadio_startRadioSongs + _shuffledMusicArray;

        {
            klpq_musicRadio_nowPlaying = configName _x;
            klpq_musicRadio_timeStarted = CBA_missionTime;

            publicVariable "klpq_musicRadio_nowPlaying";
            publicVariable "klpq_musicRadio_timeStarted";

            private _songLength = getNumber (_x >> "duration");

            [[], "klpq_musicRadio_fnc_startNewSong"] call BIS_fnc_MP;

            {
                deleteVehicle (_x getVariable ["klpq_musicRadio_hiddenRadio", objNull]);

                if (alive _x && _x getVariable ["klpq_musicRadio_loudRadioIsOn", false]) then {
                    [_x] spawn klpq_musicRadio_fnc_startLoudRadio;
                };
            } forEach klpq_musicRadio_loudRadios;

            sleep (_songLength max 1);
        } forEach _shuffledMusicArray;
    };
};
