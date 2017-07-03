initialization
initialize
	"See: https://github.com/SeasideSt/Seaside/issues/927"

	WAAbstractFileLibrary mimetypes
		at: 'sass' ifAbsentPut: 'text/x-sass';
		at: 'scss' ifAbsentPut: 'text/x-scss'