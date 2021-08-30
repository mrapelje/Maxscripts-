-- GET Rid of the "--" on the line below if you want to turn this into a macroscript.
--macroScript MattRapelje_ExportPrep category:"Matt Rapelje Tools" tooltip:"Export Prep" buttonText: "EP" 
(
-- Export Prep r2  -- Added ability to break up steps and JEEWiz Function, added Affet Pivot Mode.
-- Max 9,8,7, should work in max 6 as well but has not been tested, will not work max 5, you will need to remove the line resetxform obj.  By Doing so your Xform will no longer reset.
-- made by Matt Rapelje
-- contact at Matt@polyleaf.com on the web at www.polyleaf.com
-- A big time saver and helps reduce common export mistakes.
global ExportPrep
try (destroyDialog ExportPrep) catch()

rollout ExportPrep "Export Prep" width:440 height:200
(
	radiobuttons rdoXP "X Location" pos:[12,17] width:184 height:30 labels:#("X min", "X mid", "X max") default:1 columns:3
	radiobuttons rdoYP "Y Location" pos:[12,50] width:187 height:30 labels:#("Y min", "Y mid", "Y max") default:1 columns:3
	radiobuttons rdoZP "Z Location" pos:[12,83] width:184 height:30 labels:#("Z min", "Z mid", "Z max") default:1 columns:3
	button btnApEP "Apply Above" pos:[6,126] width:125 height:32 toolTip:"Execute Above Settings"
	spinner spnXOs "X Offset" pos:[198,32] width:96 height:16 range:[-10000,10000,0]
	spinner spnYOs "Y Offset" pos:[198,65] width:96 height:16 range:[-10000,10000,0]
	spinner spnZOs "Z Offset" pos:[198,98] width:96 height:16 range:[-10000,10000,0]

	spinner spnXPos "X Pos" pos:[333,18] width:96 height:16 range:[-10000,10000,0]
	spinner spnYPos "Y Pos" pos:[333,44] width:96 height:16 range:[-10000,10000,0]
	spinner spnZPos "Z Pos" pos:[333,71] width:96 height:16 range:[-10000,10000,0]
	GroupBox grp1 "Pivot Placement" pos:[2,1] width:300 height:120
	GroupBox grp2 "World Position" pos:[306,1] width:130 height:94
	button btnCL "Check List" pos:[307,99] width:125 height:20 toolTip:"Opens Exporting Check List"


	button RXOBtn "Reset Xform Only" pos:[138,126] width:91 height:32 toolTip:"Reset Xform Only"
	button PPOBtn "Pivot Place Only" pos:[236,126] width:89 height:32 toolTip:"Pivot Place Only"
	button WPOBtn "World Position Only" pos:[330,126] width:104 height:32 toolTip:"World Position Only"
	
	button btnAPO "Pivot Mode" pos:[6,164] width:60 height:32 toolTip:"Export Selected"
	button btnExpSel "Export Sel" pos:[70,164] width:56 height:32 toolTip:"Export Selected"
	button btnSavSel "Save Sel" pos:[130,164] width:48 height:32 toolTip:"Save Selected"
	
	button btnExport "Export" pos:[182,164] width:41 height:32 toolTip:"Exoprt Scene"
	button btnSave "Save" pos:[226,164] width:35 height:32 toolTip:"Save Scene"
	
	button btnNotes "?" pos:[422,164] width:12 height:32 toolTip:"Help"
	
	button JEEWizBtn "JEEWiz" pos:[266,164] width:47 height:32 toolTip:"Just Export Each In Selection Using Objects as Export File Name"
	label lab1 "JEEWiz Extension:" pos:[325, 164] width:90 height:26  
	edittext txtEXT "" pos:[328, 178] fieldWidth:68 labelOnTop:false text:"fbx" toolTip:"Do not include the dot at the start of the extension."
	
	on btnApEP pressed do
	(
	
	local mySpot = [0, 0, 0]
		Undo on
	for obj in selection do
	(
	resetxform obj -- This line will cause the max 5 to error, either delete it or add two - to the begining of the line.  By Doing so your Xform will no longer reset.
	collapsestack obj
	case rdoXP.state of
	(
	  1: mySpot.x = obj.min.x
	  2: mySpot.x = obj.center.x
	  3: mySpot.x = obj.max.x
	)
	case rdoYP.state of
	(
	  1: mySpot.y = obj.min.y
	  2: mySpot.y = obj.center.y
	  3: mySpot.y = obj.max.y
	)
	case rdoZP.state of
	(
	  1: mySpot.z = obj.min.z
	  2: mySpot.z = obj.center.z
	  3: mySpot.z = obj.max.z
	)
	obj.pivot = mySpot + [spnXOs.value, spnYOs.value, spnZOs.value]
	obj.pos = [0+spnXPos.value, 0+spnYPos.value, 0+spnZPos.value]
	)
	)
	on btnNotes pressed do
	(
	messageBox "Created by Matt Rapelje, www.polyleaf.com, matt@polyleaf.com" Beep:false
	)
	on btnCL pressed do
	(
	shellLaunch "notepad.exe" "C:\3dsMaxExportPrepCheckList.txt"  -- The second set of "" is where you put the location and name of the text file, the default is C:\
	)
	on btnExport pressed do
	(
	actionMan.executeAction 0 "40011"  -- File: Export File
	)
	on btnExpSel pressed do
	(
	actionMan.executeAction 0 "40373"  -- File: Export Selected
	)
	on btnSavSel pressed do
	(
	actionMan.executeAction 0 "40008"  -- File: Save Selected
	)
	on btnSave pressed do
	(
	actionMan.executeAction 0 "40006"  -- File: Save File
	)
	on RXOBtn pressed do  -- Reset Xform
	(
		Undo on
		for obj in selection do
		(
		ResetXForm obj -- This line will cause the max 5 to error, either delete it or add two - to the begining of the line.  By Doing so your Xform will no longer reset.
		collapsestack obj
		)				
	)
	on PPOBtn pressed do  -- Pivot Placer
	(
	local mySpot = [0, 0, 0]
	Undo on
	for obj in selection do
	(
	case rdoXP.state of
	(
	  1: mySpot.x = obj.min.x
	  2: mySpot.x = obj.center.x
	  3: mySpot.x = obj.max.x
	)
	case rdoYP.state of
	(
	  1: mySpot.y = obj.min.y
	  2: mySpot.y = obj.center.y
	  3: mySpot.y = obj.max.y
	)
	case rdoZP.state of
	(
	  1: mySpot.z = obj.min.z
	  2: mySpot.z = obj.center.z
	  3: mySpot.z = obj.max.z
	)
	obj.pivot = mySpot + [spnXOs.value, spnYOs.value, spnZOs.value]
	)
	)
	on WPOBtn pressed do  -- Object Mover
	(
		Undo on
	for obj in selection do
		(
		obj.pos = [0+spnXPos.value, 0+spnYPos.value, 0+spnZPos.value]
		)
	)
	on JEEWizBtn pressed do
	(
		global sExtension = ("." + txtEXT.text)
		print sExtension
		
		fn ExportSelectionTo suffix =
		(
			try( 
			local sel = (selection as array)
			if sel.count < 1 then return false
			)catch(return false) 
			
			clearselection() 
			
			for i = 1 to sel.count do (
			select sel[i]
			local n = (sel[i].name + suffix + sExtension) as string
			format "n = %\n" n 
			exportFile n #noprompt selectedOnly:true 
			)
			true		
		)
		
	ExportSelectionTo ""
	
	)
	
	on btnAPO pressed do
	(
--Affect Pivot Only, this was barrowed from Grant Adams "pivotModeToggle"
			(
			   case maxops.pivotmode of
			   (
				#none: maxops.pivotmode = #pivotonly
				#pivotonly: maxops.pivotmode = #none
			   )
			)

	)
)CreateDialog ExportPrep
)

