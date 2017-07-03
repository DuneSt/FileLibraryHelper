*FileLibraryHelper
deployFiles
	<script>
	| resourceFolder |
	resourceFolder := FileSystem workingDirectory / self resourcesFolderName.
	[ resourceFolder ensureDelete ]
		on: PrimitiveFailed
		do: [ "On windows this can happen :(" ].
	resourceFolder ensureCreateDirectory.
	(self methods groupedBy: #protocol) associations
		do: [ :association | 
			association key ~= #accessing
				ifTrue: [ self export: association value inFolder: resourceFolder / association key ] ]
		displayingProgress: [ :each | 'Deploying protocol : ' , each key ]
		every: 200