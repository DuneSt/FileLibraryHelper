Extension { #name : #WAFileLibrary }

{ #category : #'*FileLibraryHelper' }
WAFileLibrary class >> deployFiles [
	<script>
	| resourceFolder |
	resourceFolder := FileSystem workingDirectory / self resourcesFolderName.
	[ resourceFolder ensureDeleteAll ]
		on: PrimitiveFailed
		do: [ "On windows this can happen :(" ].
	resourceFolder ensureCreateDirectory.
	(self methods groupedBy: #protocol) associations
		do: [ :association | 
			association key ~= #accessing
				ifTrue: [ self export: association value inFolder: resourceFolder / association key ] ]
		displayingProgress: [ :each | 'Deploying protocol : ' , each key ]
		every: 200
]

{ #category : #'*FileLibraryHelper' }
WAFileLibrary class >> export: methods inFolder: subFolder [
	subFolder ensureCreateDirectory.
	methods
		do: [ :each | 
			(subFolder / (self default asFilename: each selector))
				ensureDelete;
				ensureCreateFile.
			GRPlatform current write: (self default perform: each selector) toFile: (self default asFilename: each selector) inFolder: subFolder pathString ]
		displayingProgress: [ :each | 'Deploying file : ' , each selector ]
		every: 200
]

{ #category : #'*FileLibraryHelper' }
WAFileLibrary class >> importFiles [
	<script>
	self importFilesFrom: FileSystem workingDirectory
]

{ #category : #'*FileLibraryHelper' }
WAFileLibrary class >> importFilesFrom: aDirectory [
	EpMonitor
		disableDuring: [ ((aDirectory / self resourcesFolderName) directories reject: [ :each | each basename beginsWith: '.' ])
				do: [ :directory | 
					directory files
						do: [ :file | 
							self addFileAt: self resourcesFolderName , '/' , directory basename , '/' , file basename.
							self methods detect: [ :m | m selector = (self default asSelector: file basename) ] ifFound: [ :m | m protocol: directory basename ] ]
						displayingProgress: [ :file | 'Importing: ' , file basename ]
						every: 200 ]
				displayingProgress: [ :dir | 'Importing files from: ' , dir basename ]
				every: 200 ]
]
