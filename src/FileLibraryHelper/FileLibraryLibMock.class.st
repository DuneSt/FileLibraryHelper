Class {
	#name : #FileLibraryLibMock,
	#superclass : #WAFileLibrary,
	#classInstVars : [
		'fileSystem'
	],
	#category : #'FileLibraryHelper-Tests'
}

{ #category : #accessing }
FileLibraryLibMock class >> fileSystem [ 
	^ fileSystem
]

{ #category : #accessing }
FileLibraryLibMock class >> fileSystem: aFileSystem [
	fileSystem := aFileSystem.
	fileSystem
		ifNotNil: [ fileSystem createDirectory: 'TheGoodPlace'.
			fileSystem createDirectory: 'TheGoodPlace/resume'.
			(fileSystem / 'TheGoodPlace' / 'resume' / 'topic.js'
				writeStreamDo: [ :stream | 
					stream
						nextPutAll: 'console.log("The Good Place is a serie about hell")' ])
				close ]
]

{ #category : #accessing }
FileLibraryLibMock class >> filesDirectory [
	self halt.
	^ self fileSystem / 'TheGoodPlace'
]
