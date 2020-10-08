rollout ui  "Morpher Conversion Tool" (
	group "Select Objects" (
		pickbutton input  "Input Object" width:180 autoDisplay:true
		pickbutton ref "Reference Object" width:180 autoDisplay:true
	)
		button start "Convert Morphs" width: 180
	on start pressed do (
		i=1
		objArray = #()
		while WM3_MC_HasData ref.object.morpher i do (
			out = copy input.object
			out.name = WM3_MC_GetName ref.object.morpher i
			WM3_MC_SetValue ref.object.morpher i 100.0
			maxOps.CollapseNode out true
			WM3_MC_SetValue ref.object.morpher i 0.0
			append objArray out
			i += 1
		)
		group objArray name:"output"
		numConverted = (i-1)
		format "processed % objects" numConverted
	)
)
createDialog ui width:200
