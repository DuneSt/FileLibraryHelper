Class {
	#name : #FileLibraryHelperTest,
	#superclass : #TestCase,
	#category : #'FileLibraryHelper-Tests'
}

{ #category : #tests }
FileLibraryHelperTest >> setUp [
	FileLibraryLibMock fileSystem: FileSystem memory 
]

{ #category : #tests }
FileLibraryHelperTest >> tearDown [ 
	FileLibraryLibMock fileSystem: nil
]

{ #category : #tests }
FileLibraryHelperTest >> testImportingJsFile [
	FileLibraryLibMock importFiles.
	self
		assert: (FileLibraryLibMock new perform: #topicJs)
		equals: 'console.log("The Good Place is a serie about hell")'
]
