//o 

// EXAMPLE NeoArmageddon
aph_dialogNodes=[];
aph_dialogNodes_ID=[];

/*
aph_dialogNodes_ID pushback "";
aph_dialogNodes pushback ["",[["","","","",""],["","","","",""]]];

		//[AI text, [[Character response,condition,code,argu for code,next dialogue]]];
*/	


//o Default
aph_dialogNodes_ID pushback "Aph_Default";
aph_dialogNodes pushback ["I am rather busy right now.",[["Exit","","","",""],["","","","",""]]];

aph_dialogNodes_ID pushback "Aph_LoyalDefault";
aph_dialogNodes pushback ["I am rather busy right now.",[["I am looking for members to join my group.","","","","Aph_GroupRequest"],["Exit","","","",""]]];

aph_dialogNodes_ID pushback "Aph_GroupRequest";
aph_dialogNodes pushback ["You are well known around here. It would be an honor to join your group.",[["I can't take anymore group members right now."," (count units (group (_this select 0)) ) >= (((_this select 0) getvariable ['MaximumGroupSize',3]))","","",""],["Join my group as a member."," (count units (group (_this select 0)) ) <=(((_this select 0) getvariable ['MaximumGroupSize',3]) - 1)",aph_Dfnc_joingroupMember,"",""],["Nevermind","","","",""]]];



//c	

//o Move Along
aph_dialogNodes_ID pushback "MoveAlong";
aph_dialogNodes pushback ["Move along. Don't press your luck around here, you'll end up like these two. ",[["Exit.","","","",""],["","","","",""]]];
//c 

//o Independent representatives
aph_dialogNodes_ID pushback "IR_Greet";
aph_dialogNodes pushback ["Hello rust. Tired of being oppressed yet?",[["Are you offering an alternative?","","","","IR_IntroTask"],["Exit","","","",""]]];

aph_dialogNodes_ID pushback "IR_IntroTask";
aph_dialogNodes pushback ["Yes, if you can prove your value we could take you to a less hostile area of the island.",[["I like the sound of that.","",ap_fnc_EscalateConversation1,"","IR_AssignTask"],["No, thank you","",ap_fnc_EscalateConversation1,"",""]]];

aph_dialogNodes_ID pushback "IR_Return";
aph_dialogNodes pushback ["Hello again. Have you reconsidered joining us?",[["I would like to join.","","","","IR_AssignTask"],["I still want to stay here.","","","",""],["Can you call the boat back?","((!(Indi_KaminoBoatDriver getvariable ['AssignedToTask',false])) && (player getvariable ['OnGuerRepMission',false])","","",""]]];

aph_dialogNodes_ID pushback "IR_AssignTask";
aph_dialogNodes pushback ["Ok, well we came here with a mission, but are coming up short. If you can help us retrieve a few opfor dogtags then we can feel comfortable taking you to our side of the island.",[["Ok, I can do that.","",aph_Dfnc_IndiRepsAssignTask,"",""],["I don't think I can do that.","","","",""]]];


//c

//o Rust Farmer

	//o Rust Farmer Conditions
		_rabbitquest="
			('aph_Rabbit' in itemcargo (_this select 0))
		";
		
		_rabbitquestempty="
			!('aph_Rabbit' in itemcargo (_this select 0))
		";
	//c
aph_dialogNodes_ID pushback "FR_Start";
aph_dialogNodes pushback ["Hello stranger. You're a new face here, what's your story?",[["People have been asking me that a lot lately. ","",ap_fnc_EscalateConversation2,"","FR_Skills"],["I've been looking for clues, but honestly I don't know.","",ap_fnc_EscalateConversation2,"","FR_Clues"]]];

aph_dialogNodes_ID pushback "FR_Skills";
aph_dialogNodes pushback ["Depending on your skills, your value to people changes. Do yourself a favor and make good use of your skills, even if you have to learn a new one.",[["Understood","","","","FR_SetupTask"],["Exit","","","",""],["","","","",""]]];

aph_dialogNodes_ID pushback "FR_Clues";
aph_dialogNodes pushback ["Well I do know other rust found some items from your wreckage. They are over on the East side of the island.",[["Ok, thanks for the information.","","","","FR_SetupTask"],["Alright.","","","","FR_SetupTask"]]];

aph_dialogNodes_ID pushback "FR_SetupTask";
aph_dialogNodes pushback ["Any chance you are available for work. You can use those skills I'm sure you have.",[["Tell me about the quest.","","","","FR_AssignQuest"],["I don't have time right now.","","","",""]]];

aph_dialogNodes_ID pushback "FR_AssignQuest";
aph_dialogNodes pushback ["I am starting to raise rabbits. I need more to start breading on a regular basis. If you can catch three rabbits I would really appreciate it.",[["Sounds easy enough. I will do that.","","","","FR_DoQuest"],["No thank you.","","","",""]]];

aph_dialogNodes_ID pushback "FR_DoQuest";
aph_dialogNodes pushback ["Ok great. There are fast and small. I have something that might help... Here, these binoculars might help you.",[["Thank you, I will use those.","","(_this select 0) addweapon 'binocular'","","FR_BinocQuest"],["I don't need those for the quest.","","","","FR_NoBinocQuest"],["On second thought. No quest.","","","",""]]];

aph_dialogNodes_ID pushback "FR_NoBinocQuest";
aph_dialogNodes pushback ["Your choice. I look forward to your return.",[["(Start Quest)","",aph_Dfnc_catchRabbits,"",""]]];

aph_dialogNodes_ID pushback "FR_BinocQuest";
aph_dialogNodes pushback ["Good choice. They are a bit weathered, but will prove useful. Return as fast as you can, I am excited to begin.",[["(Start Quest)","",aph_Dfnc_catchRabbits,"",""]]];


aph_dialogNodes_ID pushback "FR_RabbitQuestReturn";
aph_dialogNodes pushback ["Hello, any progress catching rabbits?",[["I have some rabbits for you.",_rabbitquest,aph_dfnc_TurninRabbits,"",""],["Nothing yet.",_rabbitquestempty,"","",""]]];

aph_dialogNodes_ID pushback "FR_Return";
aph_dialogNodes pushback ["Hello again, how can I help you?",[["Do you have any work for me?","","","","FR_AssignQuest"],["Exit","","","",""]]];

aph_dialogNodes_ID pushback "FR_CompleteQuest";
aph_dialogNodes pushback ["Spectacular! Thank you for doing this. Now I can get the action started on turning this place into a farm. A few more variaties of animal and I could be considered a geniune ranch. I owe you a lot.",[["Don't mention it.","",ap_fnc_EscalateConversation4,"",""],["Actually, yes you do.","",ap_fnc_EscalateConversation4,"",""],["I'll take my reward ","",ap_fnc_EscalateConversation4,"",""]]];

aph_dialogNodes_ID pushback "FR_CompletedQuestReturning";
aph_dialogNodes pushback ["Hello my friend. Do you need anything?",[["Exit","","","",""],["","","","",""]]];

	
	

//c

//o Rust Miners
aph_dialogNodes_ID pushback "MR_intro";
aph_dialogNodes pushback ["Welcome new blood. Im rather busy so I can't really talk right now.",[["Ok, goodluck.","","","",""],["Maybe I can help you and free up some time.","","","","MR_Help"]]];

aph_dialogNodes_ID pushback "MR_Help";
aph_dialogNodes pushback ["Alright, if you can collect 15 ore on my behalf I could work and talk at the same time.",[["Deal, I'll be back soon.","","","",""],["No thank you. You do it.","","","",""]]];


//c 

//o Information Civilian
aph_dialogNodes_ID pushback "IC_Start";
aph_dialogNodes pushBack ["How can I help you?",[["Where am I?","","","","IC_question"]]];
	
aph_dialogNodes_ID pushback "IC_question";
aph_dialogNodes pushback ["You are on Stratis Island. If you are here, you must have a good story.",[["What do you mean by that?","","","","IC_AboutStory"],["Exit","","","",""]]];

aph_dialogNodes_ID pushback "IC_AboutStory";
aph_dialogNodes pushback ["Come on. Why are you here?... you were sentenced to exile. you must have done something interesting.",[["Uh..","","","","IC_hesitate"],["That's none of your business.","","","","IC_RespondCold"]]];

aph_dialogNodes_ID pushback "IC_hesitate";
aph_dialogNodes pushback ["You don't have to say anything if you don't want to. But making friends helps around here.",[["Honestly, I couldn't tell you now because I don't really know.","","","","IC_Start_Friendly"],["I'll keep that information to myself.","","","","IC_Start_Unfriendly"],["What can you tell me about the other people around here?","","","","IC_AboutOthers"]]];

aph_dialogNodes_ID pushback "IC_RespondCold";
aph_dialogNodes pushback ["Alright then.",[["Where is the closest town?","","","","IC_PointTownUF"],["Goodbye","","","",""]]]; 

aph_dialogNodes_ID pushback "IC_Start_Unfriendly";
aph_dialogNodes pushback ["I see you are on track for the lone wolf lifestyles. On your way north check the other wolf bodies lieing around, you might be able to find something to prolong your death.",[["Goodbye","","","",""]]];

aph_dialogNodes_ID pushback "IC_Start_Friendly";
aph_dialogNodes pushback ["Hmm...sounds like a case of selective amnesia. All the same, what do you plan to do next?",[["Where is the closest town?","","","","IC_PointTown"],["I am going to find a place to settle down and make a plan.","","","","IC_PointNorth"],["Whats a good plan?","","","","IC_GiveAdvice"]]];

aph_dialogNodes_ID pushback "IC_AboutOthers";
aph_dialogNodes pushback ["There are all types around here: thieves, murders, just plain crazies. Coming here seems to make people work together a bit more. Maybe impending death has a...unifying factor. Don't let that fool you, there is plenty of war to go around.",[["Where do I go to stay away from war?","","","",""],["Where can I find these 'Wars'","","","",""]]];

aph_dialogNodes_ID pushback "IC_PointTownUF";
aph_dialogNodes pushback ["A few kilometers East. Good luck... you will need it.",[["Goodbye","","","",""],["","","","",""]]];

aph_dialogNodes_ID pushback "IC_PointTown";
aph_dialogNodes pushback ["The closest town is about seven kilometers south. You'll need a way to navigate. Take this compass to help.",[["Alright, thanks!","","(_this select 0) addweapon 'ItemCompass';","",""],["I won't need that.","","","",""]]];

aph_dialogNodes_ID pushback "IC_PointNorth";
aph_dialogNodes pushback ["If you desire a survivalist lifestyle your best bet is to head north. There is wild food and water available to scavenge. Much easier then the cut-throat world of 'civilization' around here. Here, take this compass to keep you on track.",[["Ok, thank you.","","(_this select 0) addweapon 'ItemCompass';","","IC_GiveKeyOpener"],["No, I won't be needing that.","","","",""]]];

aph_dialogNodes_ID pushback "IC_GiveAdvice";
aph_dialogNodes pushback ["Well, you can either find other exiles and work together to make something of life around here. Or, heading north, you will find more wildlife and open space to work with.",[["Tell me about the closest town.","","","","IC_PointTown"],["Where should I go to find more wilderness?","","","","IC_PointNorth"]]];

aph_dialogNodes_ID pushback "IC_GiveKeyOpener";
aph_dialogNodes pushback ["My pleasure. I'm glad you are a polite criminal. You might do well here...So do you plan to head north and survive?",[["Yes, I am curious to see what is there.","","","","IC_GiveKey"],["No, I don't think I will.","","","","IC_"]]];

aph_dialogNodes_ID pushback "IC_GiveKey";
aph_dialogNodes pushback ["Alright, well good luck to you then. Before you go, I want to give you something. If you follow me I will set you off on your journey.",[["Ok.","",ap_fnc_IC_openBox,"",""],["Goodbye","","","",""]]];
//c 

//o Cave Goat
aph_dialogNodes_ID pushback "Goat_Start";
aph_dialogNodes pushback ["..Baahhh...",[["This goat looks tasty. Better used for food.","",ap_fnc_GoatEat,"",""],["This goat looks hurt, how can I help?","",ap_fnc_GoatHelp,"",""]]];


aph_dialogNodes_ID pushback "GoatSecondMeeting";
aph_dialogNodes pushback ["Hello again. Still quiet as ever in here. Just the way I like it.",[["You have a nice place here.","","","",""],["Any new information to talk about?","","","",""]]];


aph_dialogNodes_ID pushback "GoatSheperd_Friendly";
aph_dialogNodes pushback ["Ahem... while you are encroaching on my place, I see you aren't a brainless killer like many around here.",[["Oh, I didn't see anyone, so I didn't know.","",ap_fnc_EscalateConversation1,"","GH_continue"],["How can you have a 'place' around here?","",ap_fnc_EscalateConversation1,"","GH_Place"]]];

aph_dialogNodes_ID pushback "GoatSheperd_Enemy";
aph_dialogNodes pushback ["Why would you kill a defenseless goat?! What are you doing here?! ! You won't take me alive! I am going to kill you first! !",[["(Defend attack)","",aph_Dfnc_GoatDefenderAttacks,"",""]]];


aph_dialogNodes_ID pushback "GH_continue";
aph_dialogNodes pushback ["Understandable. I chose this place for the solitude, so I might be extra jumpy.",[["","","","",""],["","","","",""]]];


aph_dialogNodes_ID pushback "GH_Place";
aph_dialogNodes pushback ["Everyone is entitled to make a home. I have chosen this spot. I chose it to be alone... and you are imposing on that.",[["","","","",""],["","","","",""]]];


//c

//o Rust Guard
aph_dialogNodes_ID pushback "RG_Command";
aph_dialogNodes pushback ["Step back rust. We are authorized to kill here.",[["Why are we not allowed to go past?","","","","RG_Reason"],["Exit","","","",""]]];

aph_dialogNodes_ID pushback "RG_Reason";
aph_dialogNodes pushback ["Because you have a job to do here. You are lucky we give you what you have. Get back to work!",[["What is our job?","","","","RG_Job"],["Goodbye","","","",""]]];

aph_dialogNodes_ID pushback "RG_Job";
aph_dialogNodes pushback ["Why am I the one giving you a history lesson?! You are rust! You keep the lighthouse going and that is it! I pray to god that one day the light goes out, then I can witness a Thinning and die a happy man. If you say one more word I will shoot you here. Leave!",[["Exit","","","",""],["","","","",""]]];
//c 

//o Corner Guard
aph_dialogNodes_ID pushback "RG_NiceGuy";
aph_dialogNodes pushback ["Hey",[["Hello, can you tell me if there is anyway in?","","","","RG_ContinueNice"],["Exit","","","",""]]];

aph_dialogNodes_ID pushback "RG_MeanGuy";
aph_dialogNodes pushback ["Get out of here before I call someone over.",[["Exit","","","",""],["","","","",""]]];

aph_dialogNodes_ID pushback "RG_FriendGuy";
aph_dialogNodes pushback ["You shouldn't be here. Don't let them catch us talking.",[["Can you repeat what you told me?","","","","RG_RepeatInfo"],["Exit","","","",""]]];

aph_dialogNodes_ID pushback "RG_ContinueNice";
aph_dialogNodes pushback ["Well... I'm not really supposed to help your rust.",[["I can make it worth your time.","","","","RG_NiceEndNice"],["Don't be an ass! Let me through!","","","","RG_NiceEndMean"]]];

aph_dialogNodes_ID pushback "RG_NiceEndMean";
aph_dialogNodes pushback ["No way. Get out of here before I call someone over.",[["Exit","",ap_fnc_EscalateConversation1,"",""]]];

aph_dialogNodes_ID pushback "RG_NiceEndNice";
aph_dialogNodes pushback ["Eh....Just don't let them know who told you, but there is a spare uniform near the water's edge. If you put it on you could walk past at a distance. Do something worthwhile with this information.",[["Goodbye","",ap_Cfnc_Uniform,"",""]]];

aph_dialogNodes_ID pushback "RG_RepeatInfo";
aph_dialogNodes pushback ["There is a spare uniform on the waters edge to the east. Hurry, get out of here.",[["Exit","","","",""],["","","","",""]]];
//c 

//o Intro Mining Collector
aph_dialogNodes_ID pushback "MC_FirstStart";
aph_dialogNodes pushback ["Rain or shine, we live to mine.",[["What an enduring and horrendous thought.","","","","MC_Chat"],["On Lancer's advice, I'm here because to help the cause."," ('Meet Foreman') in ( (_this select 0) getVariable ['CurrentMissions_ID',[]])","","","MC_Mission"],["This is what I've mined so far."," ('Gather ores') in ( (_this select 0) getVariable ['CurrentMissions_ID',[]])",aph_dfnc_MiningTurnin,"",""],["Why are we here?","","","","MC_RockPit"],["Exit","","","",""]]];

aph_dialogNodes_ID pushback "MC_Questions";
aph_dialogNodes pushback ["I am here to serve.",[["What are we doing in this rock pit?","","","","MC_RockPit"],["Is there anyway to make this go faster","","","","MC_RockSpeed"],["Tell me about the various ores around here.","","","","MC_Ores"],["Exit","","","",""]]];

aph_dialogNodes_ID pushback "MC_RockSpeed";
aph_dialogNodes pushback ["If you keep practicing you'll get better at mining each ore. Unless you have a spare hundred platinum coin, HewHew *chuckle*, then you could get an autodigger. That'd really be something, a rust using an autodigger...",[["Whats an autodigger?","","","",""],["Is that only way to get ore around here?","","","",""],["Let me change the subject.","","","","MC_Questions"]]];

aph_dialogNodes_ID pushback "MC_Ores";
aph_dialogNodes pushback ["There a a few different ores on this island. Each has its own uses, but mostly they are refined then made into parts used for repairs on The Tower.",[["That's interesting. Let me ask you another question.","","","","MC_Questions"],["Exit","","","",""]]];

aph_dialogNodes_ID pushback "MC_RockPit";
aph_dialogNodes pushback ["We are here to serve The Tower. If that light were to go out... well lets stick to happy thoughts ok. *Smile*",[["I have another question.","","","","MC_Questions"],["Exit","","","",""]]];

aph_dialogNodes_ID pushback "MC_Chat";
aph_dialogNodes pushback ["It's not as bad as one might assume. The rocks bring forth the materials to build tools of the gods. I have seen rock do many powerful things in my lifetime.",[["I think you might have a few rolling around in your head.","","","",""],["","","","",""]]];

aph_dialogNodes_ID pushback "MC_Mission";
aph_dialogNodes pushback ["Ok. Help by turning in ores that you mine so we can continue our building effots. I think that 5 ore of each: Iron, Platinum, Gold, and Stone, should do. Turn them in by putting the ore in this container next to me. I'll be waiting for you to finish.",[["I can do that.","",aph_dfnc_MiningMission,"",""],["I do not have the time right now.","","","",""]]];

//c 

//o Ranger at Wall

aph_dialogNodes_ID pushback "Ranger_Start";
aph_dialogNodes pushback ["Stay back! I can still kill you.",[["Woah, calm down. I am not here to hurt you.","","","","Ranger_Calm"],["Oh ya? I would like to see you try.","","","","Ranger_Fight"]]];

aph_dialogNodes_ID pushback "Ranger_Calm";
aph_dialogNodes pushback ["... okay. I could use your help then.",[["Sure, what help do you need?","",ap_fnc_EscalateConversation1,"","RG_MissionBrief"],["Sounds like I am in a position to negotiate.","","","","RG_Negotiate"],["I am not an errand boy. I have my own work.","",ap_fnc_EscalateConversation1,"",""]]];

aph_dialogNodes_ID pushback "Ranger_Fight";
aph_dialogNodes pushback ["Are you sure you want to die here? I can utilize the skills of any man on this rock, but they need to be alive.. I'd hate to lose a potential soldier because of your bad manners.",[["I'll show you bad manners! (Hostile)","","","",""],["Haha, no I'm just joking...","","","",""]]];

aph_dialogNodes_ID pushback "Ranger_Friendly";
aph_dialogNodes pushback ["Hello again.",[["I'm ready for the mission.","!((_this select 0) getvariable ['OnRangerFAMission',false])","","","RG_MissionBrief"],["I have some questions.","","","","RG_Questions"],["I have a first aid kit for you.","( (_this select 0) getvariable ['OnRangerFAMission',false]) && ('FirstAidKit' in itemcargo (_this select 0)) ",ap_fnc_CompleteRangerFA,"","RG_CompleteFA"]]];

aph_dialogNodes_ID pushback "RG_MissionBrief";
aph_dialogNodes pushback ["First I need to get into fighting condition. I need you to bring me a first aid kit so I can patch myself up. Someone at the market might have one to sell. Please don't take too long. I might not last here.",[["I'll get a first aid kit for you.","",ap_fnc_RangerFA,"",""],["You look fine, I can't do that for you right now.","","","",""]]];

aph_dialogNodes_ID pushback "RG_Negotiate";
aph_dialogNodes pushback ["Yes, I suppose you are. I will reward you if you can complete this mission. I need to see you work first.",[["Ok, what do you need help with?","",ap_fnc_EscalateConversation1,"","RG_MissionBrief"],["Well, I don't work like that. Find someone else.","","","",""]]];

aph_dialogNodes_ID pushback "RG_Questions";
aph_dialogNodes pushback ["Ok, what are you thinking about?",[["Where are we?","","","",""],["Nevermind","","","",""]]];

aph_dialogNodes_ID pushback "RG_CompleteFA";
aph_dialogNodes pushback ["Excellent! I owe you one. Give me some time to heal up. Maybe we can talk about the next step.",[["What is the plan here? You haven't told me much","","","","RG_ExplainSituation"],["I need to get going. Good luck.","","","",""]]];

	//Seconday mission 
	
aph_dialogNodes_ID pushback "RG_ExplainSituation";
aph_dialogNodes pushback ["I am not supposed to be here. If Opfor discovered me I would be killed on the spot. I am a guerilla, fighting for independence from the overpowered Blufor and Opfor. I was sent on a mission with a small team, but everyone else was killed. I still plan on completing my mission and could use some help doing it.",[["Alright. (Ponder reward for turning him in)","","","",""],["I might be able to help.","","","","RG_ExplainSecondary"]]];

aph_dialogNodes_ID pushback "RG_ExplainSecondary";
aph_dialogNodes pushback ["We are here to help the locals bust through the fence. We need to reinforce our army and we plan to enlist some of the rust. We have some who are willing to fight with us, first we need to get them to our side of the island. As such we need first get our hands on some explosives. I might have a way, but I need to talk to someone else first. If you can help me, start by taking this note to my man in the market. He will pretend to not know you, but give him this note and leave. He will know what to do from there. Come back to me when you have given him the note.",[["I can't do that. Sorry.","","","",""],["How will I know who to give it to?","","","",""],["I can do that no problem","","","",""]]];

aph_dialogNodes_ID pushback "";
aph_dialogNodes pushback ["",[["","","","",""],["","","","",""]]];
	
	





//c 

//o Lancer
aph_dialogNodes_ID pushback "LancerOpen";
aph_dialogNodes pushback ["Who are you?",[["Where am I?","","","","LC_Info"],["I'm the guy who is going to kill you. Let me go!","","","","LC_Rude"],["I honestly can't tell you. I'm having trouble remembering.","","","","LancerWelcome"]]];

aph_dialogNodes_ID pushback "LC_Rude";
aph_dialogNodes pushback ["You should watch how you behave. Having friends is the only way to survive around here.",[["I don't need friends.","",aph_Dfnc_LancerExecute,"",""],["Fair enough, what am I doing here?","","","","LancerWelcome"]]];

aph_dialogNodes_ID pushback "LC_Question";
aph_dialogNodes pushback ["Who are you? Why are you here?",[["I honestly don't remember. I'm feeling kinda funny right now. The last thing I remember is escaping the boat as it began to sink.","","","",""],["I am no one. A slave that is now free.","","","","LC_Slave"]]];

aph_dialogNodes_ID pushback "LC_Slave";
aph_dialogNodes pushback ["Well a slave will fit in around here.",[["Continue","","","","LC_IsleInfo"]]];

aph_dialogNodes_ID pushback "LC_Harsh";
aph_dialogNodes pushback ["Yes. And the harshness can mold you or break you. I am not here to ensure anyone's survival. I am here to make sure that light stays on and thats it.",[["I will do what it takes to survive.","","","","LC_IsleInfo"],["What can I do to prosper around here?","","","","LC_IsleInfo"]]];

aph_dialogNodes_ID pushback "LC_IsleInfo";
aph_dialogNodes pushback [" Allow me to summarize your new existance. We are workers and survivors. We work to keep that Lighthouse on... or we don't survive. What you will do is help us collect the minerals that are used to forge the parts we use for repairs. You will help my men collect the ore and if you behave, we might just give you something to eat.",[["I am feeling hungry. Food would be good.","","","","LancerWelcome"],["This is a very harsh place.","","","","LC_Harsh"]]];

aph_dialogNodes_ID pushback "LancerWelcome";
aph_dialogNodes pushback ["Go up the hill and see my mining foreman. He is standing near the cargobox and will have work for you to do. Show us that you are a team player and your release into the general public might be considered. Welcome to your new home.",[["Thanks... I guess.","",aph_Dfnc_LancerIntro,"",""],["Hmph.","",aph_Dfnc_LancerIntro,"",""]]];

aph_dialogNodes_ID pushback "LC_Info";
aph_dialogNodes pushback ["You are on an island. Water for miles all around. Unfortunatly you landed on the wrong side and now would benefit from answering my questions, not asking your own.",[["I understand. What do you want to know?","","","","LC_Question"],["What is out past the water?","","","","LC_Info2"],["I don't like how your talking to me. Whats the big idea here?","","","","LC_Rude"]]];

aph_dialogNodes_ID pushback "LC_Info2";
aph_dialogNodes pushback ["Hahah, don't begin thinking about whats out past the water, you will never see it. ",[["I will.","","(_this select 0) setvariable ['CIVRATING',(((_this select 0) getvariable ['CIVRATING',0]) + 5),true]","","LC_IsleInfo"],["Ok, what do you want from me?","","","","LC_IsleInfo"]]];


aph_dialogNodes_ID pushback "LancerSecond";
aph_dialogNodes pushback ["Go see the mining foreman. He will help you further.",[["Exit","","","",""],["","","","",""]]];

//c 

//c
