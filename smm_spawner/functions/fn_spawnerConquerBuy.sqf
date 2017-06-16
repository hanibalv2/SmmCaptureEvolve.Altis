/*
TODO #1 #2
author hanibalv2

Buy a Zone for a given Price via an action.

*/

private _zone = _this select 3 select 0;
private _zoneSide = _zone call smm_fnc_getSide;
private _price = _this select 3 select 1;

if!([_zone,playerSide] call smm_fnc_isTarget)	exitWith	{hint str_not_target};
if(_zoneSide == (playerSide)) 					exitWith 	{hint str_own_zone;};
if(_zoneSide == civilian)						exitWith	{hint str_conquer};

if([_zone,playerSide] call smm_fnc_isTarget) then {
	
	if(_price==(-1))						exitWith		{hint str_to_many_enemies};
	if(_price <= (call smm_fnc_getBalance)) then{
		// subtract money
		_price call smm_fnc_buy;

		// TODO #1 do better
		// delete zone units
		{
		 _x setDamage 1;
		}forEach(zoneNoToUnits select _zone);
		
		// TODO #2 problems here with the call
		["","",_zone]call smm_fnc_spawnerConquer;
		
	}else{

		hint str_insufficient;
	};
};
