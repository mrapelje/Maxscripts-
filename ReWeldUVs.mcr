

macroScript MattRapelje_ReWeldUVs category:"Matt Rapelje Tools" tooltip:"ReWeldUVs" buttonText: "ReWeldUV"
-- ReWeldUVs 
-- For 3ds Max 2012 may or may not work in earlier versions
-- Made by Matt Rapelje
-- Contact: mrapelje@hotmail.com
--ToDo: Add a selection set that has everything that has had this script run on it... a running collection.

--rollout ReWeldUVs "Re-Weld  UVs" width:162 height:50
(
	rollout ReWeldUVs "Re-Weld UVs" width:162 height:50
(
	button btnReWeld "Re-Weld UVs" pos:[7,8] width:150 height:36 tooltip:"Makes selected verts black, 0 in all channels."
	on btnReWeld pressed do 
	(
		undo on
		(
		if getCommandPanelTaskMode() != #modify do setCommandPanelTaskMode #modify -- Need to me in the modify mode for some crazzzzy reasone, who new.
		QuickUVWeld = Selection
		selectionSets ["Last Quick UV Weld"] = QuickUVWeld
		objSel = selection as array
			if objSel.count != 0 then
				(
					for o in objSel do
					(
						select o
							If  superclassof o == GeometryClass then
								(
									addModifier o (Unwrap_UVW  ()) ui:on
										o.Unwrap_UVW.setTVSubObjectMode 1
										actionMan.executeAction 0 "40021" -- Select All
										TempThresh = o.Unwrap_UVW.getWeldThreshold() -- Wanted to make sure that I was not overiding anyones Weld Threshhold settings.
										o.Unwrap_UVW.setWeldThreshold 0.01
										o.Unwrap_UVW.weldSelected()
										o.Unwrap_UVW.setWeldThreshold TempThresh -- Setting weld threshhold back.
									convertto o editable_poly
									clearselection() 
								)
							Else
								(
									StringName = o.name
									print  (StringName + " is not geometry, no was action taken on " + StringName +".")
								)	
					)
				)
			else
				(
					messagebox "You need to select some geometry."
				)
		select selectionSets["Last Quick UV Weld"] -- Reselect selection set.
		)
	)
)
CreateDialog ReWeldUVs	
)