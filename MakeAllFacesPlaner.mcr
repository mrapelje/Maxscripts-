  
macroScript MattRapelje_MakeAllFacesPlaner category:"Matt Rapelje Tools"  buttonText: "MAFP" tooltip:" Make All Faces Planer"
-- Made by Matt Rapelje, matt@polyleaf.com , www.polyleaf.com
-- Designed to help fix some problematic collision volumes in unreal's static mesh MCDCX_
(
  If selection.count != 1 or classof $ != Editable_Poly then
            (
                messageBox "Select One EditablePoly"
            )
    Else
		(
				
        (
        MakeAllPolyPlanar = $
            (
            For i = 1 to getNumFaces MakeAllPolyPlanar do 
                (
				MakeAllPolyPlanar.SetSelection #Face #{i}
				MakeAllPolyPlanar.EditablePoly.makePlanar #Face
                )
            )
        )
	)
)