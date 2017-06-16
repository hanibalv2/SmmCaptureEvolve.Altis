/*
TODO : cleanup, delete unused variables, zoneOnZoneEnterTime is maybe not necessary
author hanibalv2

This script calculates the price, for whith a zone can gets buyed.

param1 = a zone number

*/

_zone=_this;
_size 		= round 	( _zone call smm_fnc_getSize );

_units				= (zoneOnZoneEnterTime select _zone) select 1;
_vehicle			= (zoneOnZoneEnterTime select _zone) select 2; // need vehicle count fix
_basePrice			= ((_units * 1000 ) + ( _vehicle *3000 )) * (_size * 4) ; // money = zonesize * 4
//_lastBasePrice		= (zoneOnZoneEnterTime select _zone) select 3; //will get deleted 

_twentyPercentCut		= _basePrice * 0.2;
_curUnits 		= count ( zoneNoToUnits 	select _zone );
//_curVehicle   	= count ( zoneNoToVehicle 	select _zone );

_curUnitsInVehilces =0;
if!(_curUnits == 0)then {
	{
		if!(_x call CBA_fnc_vehicleRole == "")then{
				_curUnitsInVehilces= _curUnitsInVehilces+1;
		};
	}foreach ( zoneNoToUnits 	select _zone ) ;
};

_curBasePrice 	= ((_curUnits * 1000 ) + ( _curUnitsInVehilces *2000 )) * (_size * 4);
curBasePrice = _curBasePrice ;
_time				= round ( ( ( round serverTime) - ((zoneOnZoneEnterTime select _zone) select 0 )) );

_out=-1;
if(_curBasePrice <= _twentyPercentCut )then{
_out = (_curBasePrice/_time);
 }else{
(zoneOnZoneEnterTime select _zone) set [3,(_curBasePrice/_time)];
};
_out