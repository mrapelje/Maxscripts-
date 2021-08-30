
-- Scrips for turning on and off back face culling.
-- Max 2008
-- Made by Matt Rapelje
-- Contact at matt.rapelje@lith.com, www.polyleaf.com
-- USE: These scrips were made to turn on and off back face culling.  
--Backface culling is usually off by default but if you work on a lot of interior spaces (inverted boxes) like me, then having this off is really annoying because you can not see into the area that you are working on.
 
macroScript MattRapelje_BackfaceOnAll category:"Matt Rapelje Tools" tooltip:"BackfaceOnAll"  buttonText: "BfOnA"
-- Backface on all.
(
		Undo on
	BfOnAMySelection = getCurrentSelection()
	actionMan.executeAction 0 "40021"  -- Selection: Select All
	$.displayByLayer = False
	$.backfacecull = on
	clearSelection()
	select BfOnAMySelection
)

macroScript MattRapelje_BackfaceOffAll category:"Matt Rapelje Tools" tooltip:"BackfaceOffAll"  buttonText: "BfOffA"
-- Backface off all.
(
		Undo on
	BfOffAMySelection = getCurrentSelection()
	actionMan.executeAction 0 "40021"  -- Selection: Select All
	$.displayByLayer = True
	$.backfacecull = off
	clearSelection()
	select BfOffAMySelection
)

macroScript MattRapelje_BackfaceOnSel category:"Matt Rapelje Tools" tooltip:"BackfaceOnSelection"  buttonText: "BfOnS"
-- Backface on just current selection
(
		Undo on
	$.displayByLayer = false
	$.backfacecull = on
)
	
macroScript MattRapelje_BackfaceOnSel category:"Matt Rapelje Tools" tooltip:"BackfaceOnSelection"  buttonText: "BfOffS"
-- Backface off just current selection
(
		Undo on
	$.displayByLayer = true
	$.backfacecull = off
)
