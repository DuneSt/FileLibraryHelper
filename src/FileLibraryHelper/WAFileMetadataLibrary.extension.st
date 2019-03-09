Extension { #name : #WAFileMetadataLibrary }

{ #category : #'*FileLibraryHelper' }
WAFileMetadataLibrary class >> importFiles [
	EpMonitor disableDuring: [ self recursivelyAddAllFilesIn: self resourcesFolderName ]
]
