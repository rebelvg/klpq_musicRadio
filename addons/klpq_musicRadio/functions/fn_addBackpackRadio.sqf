params ["_unit"];

if (!isServer) exitWith {};

if (!klpq_musicRadio_enable) exitWith {};

[_unit] spawn {
    params ["_unit"];

    waitUntil {time > 0};

    _backpack = backpackContainer _unit;

    if (_backpack getVariable ["klpq_musicRadio_actionAdded", false]) exitWith {};
    _backpack setVariable ["klpq_musicRadio_actionAdded", true, true];

    _backpack setVariable ["klpq_musicRadio_loudRadioIsOn", false, true];

    klpq_musicRadio_loudRadios pushBack _backpack;
};

nil
