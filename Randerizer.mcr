
macroScript MattRapelje_Randerizer category:"Matt Rapelje Tools" tooltip:"Randerizer" buttonText: "r-+"
(
-- Randerizer   r1.1
-- Max 7,  has not been tested on other versions but may work as all the functions are fairly simple.
-- made by Matt Rapelje
-- contact at mrapelje@hotmail..com on the web at www.polyleaf.com
-- Noise and Randomness is the spice of life.

rollout Randerizer "Randerizer" width:358 height:346
(
	GroupBox grp1 " Move " pos:[9,11] width:343 height:73
	spinner XminM "X min " pos:[34,31] width:84 height:16 range:[-100000,100000,0] type:#float
	spinner YminM "Y min " pos:[143,31] width:84 height:16 range:[-100000,100000,0] type:#float
	spinner ZminM "Z min " pos:[252,31] width:84 height:16 range:[-100000,100000,0] type:#float
	spinner XmaxM "X max " pos:[34,59] width:84 height:16 range:[-100000,100000,0] type:#float
	spinner YmaxM "Y max " pos:[143,59] width:84 height:16 range:[-100000,100000,0] type:#float
	spinner ZmaxM "Z max " pos:[252,59] width:84 height:16 range:[-100000,100000,0] type:#float
	GroupBox grp2 " Rotate " pos:[11,93] width:338 height:76
	spinner XminR "X min " pos:[34,115] width:84 height:16 range:[-360,360,0] type:#float
	spinner YminR "Y min " pos:[143,115] width:84 height:16 range:[-360,360,0] type:#float
	spinner ZminR "Z min " pos:[252,115] width:84 height:16 range:[-360,360,0] type:#float
	spinner XmaxR "X max " pos:[34,143] width:84 height:16 range:[-360,360,0] type:#float
	spinner YmaxR "Y max " pos:[143,143] width:84 height:16 range:[-360,360,0] type:#float
	spinner ZmaxR "Z max " pos:[252,143] width:84 height:16 range:[-360,360,0] type:#float
	GroupBox grp3 " Scale " pos:[11,177] width:338 height:124
	spinner XminS "X min " pos:[34,199] width:84 height:16 range:[-100000,100000,100] type:#float
	spinner YminS "Y min " pos:[143,199] width:84 height:16 range:[-100000,100000,100] type:#float
	spinner ZminS "Z min " pos:[252,199] width:84 height:16 range:[-100000,100000,100] type:#float
	spinner XmaxS "X max " pos:[34,227] width:84 height:16 range:[-100000,100000,100] type:#float
	spinner YmaxS "Y max " pos:[143,227] width:84 height:16 range:[-100000,100000,100] type:#float
	spinner ZmaxS "Z max " pos:[252,227] width:84 height:16 range:[-100000,100000,100] type:#float
	GroupBox grp4 " Uniform Scale" pos:[16,249] width:328 height:46
	spinner UScaleMin "Uniform Min " pos:[80,270] width:84 height:16 range:[-100000,100000,100] type:#float
	spinner UScaleMax "Uniform Max" pos:[230,270] width:84 height:16 range:[-100000,100000,100] type:#float
	button BtnNotesRanderizer "Notes" pos:[308,306] width:40 height:30
	button BtnApplyRanderizer "Apply Once" pos:[11,308] width:68 height:30
	spinner spnNTimes "(N)" pos:[92,312] width:58 height:16 range:[1,1000,1] type:#integer
	button BtnApplyNTimesR "Apply N Times" pos:[156,305] width:80 height:30	
	button btnResetRanderizer "Reset Btns" pos:[242,306] width:60 height:30 toolTip:"Resets values back to defaults."
	on BtnNotesRanderizer pressed do
	(
	messageBox "Created by Matt Rapelje, www.polyleaf.com, matt@polyleaf.com"
	)
	on BtnApplyRanderizer pressed do
	if selection.count > 0 then
	(
		Undo on
	(

	MR_RanderizerCol = $
	
	For i in MR_RanderizerCol do
		(
			(if not isGroupMember i then Move i (random [XminM.value, YminM.value, ZminM.value] [XmaxM.value, YmaxM.value, ZmaxM.value]))
			(if not isGroupMember i then Rotate i (eulerAngles (random XminR.value XmaxR.value) (random YminR.value YmaxR.value) (random ZminR.value ZmaxR.value)))
			(if not isGroupMember i then Scale i (random [XminS.value/100, YminS.value/100, ZminS.value/100] [XmaxS.value/100, YmaxS.value/100, ZmaxS.value/100]))
			(if not isGroupMember i then i.scale *= (random UScaleMin.value UScaleMax.value)/100)
		--- ADDED " for i in selection do  )if not isGroupMember i then )" could be problem
		)
	)
	)
		else
		(
		MessageBox "Selection Set is Empty"
		)
	on BtnApplyNTimesR pressed do
	if selection.count > 0 then
	
	(	
	Undo on	
	(
	For j = 1 to spnNTimes.value do
			(
				BtnApplyRanderizer.pressed()
			)
	)
	)
			else
			(
				MessageBox "Selection Set is Empty"
			)
	on btnResetRanderizer pressed do
		(
			XminM.value = 0
			YminM.value = 0
			ZminM.value = 0
			XmaxM.value = 0
			YmaxM.value = 0
			ZmaxM.value = 0
			XminR.value = 0
			XmaxR.value = 0
			YminR.value = 0
			YmaxR.value = 0
			ZminR.value  = 0
			ZmaxR.value = 0
			XminS.value = 100
			YminS.value = 100
			ZminS.value = 100
			XmaxS.value = 100
			YmaxS.value = 100
			ZmaxS.value = 100
			UScaleMin.value = 100
			UScaleMax.value = 100
			spnNTimes.value = 1
		)
)
CreateDialog Randerizer
)