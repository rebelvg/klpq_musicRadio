# KLPQ MUSIC RADIO MOD by KLPQ.men

## Overview
- https://www.youtube.com/watch?v=SfBJ06N7N6k
- https://www.youtube.com/watch?v=9JMifXQhf4g

This is a configurable music radio mod.
It provides an ability to play music inside of the vehicles. How it works in-game and how to configure it for your community is explained in the videos above.
Mod itself doesn't come with any music. It's up to you to add anything you want.

## Credits
- Rebel - configs, scripting.
- Facel - icons.

## Threads
- https://forums.bistudio.com/forums/topic/203641-klpq-music-radio/

## Downloads
- https://github.com/rebelvg/klpq_musicRadio/releases
- http://steamcommunity.com/sharedfiles/filedetails/?id=1241545493

## Dependencies

### Requirements
- Latest ARMA 3.
- CBA.

### Optionals
- ACE3.

## Usage

### Ingame
Mod supports both vanilla and ACE interaction systems.

### Variables
- ```klpq_musicRadio_enable``` - bool, enables music radio.
- ```klpq_musicRadio_radioThemes``` - array, sets themes for music radio, leave empty for all themes.
- ```klpq_musicRadio_startRadioSongs``` - array, sets certain songs for music radio to play first.
- ```klpq_musicRadio_radioSongs``` - array, sets songs for music radio, leave empty for all songs.
- ```klpq_musicRadio_enableBackpackRadioMP``` - bool, allows all backpacks to play radio in MP.

### Functions
- ```[_object, true] call klpq_musicRadio_fnc_addRadio;``` - adds radio to the object, true to make it play at start.
- ```[_unit] call klpq_musicRadio_fnc_addBackpackRadio;``` - adds radio to the backpack of the unit.
- ```call klpq_musicRadio_fnc_exportSongsList;``` - exports list of configured songs to clipboard.

### CBA Settings
- Radio Volume - controls music radio volume, has immediate effect (ace hearing module will reset volume to the max, disable hearing module to make it work).
- Loudspeaker Volume - controls loudspeaker volume, only has effect on next song start.
- All Backpacks Can Play Radio (SP Only) - allows you to use backpack loudspeaker feature in SP.
