class klpq_musicRadio
{
    class functions
    {
        file = "klpq_music_radio\functions";

        class preInit {
            preInit = 1;
            recompile = 1;
        };
        class postInit {
            postInit = 1;
            recompile = 1;
        };
        class addRadio {
            recompile = 1;
        };
        class addBackpackRadio {
            recompile = 1;
        };
    };

    class initEvents
    {
        file = "klpq_music_radio\initEvents";

        class vehicleInit {
            recompile = 1;
        };
    };
};
