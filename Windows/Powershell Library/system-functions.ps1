# Run the following command on every new system prior to running this command to store the CleanMgr 
# settings in the Windows registry... The "49" arguement is arbitrary, it just defines the registry
# value allowing you to set multiple CleanMgr profiles if desired.
# http://support.microsoft.com/kb/315246
# cleanmgr /sageset:49
Function Clean-Disk()
{
	& "cleanmgr" /sagerun:49
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
	defrag '/C /M /W /U'
	defrag '/C /M /X /U'
}

Function Defrag-C-Drive()
{
	defrag C: /H /W /U
}

# -a         Remove Read-Only attribute
# -c         Clean free space
# -p passes  Specifies number of overwrite passes (default is 1)
# -q         Don't print errors (Quiet)
# -s or -r   Recurse subdirectories
# -z         Zero free space (good for virtual disk optimization)

# Zeros out free space on virtual disk drives before compaction.
# $drive = "D:\"
Function SDelete-Zero-FreeSpace([string]$drive)
{
	& "C:\Program Files (x86)\Sysinternals Suite\sdelete.exe"  -p 1 -z $drive
}

# Securely and recursively wipes a file or directory location (set for 7 passes).
# $source = "D:\WipeDir", "D:\Wipe.zip"
Function SDelete-Wipe([string]$source)
{
	& "C:\Program Files (x86)\Sysinternals Suite\sdelete.exe"  -p 7 -q -r $source
	# Make the call a second time to ensure an empty folder is wiped...
	& "C:\Program Files (x86)\Sysinternals Suite\sdelete.exe"  -p 7 -q -r $source
}

# Securely wipes all free space on a specified drive.
# $drive = "D:\"
Function SDelete-Wipe-FreeSpace([string]$drive)
{
	& "C:\Program Files (x86)\Sysinternals Suite\sdelete.exe"  -p 7 -c $drive
}