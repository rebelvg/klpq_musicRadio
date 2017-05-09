class CfgPatches
{
    class klpq_musicRadio
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1;
        requiredAddons[] = {"ace_interact_menu"};
        version = "1.0.5";
    };
};

class CfgFunctions
{
    #include "CfgFunctions.hpp"
};

class Extended_InitPost_EventHandlers
{
    #include "Extended_InitPost_EventHandlers.hpp"
};
