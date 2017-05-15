params ["_unit"];

if (!klpq_musicRadio_enable) exitWith {};

if (!local _unit) exitWith {};

[{time > 0}, {
    params ["_unit"];

    private _backpack = backpackContainer _unit;

    if (_backpack getVariable ["klpq_musicRadio_actionAdded", false]) exitWith {};
    _backpack setVariable ["klpq_musicRadio_actionAdded", true, true];

    _backpack setVariable ["klpq_musicRadio_loudRadioIsOn", false, true];
}, [_unit]] call CBA_fnc_waitUntilAndExecute;

nil
