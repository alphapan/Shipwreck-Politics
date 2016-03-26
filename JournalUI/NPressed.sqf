if !(visibleMap) exitwith {};
if ((isnull (uiNameSpace getVariable "MapMarkerCheckbox"))) then {
closedialog 0;
_handle=createDialog "MapMarkerCheckbox";
disableserialization;
	_display= uiNamespace getVariable "MapMarkerCheckbox";
		_checkbox0=_display displayCtrl 2800;
		_checkbox1=_display displayCtrl 2801;
		_checkbox2=_display displayCtrl 2802;
		_checkbox3=_display displayCtrl 2803;
			_text1=_display displayCtrl 1100;
			_text2=_display displayCtrl 1101;
			_text3=_display displayCtrl 1102;
			_text4=_display displayCtrl 1103;
			
		
		
_MarkerChoice=player getVariable ["ShowingMarkers",[false,false,false,false]];
		_areaMarkers=_MarkerChoice select 0;
		_TownInfo=_MarkerChoice select 1;
		_PersonalLoca=_MarkerChoice select 2;
		_MovingMilitia=_MarkerChoice select 3;
		
		
	_checkbox0 ctrlSetChecked _areaMarkers; 	
	_checkbox1 ctrlSetChecked _TownInfo; 
	_checkbox2 ctrlSetChecked _PersonalLoca; 	
	_checkbox3 ctrlSetChecked _MovingMilitia; 	
		
	
_text1 ctrlSetBackgroundColor [0, 0, 0, 0];
_text2 ctrlSetBackgroundColor [0, 0, 0, 0];
_text3 ctrlSetBackgroundColor [0, 0, 0, 0];
_text4 ctrlSetBackgroundColor [0, 0, 0, 0];

	_text1 ctrlSetStructuredText (parsetext format ["
		<t size='1' color='#FFFFFF'>
		Flag Markers
		</t>		
		"]);	
	_text2 ctrlSetStructuredText (parsetext format ["
		<t size='1' color='#FFFFFF'>
		Battle Marker
		</t>		
		"]);
	_text3 ctrlSetStructuredText (parsetext format ["
		<t size='1' color='#FFFFFF'>
		Town Markers
		</t>
		"]);
	_text4 ctrlSetStructuredText (parsetext format ["
		<t size='1' color='#FFFFFF'>
		Assaulting Militia
		</t>
		"]);
			
} else {closedialog 0;};