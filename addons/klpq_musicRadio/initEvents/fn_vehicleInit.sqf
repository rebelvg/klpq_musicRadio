params ["_vehicle"];

if (!klpq_musicRadio_enable) exitWith {};

_simType = toLower getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "simulation");
if (_simType in ["parachute", "paraglide"]) exitWith {};

if (_vehicle getVariable ["klpq_musicRadio_actionAdded", false]) exitWith {};
_vehicle setVariable ["klpq_musicRadio_actionAdded", true];

if (isServer) then {
    _vehicle setVariable ["klpq_musicRadio_radioIsOn", false, true];
    _vehicle setVariable ["klpq_musicRadio_loudRadioIsOn", false, true];

    klpq_musicRadio_loudRadios pushBack _vehicle;

    _vehicle addMPEventHandler ["MPKilled", {
        params ["_vehicle"];

        if (!isServer) exitWith {};

        [[_vehicle], "klpq_musicRadio_fnc_stopSongOnRadio"] call BIS_fnc_MP;
        [_vehicle] spawn klpq_musicRadio_fnc_stopLoudRadio;
    }];
};

_vehicle addEventHandler ["GetIn", {
    _vehicle = _this select 0;
    _playerEntered = _this select 2;

    if (_playerEntered == player) then {
        if (_vehicle getVariable ["klpq_musicRadio_radioIsOn", false]) then {
            call klpq_musicRadio_fnc_playMusic;
        };
    };
}];

_vehicle addEventHandler ["GetOut", {
    _playerExited = _this select 2;

    if (_playerExited == player) then {
        playMusic "";
    };
}];

_action = ["klpq_musicRadio_action_turnRadioOff", "Turn Radio Off", "klpq_musicRadio\music_off.paa", {
    params ["_vehicle"];

    [[_vehicle], "klpq_musicRadio_fnc_stopSongOnRadio"] call BIS_fnc_MP;
}, {
    params ["_vehicle", "_player"];

    _isPlaying = _vehicle getVariable ["klpq_musicRadio_radioIsOn", false];

    _isPlaying && driver _vehicle == _player
}] call ace_interact_menu_fnc_createAction;
[_vehicle, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["klpq_musicRadio_action_turnRadioOn", "Turn Radio On", "klpq_musicRadio\music_on.paa", {
    params ["_vehicle"];

    [_vehicle] spawn klpq_musicRadio_fnc_stopLoudRadio;
    [[_vehicle], "klpq_musicRadio_fnc_playSongOnRadio"] call BIS_fnc_MP;
}, {
    params ["_vehicle", "_player"];

    _isPlaying = _vehicle getVariable ["klpq_musicRadio_radioIsOn", false];

    !_isPlaying && driver _vehicle == _player
}] call ace_interact_menu_fnc_createAction;
[_vehicle, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["klpq_musicRadio_action_turnLoudRadioOff", "Turn Loudspeaker Off", "klpq_musicRadio\loud_off.paa", {
    params ["_vehicle"];

    [_vehicle] spawn klpq_musicRadio_fnc_stopLoudRadio;
}, {
    params ["_vehicle", "_player"];

    _isPlaying = _vehicle getVariable ["klpq_musicRadio_loudRadioIsOn", false];

    _isPlaying && driver _vehicle == _player
}] call ace_interact_menu_fnc_createAction;
[_vehicle, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["klpq_musicRadio_action_turnLoudRadioOn", "Turn Loudspeaker On", "klpq_musicRadio\loud_on.paa", {
    params ["_vehicle"];

    [[_vehicle], "klpq_musicRadio_fnc_stopSongOnRadio"] call BIS_fnc_MP;
    [_vehicle] spawn klpq_musicRadio_fnc_startLoudRadio;
}, {
    params ["_vehicle", "_player"];

    _isPlaying = _vehicle getVariable ["klpq_musicRadio_loudRadioIsOn", false];

    !_isPlaying && driver _vehicle == _player
}] call ace_interact_menu_fnc_createAction;
[_vehicle, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
