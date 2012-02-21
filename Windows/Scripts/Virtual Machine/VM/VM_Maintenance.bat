net stop mssqlserver

:: Run the DiskCleanup utility...
cleanmgr.exe /d c:
cleanmgr.exe /d h:

:: Run disk defrag...
:: http://technet.microsoft.com/en-us/magazine/ff458356.aspx
defrag c: /H /U /V
defrag c: /H /X /U /V
defrag h: /H /U /V
defrag h: /H /X /U /V

cd "c:\program files (x86)\sysinternals suite"

:: Run SDelete (1.6) to zero-out free space...
sdelete -p 1 -z c:\
sdelete -p 1 -z h:\

net start mssqlserver

iisreset

pause