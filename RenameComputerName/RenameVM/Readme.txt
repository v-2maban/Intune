To rename the computer, remove the commented lines from RenameComputerNamePerModel.ps1:
Rename-Computer
Shutdown
-------------
To create Win32 app, run the command (replace the source,output location path):

IntuneWinAppUtil.exe -c "E:\Intune\Source\RenameComputer" -s "E:\Intune\Source\RenameComputer\RenameComputerName.ps1" -o "E:\Intune\Output\RenameComputer"
------------------
Command line Install for Win32 app in Intune app:
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File .\RenameComputerName.ps1
