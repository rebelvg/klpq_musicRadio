params ["_object", ["_enabled", true]];

if (!klpq_musicRadio_enable) exitWith {};

if (!isServer) exitWith {};

if (_object getVariable ["klpq_musicRadio_actionAdded", false]) exitWith {};
_object setVariable ["klpq_musicRadio_actionAdded", true, true];

if (_enabled) then {
  [_object] remoteExec ["klpq_musicRadio_fnc_registerRadio", 2];
} else {
  [_object] remoteExec ["klpq_musicRadio_fnc_unregisterRadio", 2];
};

[_object] remoteExec ["klpq_musicRadio_fnc_addRadioAction", 0, true];

nil
