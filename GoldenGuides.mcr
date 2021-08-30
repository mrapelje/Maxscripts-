macroScript MattRapelje_GoldenGuides category:"Matt Rapelje Tools" tooltip:"Golden Guides" buttonText: "GG"
(
-- Golden Guides
-- For Max 9, 08, may or may not work in earlier versions
-- Made by Matt Rapelje
-- contact at mrapelje@hotmail.com on the web at www.polyleaf.com
	--Notes:
		-- 1.61803399  <-- long more accurate, 1.618 <-- short, how typically described and what is used for this script.
		-- Spiral quadrants limited to 30 or 7.5 360 degree turns do to math precision issues.

	rollout GoldenRollout "Golden Guides" width:459 height:291
	(
		GroupBox grp16 "" pos:[6,138] width:446 height:76
		GroupBox grp17 "" pos:[7,66] width:446 height:76
		GroupBox grp18 "" pos:[7,-1] width:446 height:70
		GroupBox grp2 "" pos:[116,211] width:122 height:72
		GroupBox grp1 "" pos:[6,211] width:108 height:72
		GroupBox grp5 "" pos:[240,211] width:100 height:72
		GroupBox grp7 "" pos:[343,211] width:109 height:72
		button btnCreateRuler "Create Ruler" pos:[11,11] width:90 height:25
		button btnCreateRec "Create Rectangle" pos:[10,81] width:90 height:25
		button btnCreatSpiral "Create Spiral" pos:[9,150] width:90 height:25
		button btnScaleUp "Scale Selected Up" pos:[9,221] width:102 height:25
		button btnScaleDown "Scale Selected Down" pos:[117,221] width:117 height:25
		button btnCloneScaleUp "Clone Scale Up" pos:[243,221] width:94 height:25
		button btnCloneScaleDown "Clone Scale Down" pos:[348,221] width:99 height:25
		button btnAbout "About" pos:[388,11] width:58 height:25
		spinner spnRuler_TotalL "Total Length " pos:[57,49] width:80 height:16 enabled:true range:[0,1000,26.18] type:#float
		spinner spn_RulerLG "Long Length " pos:[186,49] width:80 height:16 enabled:true range:[0,1000,16.18] type:#float
		spinner spn_RulerSm "Short Length " pos:[325,49] width:80 height:16 enabled:true range:[0,1000,10] type:#float
		spinner spnRecLength "Length " pos:[35,119] width:80 height:16 enabled:true range:[0,1000,10] type:#float
		spinner spnRecWidth "Width " pos:[143,119] width:80 height:16 enabled:true range:[0,1000,16.18] type:#float
		spinner spnRecHypt "Hypotenuse " pos:[273,119] width:80 height:16 enabled:true range:[0,1000,19.0208] type:#float
		spinner spnSpQ "1/4 Turns" pos:[55,189] width:44 height:16 enabled:true range:[1,30,5] type:#integer
		spinner spnSpLg "Length " pos:[131,189] width:80 height:16 enabled:true range:[0,1000,10] type:#float
		spinner spnSpWidth "Width " pos:[239,189] width:80 height:16 enabled:true range:[0,1000,16.18] type:#float
		spinner spnSpHypt "Hypotenuse " pos:[369,189] width:80 height:16 enabled:true range:[0,1000,19.0208] type:#float
		radiobuttons rdoRuler "Ruler Base Dimension" pos:[111,13] width:167 height:30 labels:#("Total", "Long", "Short") default:1 columns:3
		radiobuttons rdoRec "Rectangle Base Dimension" pos:[111,83] width:227 height:30 labels:#("Length", "Width", "Hypotenuse") default:1 columns:3
		radiobuttons rdoSq "Spiral Base Dimension" pos:[104,149] width:227 height:30 labels:#("Length   ", "Width    ", "Hypotenuse") default:1 columns:3
		button btnSSUX "Just X" pos:[10,253] width:40 height:25
		button btnSSUY "Y" pos:[56,253] width:24 height:25
		button btnSSUZ "Z" pos:[86,253] width:24 height:25
		button btnSSDX "Just X" pos:[124,253] width:40 height:25
		button btnSSDY "Y" pos:[172,253] width:24 height:25
		button btnSSDZ "Z" pos:[204,253] width:24 height:25
		button btnCSUX "Just X" pos:[246,253] width:36 height:25
		button btnCSUY "Y" pos:[287,253] width:22 height:25
		button btnCSUZ "Z" pos:[314,253] width:22 height:25
		button btnCSDX "Just X" pos:[352,253] width:36 height:25
		button btnCSDY "Y" pos:[393,253] width:22 height:25
		button btnCSDZ "Z" pos:[420,253] width:22 height:25
-- Golden Guides --
	-- Golder Ruler --
		on btnCreateRuler pressed do
		(
			Undo on
			(
			GrVal = 10*1.618
			GrVals = 10
			GrValt = 26.18
			GrulerLg = SplineShape pos:[0,0,0]
			addnewspline GrulerLg
			addKnot GrulerLg 1 #corner #line [0,0,0]
			addKnot GrulerLg 1 #corner #line [GrVal,0,0]
			updateShape GrulerLg
			GrulerLg.wirecolor = Orange
			GrulerLg.name = "GoldenRuler"
			)
			(
			GrulerDiv = SplineShape pos:[0,0,0]
			addnewspline GrulerDiv
			addKnot GrulerDiv 1 #corner #line [GrVal,0.375,0]
			addKnot GrulerDiv 1 #corner #line [GrVal,-0.375,0]
			updateShape GrulerDiv
			GrulerDiv.wirecolor = Blue
			)
			(
			GrulerSm = SplineShape pos:[GrVal,0,0]
			addnewspline GrulerSm
			addKnot GrulerSm 1 #corner #line [GrVal,0,0]
			addKnot GrulerSm 1 #corner #line [GrVal+10,0,0]
			updateShape GrulerSm
			GrulerSm.wirecolor = Green
			)
			(
			addAndWeld GrulerLg GrulerDiv 0
			addAndWeld GrulerLg GrulerSm 0
			TotalScaleFactor = spnRuler_TotalL.value/GrValt
			LgScaleFactor = spn_RulerLg.value/GrVal
			SmScaleFactor = spn_RulerSm.value/GrVals
				case rdoRuler.state of
				(
				  1: scale GrulerLg [TotalScaleFactor,TotalScaleFactor,TotalScaleFactor]
				  2: scale GrulerLg [LgScaleFactor,LgScaleFactor,LgScaleFactor]
				  3: scale GrulerLg [SmScaleFactor,SmScaleFactor,SmScaleFactor]
				)
			ResetXForm GrulerLg
			convertToSplineShape GrulerLg
			select GrulerLG
			)
		)
	-- Golder Ruler End --
	-- Golder Rectangle --
		on btnCreateRec pressed do
		(
			Undo on
		(
		GcVal = 10*1.618
		GcValH = GcVal/2
		GcValL = 10
		GCValHypt = 19.0208
		Grectangle = Rectangle length:10 width:GCVal cornerRadius:0 pos:[0,0,0] isSelected:on
		Grectangle.pivot = [-GcValH,-5,0]
		Grectangle.pos = [0,0,0]
		convertToSplineShape Grectangle
		Grectangle.wirecolor = Orange
		Grectangle.name = "GoldenRectangle"
			RecLengthScaleFactor = spnRecLength.value/GcValL
			RecWidthScaleFactor = spnRecWidth.value/GcVal
			RecHypScaleFactor = spnRecHypt.value/GCValHypt
				case rdoRec.state of
				(
				  1: scale Grectangle [RecLengthScaleFactor,RecLengthScaleFactor,RecLengthScaleFactor]
				  2: scale Grectangle [RecWidthScaleFactor,RecWidthScaleFactor,RecWidthScaleFactor]
				  3: scale Grectangle [RecHypScaleFactor,RecHypScaleFactor,RecHypScaleFactor]
				)
		ResetXForm Grectangle
		convertToSplineShape Grectangle
		)
		)
		-- Golden Rectangle End --
		-- Golden Spiral --
		on btnCreatSpiral pressed do
		(
			Undo on
			(
				(
				ArcA = Arc radius:(1.618) from:270 to:0 pie:off reverse:on pos:[0,0,0] isSelected:on wirecolor:Orange name:"ArcA"
				macros.run "Modifier Stack" "Convert_to_Spline"
					
					SpAEndKnot = numKnots ArcA
					SpAEndPos = getKnotPoint ArcA 1 SpAEndKnot
					SpAPivotPoint  = SpAEndPos
					ArcA.pivot = SpAEndPos
				ArcAn = eulerangles 0 0 0
				rotate ArcA ArcAn
					ArcAPos = [0,0,0]
					ArcA.pos = ArcAPos
				resetxform ArcA
					ArcA.name = "ArcA"
					macros.run "Modifier Stack" "Convert_to_Spline"
				)
							For I = 1 to spnSpQ.value-1 do
					(
					ArcB = Arc radius:(1.618) from:270 to:0 pie:off reverse:off pos:[0,0,0] isSelected:on wirecolor:red name:"ArcB"
					macros.run "Modifier Stack" "Convert_to_Spline"
						
						SpBEndKnot = numKnots ArcB
						SpBEndPos = getKnotPoint ArcB 1 SpBEndKnot
						SpBPivotPoint = SpBEndPos
						ArcB.pivot = SpBPivotPoint
						

					AngleSet = i*(-90)
					ArcAn = eulerangles 0 0 AngleSet
					rotate ArcB ArcAn
					scale ArcB [1.618^i,1.618^i,1.618^i]
					--
					--
					SpEndKnot = numKnots ArcA 
					SpEndPos = getKnotPoint ArcA 1 SpEndKnot 
					ArcB.pos = SpEndPos  
					addAndWeld ArcA ArcB 0.1  
						
					SpFinalPivot = getKnotPoint ArcA 1 1
					ArcA.pivot = SpFinalPivot

					SpFinalPos = [0,0,0]
					ArcA.pos = SpFinalPos
					)	

							(
								-- Scale Spiral Code --
													DisCurrentX = abs ArcA.min.x + abs ArcA.max.x
													DesiredDisX = spnSpLg.value  
													ArcAScaleFactorX = DesiredDisX/ DisCurrentX
								
													DisCurrentY = abs ArcA.min.y + abs ArcA.max.y
													DesiredDisY = spnSpWidth.value  
													ArcAScaleFactorY = DesiredDisY/ DisCurrentY
								
													DisCurrentH = sqrt((DisCurrentX^2)+(DisCurrentY^2))
													DesiredDisH = spnSpHypt.value  
													ArcAScaleFactorH = DesiredDisH/ DisCurrentH
								
								case rdoSq.state of
											(
											  1: scale ArcA [ArcAScaleFactorX,ArcAScaleFactorX,ArcAScaleFactorX]
											  2: scale ArcA [ArcAScaleFactorY,ArcAScaleFactorY,ArcAScaleFactorY]
											  3: scale ArcA [ArcAScaleFactorH,ArcAScaleFactorH,ArcAScaleFactorH]
											)
							)
						(
						Select ArcA
						resetxform ArcA
						macros.run "Modifier Stack" "Convert_to_Spline"
						ArcA.name = "GolderSpiral"
						)
		)
	)
		-- Golden Spiral End --
		-- Scaling  Btns -- 
	on btnScaleUp pressed do
		(
			Undo on
			if selection.count	>= 1 do
				(
					scale $ [1.618,1.618,1.618]
				)
		)
	on btnScaleDown pressed do
		(
			Undo on
			if selection.count	>= 1 do
				(
				scale $ [0.618,0.618,0.618]
				)
		)
	on btnCloneScaleUp pressed do
		(
			Undo on
			if selection.count	>= 1 do
				(
				maxOps.cloneNodes $ cloneType:#instance newNodes:&nnl
				scale $ [1.618,1.618,1.618]
				)
		)
	on btnCloneScaleDown pressed do
		(
			Undo on
			if selection.count	>= 1 do
				(
				maxOps.cloneNodes $ cloneType:#instance newNodes:&nnl
				scale $ [0.618,0.618,0.618]
				)
		)
	on btnSSUX pressed do
		(
			Undo on
			if selection.count	>= 1 do
				(
				scale $ [1.618,1.0,1.0]
				)
		)
	on btnSSUY pressed do
		(
			Undo on
			if selection.count	>= 1 do
				(
				scale $ [1.0,1.618,1.0]
				)
		)
	on btnSSUZ pressed do
		(
			Undo on
			if selection.count	>= 1 do
				(
				scale $ [1.0,1.0,1.618]
				)
		)
	on btnSSDX pressed do
		(
			Undo on
			if selection.count	>= 1 do
			(
			scale $ [0.618,1.0,1.0]
			)
		)
	on btnSSDY pressed do
		(
			Undo on
			if selection.count	>= 1 do
				(
				scale $ [1.0,0.618,1.0]
				)
		)
	on btnSSDZ pressed do
		(
			Undo on
			if selection.count	>= 1 do
				(
				scale $ [1.0,1.0,0.618]
				)
		)
	on btnCSUX pressed do
		(
			Undo on
			if selection.count	>= 1 do
				(
				maxOps.cloneNodes $ cloneType:#instance newNodes:&nnl
				scale $ [1.618,1.0,1.0]
				)
		)
	on btnCSUY pressed do
		(
			Undo on
			if selection.count	>= 1 do
				(
				maxOps.cloneNodes $ cloneType:#instance newNodes:&nnl
				scale $ [1.0,1.618,1.0]
				)
		)
	on btnCSUZ pressed do
		(
			Undo on
			if selection.count	>= 1 do
				(
				maxOps.cloneNodes $ cloneType:#instance newNodes:&nnl
				scale $ [1.0,1.0,1.618]
				)
		)
	on btnCSDX pressed do
		(
			Undo on
			if selection.count	>= 1 do
				(
				maxOps.cloneNodes $ cloneType:#instance newNodes:&nnl
				scale $ [0.618,1.0,1.0]
				)
		)
	on btnCSDY pressed do
		(
			Undo on
			if selection.count	>= 1 do
				(
				maxOps.cloneNodes $ cloneType:#instance newNodes:&nnl
				scale $ [1.0,0.618,1.0]
				)
		)
	on btnCSDZ pressed do
		(
			Undo on
			if selection.count	>= 1 do
				(
				maxOps.cloneNodes $ cloneType:#instance newNodes:&nnl
				scale $ [1.0,1.0,0.618]
				)
		)
	on btnAbout pressed do
			(
			messageBox "Created by Matt Rapelje, www.polyleaf.com, matt@polyleaf.com"
			)
	)
	CreateDialog GoldenRollout
	)


