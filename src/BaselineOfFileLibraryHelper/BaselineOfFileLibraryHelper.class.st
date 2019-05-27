"
I am the baseline of the FileLibraryHelper project. 
To know more: https://github.com/jecisc/FileLibraryHelper
"
Class {
	#name : #BaselineOfFileLibraryHelper,
	#superclass : #BaselineOf,
	#category : 'BaselineOfFileLibraryHelper'
}

{ #category : #baseline }
BaselineOfFileLibraryHelper >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self seaside3: spec.
			spec package: 'FileLibraryHelper' with: [ spec requires: #('Seaside3') ] ].

	spec
		for: #(#'pharo4.x' #'pharo5.x' #'pharo6.x' #'pharo7.x')
		do: [ spec
				package: 'FileLibraryHelper' with: [ spec requires: #('FileLibraryHelper-Pharo8') ];
				package: 'FileLibraryHelper-Pharo8' ]
]

{ #category : #dependencies }
BaselineOfFileLibraryHelper >> seaside3: spec [
	spec
		baseline: 'Seaside3'
		with: [ spec
				loads: #('Core');
				repository: 'github://SeasideSt/Seaside:v3.3.x/repository' ]
]
