// Assign Gear Script

// DECLARE VARIABLES AND FUNCTIONS
private ["_faction","_typeofUnit","_unit", "_ff", "_isMan"];

_ff = false; // Track whether we have found a faction for this unit

// DETECT unit FACTION
// The following code detects what faction the unit's slot belongs to, and
// stores it in the private variable _faction. It can also be passed as an
// optional parameter.

_typeofUnit = toLower (_this select 0);
_unit = _this select 1;

_isMan = _unit isKindOf "CAManBase";
_faction = toLower (faction _unit);

if(count _this > 2) then {
  _faction = toLower (_this select 2);
};

// INSIGNIA
// This block will give units insignia on their uniforms.
[_unit,_typeofUnit] spawn {
    [_this select 0, _this select 1] call compile preprocessFileLineNumbers "f\assignGear\f_assignInsignia.sqf";
};

// DECIDE IF THE SCRIPT SHOULD RUN
// Depending on locality the script decides if it should run

if !(local _unit) exitWith {};

// SET A PUBLIC VARIABLE
// A public variable is set on the unit, indicating their type. This is mostly
// relevant for the respawn component
_unit setVariable ["f_var_assignGear", _typeofUnit, true];

// This variable simply tracks the progress of the gear assignation process,
// for other scripts to reference.
_unit setVariable ["f_var_assignGear_done", false, true];

// GEAR: BLUFOR > NATO
// The following block of code executes only if the unit is in a NATO slot; it
// automatically includes a file which contains the appropriate equipment
// data.
if (_faction == "blu_f") then {
#include "f_assignGear_nato.sqf";
};

// GEAR: OPFOR > CSAT
// The following block of code executes only if the unit is in a CSAT slot; it
// automatically includes a file which contains the appropriate equipment
// data.
if (_faction == "opf_f") then {
#include "f_assignGear_csat.sqf";
};

// GEAR: INDEPEDENT > AAF
// The following block of code executes only if the unit is in a AAF slot; it
// automatically includes a file which contains the appropriate equipment
// data.
if(_faction == "ind_f") then {
#include "f_assignGear_aaf.sqf";
};

// GEAR: FIA
// The following block of code executes only if the unit is in a FIA slot (any
// faction); it automatically includes a file which contains the appropriate
// equipment data.
if (_faction in ["blu_g_f","opf_g_f","ind_g_f"]) then {
#include "f_assignGear_fia.sqf"
};

// PA: Add medical supplies to unit
if (_isMan) then {
    [_typeOfUnit, _unit] call compile preprocessFileLineNumbers "f\assignGear\f_medical_gear.sqf";
};

// This variable simply tracks the progress of the gear assignation process,
// for other scripts to reference.
_unit setVariable ["f_var_assignGear_done", true, true];

// ERROR CHECKING
// If the faction of the unit cannot be defined, the script exits with an
// error.

if (isNil "_carbine") then { 
    //_carbine should exist unless no faction has been called
    [nil, "Faction %1 has no gear defined.",_faction] call pa_fnc_bothlog;
} else {
    [nil, "Gear for %1: %1 slot selected.",_unit,_faction,_typeofUnit] call pa_fnc_rptlog;
};

// vim: sts=-1 ts=4 et sw=4
