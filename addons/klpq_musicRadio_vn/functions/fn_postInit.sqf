[] spawn {
  if (!hasInterface) exitWith {};

#  waitUntil {!isNull player};

#  [
#    "klpq_musicRadio_vn_allRadiosPlayMusic",
#    "CHECKBOX",
#    "All VN Radios Play Music",
#    "KLPQ Music Radio",
#    false,
#    nil,
#    {},
#    true
#  ] call CBA_Settings_fnc_init;
};
