

--macroScript MattRapelje_CenterPivot category:"Matt Rapelje Tools" tooltip:"Center Pivot" buttonText: "CP"
(
-- For Jermy Estrellado
-- should work in max 5 plus  but has not been tested.
-- made by Matt Rapelje
-- contact at mrapelje@hotmail.com
Undo on
for obj in selection do
	(
		obj.pivot = [ obj.center.x , obj.center.y, obj.center.z]
	)
)