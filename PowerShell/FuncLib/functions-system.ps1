# Configures PowerShell UI settings...
Function Setup-PowerShell-Console()
{
	$host.ui.rawui.ForegroundColor 	= "Green"
	$host.ui.rawui.BackgroundColor 	= "Black"
	$host.ui.rawui.CursorSize 		= 25

	$bufferSize = $host.ui.rawui.BufferSize
	$bufferSize.Width = 140
	$bufferSize.Height = 3000
	$host.ui.rawui.BufferSize = $bufferSize

	$windowSize = $host.ui.rawui.WindowSize
	$windowSize.Width = 140
	$windowSize.Height = 40
	$host.ui.rawui.WindowSize = $windowSize

	Clear-Host
}


# Run the following command on every new system prior to running this command to store the CleanMgr 
# settings in the Windows registry... The "49" arguement is arbitrary, it just defines the registry
# value allowing you to set multiple CleanMgr profiles if desired.
# http://support.microsoft.com/kb/315246
# cleanmgr /sageset:49
Function Clean-Disk()
{
	cleanmgr /sagerun:49
}


# defrag Command Line Parameters
# Value   Description
# /A      Perform analysis on the specified volumes.
# /C      Perform the operation on all volumes.
# /E      Perform the operation on all volumes except those specified.
# /H      Run the operation at normal priority (default is low).
# /M      Run the operation on each volume in parallel in the background.
# /T      Track an operation already in progress on the specified volume.
# /U      Print the progress of the operation on the screen.
# /V      Print verbose output containing the fragmentation statistics.
# /W 	  Performs full defragmentation. Attempts to consolidate all file fragments, regardless of their size.
# /X      Perform free space consolidation on the specified volumes.

Function Defrag-All-Drives()
{
	defrag /C /U /V
	defrag /C /U /X
}

Function Defrag-C-Drive()
{
	defrag C: /U /V
}

# Launch SSMS as a given domain user instead of a local machine account...
Function SQLServer-RunAs([string]$user = $(throw "$user parameter is required."))
{
	runas /netonly /user:$user ssms.exe
}

