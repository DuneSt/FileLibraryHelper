*FileLibraryHelper
importFiles
	<script>
	(FileSystem workingDirectory / self resourcesFolderName) allDirectories
		do: [ :directory | 
			directory allFiles
				do: [ :file | 
					| fileName |
					fileName := self default asSelector: file basename.
					self compileText: file contents selector: fileName.
					self methods detect: [ :m | m selector = fileName ] ifFound: [ :m | m protocol: directory basename ] ] ]