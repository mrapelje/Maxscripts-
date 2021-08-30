
-- Paint Deform Value and Brush size increasing and decreasing scripts, useful for binding to hotkeys.
-- Max 9
-- Made by Matt Rapelje
-- Contact at matt@polyleaf.com on the web at www.polyleaf.com
-- USE: Respectively makes Paint Deform Push Pull Values bigger or smaller by 20% (20% because every four times the size roughly doubles). Only for editable poly objects.
 
---
 
macroScript MattRapelje_PaintDefValUp category:"Matt Rapelje Tools" tooltip:"Paint Deform Value Up"  buttonText: "PDVU"
--Up 20%
(
	Undo on
uPaintDefVX = $.paintDeformValue
uPaintDefVY = uPaintDefVX * 1.2 
	(
	$.paintDeformValue = uPaintDefVY
	)
)

---

macroScript MattRapelje_PaintDefValDown category:"Matt Rapelje Tools" tooltip:"Paint Deform Value Down"  buttonText: "PDVD"
--Down 20%
(
	Undo on
dPaintDefVX = $.paintDeformValue
dPaintDefVY = dPaintDefVX * 0.8 
	(
	$.paintDeformValue = dPaintDefVY
	)
)

---
 
macroScript MattRapelje_PaintDefBrushUp category:"Matt Rapelje Tools" tooltip:"Paint Deform Brush Up"  buttonText: "PDBU"
--Up 20%
(
	Undo on
uPaintDefBX = $.paintDeformSize
uPaintDefBY = uPaintDefBX * 1.2 
	(
	$.paintDeformSize = uPaintDefBY
	)
)

---

macroScript MattRapelje_PaintDefBrushDown category:"Matt Rapelje Tools" tooltip:"Paint Deform Brush Down"  buttonText: "PDBD"
--Down 20%
(
	Undo on
dPaintDefBX = $.paintDeformSize
dPaintDefBY = dPaintDefBX * 0.8 
	(
	$.paintDeformSize = dPaintDefBY
	)
)

---

