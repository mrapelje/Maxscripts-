
-- Softselection Edge Distance Toggle
-- Max 6
-- made by Matt Rapelje
-- contact at mrapelje@hotmail.com on the web at www.polyleaf.com
-- Sombody wanted to create a shortcut key stroke for this... so now he can.


macroScript MattRapelje_SSEdgeDistTog category:"Matt Rapelje Tools" tooltip:"Soft Selection Edge Distance Toggle" buttonText: "SsEdT"
(
	undo on
	(
		if classOf $ == Editable_Poly then 
			(
			$.ssUseEdgeDist = not $.ssUseEdgeDist
			)
		else
			(MessageBox "Selected object needs to be an editable poly." title:"Warning")
	)
)