class CfgPatches {
    class klpq_musicRadio_vn {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1;
        requiredAddons[] = {"klpq_musicRadio", "music_f_vietnam_c"};
    };
};

class CfgFunctions {
    class klpq_musicRadio_vn {
        class functions {
            file = "klpq_musicRadio_vn\functions";

            class preInit {
                preInit = 1;
                recompile = 1;
            };
            class postInit {
                postInit = 1;
                recompile = 1;
            };
            class exInit {
                recompile = 1;
            };
        };
    };
};

class Extended_InitPost_EventHandlers
{
    class Land_vn_radio {
        klpq_musicRadio_vn_exInit = "_this call klpq_musicRadio_vn_fnc_exInit";
    };
};


class CfgMusic {
    tracks[] = {};

    class klpq_musicRadio_18c42bf1a458046697ad17752b7c8aa2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_01.ogg", db+3, 1};
        tag = "klpq_musicRadio_v1";
        theme = "no_theme";
        duration = 165;
        artist = "Adam Bailey";
        title = "Trippin";
        klpq_ignoreTrack = 0;
    };
    class klpq_musicRadio_b2d8ddde9980651f22a3c999387e13d2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_02.ogg", db+3, 1};
        tag = "klpq_musicRadio_v1";
        theme = "no_theme";
        duration = 182;
        artist = "Adam Bailey";
        title = "Up here looking down";
        klpq_ignoreTrack = 0;
    };
    class klpq_musicRadio_4a8a0b9e41c699cbef9d13d734c38080 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_03.ogg", db+3, 1};
        tag = "klpq_musicRadio_v1";
        theme = "no_theme";
        duration = 207;
        artist = "Adam Bailey";
        title = "Drafted";
        klpq_ignoreTrack = 0;
    };
    class klpq_musicRadio_6b36570cbe9e2e9a758dc5209988c25d {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_04.ogg", db+3, 1};
        tag = "klpq_musicRadio_v1";
        theme = "no_theme";
        duration = 180;
        artist = "Adam Bailey";
        title = "Unsung heroes";
        klpq_ignoreTrack = 0;
    };
    class klpq_musicRadio_0a311e529cf9e893a89e1d8cf7630795 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_05.ogg", db+3, 1};
        tag = "klpq_musicRadio_v1";
        theme = "no_theme";
        duration = 197;
        artist = "Adam Bailey";
        title = "Route 9";
        klpq_ignoreTrack = 0;
    };
    class klpq_musicRadio_73dd3982a036d939b79b2d9ae3103a0a {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_06.ogg", db+3, 1};
        tag = "klpq_musicRadio_v1";
        theme = "no_theme";
        duration = 165;
        artist = "Adam Bailey";
        title = "Blues for Suzy";
        klpq_ignoreTrack = 0;
    };
    class klpq_musicRadio_30def021cf4b5702e0b4ab80e73bd64b {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_07.ogg", db+3, 1};
        tag = "klpq_musicRadio_v1";
        theme = "no_theme";
        duration = 201;
        artist = "Adam Bailey";
        title = "Voodoo girl";
        klpq_ignoreTrack = 0;
    };
    class klpq_musicRadio_fcb52bc298ace234e57d2234a9667623 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_08.ogg", db+3, 1};
        tag = "klpq_musicRadio_v1";
        theme = "no_theme";
        duration = 183;
        artist = "Adam Bailey";
        title = "Tequila highway";
        klpq_ignoreTrack = 0;
    };
    class klpq_musicRadio_9de8b06708943e71f9acd5f0347636c6 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_09.ogg", db+3, 1};
        tag = "klpq_musicRadio_v1";
        theme = "no_theme";
        duration = 165;
        artist = "Adam Bailey";
        title = "There it is";
        klpq_ignoreTrack = 0;
    };
    class klpq_musicRadio_707b5447e1e29173c82586a027b25f0a {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_10.ogg", db+3, 1};
        tag = "klpq_musicRadio_v1";
        theme = "no_theme";
        duration = 176;
        artist = "Adam Bailey";
        title = "Kitty bar blues";
        klpq_ignoreTrack = 0;
    };
    class klpq_musicRadio_164fe4f11ea75b0ada0075d5f326ad29 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_11.ogg", db+3, 1};
        tag = "klpq_musicRadio_v1";
        theme = "no_theme";
        duration = 173;
        artist = "Adam Bailey";
        title = "Fire in the sky demo";
        klpq_ignoreTrack = 0;
    };
    class klpq_musicRadio_b626b3373ae7cd4a48a1d7d4cf696524 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_12.ogg", db+3, 1};
        tag = "klpq_musicRadio_v1";
        theme = "no_theme";
        duration = 246;
        artist = "Adam Bailey";
        title = "Freedom bird";
        klpq_ignoreTrack = 0;
    };
    class klpq_musicRadio_c2a26de75bd737dd4d1a8c1ce6605e00 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_13.ogg", db+3, 1};
        tag = "klpq_musicRadio_v1";
        theme = "no_theme";
        duration = 159;
        artist = "Adam Bailey";
        title = "Don&#39;t cry baby";
        klpq_ignoreTrack = 0;
    };
    class klpq_musicRadio_abcb85d9fbbdfe8fd091bdddbc972e21 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_14.ogg", db+3, 1};
        tag = "klpq_musicRadio_v1";
        theme = "no_theme";
        duration = 190;
        artist = "Adam Bailey";
        title = "Jungle boots";
        klpq_ignoreTrack = 0;
    };
};

class CfgSounds {
    tracks[] = {};

    class klpq_musicRadio_18c42bf1a458046697ad17752b7c8aa2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_01.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_18c42bf1a458046697ad17752b7c8aa2_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_01.ogg", db+0, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_18c42bf1a458046697ad17752b7c8aa2_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_01.ogg", db+3, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_18c42bf1a458046697ad17752b7c8aa2_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_01.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_18c42bf1a458046697ad17752b7c8aa2_loud_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_01.ogg", db+0, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_18c42bf1a458046697ad17752b7c8aa2_loud_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_01.ogg", db+6, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_18c42bf1a458046697ad17752b7c8aa2_loud_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_01.ogg", db+12, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_b2d8ddde9980651f22a3c999387e13d2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_02.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_b2d8ddde9980651f22a3c999387e13d2_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_02.ogg", db+0, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_b2d8ddde9980651f22a3c999387e13d2_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_02.ogg", db+3, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_b2d8ddde9980651f22a3c999387e13d2_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_02.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_b2d8ddde9980651f22a3c999387e13d2_loud_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_02.ogg", db+0, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_b2d8ddde9980651f22a3c999387e13d2_loud_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_02.ogg", db+6, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_b2d8ddde9980651f22a3c999387e13d2_loud_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_02.ogg", db+12, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_4a8a0b9e41c699cbef9d13d734c38080 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_03.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_4a8a0b9e41c699cbef9d13d734c38080_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_03.ogg", db+0, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_4a8a0b9e41c699cbef9d13d734c38080_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_03.ogg", db+3, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_4a8a0b9e41c699cbef9d13d734c38080_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_03.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_4a8a0b9e41c699cbef9d13d734c38080_loud_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_03.ogg", db+0, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_4a8a0b9e41c699cbef9d13d734c38080_loud_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_03.ogg", db+6, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_4a8a0b9e41c699cbef9d13d734c38080_loud_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_03.ogg", db+12, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_6b36570cbe9e2e9a758dc5209988c25d {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_04.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_6b36570cbe9e2e9a758dc5209988c25d_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_04.ogg", db+0, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_6b36570cbe9e2e9a758dc5209988c25d_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_04.ogg", db+3, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_6b36570cbe9e2e9a758dc5209988c25d_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_04.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_6b36570cbe9e2e9a758dc5209988c25d_loud_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_04.ogg", db+0, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_6b36570cbe9e2e9a758dc5209988c25d_loud_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_04.ogg", db+6, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_6b36570cbe9e2e9a758dc5209988c25d_loud_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_04.ogg", db+12, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_0a311e529cf9e893a89e1d8cf7630795 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_05.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_0a311e529cf9e893a89e1d8cf7630795_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_05.ogg", db+0, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_0a311e529cf9e893a89e1d8cf7630795_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_05.ogg", db+3, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_0a311e529cf9e893a89e1d8cf7630795_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_05.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_0a311e529cf9e893a89e1d8cf7630795_loud_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_05.ogg", db+0, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_0a311e529cf9e893a89e1d8cf7630795_loud_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_05.ogg", db+6, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_0a311e529cf9e893a89e1d8cf7630795_loud_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_05.ogg", db+12, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_73dd3982a036d939b79b2d9ae3103a0a {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_06.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_73dd3982a036d939b79b2d9ae3103a0a_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_06.ogg", db+0, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_73dd3982a036d939b79b2d9ae3103a0a_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_06.ogg", db+3, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_73dd3982a036d939b79b2d9ae3103a0a_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_06.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_73dd3982a036d939b79b2d9ae3103a0a_loud_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_06.ogg", db+0, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_73dd3982a036d939b79b2d9ae3103a0a_loud_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_06.ogg", db+6, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_73dd3982a036d939b79b2d9ae3103a0a_loud_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_06.ogg", db+12, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_30def021cf4b5702e0b4ab80e73bd64b {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_07.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_30def021cf4b5702e0b4ab80e73bd64b_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_07.ogg", db+0, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_30def021cf4b5702e0b4ab80e73bd64b_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_07.ogg", db+3, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_30def021cf4b5702e0b4ab80e73bd64b_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_07.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_30def021cf4b5702e0b4ab80e73bd64b_loud_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_07.ogg", db+0, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_30def021cf4b5702e0b4ab80e73bd64b_loud_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_07.ogg", db+6, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_30def021cf4b5702e0b4ab80e73bd64b_loud_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_07.ogg", db+12, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_fcb52bc298ace234e57d2234a9667623 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_08.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_fcb52bc298ace234e57d2234a9667623_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_08.ogg", db+0, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_fcb52bc298ace234e57d2234a9667623_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_08.ogg", db+3, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_fcb52bc298ace234e57d2234a9667623_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_08.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_fcb52bc298ace234e57d2234a9667623_loud_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_08.ogg", db+0, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_fcb52bc298ace234e57d2234a9667623_loud_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_08.ogg", db+6, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_fcb52bc298ace234e57d2234a9667623_loud_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_08.ogg", db+12, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_9de8b06708943e71f9acd5f0347636c6 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_09.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_9de8b06708943e71f9acd5f0347636c6_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_09.ogg", db+0, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_9de8b06708943e71f9acd5f0347636c6_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_09.ogg", db+3, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_9de8b06708943e71f9acd5f0347636c6_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_09.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_9de8b06708943e71f9acd5f0347636c6_loud_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_09.ogg", db+0, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_9de8b06708943e71f9acd5f0347636c6_loud_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_09.ogg", db+6, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_9de8b06708943e71f9acd5f0347636c6_loud_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_09.ogg", db+12, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_707b5447e1e29173c82586a027b25f0a {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_10.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_707b5447e1e29173c82586a027b25f0a_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_10.ogg", db+0, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_707b5447e1e29173c82586a027b25f0a_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_10.ogg", db+3, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_707b5447e1e29173c82586a027b25f0a_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_10.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_707b5447e1e29173c82586a027b25f0a_loud_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_10.ogg", db+0, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_707b5447e1e29173c82586a027b25f0a_loud_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_10.ogg", db+6, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_707b5447e1e29173c82586a027b25f0a_loud_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_10.ogg", db+12, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_164fe4f11ea75b0ada0075d5f326ad29 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_11.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_164fe4f11ea75b0ada0075d5f326ad29_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_11.ogg", db+0, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_164fe4f11ea75b0ada0075d5f326ad29_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_11.ogg", db+3, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_164fe4f11ea75b0ada0075d5f326ad29_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_11.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_164fe4f11ea75b0ada0075d5f326ad29_loud_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_11.ogg", db+0, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_164fe4f11ea75b0ada0075d5f326ad29_loud_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_11.ogg", db+6, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_164fe4f11ea75b0ada0075d5f326ad29_loud_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_11.ogg", db+12, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_b626b3373ae7cd4a48a1d7d4cf696524 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_12.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_b626b3373ae7cd4a48a1d7d4cf696524_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_12.ogg", db+0, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_b626b3373ae7cd4a48a1d7d4cf696524_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_12.ogg", db+3, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_b626b3373ae7cd4a48a1d7d4cf696524_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_12.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_b626b3373ae7cd4a48a1d7d4cf696524_loud_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_12.ogg", db+0, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_b626b3373ae7cd4a48a1d7d4cf696524_loud_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_12.ogg", db+6, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_b626b3373ae7cd4a48a1d7d4cf696524_loud_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_12.ogg", db+12, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_c2a26de75bd737dd4d1a8c1ce6605e00 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_13.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_c2a26de75bd737dd4d1a8c1ce6605e00_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_13.ogg", db+0, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_c2a26de75bd737dd4d1a8c1ce6605e00_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_13.ogg", db+3, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_c2a26de75bd737dd4d1a8c1ce6605e00_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_13.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_c2a26de75bd737dd4d1a8c1ce6605e00_loud_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_13.ogg", db+0, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_c2a26de75bd737dd4d1a8c1ce6605e00_loud_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_13.ogg", db+6, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_c2a26de75bd737dd4d1a8c1ce6605e00_loud_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_13.ogg", db+12, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_abcb85d9fbbdfe8fd091bdddbc972e21 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_14.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_abcb85d9fbbdfe8fd091bdddbc972e21_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_14.ogg", db+0, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_abcb85d9fbbdfe8fd091bdddbc972e21_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_14.ogg", db+3, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_abcb85d9fbbdfe8fd091bdddbc972e21_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_14.ogg", db+6, 1, 100};
        titles[] = {};
    };
    class klpq_musicRadio_abcb85d9fbbdfe8fd091bdddbc972e21_loud_vol0 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_14.ogg", db+0, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_abcb85d9fbbdfe8fd091bdddbc972e21_loud_vol1 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_14.ogg", db+6, 1, 500};
        titles[] = {};
    };
    class klpq_musicRadio_abcb85d9fbbdfe8fd091bdddbc972e21_loud_vol2 {
        sound[] = {"\vn\music_f_vietnam\radiomusic\vn_drmm_song_os_14.ogg", db+12, 1, 500};
        titles[] = {};
    };
};
