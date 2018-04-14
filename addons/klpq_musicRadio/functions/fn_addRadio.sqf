params ["_object", ["_enabled", true]];

if (!klpq_musicRadio_enable) exitWith {};

if (!isServer) exitWith {};

if (_object getVariable ["klpq_musicRadio_actionAdded", false]) exitWith {};
_object setVariable ["klpq_musicRadio_actionAdded", true, true];

_object setVariable ["klpq_musicRadio_loudRadioIsOn", _enabled, true];

klpq_musicRadio_loudRadios pushBack _object;

[_object] remoteExec ["klpq_musicRadio_fnc_addRadioRemote", 0, true];

nil
