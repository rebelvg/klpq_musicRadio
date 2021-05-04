params ["_vehicle"];

if (!klpq_musicRadio_enable) exitWith {};

private _simType = toLower getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "simulation");
if (_simType in ["parachute", "paraglide"]) exitWith {};

if (_vehicle getVariable ["klpq_musicRadio_actionAdded", false]) exitWith {};
_vehicle setVariable ["klpq_musicRadio_actionAdded", true];

if (isServer) then {
    [_vehicle] remoteExec ["klpq_musicRadio_fnc_unregisterRadio", 2];

    _vehicle addMPEventHandler ["MPKilled", {
        params ["_vehicle"];

        if (!isServer) exitWith {};

        [_vehicle] remoteExec ["klpq_musicRadio_fnc_unregisterRadio", 2];

        [_vehicle] remoteExec ["klpq_musicRadio_fnc_stopSong"];
    }];
};

private _actionOff = ["klpq_musicRadio_action_turnRadioOff", "Turn Radio Off", "klpq_musicRadio\music_off.paa", {
    params ["_vehicle"];

    [_vehicle] remoteExec ["klpq_musicRadio_fnc_unregisterRadio", 2];

    [_vehicle] remoteExec ["klpq_musicRadio_fnc_stopSong"];
}, {
    params ["_vehicle", "_player"];

    private _isPlaying = _vehicle getVariable ["klpq_musicRadio_radioIsOn", false];

    _isPlaying && driver _vehicle == _player && !visibleMap
}] call ace_interact_menu_fnc_createAction;
[_vehicle, 1, ["ACE_SelfActions"], _actionOff] call ace_interact_menu_fnc_addActionToObject;

private _actionOn = ["klpq_musicRadio_action_turnRadioOn", "Turn Radio On", "klpq_musicRadio\music_on.paa", {
    params ["_vehicle"];

    [_vehicle] remoteExec ["klpq_musicRadio_fnc_registerRadio", 2];

    [_vehicle] remoteExec ["klpq_musicRadio_fnc_startSong"];
}, {
    params ["_vehicle", "_player"];

    private _isPlaying = _vehicle getVariable ["klpq_musicRadio_radioIsOn", false];

    !_isPlaying && driver _vehicle == _player && !visibleMap
}] call ace_interact_menu_fnc_createAction;
[_vehicle, 1, ["ACE_SelfActions"], _actionOn] call ace_interact_menu_fnc_addActionToObject;
