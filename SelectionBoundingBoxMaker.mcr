

-- 4 Different Macro Scripts in here. 
		--1.Takes mesh and converts it be a collision mesh,  
		--2.  Creates a sphere that mostly encompasses each selected mesh (sphere scaled down 3/8ths total volume)  For me this worked best for most destruction chunks.  
		--3. Creates a box that fits each selected object.   
		--4. Creates one box that encompasses every selected object.

--Makes Collision, originally made for Snowblind Assets updated names for Unreal UBX -USP - UCX, Commented out user defined properties.
-- 3ds Max 2008 should work in latter versions.
-- Made by Matt Rapelje
-- Contact at mrapelje@hotmail.com
-- USE: You could use this to make simple collision, LOD/Proxies... originally made to make collision for Snowblinds, LOTR: War In the North.  
-- Made September 2009

--Start Mesh
macroScript MattRapelje_ColMesh category:"Matt Rapelje Tools" tooltip:"UCX Collision Mesh" buttonText: "ColMesh"
(
undo on
if selection.count > 0 then
(
	ColMSel = getCurrentSelection()
	clearSelection()
	for cM in ColMSel  do
		(
			If iskindof cM GeometryClass then
				(
				cM.wirecolor = brown
				cM.xray = on
				PostName = cM.name
				cM.name = "UCX_"+PostName  -- <-- CHANGE PREFIX HERE
				modPanel.addModToSelection (Materialmodifier ()) ui:on
				resetxform cM
				collapseStack cM
				setuserprop cM "collision" "mesh"  -- Uncomment this line to add a user defined property.-- Uncomment this line to add a user defined property.
				)
			Else	
				(
				baseNameString =  cM.name as string
				baseString	= "Could not apply to non geometry class object:  "
				AddedString = baseString + baseNameString
				messageBox  AddedString Beep:true
				)
		)
				(
				--messageBox "Add Notes Here." Beep:false
				)
)
Else
(
messageBox "Nothing Selected" Beep:true
)
)
--End Mesh
--
--Start Sphere
macroScript MattRapelje_ColSphere category:"Matt Rapelje Tools" tooltip:"USP Collision Sphere" buttonText: "ColSphere"
(
undo on
if selection.count > 0 then
(
	ColSSel = getCurrentSelection()
	clearSelection()
	for rS in ColSSel do	
		(
			If  iskindof rS GeometryClass then
			(
				resetxform rS
						(
							--Find Center Point Position
							Cx = rS.center.x
							Cy = rS.center.y
							Cz = rS.center.z
							CenterPlace = [Cx, Cy, Cz]
						)
					(
					MnPX = rS.min.x 
					MnPY = rS.min.y 
					MnPZ = rS.min.z

					MxPX = rS.max.x 
					MxPY = rS.max.y 
					MxPZ = rS.max.z 

					xDis = MxPX-MnPX
					yDis = MxPY-MnPY
					zDis = MxPZ-MnPZ
					)
		D2P = (sqrt((xDis*xDis)+(yDis*yDis)+(zDis*zDis)))

			Pname = rS.name
			ColSphere = Sphere radius:((D2P/2)*0.625)
			ColSphere.pos = CenterPlace
			addModifier ColSphere (Materialmodifier ()) ui:on
			resetxform ColSphere
			convertToPoly(ColSphere)
			ColSphere.wirecolor = brown
			ColSphere.xray = on
			ColSphere.name = Pname
			PostName = ColSphere.name
			ColSphere.name = "USP_"+PostName  -- <-- CHANGE PREFIX HERE
			setuserprop ColSphere "collision" "sphere"  -- Uncomment this line to add a user defined property.
			collapseStack rS
			)
			Else	
			(
			baseNameString =  rS.name as string
			baseString	= "Could not apply to non geometry class object:  "
			AddedString = baseString + baseNameString
			messageBox  AddedString Beep:true
			)
		)
				(
				--messageBox "Add Notes Here." Beep:false
				)
)
Else
(
messageBox "Nothing Selected" Beep:true
)
)
-- End Sphere
--
-- Start Box
macroScript MattRapelje_ColBox category:"Matt Rapelje Tools" tooltip:"UBX Collision Box" buttonText: "ColBox"
(
Undo on	
if selection.count > 0 then
(
	ColBSel = getCurrentSelection()
	clearSelection()
	for rB in ColBSel do	
		(
			If  iskindof rB GeometryClass then
			(
				PBname = rB.name
					resetxform rB
							bCx = rB.center.x
							bCy = rB.center.y
							bCz = rB.center.z
							CenterPlaceB = [bCx, bCy, bCz]
								(
								MnPX = rB.min.x 
								MnPY = rB.min.y 
								MnPZ = rB.min.z
								MxPX = rB.max.x 
								MxPY = rB.max.y 
								MxPZ = rB.max.z 
								xDis = MxPX-MnPX
								yDis = MxPY-MnPY
								zDis = MxPZ-MnPZ
								)
							ColBox = Box Length: yDis Width:xDis Height:zDis
							ColBox.pivot = [ColBox.center.x, ColBox.center.y, ColBox.center.z]
							ColBox.pos = CenterPlaceB
							addModifier ColBox (Materialmodifier ()) ui:on
							resetxform ColBox
							convertToPoly(ColBox)
							ColBox.wirecolor = brown
							ColBox.xray = on
							--	
							ColBox.name = PBname
							PostName = ColBox.name
							ColBox.name = "UBX_"+PostName  -- <-- CHANGE PREFIX HERE
							--setuserprop ColBox "collision" "box"  -- Uncomment this line to add a user defined property.
							collapseStack rB
			)
					Else	
			(
			baseNameString =  rB.name as string
			baseString	= "Could not apply to non geometry class object:  "
			AddedString = baseString + baseNameString
			messageBox  AddedString Beep:true
			)
		)
				(
				--messageBox "Add Notes Here." Beep:false
				)
)
Else
(
messageBox "Nothing Selected" Beep:true
)
)
-- End Box
--
-- Start Col Box for all Secelected
macroScript MattRapelje_SelectionBoundingBoxMaker category:"Matt Rapelje Tools" tooltip:"UBX Selection Bounding Box Maker" buttonText: "SB_BoxMaker"
(
	undo on
	(
		--PGname = $.name
		--resetxform $
		bCx = $.center.x
		bCy = $.center.y
		bCz = $.center.z
		CenterPlaceB = [bCx, bCy, bCz]
			(
				MnPX = $.min.x 
				MnPY = $.min.y 
				MnPZ = $.min.z
				MxPX = $.max.x 
				MxPY = $.max.y 
				MxPZ = $.max.z 
				xDis = MxPX-MnPX
				yDis = MxPY-MnPY
				zDis = MxPZ-MnPZ
			)
		ColBox = Box Length: yDis Width:xDis Height:zDis
		ColBox.pivot = [ColBox.center.x, ColBox.center.y, ColBox.center.z]
		ColBox.pos = CenterPlaceB
		addModifier ColBox (Materialmodifier ()) ui:on
		resetxform ColBox
		convertToPoly(ColBox)
		ColBox.wirecolor = brown
		ColBox.xray = on
		PostName = ColBox.name
		ColBox.name = "UBX_"+PostName
		--setuserprop ColBox "This is Collision A " "box"  -- Uncomment this line to add a user defined property.
		collapseStack $
	)
)

-- End Col Box for all Secelected. 
