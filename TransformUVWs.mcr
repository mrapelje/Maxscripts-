--macroScript MattRapelje_UVW_Transform category:"Matt Rapelje Tools" tooltip:"UVW Transforms" buttonText: "UvwTran"
-- Made by Matt Rapelje, matt@polyleaf.com , www.polyleaf.com
-- Need to add an error to select only one object at a time.
(
rollout TransformUVWs "Transform UVWs" width:342 height:146
(
	GroupBox offset "Offset: UVWs" pos:[9,6] width:320 height:92
	spinner OfUm "mU:" pos:[30,25] width:84 height:16 range:[-1000,1000,0]
	spinner OfVm "mV:" pos:[30,49] width:84 height:16 range:[-1000,1000,0]
	--spinner OfWm "mW:" pos:[30,73] width:84 height:16 range:[-1000,1000,0]
	--spinner OfUr "rU:" pos:[132,25] width:84 height:16 range:[-1000,1000,0]
	spinner OfWr "rW:" pos:[132,37] width:84 height:16 range:[-1000,1000,0]
	spinner OfUs "sU:" pos:[234,25] width:84 height:16 range:[-1000,1000,1]
	spinner OfVs "sV:" pos:[234,49] width:84 height:16 range:[-1000,1000,1]
	button btnAbt "About" pos:[276,104] width:53 height:30
	button btnApply "Apply" pos:[96,104] width:95 height:30
	button btnReset "Reset Values" pos:[195,104] width:75 height:30		
	button btnApplyR "Apply - Reset" pos:[9,104] width:82 height:30
	
	on btnAbt pressed do
	(
	messageBox "Created by Matt Rapelje, matt@polyleaf.com" Beep:false
	)
	on btnApply pressed do  -- Centered
		Undo on
	(
	$.modifiers[#unwrap_uvw].unwrap2.MoveSelected [0+OfUm.value,0+OfVm.value,0]
	$.modifiers[#unwrap_uvw].unwrap2.RotateSelectedCenter (degToRad OfWr.value)
	$.modifiers[#unwrap_uvw].unwrap2.ScaleSelectedXY OfUs.value OfVs.value [0,0,0]	
	)
	on btnReset pressed do
	(
	OfUm.value = 0
	OfVm.value = 0 
	--OfWm.value = 0 
	--OfUr.value = 0 
	--OfVr.value = 0 
	OfWr.value = 0
	OfUs.value = 1
	OfVs.value = 1
	)
	on btnApplyR pressed do  
		Undo on 
	(
		BtnApply.pressed()
		BtnReset.pressed()
	)

) 
CreateDialog TransformUVWs
)