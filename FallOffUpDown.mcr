
-- FallOff size increasing and decreasing scripts, useful for binding to hotkeys.
-- Max 9
-- Made by Matt Rapelje
-- Contact at matt@polyleaf.com on the web at www.polyleaf.com
-- USE: Respectively makes FallOff bigger smaller by 20% (20% because every four times the size roughly doubles). Only for editable poly.
 
macroScript MattRapelje_FallOffUp category:"Matt Rapelje Tools" tooltip:"FallOff Up"  buttonText: "FoU"
--FallOff Up 20%
(
	Undo on
FallOffX = $.falloff
FallOffY = FallOffX * 1.2 
	(
	$.falloff = FallOffY
	)
)

macroScript MattRapelje_FallOffDown category:"Matt Rapelje Tools" tooltip:"FallOff Down"  buttonText: "FoD"
--Falloff Down 20%
(
	Undo on
FallOffX = $.falloff
FallOffY = FallOffX * 0.8 
	(
	$.falloff = FallOffY
	)
)