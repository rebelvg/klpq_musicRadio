klpq_musicRadio_fnc_playMusic = {
    if (klpq_musicRadio_radioVolumePercent == 0) exitWith {};

    playMusic "";
    playMusic [klpq_musicRadio_nowPlaying, CBA_missionTime - klpq_musicRadio_timeStarted];
    0 fadeMusic (klpq_musicRadio_radioVolumePercent / 100);

    [klpq_musicRadio_nowPlaying] call klpq_musicRadio_fnc_displayTiles;
};

klpq_musicRadio_fnc_findTrackConfig = {
    params ["_root", ["_trackName", ""]];

    private _trackConfig = configNull;

    if (isClass (configFile >> _root >> _trackName)) then {
        _trackConfig = configFile >> _root >> _trackName;
    };

    if (isClass (missionConfigFile >> _root >> _trackName)) then {
        _trackConfig = missionConfigFile >> _root >> _trackName;
    };

    _trackConfig
};

klpq_musicRadio_fnc_displayTiles = {
    params [["_trackName", ""]];

    private _trackConfig = ["CfgMusic", _trackName] call klpq_musicRadio_fnc_findTrackConfig;

    private _artist = getText (_trackConfig >> "artist");
    private _title = getText (_trackConfig >> "title");

    if (count _artist == 0 || count _title == 0) exitWith {};

    private _tileSize = linearConversion [100, 10, count (_artist + _title), 1.6, 2.2, true];

    private _tilePos = [
        (safezoneX + safezoneW - 21 * (((safezoneW / safezoneH) min 1.2) / 35)),
        (safezoneY + safezoneH - 13 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)),
        20 * (((safezoneW / safezoneH) min 1.2) / 35),
        10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)
    ];

    [parseText format ["<t font='PuristaBold' shadow='2' align='right' size='%3'>""%1""</t><br/><t shadow='2' align='right' size='%4'>by %2</t>", _title, _artist, _tileSize, _tileSize - 0.2], _tilePos, nil, 7, 1, 0] spawn BIS_fnc_textTiles;
};

klpq_musicRadio_fnc_startNewSong = {
    if ((vehicle player) getVariable ['klpq_musicRadio_radioIsOn', false]) then {
        call klpq_musicRadio_fnc_playMusic;
    };
};

klpq_musicRadio_fnc_playSongOnRadio = {
    params ["_vehicle"];

    if (isServer) then {
        _vehicle setVariable ["klpq_musicRadio_radioIsOn", true, true];
    };

    if (player in crew _vehicle) then {
        call klpq_musicRadio_fnc_playMusic;
    };
};

klpq_musicRadio_fnc_stopSongOnRadio = {
    params ["_vehicle"];

    if (isServer) then {
        _vehicle setVariable ["klpq_musicRadio_radioIsOn", false, true];
    };

    if (player in crew _vehicle) then {
        playMusic "";
    };
};

klpq_musicRadio_fnc_startLoudRadio = {
    params ["_vehicle"];

    private _hiddenRadio = "#particleSource" createVehicle [0, 0, 0];

    [[_hiddenRadio, true], "hideObjectGlobal", false] call BIS_fnc_MP;
    hideObject _hiddenRadio;
    _hiddenRadio allowDamage false;

    _hiddenRadio setPosATL getPosATL _vehicle;
    _hiddenRadio attachTo [_vehicle, [0, 0, 0]];
    _vehicle setVariable ["klpq_musicRadio_hiddenRadio", _hiddenRadio, true];

    _vehicle setVariable ["klpq_musicRadio_loudRadioIsOn", true, true];

    if (klpq_musicRadio_nowPlaying == "") exitWith {};

    if (_vehicle isKindOf "air") then {
        [[_hiddenRadio, klpq_musicRadio_nowPlaying + "_loud"], "klpq_musicRadio_fnc_say3D"] call BIS_fnc_MP;
    } else {
        [[_hiddenRadio, klpq_musicRadio_nowPlaying], "klpq_musicRadio_fnc_say3D"] call BIS_fnc_MP;
    };
};

klpq_musicRadio_fnc_stopLoudRadio = {
    params ["_vehicle"];

    _vehicle setVariable ["klpq_musicRadio_loudRadioIsOn", false, true];
    deleteVehicle (_vehicle getVariable ["klpq_musicRadio_hiddenRadio", objNull]);
};

klpq_musicRadio_fnc_say3D = {
    params ["_hiddenRadio", "_classname"];

    if (klpq_musicRadio_loudspeakerVolume == -1) exitWith {};

    _hiddenRadio say3D format ["%1_vol%2", _classname, klpq_musicRadio_loudspeakerVolume];

    if (!klpq_musicRadio_displayTilesOnLoudRadio) exitWith {};

    private _trackConfig = ["CfgSounds", klpq_musicRadio_nowPlaying] call klpq_musicRadio_fnc_findTrackConfig;

    private _cameraPos = positionCameraToWorld [0,0,0];

    private _sound = getArray (_trackConfig >> "sound");
    _sound params ["", "", "", ["_soundDistance", 0]];

    if (_hiddenRadio distance _cameraPos < (_soundDistance / 3)) then {
        [klpq_musicRadio_nowPlaying] call klpq_musicRadio_fnc_displayTiles;
    };
};

klpq_musicRadio_fnc_addLoudRadio = {
    params ["_object"];

    klpq_musicRadio_loudRadios pushBackUnique _object;
};

klpq_musicRadio_fnc_exportSongsList = {
    private _allMusic = "true" configClasses (configFile >> "CfgMusic");
    _allMusic append ("true" configClasses (missionConfigFile >> "CfgMusic"));
    _allMusic = _allMusic select {getText (_x >> "tag") == klpq_musicRadio_configTag};

    private _addNewLine = {
        params ["_output", "_string", "_indent"];

        private _br = toString [13, 10];

        for "_i" from 1 to _indent do {
            _output = _output + "    ";
        };

        _output + _string + _br
    };

    private _output = "";

    private _allThemes = [];

    {
        private _theme = (getText (_x >> "theme"));

        if (count _theme != 0) then {
            _allThemes pushBackUnique _theme;
        };
    } forEach _allMusic;

    _output = [_output, "Themes.", 0] call _addNewLine;

    {
        _output = [_output, _x, 0] call _addNewLine;
    } forEach _allThemes;

    _output = [_output, "", 0] call _addNewLine;
    _output = [_output, "Tracks.", 0] call _addNewLine;

    {
        _output = [_output, format ["%1, %2 - %3, theme - %4, duration - %5, is ignored - %6", configName _x, parseText getText (_x >> "artist"), parseText getText (_x >> "title"), getText (_x >> "theme"), getNumber (_x >> "duration"), getNumber (_x >> "klpq_ignoreTrack")], 0] call _addNewLine;
    } forEach _allMusic;

    copyToClipboard _output;

    hintSilent "List was exported to your clipboard.";
};

klpq_musicRadio_fnc_addRadioRemote = {
    params ["_object"];

    if (isNull _object) exitWith {};

    private ["_action"];

    _action = ["klpq_musicRadio_action_turnLoudRadioOff", "Turn Radio Off", "klpq_musicRadio\loud_off.paa", {
        params ["_object"];

        [_object] spawn klpq_musicRadio_fnc_stopLoudRadio;
    }, {
        params ["_object"];

        private _isPlaying = _object getVariable ["klpq_musicRadio_loudRadioIsOn", false];

        _isPlaying
    }] call ace_interact_menu_fnc_createAction;

    [_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

    _action = ["klpq_musicRadio_action_turnLoudRadioOn", "Turn Radio On", "klpq_musicRadio\loud_on.paa", {
        params ["_object"];

        [_object] spawn klpq_musicRadio_fnc_startLoudRadio;
    }, {
        params ["_object"];

        private _isPlaying = _object getVariable ["klpq_musicRadio_loudRadioIsOn", false];

        !_isPlaying
    }] call ace_interact_menu_fnc_createAction;

    [_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
};

KK_fnc_arrayShufflePlus = {
    private ["_arr", "_cnt"];

    _arr = _this select 0;
    _cnt = count _arr;

    for "_i" from 1 to (_this select 1) do {
        _arr pushBack (_arr deleteAt floor random _cnt);
    };

    _arr
};

if !(isClass (configFile >> "CfgPatches" >> "ace_interact_menu")) then {
    ace_interact_menu_fnc_createAction = {
        params ["_handle", "_actionName", "_icon", "_statement", "_condition"];

        [_handle, _actionName, _icon, _statement, _condition]
    };

    ace_interact_menu_fnc_addActionToObject = {
        params ["_object", "_type", "_path", "_action"];
        _action params ["_handle", "_actionName", "_icon", "_statement", "_condition"];

        _conditionString = format ["%1", _condition];

        _actionCondition = format ["[_target, _this] call %1;", _conditionString];

        if (_object == player && _type == 1) then {
            _actionCondition = "if (_target != player) exitWith {false};" + _actionCondition;
        };

        _object addAction [_actionName, _statement, nil, 0, false, true, "", _actionCondition, 5, false];

        if (_object == player && local _object) then {
            [_object, "Respawn", {
                params ["_unit"];
                _thisArgs params ["_actionName", "_statement", "_actionCondition"];

                _unit addAction [_actionName, _statement, nil, 0, false, true, "", _actionCondition, 5, false];
            }, [_actionName, _statement, _actionCondition]] call CBA_fnc_addBISEventHandler;
        };
    };
};

if (isNil "klpq_musicRadio_loudRadios") then {
    klpq_musicRadio_loudRadios = [];
};

if (isNil "klpq_musicRadio_timeStarted") then {
    klpq_musicRadio_timeStarted = 0;
};

if (isNil "klpq_musicRadio_nowPlaying") then {
    klpq_musicRadio_nowPlaying = "";
};

if (isNil "klpq_musicRadio_startRadioSongs") then {
    klpq_musicRadio_startRadioSongs = [];
};

if (isNil "klpq_musicRadio_radioSongs") then {
    klpq_musicRadio_radioSongs = [];
};

if (isNil "klpq_musicRadio_radioThemes") then {
    klpq_musicRadio_radioThemes = [];
};

if (isNil "klpq_musicRadio_enable") then {
    klpq_musicRadio_enable = true;
};

if (isNil "klpq_musicRadio_radioVolumePercent") then {
    klpq_musicRadio_radioVolumePercent = 100;
};

if (isNil "klpq_musicRadio_loudspeakerVolume") then {
    klpq_musicRadio_loudspeakerVolume = 2;
};

if (isNil "klpq_musicRadio_enableBackpackRadioSP") then {
    klpq_musicRadio_enableBackpackRadioSP = false;
};

if (isNil "klpq_musicRadio_enableBackpackRadioMP") then {
    klpq_musicRadio_enableBackpackRadioMP = false;
};

if (isNil "klpq_musicRadio_displayTilesOnLoudRadio") then {
    klpq_musicRadio_displayTilesOnLoudRadio = true;
};

klpq_musicRadio_configTag = "klpq_musicRadio_v1";
