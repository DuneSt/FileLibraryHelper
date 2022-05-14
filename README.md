# FileLibraryHelper

A little project to help to manage Seaside's FileLibrary when we need to edit files outside Pharo.

## Version management 

This project uses semantic versioning to define the releases. This mean that each stable release of the project will get associate a version number of the form `vX.Y.Z`. 

- **X** define the major version number
- **Y** define the minor version number 
- **Z** define the patch version number

When a release contains only bug fixes, the patch number increase. When the release contains new features backward compatibles, the minor version increase. When the release contains breaking changes, the major version increase. 

Thus, it should be safe to depend on a fixed major version and moving minor version of this project.

## Install FileLibraryHelper

To install the project on your Pharo image you can just execute the following script: 

```Smalltalk
    Metacello new
    	githubUser: 'DuneSt' project: 'FileLibraryHelper' commitish: 'v1.x.x' path: 'src';
    	baseline: 'FileLibraryHelper';
    	onWarningLog;
    	load
```

To add the project to your baseline just add this:

```Smalltalk
    spec
    	baseline: 'FileLibraryHelper'
    	with: [ spec repository: 'github://DuneSt/FileLibraryHelper:v1.x.x/src' ]
```

## Getting started

The goal of the project is to allow to export and import easilly the contents of the FileLibrary on the disc. This project extends the `WAFileLibrary` with some methods to help in that direction.

To starting to use `FileLibraryHelper` is simple. It can be done in two steps:
- (Optional) Implements `#resourceFolderName` in the class side of your library. The files will be exported in a folder of this name. If it is not overriden, the folder will take the name of the FileLibrary.
- Execute: `MyFileLibrary addFileLibraryHelperMethods`. This will compile methods with script pragma in the class side of the FileLibrary to launch some scripts.

Current features:
- `#deployFiles` : Deploy all the methods of the FileLibrary into files except the ones in the `#accessing` protocol. Each file will be in a folder corresponding to his protocol. Thus you can categorize the files in protocols as 'css', 'javascript', 'sass'...
- `#importFiles` : Reimport  all the files.
- `#openImportButton` : When you need to import multiple times, for example when you use the watch command of SASS, it is easier to just clic on a button into Pharo. This method is here for you!
- `#filesDirectory` : Override this class method if you use a shared directory (like a git repo) between images.

## Future Ideas

In the future I would like to get a group with OSSubProcess in order to execute scripts directly from Pharo.

## Smalltalk versions compatibility

| MDL version 	| Compatible Pharo versions 	|
|-------------	|---------------------------	|
| 0.0.1       	| Pharo 50, 60, 61, 70				|
| 1.x.x       	| Pharo 61, 70, 80, 90, 10        		|

