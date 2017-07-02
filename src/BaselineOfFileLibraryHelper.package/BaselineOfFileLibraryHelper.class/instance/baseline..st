baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ self seaside3: spec.
			spec package: 'FileLibraryHelper' with: [ spec requires: #('Seaside3') ] ]