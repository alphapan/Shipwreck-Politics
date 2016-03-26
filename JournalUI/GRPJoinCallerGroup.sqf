_target=_this select 0;
_caller=_this select 1;

{[_x] join _caller;} foreach units group _target;
{ removeallactions _x;} foreach units group _target;

_Group=_target getVariable "InMemberArray";
_Array=_player getvariable [_group + 'Array',[]];
_Array=_Array + [_partner];
_player setVariable [_group + 'Array',_Array,true];

//_caller addaction ["Command","VariablesF\StartHighCommand.sqf","",6,false,true,"",""];