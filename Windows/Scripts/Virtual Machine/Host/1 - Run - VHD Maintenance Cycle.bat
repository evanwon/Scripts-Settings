echo %time%

:: Move backups from prior maintenance cycle to the ..\old directory...
del "d:\vhd backups\old\*.7z"
move "d:\vhd backups\*.7z" "d:\vhd backups\old"

:: Run Diskpart compact and merge tasks...
diskpart /s "C:\KB\Scripts\VHD Maintenance\Host OS\VHD Mgmt - Compact and Merge Disks.txt"

echo %time%

:: Backup the VHDs...
call:ZipFile "d:\vhd backups\Ultimatex64_Development.7z" "v:\native\developer\ultimatex64_development.vhd"
call:ZipFile "d:\vhd backups\2008R2_Developer.7z" "v:\native\developer\2008r2_developer.vhd"
call:ZipFile "d:\vhd backups\2008R2_Data.7z" "v:\native\developer\2008r2_data.vhd"

echo %time%

pause

goto:eof

::--------------------------------------------------
:: Creates a 7-Zip .7z archive.
:: Params: 	%1 = destination archive
::			%2 = source file
:: http://www.dostips.com/DtTutoFunctions.php#FunctionTutorial.CreatingAFunction
::--------------------------------------------------
:ZipFile
cd "c:\program files\7-zip"
7z a -t7z %1 %2
goto:eof
