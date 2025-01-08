class CfgPatches
{
    class klpq_musicRadio
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1;
        requiredAddons[] = {
            "cba_main"
        };
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
