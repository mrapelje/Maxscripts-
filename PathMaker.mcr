
macroScript MattRapelje_PathMaker category:"Matt Rapelje Tools" tooltip:"Path Maker" buttonText: "PathM"
-- Made by Matt Rapelje, matt@polyleaf.com , www.polyleaf.com
-- Makes Paths by Making Planar on Z the axis to each face individually in the Polygon selection in effect averaging and leveling a path on the terrain. 
-- Best not to use with soft selection.

(
	  If selection.count != 1 or classof $ != Editable_Poly then
            (
                messageBox "Select One EditablePoly, script effects the current polygon selection "
            )
    Else
			(
				disableSceneRedraw 
				(
			undo on
						(
			PathObject =$

			PathObject.Faces["LastPathSelection"] = PathObject.SelectedFaces -- Create selection set.

			PathSelArray = (polyop.getFaceSelection $ as array)

			PathObject.name  -- Not Needed, outputs Name of current asset.
			PathSelArray.count  -- Not Needed, outputs Number of faces selected.
			PathSelArray[1]  -- Not Needed, ouotputs Index number of first selected.

			deselect PathObject.Faces -- Deslect selection set.

			 For PP = 1 to PathSelArray.count do -- PP is the path point in array
					 (
					Sel = PathSelArray[PP]
					EdgeNum = PathSelArray[PP]
					PathObject.EditablePoly.SetSelection #Face #{EdgeNum}
					PathObject.EditablePoly.MakePlanarIn #Z
					)
 select PathObject.Faces["LastPathSelection"] -- Reselect selection set.
						)
					)
			)
)