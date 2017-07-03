*FileLibraryHelper
importFiles
	<script>
	(FileSystem workingDirectory / self resourcesFolderName) directories
		do: [ :directory | 
			directory files
				do: [ :file | 
					self addFileAt: self resourcesFolderName , '/' , directory basename , '/' , file basename.
					self methods detect: [ :m | m selector = (self default asSelector: file basename) ] ifFound: [ :m | m protocol: directory basename ] ]
				displayingProgress: [ :file | 'Importing: ' , file basename ]
				every: 200 ]
		displayingProgress: [ :dir | 'Importing files from: ' , dir basename ]
		every: 200