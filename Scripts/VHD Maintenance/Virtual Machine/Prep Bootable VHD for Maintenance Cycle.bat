:: Run the DiskCleanup utility...
cleanmgr.exe /d c:

:: Run disk defrag...
defrag c: /H /U /V
defrag c: /H /X /U /V

cd "c:\program files (x86)\sysinternals suite"

:: Run SDelete to zero-out free space...
sdelete.exe -p 1 -c c:

pause