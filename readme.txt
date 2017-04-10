KLPQ MUSIC RADIO MOD SOURCES by KLPQ.men

Rebel - configs, scripting.
Facel - icons.

Usage.
klpq_musicRadio_enable - bool, enables music radio.
klpq_musicRadio_radioThemes - array, sets themes for music radio, leave empty for all themes.
klpq_musicRadio_startRadioSongs - array, sets certain songs for music radio to play first.
klpq_musicRadio_radioSongs - array, sets songs for music radio, leave empty for all songs.
0 = [_object, true] call klpq_musicRadio_fnc_addRadio; - adds radio to the object, true to make it play at start.
0 = [_unit] call klpq_musicRadio_fnc_addBackpackRadio; - adds radio to the backpack of the unit.
