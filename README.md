**GDI Shrink and Rename Tool** is a powershell script (2 acctualy) to help you rename your GDI Dumps to maximaze compatibility with GDEMU software.
The Shrink feature is optional, as you can have problems with 'shrinked' images using GDEMU, that why there separated.
**use shrink if you need to save space on your SDCard, but keep in mind that not all images will work**.


## Download
* Just clone the git or download ZIP.

## Usage and Requirements
* You will need python 2.X (2.7 is currently the latest release) propertly installed on your system
* Place all the GDIs that you want to rename and/or compress inside the same folder of the script. Each gdi inside its own folder;
* The script "1 - rename-files.ps1" will search in subfolders for any .gdi file, readit and rename tracks to "track01, track02, track03", create a file called disc.gdi and rename the original gdi to .back.
* The script "2 - compress-all.ps1" will search in subfolders for any .gdi file, compress it using the python script "gdishrink" and if the gdi isnt called "disc.gdi" will rename-it. Also will create a txt file inside each folder with the information about the compress process.

The script is self-understantable, and you are free to mod and contribute as you wish.

## Contributors

### Contributors on GitHub
* Just me, for now.

### Third party libraries
* gditools by famillyguy and sizious (https://sourceforge.net/projects/dcisotools/)

## License 
* MIT. See [LICENSE](https://github.com/username/sw-name/blob/master/LICENSE.md) file

## Version 
* Version 0.1
