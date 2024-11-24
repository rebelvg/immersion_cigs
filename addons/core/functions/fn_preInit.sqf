#include "../script_component.hpp"

/*
* Author: Zorn
* Pre Init Function
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', 
player] call prefix_component_fnc_functionname
*
* Public: No
*/

// Defaults to enable giving items in SP - can be made into a cba setting

if (isNil QGVAR(giveItems_SP)) then {
    GVAR(giveItems_SP) = true;
};


// Generates GVAR array of all smokable items
GVAR(cigsArray) = [
    "EWK_Cigar1", 
    "EWK_Cigar2", 
    "EWK_Cig1", 
    "EWK_Cig2", 
    "EWK_Cig3", 
    "EWK_Cig4", 
    "EWK_Glasses_Cig1", 
    "EWK_Glasses_Cig2", 
    "EWK_Glasses_Cig3", 
    "EWK_Glasses_Cig4", 
    "EWK_Glasses_Shemag_GRE_Cig6", 
    "EWK_Glasses_Shemag_NB_Cig6", 
    "EWK_Glasses_Shemag_tan_Cig6", 
    "EWK_Cig5", 
    "EWK_Glasses_Cig5", 
    "EWK_Cig6", 
    "EWK_Glasses_Cig6", 
    "EWK_Shemag_GRE_Cig6", 
    "EWK_Shemag_NB_Cig6", 
    "EWK_Shemag_tan_Cig6"
] + (
    (Q(getNumber (_x >> QQPVAR(isSmokeable)) == 1) configClasses (configFile >> "CfgGlasses")) apply {configName _x}) + ((Q(getNumber (_x >> QQPVAR(isSmokeable)) == 1) configClasses (configFile >> "CfgWeapons")) apply {configName _x}
);