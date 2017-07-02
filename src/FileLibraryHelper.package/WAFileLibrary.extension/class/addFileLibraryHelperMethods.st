*FileLibraryHelper
addFileLibraryHelperMethods
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