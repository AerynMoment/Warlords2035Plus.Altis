private["_vehicle","_type"];
_vehicle=_this;
if!(local _vehicle)exitWith{};
_vehicle setVariable["dapsCanSmoke",1,TRUE];
_type=typeOf _vehicle;
if(_type in dapsLight)exitWith{_vehicle spawn DAPS_fnc_APSlight};
if(_type in dapsMedium)exitWith{_vehicle spawn DAPS_fnc_APSmedium};
if(_type in dapsHeavy)exitWith{_vehicle spawn DAPS_fnc_APSheavy};
if(_type in dapsTrophyLV)exitWith{_vehicle spawn DAPS_fnc_APSTrophyLV};
if(_type in dapsTrophyMV)exitWith{_vehicle spawn DAPS_fnc_APSTrophyMV};
if(_type in dapsTrophyHV)exitWith{_vehicle spawn DAPS_fnc_APSTrophyHV};
if(_type in dapsTrophyHVe)exitWith{_vehicle spawn DAPS_fnc_APSTrophyHVe};
if(_type in dapsArena)exitWith{_vehicle spawn DAPS_fnc_APSArena};
if(_type in dapsDazzler)exitWith{_vehicle spawn DAPS_fnc_APSDazzler};
if(_type in dapsDrozd)exitWith{_vehicle spawn DAPS_fnc_APSDrozd};
if(_type in dapsDrozd2)exitWith{_vehicle spawn DAPS_fnc_APSDrozd2};
if(_type in dapsAfganit)exitWith{_vehicle spawn DAPS_fnc_APSAfganit};
if(_type in dapsAfganitE)exitWith{_vehicle spawn DAPS_fnc_APSAfganitE};
if(_type in dapsIronFist)exitWith{_vehicle spawn DAPS_fnc_APSIronFist};
if(_type in dapsAMAP)exitWith{_vehicle spawn DAPS_fnc_APSAMAP};