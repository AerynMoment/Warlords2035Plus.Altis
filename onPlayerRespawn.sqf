params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
0 spawn KS_fnc_unflipVehicleAddAction;

private _grp = (_newUnit getVariable ["MRTM_currentGroup", (createGroup (side _newUnit))]);
[_newUnit] joinSilent _grp;

private _leader = (leader _grp);

if ((_newUnit != _leader) && {(alive _leader) && {((_oldUnit distance _leader) < 100)}}) then {
	0 spawn BIS_fnc_WL2_orderLastLoadout;
	_newUnit setVehiclePosition [getPosATL _leader, [], 2, "NONE"];
};

{
	if (isNull _x) then {
		missionNamespace setVariable [(format ["BIS_WL_%1_ownedVehicles", getPlayerUID player]), ((missionNamespace getVariable [format ["BIS_WL_%1_ownedVehicles", getPlayerUID player], []]) - [_x])];
	};
} forEach (missionNamespace getVariable (format ["BIS_WL_%1_ownedVehicles", getPlayerUID player]));

["Died"] call MRTM_fnc_statTracker;

player addAction [
	"10K CP", 
	{[player, "10k"] remoteExec ["BIS_fnc_WL2_handleClientRequest", 2]} 
];