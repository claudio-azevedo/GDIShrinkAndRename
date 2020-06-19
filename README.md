**GDI Shrink and Rename Tool** is a powershell script (2 actually) to help you rename your GDI Dumps to maximize compatibility with GDEMU hardware and GDMENU software.

The Shrink feature is optional, as you can have problems with 'shrinked' images using GDEMU, thats why is a separated script.
**use shrink if you need to save space on your SDCard, but keep in mind that not all images will work**.


## Download
* Just clone the git or download ZIP.

## Usage and Requirements
* You will need python 2.X (2.7 is currently the latest release) propertly installed on your system and in your "path";
* Place all the GDIs that you want to rename and/or compress inside the same folder of the script. Each .gdi inside its own folder with its own files;
* The script "1 - rename-files.ps1" will search in subfolders for any .gdi file, read it and rename tracks to "track01, track02, track03", create a file called disc.gdi and rename the original gdi to .back.
* The script "2 - compress-all.ps1" will search in subfolders for any .gdi file, compress it using the python script "gdishrink" and if the gdi isnt called "disc.gdi" will rename it. Also will create a txt file inside each folder with the information about the compress process.

The script is self-explanatory, and you are free to mod and contribute as you wish.

## Currently know bugs
* Folders and gdi/track files with a lot of characters like "(USA)(XX)[!][abc,abc]" will cause issues. You may want to rename those before.

## Contributors on GitHub
* Just me, for now.

## Third party libraries
* gditools by famillyguy and sizious (https://sourceforge.net/projects/dcisotools/)

## License 
* MIT. See [LICENSE](https://github.com/joseclaudioazevedo/GDIShrinkAndRename/blob/master/LICENSE) file

## Version 
* Version 0.1
