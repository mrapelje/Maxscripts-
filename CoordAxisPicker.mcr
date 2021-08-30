
macroScript CoordAxisPicker category:"Matt Rapelje Tools"  buttonText: "CAP"  tooltip:"Coordinate Axis Picker"
( 
-- CoordAxisPicker
-- Max 7
-- made by Matt Rapelje
-- contact at mrapelje@hotmail.com on the web at www.polyleaf.com
-- Somebody asked for it so I made it.
-- If you do not like it closing when you press a button just delete/comment out all lines that start with DestroyDialog

rollout CoordAxisPicker "CoAxPicker" width:110 height:225
(
	GroupBox grp1 "Coord" pos:[5,5] width:53 height:215
	GroupBox grp2 "Axis" pos:[64,6] width:40 height:185
	button BtnView "View" pos:[11,22] width:40 height:22
	button BtnScreen "Screen" pos:[11,50] width:40 height:22
	button BtnWorld "World" pos:[11,78] width:40 height:22
	button BtnParent "Parent" pos:[11,106] width:40 height:22
	button BtnLocal "Local" pos:[11,134] width:40 height:22
	button BtnGimbal "Gimbal" pos:[11,162] width:40 height:22
	button BtnPick "Pick" pos:[11,190] width:40 height:22
	button BtnXYAxis "XY" pos:[71,23] width:25 height:22
	button BtnYZAxis "YZ" pos:[72,51] width:25 height:22
	button BtnZXAxis "ZX" pos:[71,79] width:25 height:22
	button BtnXAxis "X" pos:[71,107] width:25 height:22
	button BtnYAxis "Y" pos:[71,135] width:25 height:22
	button BtnZAxis "Z" pos:[71,163] width:25 height:22
	button BtnAbout "About" pos:[64,197] width:40 height:22
	on BtnView pressed do
	(
	toolMode.coordsys #view
	DestroyDialog CoordAxisPicker
	)
	on BtnScreen pressed do
	(
	toolMode.coordsys #screen
	DestroyDialog CoordAxisPicker
	)
	on BtnWorld pressed do
	(
	toolMode.coordsys #world
	DestroyDialog CoordAxisPicker
	)
	on BtnParent pressed do
	(
	toolMode.coordsys #parent
	DestroyDialog CoordAxisPicker
	)
	on BtnLocal pressed do
	(
	toolMode.coordsys #local
	DestroyDialog CoordAxisPicker
	)
	on BtnGimbal pressed do
	(
	toolMode.coordsys #gimbal
	DestroyDialog CoordAxisPicker
	)
	on BtnPick pressed do
	(
	PickerOne = pickObject()
	(
		toolMode.coordsys PickerOne
	)
	DestroyDialog CoordAxisPicker
	)
	on BtnXYAxis pressed do
	(
	toolmode.axisConstraints = #XY
	DestroyDialog CoordAxisPicker
	)
	on BtnYZAxis pressed do
	(
	toolmode.axisConstraints = #YZ
	DestroyDialog CoordAxisPicker
	)
	on BtnZXAxis pressed do
	(
	toolmode.axisConstraints = #ZX
	DestroyDialog CoordAxisPicker
	)
	on BtnXAxis pressed do
	(
	toolmode.axisConstraints = #X
	DestroyDialog CoordAxisPicker
	)
	on BtnYAxis pressed do
	(
	toolmode.axisConstraints = #Y
	DestroyDialog CoordAxisPicker
	)
	on BtnZAxis pressed do
	(
	toolmode.axisConstraints = #Z
	DestroyDialog CoordAxisPicker
	)
	on BtnAbout pressed do
	(
	messageBox "Created by Matt Rapelje, www.polyleaf.com, mrapelje@hotmail.com"
	)
)
CreateDialog CoordAxisPicker
)
