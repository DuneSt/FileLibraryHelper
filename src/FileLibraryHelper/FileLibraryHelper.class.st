"
I am a simple class to add some mime types to the FileLibraries.
"
Class {
	#name : #FileLibraryHelper,
	#superclass : #Object,
	#category : 'FileLibraryHelper'
}

{ #category : #initialization }
FileLibraryHelper class >> initialize [
	"See: https://github.com/SeasideSt/Seaside/issues/927"

	WAAbstractFileLibrary mimetypes
		at: 'sass' ifAbsentPut: 'text/x-sass';
		at: 'scss' ifAbsentPut: 'text/x-scss'
]
