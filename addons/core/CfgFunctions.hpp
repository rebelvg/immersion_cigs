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

            class sound {};
            class smoke {};
            class anim {};

            class removeItemFromMag {};

            class action_cigPack_children {};
            class take_cig_from_pack {};

            class start_cig_your {};
            class start_cig_their {};

            class start_smoking {};
            class smoking {};

            class stop_cig {};
        };

        class lighter
        {
            file = PATH_TO_FUNC_SUB(lighter);

            class hasLighter {};
            class getLighter {};
            class useLighter {};
        };

        class conditions
        {
            file = PATH_TO_FUNC_SUB(conditions);

            class canStartSmoking {};
            class canStopSmoking {};

            class canTakeCigFromPack {};
        };

        class singleplayer
        {
            file = PATH_TO_FUNC_SUB(singleplayer);

            class addItemsInSP { postInit = 1; };
        };
    };
};