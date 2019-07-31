Class {
	#name : #FileLibraryLibMock,
	#superclass : #WAFileLibrary,
	#classInstVars : [
		'fileSystem'
	],
	#category : #'FileLibraryHelper-Tests'
}

{ #category : #accessing }
FileLibraryLibMock class >> filesDirectory [
	^ FileLibraryGitBridge root / 'testResource'
]
