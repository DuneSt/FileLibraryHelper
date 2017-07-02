*FileLibraryHelper
export: methods inFolder: subFolder
	subFolder ensureCreateDirectory.
	methods
		do: [ :each | 
			(subFolder / (self default asFilename: each selector))
				ensureDelete;
				ensureCreateFile;
				writeStreamDo: [ :s | s << (self default perform: each selector) ] ]