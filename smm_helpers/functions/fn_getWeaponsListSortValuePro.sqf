private _allpistols 		= [];   
private _allListWeapons 	= []; 
private _isjavelin			= [];  
private _lowlaunchers 		= [];
private _highlaunchers 		= [];
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
				_allpistols append [[_hitvalue,_cfgName]];   
			};   
			if (_gettype == 1) then {
				_allListWeapons append [[_hitvalue,_cfgName]];
			};
		}; 
		
		_getlock = getnumber (configfile >> "CfgWeapons" >> _cfgName >> "canLock");
		_aceJavelinEnabled = getnumber (configfile >> "CfgWeapons" >> _cfgName >> "ace_javelin_enabled");
		if (_aceJavelinEnabled == 1)then{
			_isJavelin set [count _isjavelin, _cfgName];
		}else{
			if (_gettype == 4 AND _getlock < 2) then {

				_lowlaunchers set [count _lowlaunchers, _cfgName];

			};

			if (_gettype == 4 AND _getlock == 2) then {

				_highlaunchers set [count _highlaunchers, _cfgName];

			};
		};
	};   
};   
 
_allpistols 	sort true;
_allListWeapons sort true;
WEAPONLIST= [_allpistols,_allListWeapons,_isjavelin,_lowlaunchers,_highlaunchers];
true 
