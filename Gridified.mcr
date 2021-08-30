macroScript MattRapelje_Gridified category:"Matt Rapelje Tools" tooltip:"Gridified" buttonText: "grd"
(
-- Gridified   r1.0
-- Max 8, has worked for me on all versions of max up to 2013... should work on latter versions too.
-- made by Matt Rapelje
-- contact at mrapelje@hotmail.com on the web at www.polyleaf.com
-- Grids Are Great, About Button will list common grid for Games (powers of 2), and Common Architectural Fractions

rollout Gridified "Gridified" width:256 height:112
(  
	button BtnGridify " Gridify" pos:[8,14] width:76 height:60
	spinner Xg "Xg " pos:[100,38] width:76 height:16 range:[0,1.67772e+007,1]
	spinner Yg "Yg " pos:[100,60] width:76 height:16 range:[0,1.67772e+007,1]
	spinner Zg "Zg " pos:[100,82] width:76 height:16 range:[0,1.67772e+007,1]
	checkbox Xon "X on" pos:[186,38] width:47 height:19 checked:true
	checkbox Yon "Y on" pos:[186,60] width:47 height:19 checked:true
	checkbox Zon "Z on" pos:[186,82] width:47 height:19 checked:true
	button BtnAboutGridifier "About" pos:[8,80] width:76 height:20
	radiobuttons rdoOSO "" pos:[93,14] width:157 height:16 labels:#("Object", "Sub Object") columns:2
	On BtnGridify pressed do
	Undo on
	( 
	If rdoOSO.state == 1 and selection.count > 0 then
		(
		GridObjects = $
			For i in GridObjects do
				( 
					If Xon.checked == True then
					(
					VaX = Xg.value
					PoX = i.pos.x
					MoX = PoX/Xg.value
					MpX = MoX-0.5
					MtX = Ceil MpX
					PnX = MtX*Xg.value
					i.pos.x = 0
					i.pos.x = PnX
					)
				If Yon.checked == True then
					(
					VaY = Yg.value	
					PoY = i.pos.y
					MoY = PoY/Yg.value
					MpY = MoY-0.5
					MtY = Ceil MpY
					PnY = MtY*Yg.value
					i.pos.y = 0
					i.pos.y = PnY
					)
				If Zon.checked == True then
					(
					VaZ = Zg.value
					PoZ = i.pos.z
					MoZ = PoZ/Zg.value
					MpZ = MoZ-0.5
					MtZ = Ceil MpZ
					PnZ = MtZ*Zg.value
					i.pos.z = 0
					i.pos.z = PnZ
					)
				) 
		)
	Else
	(
			If selection.count == 0 and rdoOSO.state == 1 then
				(
				MessageBox  "Select Something Grid Objects"
				)
	)
	
(
	If rdoOSO.state == 2 and classof $ == Editable_mesh and selection.count == 1 then
			(
			GridSubObj = $	
				convertToMesh GridSubObj
				for v = 1 to getNumVerts GridSubObj do
				(
				If Xon.checked == True then
					(
					vert = getVert GridSubObj v 
							VaX = Xg.value
							PoX = vert.x
							MoX = PoX/Xg.value
							MpX = MoX-0.5
							MtX = Ceil MpX
							PnX = MtX*Xg.value
							vert.x = 0
							vert.x = PnX
					setVert GridSubObj v vert
					)
				If Yon.checked == True then
					(
					vert = getVert GridSubObj v --get the v-th vertex 
							VaY = Yg.value
							PoY = vert.y
							MoY = PoY/Yg.value
							MpY = MoY-0.5
							MtY = Ceil MpY
							PnY = MtY*Yg.value
							vert.y = 0
							vert.y = PnY
					setVert GridSubObj v vert --assign back to the v-th vertex
					)
				If Zon.checked == True then
					(
					vert = getVert GridSubObj v --get the v-th vertex 
							VaZ = Zg.value
							PoZ = vert.z
							MoZ = PoZ/Zg.value
							MpZ = MoZ-0.5
							MtZ = Ceil MpZ
							PnZ = MtZ*Zg.value
							vert.z = 0
							vert.z = PnZ
					setVert GridSubObj v vert --assign back to the v-th vertex
					)
				)
				update GridSubObj 
			)	
	Else
		If rdoOSO.state == 2 then
					(
					messageBox "Select One Editable Mesh"
					)
	)
			)
				on BtnAboutGridifier pressed do
					(
					messageBox "Created by Matt Rapelje, www.polyleaf.com, matt@polyleaf.com \n\n First SixTeen Powers Of Two: \n  1 , 2 , 4 , 8 , 16 , 32 , 64 , 128 , 256 , 512 , 1024 , 2048 , 4096 , 8192 , 16384 , 32768 \n\n Common Fractions: \n 1/2 = 0.5 , 1/4 = 0.25 , 1/8 = 0.125 , 1/16 = 0.0625 , 1/32 = 0.03125 , 1/64 = 0.015625 "
					)
	)
	CreateDialog Gridified
)


