private _v=_this select 0;
private _i=_this select 1;
private _d=_v distance _i;
if(_d<20)exitWith{};
if((typeOf _i)in dapsExcludedAmmo)exitWith{};
sleep .1;
if ((_v distance _i)>_d)exitWith{};
if((getNumber(configFile>>"CfgAmmo">>typeOf _i>>"hit"))>dapsHitLimit)exitWith{};
private _p=getPosATL _i;
private _id=getDir _i;
private _rd=[_id,_v]call DAPS_fnc_RelDir2;
[_v,_id,_p,_i]call DAPS_fnc_React;
private _ex=TRUE;
while{TRUE}do{
	if!(alive _i)exitWith{_ex=FALSE};
	if!(alive _v)exitWith{};
	_d=_v distance _i;
	if(_d>150)exitWith{_ex=FALSE}; //Max intercept distance
	if(_d<10)exitWith{};  //Min intercept distance
	sleep 0.001;
};
if!(alive _v)exitWith{};
if!(_ex)exitWith{};
deleteVehicle _i;
_p call DAPS_fnc_Blast;
private _a=_v getVariable"dapsAmmo";
[_v,"",_a]call DAPS_fnc_DeductAmmo;
[_v,"",_rd,TRUE]remoteExec["DAPS_fnc_Report"];