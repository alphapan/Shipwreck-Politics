disableSerialization;
_display=createdialog "IntroScreen";
	_display= uiNameSpace getVariable "IntroScreen";
		_TextBox= _display displayCtrl 1100;
		_Pic= _display displayCtrl 1200;
_TextBox ctrlSetStructuredText (parsetext format ['<t color="#FFFFFF" align= "LEFT" size= "1.5" shadow="2">
 <br/>
  <br/>
   <br/>
After washing up on shore, you are waken by people who are wearing soldier uniforms and carry long assault rifles. <br/> 
<br/>
<br/>

"Are you alive?" <br/> 
<br/>
<br/>

Have been answer with a myriad of coughs and a double water upheave finale, the uniformed soldiers quietly chuckle with their approval. <br/> 
<br/>
<br/>

"Looks like rust duty paid off today, a small light in this hellhole.
<br/>
<br/>

A quick survey of the situation leads you to believe these are not friendly people helping you up from the sand. You start to consider the options in this situation, but are waken from thought by a new voice.


<br/>
<br/>

"This is not a safe place for you."</t>"']);


ctrlSetText [1200,"Convo\Images\INTROshot.jpg"];










