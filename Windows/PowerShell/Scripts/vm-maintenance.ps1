Stop-Service MSSQLSERVER -Force

Clean-Disk

# Adding a wait because Clean-Disk is a non-shell app and will execute asynchronously without...
$pause = Read-Host "Press any key to continue..."

Defrag-All-Drives

SDelete-Zero-FreeSpace "C:\"
SDelete-Zero-FreeSpace "H:\"

Start-Service MSSQLSERVER

iisreset