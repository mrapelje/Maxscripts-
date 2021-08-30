macroScript MattRapelje_UVWXYZswap category:"Matt Rapelje Tools"  buttonText: "UXs" tooltip:"swap UVWs with XYZs"

-- UVWXYZswap
-- Max 7
-- made by Matt Rapelje
-- contact at Matt@polyleaf.com on the web at www.polyleaf.com
-- NOTES:
-- Works On One Selected Model At A Time.
-- Does not work on multiple objects or non geometryclass type objects.
-- This will convert object into an editable poly and reset the Xform.
-- Because of scale differences between UVW and XYZ space, swapping will likely make your model/UVWs either very small or very large.  Depending on you unit setup this can be problematic, UVWs swapped into 3D can be so small that they are hard to work with in 3D.\n I experienced problems with models that I had created meters, I had to scale up the UVWs to fix this before swapping.
-- Swaps your first map channel with you 3D model. Not tested with models with multiple mapping channels and not recommended.
-- July 2012 Updated with mods from textools by Hendrik-Jan Schoenmaker http://www.renderhjs.net/textools/  -- this Added a nice scaling function.  
(
Undo on
If SuperClassof $ == GeometryClass and selection.count == 1 then
(
	(
		--  Begin From Textools Mod of my tool 
			local org = selection[1];
			local obj = snapshot org;

			local w = obj.max.x - obj.min.x;
			local h = obj.max.y - obj.min.y;
			local a_sze; 

			
			local _scaled = getUserProp org "texTools_swapped";
			/*if (org.modifiers[#Edit_Poly] == undefined and _scaled == true)then(
				_scaled = false;
			)*/
			if (_scaled == undefined or _scaled == false)then(
				a_sze = (w+h)/2.0;
				obj.scale = [1.0/a_sze,1.0/a_sze,1.0/a_sze];--UVW scale
				
				setUserProp org "texTools_swapped" true;
				setUserProp org "texTools_SwapScale" a_sze;
			)else(
				a_sze = (getUserProp org "texTools_SwapScale") as float;
				obj.scale = [1.0/a_sze,1.0/a_sze,1.0/a_sze];--UVW scale
				
				setUserProp org "texTools_swapped" false;
				setUserProp org "texTools_SwapScale" 1.0;--back to normal
			)
		--  End Textools Mod of my tool --Added scaling

			resetxform obj
			macros.run "Modifier Stack" "Convert_to_Poly"
			modPanel.addModToSelection (Unwrap_UVW ()) ui:on
			maxOps.CollapseNode obj on
		
		-- Swap magic
			channelInfo.CopyChannel obj 1 0
			channelInfo.PasteChannel obj 3 2
			channelInfo.CopyChannel obj 3 1
			channelInfo.PasteChannel obj 3 3
			channelInfo.CopyChannel obj 3 2
			channelInfo.PasteChannel obj 3 1
			channelInfo.CopyChannel obj 3 3
			channelInfo.PasteChannel obj 1 0
			channelInfo.ClearChannel obj 2
			channelInfo.ClearChannel obj 3

		
			obj.scale = [a_sze,a_sze,a_sze];--world space scaling  -- --  From Textools Mod of my tool 
			convertToMesh obj;
			modPanel.addModToSelection (Edit_Poly ()) ui:on
			subobjectLevel = 1;  --  From Textools Mod of my tool 
			actionMan.executeAction 0 "40021"  -- Selection: Select All  --  From Textools Mod of my tool 
			actionMan.executeAction 0 "40020"  -- Edit: Delete Objects  --  From Textools Mod of my tool 
			org.modifiers[#Edit_Poly].Attach obj editPolyNode:org;	--  From Textools Mod of my tool 
			subobjectLevel = 0;  --  From Textools Mod of my tool 
	)

	)
	else
	messagebox "\n     **     Works On One Selected Model At A Time.     **     \n\n NOTE: Does not work on multiple objects or non geometryclass type objects. \n\n NOTE: This will convert object into an editable poly and reset the Xform.\n\nCreated by: Matt Rapelje, www.polyleaf.com Contact: matt@polyleaf.com \n"
	)