*FileLibraryHelper
export: methods inFolder: subFolder
	subFolder ensureCreateDirectory.
	methods
		do: [ :each | 
			(subFolder / (self default asFilename: each selector))
				ensureDelete;
				ensureCreateFile.
			GRPlatform current write: (self default perform: each selector) toFile: (self default asFilename: each selector) inFolder: subFolder pathString ]
		displayingProgress: [ :each | 'Deploying file : ' , each selector ]
		every: 200