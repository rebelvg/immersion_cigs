#include "../../script_component.hpp"

/*
* Author: Zorn
* Function which will add Items in Singleplayer when enabled.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/


private _code = {

    // Add items to Player in SP
    ["unit", {
        params ["_player"];

        ZRN_LOG_MSG(cba PEH - SP items);
        ZRN_LOG_1(_player);

        if (/*!isMultiplayer && !is3DENPreview &&*/ SET(sp_addItems)) then {
            ZRN_LOG_MSG(condition true);
            
            if (SET(sp_addLighter)) then { ZRN_LOG_MSG(ADDED); _player addItem QPVAR(lighter)          };
            if (SET(sp_addMatches)) then { ZRN_LOG_MSG(ADDED); _player addItem QPVAR(matches)          };
            if (SET(sp_addCigar))   then { ZRN_LOG_MSG(ADDED); _player addItem QEGVAR(cigars,cigar0)   };
            if (SET(sp_addCigpack)) then { ZRN_LOG_MSG(ADDED); _player addItem SET(sp_addCigpack_type) };

            ZRN_LOG_MSG(DONE);
        };
    },true] call CBA_fnc_addPlayerEventHandler;
};

if (missionNamespace getVariable ["cba_settings_ready",false]) then _code else { ["CBA_settingsInitialized",_code,[]] call CBA_fnc_addEventHandler; };
