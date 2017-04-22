KLPQ MUSIC RADIO MOD SOURCES by KLPQ.men

-- Credits
Rebel - configs, scripting.
Facel - icons.

-- Threads
https://forums.bistudio.com/forums/topic/203641-klpq-music-radio/

-- Downloads
https://github.com/rebelvg/klpq_musicRadio/releases

-- Requirements
Latest ARMA 3.
CBA.
ACE3.

-- Usage

Ingame.
All actions are available via ACE Interaction.

Variables.
klpq_musicRadio_enable - bool, enables music radio.
klpq_musicRadio_radioThemes - array, sets themes for music radio, leave empty for all themes.
klpq_musicRadio_startRadioSongs - array, sets certain songs for music radio to play first.
klpq_musicRadio_radioSongs - array, sets songs for music radio, leave empty for all songs.
klpq_musicRadio_enableBackpackRadioMP - bool, allows all backpacks to play radio in MP.

Functions.
[_object, true] call klpq_musicRadio_fnc_addRadio; - adds radio to the object, true to make it play at start.
[_unit] call klpq_musicRadio_fnc_addBackpackRadio; - adds radio to the backpack of the unit.
call klpq_musicRadio_fnc_exportSongsList; - exports list of configured songs to clipboard.

CBA settings.
Radio volume - controls music radio volume, only has effect on next song start.
Loudspeaker volume - controls loudspeaker volume, only has effect on next song start.
All backpacks can play radio - allows you to use backpack loudspeaker feature in SP.
