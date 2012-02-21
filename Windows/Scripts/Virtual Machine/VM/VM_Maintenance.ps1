net stop mssqlserver

# Run the DiskCleanup utility...
cleanmgr.exe /d c:
Write-Host "Press any key to continue ..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# Run disk defrag...
# http://technet.microsoft.com/en-us/magazine/ff458356.aspx
defrag c: /H /U /V
defrag c: /H /X /U /V

# Run SDelete (1.6) to zero-out free space...
& "C:\Program Files (x86)\Sysinternals Suite\sdelete.exe"  -p 1 -z c:\

net start mssqlserver

iisreset

pause