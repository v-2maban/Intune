To Rename the computername based upon specific Model, we can use use RenameComputerName.ps1 in the form of Win32 App.

RenameComputerName.ps1 is used for renaming the Computername name, while DetectComputerName.ps1 is used for detection of ComputerName.

Only RenameComputerName.ps1 is required as source.
-------------
To create Win32 app, run the command (replace the source,output location path):

IntuneWinAppUtil.exe -c "E:\Intune\Packages\Rename Computer V02\Source" -s "E:\Intune\Packages\Rename Computer V02\Source\RenameComputerName.ps1" -o "E:\Intune\Packages\Rename Computer V02\Output"
------------------
Command line Install for Win32 app in Intune app:
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File .\RenameComputerName.ps1

