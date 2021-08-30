

-- Scrips for opening and closing groups.
-- Max 2010
-- Made by Matt Rapelje
-- Contact at mrapelje@hotmail.com -- www.polyleaf.com
-- USE: These scrips were made to open or close all groups in your selection.

macroScript MattRapelje_GroupClose category:"Matt Rapelje Tools" tooltip:"Group Close"  buttonText: "GrpClose"

(
	Undo on
	(
	GroupSelectionM  = getCurrentSelection()
	for i in GroupSelectionM do
		(
			 actionMan.executeAction 0 "40143"
		)
	)
)

macroScript MattRapelje_GroupOpen category:"Matt Rapelje Tools" tooltip:"Group Open"  buttonText: "GrpOpen"

(
	Undo On
	(
	GroupSelectionM  = getCurrentSelection()
	for i in GroupSelectionM do
		(
			 actionMan.executeAction 0 "40142"
		)
	)
)