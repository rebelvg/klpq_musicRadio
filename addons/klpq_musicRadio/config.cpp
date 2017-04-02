class CfgPatches
{
    class klpq_musicRadio
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1;
        requiredAddons[] = {"ace_interact_menu"};
        version = "1.0";
    };
};

class CfgFunctions
{
    class klpq_musicRadio
    {
        class functions
        {
            file = "klpq_musicRadio\functions";

            class preInit {preInit = 1;};
            class postInit {postInit = 1;};
            class addRadio {};
        };

        class initEvents
        {
            file = "klpq_musicRadio\initEvents";

            class vehicleInit {};
        };
    };
};

class Extended_InitPost_EventHandlers
{
    class Car
    {
        klpq_musicRadio_vehicleInit = "_this call klpq_musicRadio_fnc_vehicleInit";
    };
    class Tank
    {
        klpq_musicRadio_vehicleInit = "_this call klpq_musicRadio_fnc_vehicleInit";
    };
    class Air
    {
        klpq_musicRadio_vehicleInit = "_this call klpq_musicRadio_fnc_vehicleInit";
    };
    class Ship
    {
        klpq_musicRadio_vehicleInit = "_this call klpq_musicRadio_fnc_vehicleInit";
    };
};
