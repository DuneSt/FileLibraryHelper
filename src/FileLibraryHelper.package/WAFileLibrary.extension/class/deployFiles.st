*FileLibraryHelper
deployFiles
	<script>
	| resourceFolder |
	resourceFolder := FileSystem workingDirectory / self resourcesFolderName.
	[ resourceFolder ensureDelete ]
		on: PrimitiveFailed
		do: [ "On windows this can happen :(" ].
	resourceFolder ensureCreateDirectory.
	(self methods groupedBy: #protocol)
		keysAndValuesDo: [ :protocol :methods | 
			protocol ~= #accessing
				ifTrue: [ self export: methods inFolder: resourceFolder / protocol ] ]