Class {
	#name : #FileLibraryHelperTest,
	#superclass : #TestCase,
	#category : #'FileLibraryHelper-Tests'
}

{ #category : #tests }
FileLibraryHelperTest >> tearDown [ 
	 FileLibraryLibMock methods do: #removeFromSystem
]

{ #category : #tests }
FileLibraryHelperTest >> testImportingJsFile [
	FileLibraryLibMock importFiles.
	self
		assert: (FileLibraryLibMock new perform: #TheGoodPlaceJs)
		equals: 'console.log("The Good Place is a serie about hell")
'
]
