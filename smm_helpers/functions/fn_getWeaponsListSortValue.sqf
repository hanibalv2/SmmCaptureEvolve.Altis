// https://forums.bistudio.com/forums/topic/169386-read-weapons-from-cfg-and-sort-them-according-to-firepower/

// MARK OPTIMIZED

//This script will filter all weapons including AddOn weapons to improve custom loadout handling
//All weapons are stored in the GOM_list_allweapons array:
//
//Handguns: GOM_list_allweapons select 0;
//Low damage rifles: (GOM_list_allweapons select 1) select 0;
//Medium damage rifles: (GOM_list_allweapons select 1) select 1;
//High damage rifles: (GOM_list_allweapons select 1) select 2;
//Non-locking Launchers: (GOM_list_allweapons select 2) select 0;
//Locking Launchers: (GOM_list_allweapons select 2) select 1;



private _pistols = [];
private _verylowrifles = [];
private _lowrifles = [];
private _medrifles = [];
private _highrifles = [];
private _veryhighrifles = [];
private _ultrarifles = [];
private _veryultrarifles = [];
private _lowgodlikerifles = [];
private _mediumgodlikerifles = [];
private _highgodlikerifles = [];
private _ultragodlikerifles = [];
private _prorifles = [];
private _paytowinrifles = [];
private _lowlaunchers = [];
private _highlaunchers = [];

_admin0rifles = [];
_admin1rifles = [];
_admin2rifles = [];
_admin3rifles = [];
_admin4rifles = [];


_cfg = (configFile >> "CfgWeapons");

for "_i" from 0 to ((count _cfg)-1) do {

if (isClass ((_cfg select _i) )) then {

	_cfgName = configName (_cfg select _i);
	_getmagazines = getarray (configfile >> "CfgWeapons" >> _cfgName >> "magazines");
	_gettype = getnumber (configfile >> "CfgWeapons" >> _cfgName >> "type");
	_check = (configfile >> "CfgWeapons" >> _cfgName >> "type");

	if ((_gettype <= 4 AND _gettype > 0) AND (getNumber ((_cfg select _i) >> "scope") == 2) AND (count _getmagazines != 0)) then {

		_magazine = _getmagazines select 0;
		_ammo = gettext (configfile >> "CfgMagazines" >> _magazine >> "ammo");
		_hitvalue = getnumber (configfile >> "CfgAmmo" >> _ammo >> "hit");

		if (_gettype == 2) then {


			_pistols set [count _pistols, _cfgName];

		};

		if (_gettype == 1) then {
			if (_hitvalue < 5) then {

				_verylowrifles set [count _verylowrifles, _cfgName];

			};
			
			if (_hitvalue >= 5 AND _hitvalue < 6) then {

				_lowrifles set [count _lowrifles, _cfgName];

			};

			if (_hitvalue >= 6 AND _hitvalue < 7) then {

				_medrifles set [count _medrifles, _cfgName];

			};
			
			if (_hitvalue >= 7 AND _hitvalue < 8) then {

				_highrifles set [count _highrifles, _cfgName];

			};
			
			if (_hitvalue >= 8 AND _hitvalue < 9) then {

				_veryhighrifles set [count _veryhighrifles, _cfgName];

			};
			if (_hitvalue >= 9 AND _hitvalue < 10) then {

				_ultrarifles set [count _ultrarifles, _cfgName];

			};
			if (_hitvalue >= 10 AND _hitvalue < 11) then {

				_veryultrarifles set [count _veryultrarifles, _cfgName];

			};
			
			if (_hitvalue >= 11 AND _hitvalue < 12) then {

				_lowgodlikerifles set [count _lowgodlikerifles, _cfgName];

			};
			
			if (_hitvalue >= 12 AND _hitvalue < 13) then {

				_mediumgodlikerifles set [count _mediumgodlikerifles, _cfgName];

			};
			
			if (_hitvalue >= 13 AND _hitvalue < 14) then {

				_highgodlikerifles set [count _highgodlikerifles, _cfgName];

			};
			if (_hitvalue >= 14 AND _hitvalue < 15) then {

				_ultragodlikerifles set [count _ultragodlikerifles, _cfgName];
			};
			
			if (_hitvalue >= 15 AND _hitvalue < 16) then {

				_prorifles set [count _prorifles, _cfgName];

			};
			
			if (_hitvalue >= 16 AND _hitvalue < 17) then {

				_paytowinrifles set [count _paytowinrifles, _cfgName];

			};
			if (_hitvalue >= 17  AND _hitvalue <18 ) then {

				_admin0rifles set [count _admin0rifles, _cfgName];

			};
			if (_hitvalue >= 18  AND _hitvalue <19 ) then {

				_admin1rifles set [count _admin1rifles, _cfgName];

			};
			if (_hitvalue >= 19 AND _hitvalue < 20) then {

				_admin2rifles set [count _admin2rifles, _cfgName];

			};
			if (_hitvalue >= 20 AND _hitvalue < 21 ) then {

				_admin3rifles set [count _admin3rifles, _cfgName];

			};
			if (_hitvalue >= 21) then {

				_admin4rifles set [count _admin4rifles, _cfgName];

			};
			
		};
		_getlock = getnumber (configfile >> "CfgWeapons" >> _cfgName >> "canLock");

		if (_gettype == 4 AND _getlock < 2) then {

			_lowlaunchers set [count _lowlaunchers, _cfgName];

		};

		if (_gettype == 4 AND _getlock == 2) then {

			_highlaunchers set [count _highlaunchers, _cfgName];

		};
	};
};
};

GOM_list_allweapons = [_pistols,[_verylowrifles,_lowrifles,_medrifles,_highrifles,_veryhighrifles,_ultrarifles,_veryultrarifles,_lowgodlikerifles,_mediumgodlikerifles,_highgodlikerifles,_ultragodlikerifles,_prorifles,_paytowinrifles],[_admin0rifles,_admin1rifles,_admin2rifles,_admin3rifles,_admin4rifles,],[_lowlaunchers,_highlaunchers]];

true