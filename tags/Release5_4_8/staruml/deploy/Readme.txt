-------------------------------------------------------------------------------
                              StarUML(TM) 5.0 Beta2
                                 RELEASE NOTES
                                      2005. 11
--------------------------------------------------------------------------------

This document contains the latest information and other additional information 
which is not presented in the document of StarUML(TM). We recommend you to 
read this content. 
For more information, please visit http://www.staruml.com or
http://staruml.tigris.org

--------------------------------------------------------------------------------
Table of Contents

1. System Requirements
2. Before Installation (Important)
3. Change Log (From StarUML Beta1)
4. Change Log (StarUML 5.0 Beta with Core Modules)
--------------------------------------------------------------------------------

1. System Requirements
=======================

  * Intel(R) Pentium(R) 233MHz or higher 
  * Windows(R) 2000, Windows XP(TM) or higher 
  * Microsoft(R) Internet Explorer 5.0 or higher 
  * Microsoft(R) Office XP(TM) or higher (recommended)
  * 128 MB RAM (256MB recommended) 
  * 110 MB hard disc space (150MB free space recommended) 
  * CD-ROM drive 
  * SVGA or higher resolution monitor (1024x768 recommended) 
  * Mouse or other pointing device 

2. Before Installation (Important)
==================================

  * Check whether any of the following previous versions of Plastic Software 
    products are installed on the system.
    - PLASTIC 2.0
    - PLASTIC 3.0
    - PLASTIC 3.0+
    - PLASTIC EXPRESS
    It is recommended to uninstall any of the above programs.

  * Check whether any of the following previous versions of Plastic Software 
    products are installed on the system.
    - PLASTIC 2003 Personal
    - PLASTIC 2003 Standard
    - PLASTIC 2005 Trial
    - PLASTIC 2005 Personal
    - PLASTIC 2005 Standard
    These programs must be uninstalled before installing StarUML(TM).

  * If you are using StarUML(TM) 5.0 Beta1, please uninstall it.

  * Microsoft(R) Internet Explorer 5.0 or above is required (Start Internet 
    Explorer and select the Help -> About Internet Explorer menu to check the 
    product version). If the version is lower than 5.0, some software functions 
    may not work properly.

3. Change Log (From StarUML Beta1)
==================================

3.1. New Feature
------------------
 - Shows the name of contributors as initial name of element when creating 
   elements. (Issue #17)

3.2. Changes
------------------
 - Changed item list of "Show stereotype" option in Environment.opt file. 
   (Issue #12)
 - Changed the namespace on xmlns of <XPD:PROJECT> element of StarUML model file
   (.UML) from "www.plasticsoftware.com" to "www.staruml.com". (Issue #19)
 - Modified to show read only state icon on element node of model explorer.
   (Issue #20)
 - Modified Stereotype applied element to show icon of the stereotype in model 
   explorer. (Issue #30)

3.3. Bug Fixes
------------------
 - Fixed the bug that icons of message has been invisible in the message. 
   (Issue #4)
 - Fixed the bug that an "Access violation" error occures when rename activity 
   diagram after copying of ActivityGraph. (Issue #10)
 - Fixed the bug that sub menu of the [Views] menu did't represent window states
   exactly. (Issue #16)
 - Modified to show english from Font dialog in Korean.(Issue #26)

* Issue number(Issue #) means registering number of the issue in the StarUML 
  issue tracker(http://staruml.tigris.com).

4. Change Log (StarUML 5.0 Beta with Core Modules)
====================================================

4.1 New Features
------------------
 - Supports UML 2.0.
 - Geneates MS Word/Excel/Powerpoint documents and code from model. 
   (Generator Module)
 - Pallette extension (Configuring Add Menu, Notation, and Tool Button Icon).
 - Notation extension (User defined Notation, ex. ER Diagram Notation).
 - Registers and Load Extension Modules Automatically (AddIn, Profile, 
   Framework, Option, and Approach)
 - Supports Short Creation Textual Syntax in QuickDialog.
 - Supports Decoration View.
 - General Shape Added (Rectangle, Rounded Rect, Ellipse).
 - SignalAccept/SignalSend notation added.
 - Displays Raised Signal at Operation.
 - Displays UMLAttributeLink.
 - Supports Classifier Name WordWrap.
 - Includes Model Fragment in Approach.
 - Moves Selection and Resizes View using Arrow Keys.
 - Supports Docking UI Panes.
 - Copies Diagram to Bitmap Image.

4.2 Bug Fixes and Changes
---------------------------
 - Changes Project Name (Plastic -> StarUML).
 - Supports Real Number Style in European OS. (ex. 0.01 -> 0,001).
 - Sets Stereotype to Model in Approach.
 - Applies Classifer Element's Stereotype to its Object Element automatically.
 - Fixes error when reading unit or project file including Multilanguage unit 
   file.
 - Pops up Suggestions Hint while typing in QuickDialog.
 - Changes Layout Direction for StateChart/Activity Diagram(from Top to Bottom).
 - Displays Message name without parentheses in Sequence Diagram.
 - Shows Instance of Classifier in TreeView.
 - Shows Usecase in Iconic Style.
 - ObjectFlowState View Added.
 - Shows SlotCompartment View for Object Elemement.
 - Shows ExtensionPoint Compartment for Usecase Element.
 - Removes "Import Unit" Menu.
 - Removes UML Adivisor and Embedded WebBrower from UI.
 - Moves Diagram Tab to Popup Menu.
