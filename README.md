# FileLibraryHelper

A little project to help to manage Seaside's FileLibrary when we need to edit files outside Pharo.

# Getting started

The goal of the project is to allow to export and import easilly the contents of the FileLibrary on the disc. This project extends the `WAFileLibrary` with some methods to help in that direction.

To starting to use `FileLibraryHelper` is simple. It can be done in two steps:
- (Optional) Implements `#resourceFolderName` in the class side of your library. The files will be exported in a folder of this name. If it is not overriden, the folder will take the name of the FileLibrary.
- Execute: `MyFileLibrary addFileLibraryHelperMethods`. This will compile methods with script pragma in the class side of the FileLibrary to launch some scripts.

Current features:
- `#deployFiles` : Deploy all the methods of the FileLibrary into files except the ones in the `#accessing` protocol. Each file will be in a folder corresponding to his protocol. Thus you can categorize the files in protocols as 'css', 'javascript', 'sass'...
- `#importFiles` : Reimport  all the files.
- `#openImportButton` : When you need to import multiple times, for example when you use the watch command of SASS, it is easier to just clic on a button into Pharo. This method is here for you!

# Future Ideas

In the future I would like to get a group with OSSubProcess in order to execute scripts directly from Pharo.
