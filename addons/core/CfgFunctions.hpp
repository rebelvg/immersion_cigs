class CfgFunctions
{
    class ADDON
    {
        // tag = "cigs"; // the function will be named TAG_fnc_myOtherFunction
        class COMPONENT
        {

            file = PATH_TO_FUNC;

            class preinit  { preInit = 1; };
            class postinit { postInit = 1; };

            class addVanillaActions {};

            class smoke {};
            class anim {};
            class removeItemFromMag {};
            class useItem {};

            class start_cig_your {};
            class start_cig_their {};

            class start_cig {};
            class start_cig_recursive {};

            class stop_cig {};
            class take_cig_from_pack {};
        };
        
        class conditions
        {
            file = PATH_TO_FUNC_SUB(conditions);

            class canStartSmoking {};
            class canStopSmoking {};

            class canTakeCigFromPack {};
        };
    };
};

// cigs_core_fnc_name