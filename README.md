# WhiteStarUml

*WhiteStarUML* is a fork of *StarUML 5.0* providing a number of bug fixes and improving compatibility with modern operating systems.

## Features
* Refreshed user interface
* Fully functional handling of UNICODE strings
* Diagrams may be enhanced with antialiased drawing and images
* Java reverse engineering updated to version 1.5 (thanks to Frank Hernandez)
* ERD Profile is directly integrated and extended to generate and parse SQL tables
* Improved support for large projects - units may be loaded and unloaded on demand
* 64-bit build is available (some plugins were not ported)
* Developed and tested on Windows 7, 8 and 10

## Build
To build it you will need Delphi XE5 or later and recent versions of following components:

* [Virtual TreeView](https://github.com/Virtual-TreeView/Virtual-TreeView) — MPL 1.1 & Modified LGPL 2.1
* [JEDI library](https://github.com/project-jedi/jcl) — MPL
* [ExpressBars](https://www.devexpress.com/products/vcl/navigation/) — [Delphi/C++Builder Controls EULA](https://www.devexpress.com/Support/EULAs/vcl-controls.xml)

*Note:* if you use ExpressBars Trial version, you may got fatal error like `dxBar is not found`. The cause is unavaliable sources of `ExpressBars`. You should enable **Build with runtime packages** in Project options[[1]](https://supportcenter.devexpress.com/Ticket/Details/T103912).

## Additional links
* [WhiteStarUML](https://sourceforge.net/p/whitestaruml/code-0) on SourceForge
* Original [StarUML](https://sourceforge.net/p/staruml/code) project
* [Latest build](https://sourceforge.net/projects/whitestaruml/files/WhiteStarUMLSetup-5.9.1.exe/download) on SourceForge ([x86-64](https://sourceforge.net/projects/whitestaruml/files/Win64/WhiteStarUMLSetup-5.9.1-Win64.exe/download))
