
Assign_WallRangerMission={
_player=_this select 0;

_MissionTitle='Ranger Contact';
_MissionDescription='An injured soldier has given me a task to get a first aid kit. When he is healed up he has an important mission for me.';

RangerFA_Task= _player createSimpleTask [_MissionTitle]; 
RangerFA_Task setSimpleTaskDescription [_MissionDescription,_MissionTitle,''];  
RangerFA_Task setTaskState 'Assigned';

// Check and add ID if needed
_missionsID=_player getVariable ["CurrentMissions_ID",[]];
_missions=_player getVariable ["CurrentMissions",[]];
	if !(_missionTitle in _missionsID) then {
		_missionsID pushback _MissionTitle;
		_missions pushback [_MissionTitle,_MissionDescription];
		_player setVariable ["CurrentMissions_ID",_missionsID,true];
		_player setVariable ["CurrentMissions",_missions,true];
	};

};

Assign_MiningMissionTask={
_player=_this select 0;


_MissionTitle='Gather ores';
_MissionDescription='I need to gather 5 Iron, Gold, Platinum, and Stone ore. This mission will help me a positive reputation with the local rust.';

MiningMission_Task= _player createSimpleTask [_MissionTitle]; 
MiningMission_Task setSimpleTaskDescription [_MissionDescription,_MissionTitle,''];  
MiningMission_Task setTaskState 'Assigned'; 


// Check and add ID if needed
_missionsID=_player getVariable ["CurrentMissions_ID",[]];
_missions=_player getVariable ["CurrentMissions",[]];
	if !(_missionTitle in _missionsID) then {
		_missionsID pushback _MissionTitle;
		_missions pushback [_MissionTitle,_MissionDescription];
		_player setVariable ["CurrentMissions_ID",_missionsID,true];
		_player setVariable ["CurrentMissions",_missions,true];
	};


};

Assign_LancerSendToForeman={
_player=_this select 0;

_MissionTitle='Meet Foreman';
_MissionDescription='Lancer, who appears to be a leader around here, has asked me to put in some work in the mines. He tells me that mining is an essential part of life on the island and that the foreman has more information about this place.';

LancerIntro_Task= _player createSimpleTask [_MissionTitle]; 
LancerIntro_Task setSimpleTaskDescription [_MissionDescription,_MissionTitle,''];  
LancerIntro_Task setTaskState 'Assigned'; 


// Check and add ID if needed
_missionsID=_player getVariable ["CurrentMissions_ID",[]];
_missions=_player getVariable ["CurrentMissions",[]];
	if !(_missionTitle in _missionsID) then {
		_missionsID pushback _MissionTitle;
		_missions pushback [_MissionTitle,_MissionDescription];
		_player setVariable ["CurrentMissions_ID",_missionsID,true];
		_player setVariable ["CurrentMissions",_missions,true];
	};

};









//MARK COMPLETED 
Completed_MeetForeman={
_player=_this select 0;


// Check and add ID if needed
_missionsID=_player getVariable ["CompletedMissions_ID",[]];
_missions=_player getVariable ["CompletedMissions",[]];
	if !(_missionTitle in _missionsID) then {
		_missionsID pushback _MissionTitle;
		_missions pushback [_MissionTitle,_MissionDescription];
		_player setVariable ["CurrentMissions_ID",_missionsID,true];
		_player setVariable ["CurrentMissions",_missions,true];
	};
	
	
// Take away active task
_player removeSimpleTask LancerIntro_Task;

};


Completed_MiningMission={
_player=_this select 0;


// Check and add ID if needed
_missionsID=_player getVariable ["CurrentMissions_ID",[]];
_missions=_player getVariable ["CurrentMissions",[]];
	if !(_missionTitle in _missionsID) then {
		_missionsID pushback _MissionTitle;
		_missions pushback [_MissionTitle,_MissionDescription];
		_player setVariable ["CurrentMissions_ID",_missionsID,true];
		_player setVariable ["CurrentMissions",_missions,true];
	};
	
// Take away active task
_player removeSimpleTask MiningMission_Task;
};


Completed_WallRangerMission={
_player=_this select 0;


// Check and add ID if needed
_missionsID=_player getVariable ["CurrentMissions_ID",[]];
_missions=_player getVariable ["CurrentMissions",[]];
	if !(_missionTitle in _missionsID) then {
		_missionsID pushback _MissionTitle;
		_missions pushback [_MissionTitle,_MissionDescription];
		_player setVariable ["CurrentMissions_ID",_missionsID,true];
		_player setVariable ["CurrentMissions",_missions,true];
	};

// Take away active task
_player removeSimpleTask MiningMission_Task;
};