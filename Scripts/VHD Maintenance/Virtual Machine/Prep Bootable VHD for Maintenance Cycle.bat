:: Run the DiskCleanup utility...
cleanmgr.exe /d c:

:: Run disk defrag...
:: http://technet.microsoft.com/en-us/magazine/ff458356.aspx
defrag c: /H /U /V
defrag c: /H /X /U /V

cd "c:\program files (x86)\sysinternals suite"

:: Run SDelete to zero-out free space...
sdelete.exe -p 1 -z c:\

pause