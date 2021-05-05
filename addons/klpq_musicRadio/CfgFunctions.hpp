class klpq_musicRadio
{
    class functions
    {
        file = "klpq_musicRadio\functions";

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
        file = "klpq_musicRadio\initEvents";

        class vehicleInit {
            recompile = 1;
        };
    };
};
