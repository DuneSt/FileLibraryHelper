Extension { #name : #WAAbstractFileLibrary }

{ #category : #'*FileLibraryHelper' }
WAAbstractFileLibrary class >> addFileLibraryHelperMethods [
	#(#deployFiles #importFiles #openImportButton)
		do: [ :each | 
			self class
				compile:
					(String
						streamContents: [ :stream | 
							stream
								<< each;
								cr;
								tab;
								<< '<script>';
								cr;
								tab;
								<< 'super ';
								<< each ])
				classified: 'fileLibraryHelper' ]
]

{ #category : #'*FileLibraryHelper' }
WAAbstractFileLibrary class >> importFiles [
	^ self subclassResponsibility
]

{ #category : #'*FileLibraryHelper' }
WAAbstractFileLibrary class >> openImportButton [
	<script>
	SimpleButtonMorph new
		color: Smalltalk ui theme buttonColor;
		label: 'Import';
		target: self;
		actionSelector: #importFiles;
		extent: 100 @ 25;
		position: 800 @ 0;
		openInWorld
]

{ #category : #'*FileLibraryHelper' }
WAAbstractFileLibrary class >> resourcesFolderName [
	^ self printString
]
