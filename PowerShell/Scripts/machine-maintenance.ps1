# Run this script using the following PowerShell call...
#		.\machine-maintenance.ps1 VM/Host

# define the PowerShell script parameters...
param($systemType = $(throw "$systemType parameter (VM, Host) is required."))

Clean-Disk

# Add a console-wait because Clean-Disk is a non-shell app and will execute asynchronously without this...
$pause = Read-Host "Press any key to continue after Clean-Disk finishes..."

if ($systemType.Equals("VM"))
{
	Stop-Service MSSQLSERVER -Force

	Defrag-All-Drives

	SDelete-Zero-FreeSpace "C:\"
	SDelete-Zero-FreeSpace "S:\"

	Start-Service MSSQLSERVER

	iisreset
}
else
{
	Defrag-All-Drives
}

