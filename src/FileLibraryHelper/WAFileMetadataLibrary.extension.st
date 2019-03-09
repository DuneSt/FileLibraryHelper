Extension { #name : #WAFileMetadataLibrary }

{ #category : #'*FileLibraryHelper' }
WAFileMetadataLibrary class >> importFiles [
	self recursivelyAddAllFilesIn: self resourcesFolderName
]
