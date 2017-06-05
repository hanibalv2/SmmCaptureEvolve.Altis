private _range = _this select 1;
private _targetAreaCenter = _this select 0;
private _fallbackCounter = 0;
[[(_targetAreaCenter select 0) + _range,_targetAreaCenter select 1],30,"ColorOrange"] call smm_fnc_createDebugMarker;
[[(_targetAreaCenter select 0) - _range,_targetAreaCenter select 1],30,"ColorOrange"] call smm_fnc_createDebugMarker;
[[_targetAreaCenter select 0,(_targetAreaCenter select 1)+ _range],30,"ColorOrange"] call smm_fnc_createDebugMarker;
[[_targetAreaCenter select 0,(_targetAreaCenter select 1)- _range],30,"ColorOrange"] call smm_fnc_createDebugMarker;
private _posFound = [];

//private _options = "(1 - trees) * (1 - forest) * (1 - sea) * (meadow)";

while{(_fallbackCounter < 1000) && ((count _posFound)==0) || {((_targetAreaCenter distance _posFound) > _range )}}do{
	
	private _res = [(_targetAreaCenter select 0) + random[(-1) * _range,0,_range],(_targetAreaCenter select 1)+ random[(-1) * _range,0,_range]  ];
	// TODO check if pos is null what will be returned
	// https://community.bistudio.com/wiki/BIS_fnc_findSafePos
		_posFound = [_res, 0,_range * 0.25, 3,0,20,0] call BIS_fnc_findSafePos;
	//if no valid position is found, don't set one
	if((count _posFound)>2)then{
		_posFound = [];
	};
	
	//_result = selectBestPlaces [_res, _range * 0.25, _options, (_range / 10) min 500, 100]; 
	//_posFound = _result select 0 select 0;
	
	/*
	if((count _posFound) != 0)then{
	
	// 1 Version : Is sky visible?
	
		private _posHeight			= getTerrainHeightASL _posFound ;
		private _posElevated		= [_posFound select 0, _posFound select 1, _posHeight + 0.05];
		private _posElevatedMore 	= [_posFound select 0, _posFound select 1, _posHeight + 100.0];
		if (lineIntersects[_posElevated,_posElevatedMore])then{
			[_posFound,30,"ColorPink"] call smm_fnc_createDebugMarker;
			_posFound=[];
		};
		
	};
	*/

	// 2 Version : use smm_fnc_setPosAGLS;
			
	_fallbackCounter = _fallbackCounter+1;
};

if((count _posFound ==0))then{
diag_log("get_Pos_Near fallback is triggerd");
_posFound =[_targetAreaCenter select 0 ,_targetAreaCenter select 1, 1000] ;
}else{
/*
//version 1
_posFound set [2,0];
*/
};
assert((count _posFound)>1);
_posFound