// Assign Gear Script - AAF
private ["_attach1","_attach2","_silencer1","_silencer2","_scope1","_scope2","_scope3","_bipod1","_bipod2","_attachments","_silencer","_hg_silencer1","_hg_scope1","_hg_attachments","_rifle","_riflemag","_riflemag_tr","_carbine","_carbinemag","_carbinemag_tr","_smg","_smgmag","_smgmag_tr","_diverWep","_diverMag1","_diverMag2","_glrifle","_glriflemag","_glriflemag_tr","_glmag","_glsmokewhite","_glsmokegreen","_glsmokered","_glflarewhite","_glflarered","_glflareyellow","_glflaregreen","_pistol","_pistolmag","_grenade","_Mgrenade","_smokegrenade","_smokegrenadegreen","_nvg","_uavterminal","_chemgreen","_chemred","_chemyellow","_chemblue","_bagsmall","_bagmedium","_baglarge","_bagmediumdiver","_baguav","_baghmgg","_baghmgag","_baghatg","_baghatag","_bagmtrg","_bagmtrag","_baghsamg","_baghsamag","_AR","_ARmag","_ARmag_tr","_MMG","_MMGmag","_MMGmag_tr","_Tracer","_DMrifle","_DMriflemag","_RAT","_RATmag","_MAT","_MATmag1","_MATmag2","_HAT","_HATmag1","_HATmag2","_SAM","_SAMmag","_SNrifle","_SNrifleMag","_ATmine","_satchel","_APmine1","_APmine2","_light","_heavy","_diver","_pilot","_crew","_ghillie","_specOp","_baseUniform","_baseHelmet","_baseGlasses","_lightRig","_mediumRig","_heavyRig","_diverUniform","_diverHelmet","_diverRig","_diverGlasses","_pilotUniform","_pilotHelmet","_pilotRig","_pilotGlasses","_crewUniform","_crewHelmet","_crewRig","_crewGlasses","_ghillieUniform","_ghillieHelmet","_ghillieRig","_ghillieGlasses","_sfuniform","_sfhelmet","_sfRig","_sfGlasses","_typeofUnit","_unit","_isMan","_backpack","_typeofBackPack","_loadout","_COrifle","_mgrenade","_DCrifle","_FTLrifle","_armag","_ratmag","_typeofunit", "_lrradio", "_srradio", "_debug"];

_debug=false;
// DEFINE EQUIPMENT TABLES
// The blocks of code below identifies equipment for this faction
//
// Defined loadouts:
//      co          - commander
//      dc          - deputy commander / squad leader
//      m           - medic
//      ftl         - fire team leader
//      ar          - automatic rifleman
//      aar         - assistant automatic rifleman
//      rat         - rifleman (AT)
//      dm          - designated marksman
//      mmgg        - medium mg gunner
//      mmgag       - medium mg assistant
//      matg        - medium AT gunner
//      matag       - medium AT assistant
//      hmgg        - heavy mg gunner (deployable)
//      hmgag       - heavy mg assistant (deployable)
//      hatg        - heavy AT gunner (deployable)
//      hatag       - heavy AT assistant (deployable)
//      mtrg        - mortar gunner (deployable)
//      mtrag       - mortar assistant (deployable)
//      msamg       - medium SAM gunner
//      msamag      - medium SAM assistant gunner
//      hsamg       - heavy SAM gunner (deployable)
//      hsamag      - heavy SAM assistant gunner (deployable)
//      sn          - sniper
//      sp          - spotter (for sniper)
//      vc          - vehicle commander
//      vg          - vehicle gunner
//      vd          - vehicle driver (repair)
//      pp          - air vehicle pilot / co-pilot
//      pcc         - air vehicle co-pilot (repair) / crew chief (repair)
//      pc          - air vehicle crew
//      eng         - engineer (demo)
//      engm        - engineer (mines)
//      uav         - UAV operator
//      div         - divers
//
//      r           - rifleman
//      car         - carabineer
//      smg         - submachinegunner
//      gren        - grenadier
//
//      v_car       - car/4x4
//      v_tr        - truck
//      v_ifv       - ifv
//
//      crate_small - small ammocrate
//      crate_med   - medium ammocrate
//      crate_large - large ammocrate
//

// GENERAL EQUIPMENT USED BY MULTIPLE CLASSES

// ATTACHMENTS - PRIMARY
_attach1 = "acc_pointer_IR";    // IR Laser
_attach2 = "acc_flashlight";    // Flashlight

_silencer1 = "muzzle_snds_M";   // 5.56 suppressor
_silencer2 = "muzzle_snds_H";   // 6.5 suppressor

_scope1 = "optic_ACO_grn";      // ACO
_scope2 = "optic_MRCO";         // MRCO Scope - 1x - 6x
_scope3 = "optic_SOS";          // SOS Scope - 18x - 75x

_bipod1 = "bipod_03_F_oli";     // Default bipod
_bipod2 = "bipod_03_F_blk";     // Black bipod

// Default setup
// The default attachment set for most units, overwritten in the individual
// unitType
_attachments = [_attach1,_scope1];

// [] = remove all
// [_attach1,_scope1,_silencer] = remove all, add items assigned in _attach1,
// _scope1 and _silencer1
// [_scope2] = add _scope2, remove rest
// false = keep attachments as they are

// ==========================================================================

// ATTACHMENTS - HANDGUN
_hg_silencer1 = "muzzle_snds_acp";  // .45 suppressor

_hg_scope1 = "optic_MRD";           // MRD

// Default setup
// The default attachment set for handguns, overwritten in the individual
// unitType
_hg_attachments= [];

// ==========================================================================

// WEAPON SELECTION

// Standard Riflemen ( MMG Assistant Gunner, Assistant Automatic Rifleman, MAT
// Assistant Gunner, MTR Assistant Gunner, Rifleman)
_rifle = "arifle_Mk20_F";
_riflemag = "30Rnd_556x45_Stanag";
_riflemag_tr = "30Rnd_556x45_Stanag_Tracer_Yellow";

// Standard Carabineer (Medic, Rifleman (AT), MAT Gunner, MTR Gunner,
// Carabineer)
_carbine = "arifle_Mk20C_F";
_carbinemag = "30Rnd_556x45_Stanag";
_carbinemag_tr = "30Rnd_556x45_Stanag_Tracer_Yellow";

// Standard Submachine Gun/Personal Defence Weapon (Aircraft Pilot,
// Submachinegunner)
_smg = "SMG_02_F";
_smgmag = "30Rnd_9x21_Mag";
_smgmag_tr = "30Rnd_9x21_Mag";

// Diver
_diverWep = "arifle_SDAR_F";
_diverMag1 = "30Rnd_556x45_Stanag";
_diverMag2 = "20Rnd_556x45_UW_mag";

// Rifle with GL and HE grenades (CO, DC, FTLs)
_glrifle = "arifle_Mk20_GL_MRCO_pointer_F";
_glriflemag = "30Rnd_556x45_Stanag";
_glriflemag_tr = "30Rnd_556x45_Stanag_Tracer_Yellow";
_glmag = "1Rnd_HE_Grenade_shell";

// Smoke for FTLs, Squad Leaders, etc
_glsmokewhite = "1Rnd_Smoke_Grenade_shell";
_glsmokegreen = "1Rnd_SmokeGreen_Grenade_shell";
_glsmokered = "1Rnd_SmokeRed_Grenade_shell";

// Flares for FTLs, Squad Leaders, etc
_glflarewhite = "UGL_FlareWhite_F";
_glflarered = "UGL_FlareRed_F";
_glflareyellow = "UGL_FlareYellow_F";
_glflaregreen = "UGL_FlareGreen_F";

// Pistols (CO, DC, Automatic Rifleman, Medium MG Gunner)
_pistol = "hgun_ACPC2_F";
_pistolmag = "9Rnd_45ACP_Mag";

// Grenades
_grenade = "HandGrenade";
_Mgrenade = "MiniGrenade";
_smokegrenade = "SmokeShell";
_smokegrenadegreen = "SmokeShellGreen";

// Night Vision Goggles (NVGoggles)
_nvg = "NVGoggles_INDEP";

// UAV Terminal
_uavterminal = "I_UavTerminal";

// Chemlights
_chemgreen =  "Chemlight_green";
_chemred = "Chemlight_red";
_chemyellow =  "Chemlight_yellow";
_chemblue = "Chemlight_blue";

// Backpacks
_bagsmall = "B_AssaultPack_khk";        // carries 120, weighs 20
_bagmedium = "B_FieldPack_oli";         // carries 200, weighs 30
_baglarge =  "B_Carryall_oli";          // carries 320, weighs 40
_bagmediumdiver =  "B_AssaultPack_blk"; // used by divers
_baguav = "I_UAV_01_backpack_F";        // used by UAV operator
_baghmgg = "I_HMG_01_weapon_F";         // used by Heavy MG gunner
_baghmgag = "I_HMG_01_support_F";       // used by Heavy MG assistant gunner
_baghatg = "I_AT_01_weapon_F";          // used by Heavy AT gunner
_baghatag = "I_HMG_01_support_F";       // used by Heavy AT assistant gunner
_bagmtrg = "I_Mortar_01_weapon_F";      // used by Mortar gunner
_bagmtrag = "I_Mortar_01_support_F";    // used by Mortar assistant gunner
_baghsamg = "I_AA_01_weapon_F";         // used by Heavy SAM gunner
_baghsamag = "I_HMG_01_support_F";      // used by Heavy SAM assistant gunner

// ==========================================================================

// UNIQUE, ROLE-SPECIFIC EQUIPMENT

// Automatic Rifleman
_AR = "LMG_Mk200_F";
_ARmag = "200Rnd_65x39_cased_Box";
_ARmag_tr = "200Rnd_65x39_cased_Box_Tracer";

// Medium MG
_MMG = "MMG_01_tan_F";
_MMGmag = "150Rnd_93x64_Mag";
_MMGmag_tr = "150Rnd_93x64_Mag";

// NON-DLC ALTERNATIVE:
//_MMG = "LMG_Zafir_F";
//_MMGmag = ""150Rnd_762x54_Box"";
//_MMGmag_tr = ""150Rnd_762x54_Box"_Tracer";

// Marksman rifle
_DMrifle = "srifle_EBR_F";
_DMriflemag = "20Rnd_762x51_Mag";

// Rifleman AT
_RAT = "launch_RPG32_F";
_RATmag = "RPG32_F";

// Medium AT
_MAT = "launch_NLAW_F";
_MATmag1 = "NLAW_F";
_MATmag2 = "NLAW_F";

// Surface Air
_SAM = "launch_I_Titan_F";
_SAMmag = "Titan_AA";

// Heavy AT
_HAT = "launch_I_Titan_short_F";
_HATmag1 = "Titan_AT";
_HATmag2 = "Titan_AP";

// Sniper
_SNrifle = "srifle_GM6_F";
_SNrifleMag = "5Rnd_127x108_Mag";

// Engineer items
_ATmine = "ATMine_Range_Mag";
_satchel = "DemoCharge_Remote_Mag";
_APmine1 = "APERSBoundingMine_Range_Mag";
_APmine2 = "APERSMine_Range_Mag";

// ==========================================================================

// CLOTHES AND UNIFORMS

// Define classes. This defines which gear class gets which uniform
// "medium" vests are used for all classes if they are not assigned a specific
// uniform

_light = [];
_heavy =  ["eng","engm"];
_diver = ["div"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = [];

// Basic clothing
// The outfit-piece is randomly selected from the array for each unit

_baseUniform = ["U_I_CombatUniform","U_I_CombatUniform_shortsleeve","U_I_CombatUniform_tshirt"];
_baseHelmet = ["H_HelmetIA_net","H_HelmetIA_camo","H_HelmetIA"];
_baseGlasses = [];

// Vests
_lightRig = ["V_Chestrig_oli","V_BandollierB_oli"];
// "medium" is the default for all infantry classes
_mediumRig = ["V_PlateCarrierIA2_dgtl","V_PlateCarrierIA1_dgtl"];
_heavyRig = ["V_PlateCarrierIAGL_dgtl"];

// Diver
_diverUniform =  ["U_I_Wetsuit"];
_diverHelmet = [];
_diverRig = ["V_RebreatherIA"];
_diverGlasses = ["G_Diving"];

// Pilot
_pilotUniform = ["U_I_HeliPilotCoveralls"];
_pilotHelmet = ["H_PilotHelmetHeli_I"];
_pilotRig = ["V_TacVest_oli"];
_pilotGlasses = [];

// Crewman
_crewUniform = ["U_I_CombatUniform"];
_crewHelmet = ["H_HelmetCrew_I"];
_crewRig = ["V_TacVest_oli"];
_crewGlasses = [];

// Ghillie
// DLC alternatives:
//["U_I_FullGhillie_lsh","U_I_FullGhillie_ard","U_I_FullGhillie_sard"];
_ghillieUniform = ["U_I_GhillieSuit"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_oli"];
_ghillieGlasses = [];

// Spec Op - no nice stuff for AAF
_sfuniform = _baseUniform;
_sfhelmet = _baseHelmet;
_sfRig = _mediumRig;
_sfGlasses = [];


// ==========================================================================
// RADIOS
_srradio = "TFAR_anprc148jem";
_lrradio = "TFAR_anprc155";


// INTERPRET PASSED VARIABLES
// The following interprets what has been passed to this script element

// Tidy input for SWITCH/CASE statements, expecting something like : r =
// Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_typeofUnit = toLower (_this select 0);
// expecting name of unit; originally passed by using 'this' in unit init
_unit = _this select 1;
// We check if we're dealing with a soldier or a vehicle
_isMan = _unit isKindOf "CAManBase";

if (_debug) then {
    ["f\\assingGear\\f_assignGear_aaf.sqf",
     "Unit '%1' is a '%2' (man: %3)",
     _unit, _typeofUnit, _isman] call pa_fnc_rptlog;
};

// This block needs only to be run on an infantry unit
if (_isMan) then {
    // PREPARE UNIT FOR GEAR ADDITION
    // The following code removes all existing weapons, items, magazines and
    // backpacks
    removeBackpack _unit;
    removeAllWeapons _unit;
    removeAllItemsWithMagazines _unit;
    removeAllAssignedItems _unit;

    // HANDLE CLOTHES
    // Handle clothes and helmets and such using the include file called next.
    #include "f_assignGear_clothes.sqf";

    // ADD UNIVERSAL ITEMS
    // Add items universal to all units of this faction
    _unit linkItem _nvg;            // Add and equip the faction's nvg
    _unit linkItem "ItemMap";       // Add and equip the map
    _unit linkItem "ItemCompass";   // Add and equip a compass
    _unit linkItem "ItemWatch";     // Add and equip a watch
    _unit linkItem _srradio;
    //_unit linkItem "ItemGPS";     // Add and equip a GPS
};

// SETUP BACKPACKS
// Include the correct backpack file for the faction
_backpack = {
    _typeofBackPack = _this select 0;
    _loadout = f_param_backpacks;
    if (count _this > 1) then {_loadout = _this select 1};
    switch (_typeofBackPack) do {
        #include "f_assignGear_aaf_b.sqf";
    };
};

// ==========================================================================

// DEFINE UNIT TYPE LOADOUTS
// The following blocks of code define loadouts for each type of unit (the
// unit type is passed to the script in the first variable)
switch (_typeofUnit) do {

    // COMMANDER
    case "co": {
        _unit addmagazines [_glriflemag,7];
        _unit addmagazines [_glriflemag_tr,2];
        _unit addmagazines [_glmag,3];
        _unit addmagazines [_glsmokewhite,4];
        _unit addweapon _glrifle;                   //_COrifle
        _unit addmagazines [_pistolmag,2];
        _unit addweapon _pistol;
        _unit addmagazines [_grenade,1];
        _unit addmagazines [_mgrenade,1];
        _unit addmagazines [_smokegrenade,2];
        _unit addmagazines [_smokegrenadegreen,2];
        _unit addWeapon "Rangefinder";
        _unit linkItem "ItemGPS";
        ["co"] call _backpack;
    };

    // DEPUTY COMMANDER AND SQUAD LEADER
    case "dc": {
        _unit addmagazines [_glriflemag,7];
        _unit addmagazines [_glriflemag_tr,2];
        _unit addmagazines [_glmag,3];
        _unit addmagazines [_glsmokewhite,4];
        _unit addweapon _glrifle;                   //_DCrifle
        _unit addmagazines [_pistolmag,2];
        _unit addweapon _pistol;
        _unit addmagazines [_grenade,1];
        _unit addmagazines [_mgrenade,1];
        _unit addmagazines [_smokegrenade,2];
        _unit addmagazines [_smokegrenadegreen,2];
        _unit addWeapon "Rangefinder";
        _unit linkItem "ItemGPS";
        ["dc"] call _backpack;
    };

    // MEDIC
    case "m": {
        _unit addmagazines [_carbinemag,7];
        _unit addweapon _carbine;
        _unit addmagazines [_smokegrenade,4];
    };

    // CRATE: Medium, ammo for 1 squad
    case "crate_med": {
        clearWeaponCargoGlobal _unit;
        clearMagazineCargoGlobal _unit;
        clearItemCargoGlobal _unit;
        clearBackpackCargoGlobal _unit;
        _unit addMagazineCargoGlobal [_riflemag, 15];
        _unit addMagazineCargoGlobal [_glriflemag, 20];
        _unit addMagazineCargoGlobal [_armag, 15];
        _unit addMagazineCargoGlobal [_carbinemag, 20];
        _unit addMagazineCargoGlobal [_glmag, 20];
        _unit addMagazineCargoGlobal [_glsmokewhite,16];
        _unit addMagazineCargoGlobal [_ratmag, 6];
        _unit addMagazineCargoGlobal [_grenade, 25];
        _unit addMagazineCargoGlobal [_mgrenade, 25];
        _unit addMagazineCargoGlobal [_smokegrenade, 25];
        _unit addMagazineCargoGlobal [_smokegrenadegreen, 6];
    };

    // CRATE: Large, ammo for 1 platoon
    case "crate_large": {
        clearWeaponCargoGlobal _unit;
        clearMagazineCargoGlobal _unit;
        clearItemCargoGlobal _unit;
        clearBackpackCargoGlobal _unit;
        _unit addMagazineCargoGlobal [_riflemag, 45];
        _unit addMagazineCargoGlobal [_glriflemag, 60];
        _unit addMagazineCargoGlobal [_armag, 45];
        _unit addMagazineCargoGlobal [_carbinemag, 60];
        _unit addMagazineCargoGlobal [_glmag, 60];
        _unit addMagazineCargoGlobal [_glsmokewhite,50];
        _unit addMagazineCargoGlobal [_ratmag, 20];
        _unit addMagazineCargoGlobal [_grenade, 75];
        _unit addMagazineCargoGlobal [_mgrenade, 75];
        _unit addMagazineCargoGlobal [_smokegrenade, 75];
        _unit addMagazineCargoGlobal [_smokegrenadegreen, 20];
    };

    // DEFAULT/UNDEFINED (use RIFLEMAN)
   default {
        _unit addmagazines [_riflemag,7];
        _unit addweapon _rifle;

        _unit selectweapon primaryweapon _unit;

        if (true) exitwith {
            ["f\assignGear\f_assignGear_aaf.sqf",
             "Unit: %1. Gear template %2 does not exist, used Rifleman instead.",
             _unit,_typeofunit] call pa_fnc_bothlog;
        }
   };
// END SWITCH FOR DEFINE UNIT TYPE LOADOUTS
};

// ==========================================================================

// If this isn't run on an infantry unit we can exit
if !(_isMan) exitWith {};

// ==========================================================================

// Handle weapon attachments
#include "f_assignGear_attachments.sqf";

// ==========================================================================

// ENSURE UNIT HAS CORRECT WEAPON SELECTED ON SPAWNING

_unit selectweapon primaryweapon _unit;

// vim: sts=-1 ts=4 et sw=4
