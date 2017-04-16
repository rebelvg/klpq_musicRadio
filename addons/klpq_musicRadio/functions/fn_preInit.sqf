klpq_musicRadio_fnc_playMusic = {
    if (klpq_musicRadio_radioVolume == -1) exitWith {};

    playMusic "";
    playMusic [klpq_musicRadio_nowPlaying, CBA_missionTime - klpq_musicRadio_timeStarted];
    0 fadeMusic klpq_musicRadio_radioVolume;

    _artist = getText (configFile >> "CfgMusic" >> klpq_musicRadio_nowPlaying >> "artist");
    _title = getText (configFile >> "CfgMusic" >> klpq_musicRadio_nowPlaying >> "title");

    if (count _artist == 0 || count _title == 0) exitWith {};

    [parseText format ["<t font='PuristaBold' shadow='2' align='right' size='2.2'>""%1""</t><br/><t shadow='2' align='right' size='2.0'>%2</t>", _title, format ["by %1", _artist]], true, nil, 7, 1, 0] spawn BIS_fnc_textTiles;
};

klpq_musicRadio_fnc_startNewSong = {
    if ((vehicle player) getVariable ['klpq_musicRadio_radioIsOn', false]) then {
        call klpq_musicRadio_fnc_playMusic;
    };
};

klpq_musicRadio_fnc_playSongOnRadio = {
    _vehicle = _this select 0;

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

    _hiddenRadio = "#particleSource" createVehicle [0, 0, 0];

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
};

klpq_musicRadio_fnc_exportSongsList = {
    _musicArray = "true" configClasses (configFile >> "CfgMusic");
    _musicArray = _musicArray select {getText (_x >> "tag") == klpq_musicRadio_configTag};

    private _addNewLine = {
        params ["_string", "_indent"];

        _br = toString [13, 10];

        for "_i" from 1 to _indent do {
            _output = _output + "    ";
        };

        _output = _output + _string + _br;
    };

    private _output = "";

    {
        [format ["%1, %2 - %3, theme - %4, duration - %5", configName _x, getText (_x >> "artist"), getText (_x >> "title"), getText (_x >> "theme"), getNumber (_x >> "duration")], 0] call _addNewLine;
    } forEach _musicArray;

    copyToClipboard _output;

    hintSilent "List was exported to your clipboard.";
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

if (isNil "klpq_musicRadio_radioVolume") then {
    klpq_musicRadio_radioVolume = 1;
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

klpq_musicRadio_configTag = "klpq_musicRadio_v1";
