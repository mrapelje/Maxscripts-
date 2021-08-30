
--Multiple UVW Aligning Scrips, Horizontal, Vertical, and Collapse

-- UVW Unwrap Align Horizontal
-- Max 9
-- Made by Matt Rapelje
-- Contact at mrapelje@hotmail.com on the web at www.polyleaf.com

-- UVW Unwrap Align Horizontal
-- USE: For use with UnwrapUVW.  Aligns selection on horizontal axis.
macroScript MattRapelje_UVW_AlignHorizantal category:"Matt Rapelje Tools" tooltip:"Align Horizontal"  buttonText: "AlH"
(
	Undo on
$.modifiers[#unwrap_uvw].unwrap2.ScaleSelectedCenter 0.0 2
)

-- UVW Unwrap Align Vertical
-- USE: For use with UnwrapUVW.  Aligns selection on vertical axis.
macroScript MattRapelje_UVW_UnwrapAlignVertical category:"Matt Rapelje Tools" tooltip:"Align Vertical"  buttonText: "AlV"
(
	Undo on
$.modifiers[#unwrap_uvw].unwrap2.ScaleSelectedCenter 0.0 1
)

-- UVW Unwrap Collapse
-- USE: For use with UnwrapUVW.  Collapses selection to one point.
macroScript MattRapelje_UVW_UnwrapCollapse category:"Matt Rapelje Tools" tooltip:"Collapse Selection"  buttonText: "ColSel"
(
	Undo on
$.modifiers[#unwrap_uvw].unwrap2.ScaleSelectedCenter 0.0 0
)