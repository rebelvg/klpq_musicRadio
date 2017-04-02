params ["_object", ["_enabled", true]];

if (!klpq_musicRadio_enable) exitWith {};

if (_object getVariable ["klpq_musicRadio_actionAdded", false]) exitWith {};
_object setVariable ["klpq_musicRadio_actionAdded", true];

if (isServer) then {
    _object setVariable ["klpq_musicRadio_loudRadioIsOn", _enabled, true];

    klpq_musicRadio_loudRadios = klpq_musicRadio_loudRadios + [_object];
};

_action = ["klpq_musicRadio_action_turnLoudRadioOff", "Turn Radio Off", "klpq_musicRadio\loud_off.paa", {
    params ["_object"];

    [_object] spawn klpq_musicRadio_fnc_stopLoudRadio;
}, {
    params ["_object"];

    _isPlaying = _object getVariable ["klpq_musicRadio_loudRadioIsOn", false];

    _isPlaying
}] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["klpq_musicRadio_action_turnLoudRadioOn", "Turn Radio On", "klpq_musicRadio\loud_on.paa", {
    params ["_object"];

    [_object] spawn klpq_musicRadio_fnc_startLoudRadio;
}, {
    params ["_object"];

    _isPlaying = _object getVariable ["klpq_musicRadio_loudRadioIsOn", false];

    !_isPlaying
}] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
