# <7-Zip Commands>
#  a: Add files to archive
#  b: Benchmark
#  d: Delete files from archive
#  e: Extract files from archive (without using directory names)
#  l: List contents of archive
#  t: Test integrity of archive
#  u: Update files to archive
#  x: eXtract files with full paths
# <Switches>
#  -ai[r[-|0]]{@listfile|!wildcard}: Include archives
#  -ax[r[-|0]]{@listfile|!wildcard}: eXclude archives
#  -bd: Disable percentage indicator
#  -i[r[-|0]]{@listfile|!wildcard}: Include filenames
#  -m{Parameters}: set compression Method
#  -o{Directory}: set Output directory
#  -p{Password}: set Password
#  -r[-|0]: Recurse subdirectories
#  -scs{UTF-8 | WIN | DOS}: set charset for list files
#  -sfx[{name}]: Create SFX archive
#  -si[{name}]: read data from stdin
#  -slt: show technical information for l (List) command
#  -so: write data to stdout
#  -ssc[-]: set sensitive case mode
#  -ssw: compress shared files
#  -t{Type}: Set type of archive
#  -v{Size}[b|k|m|g]: Create volumes
#  -u[-][p#][q#][r#][x#][y#][z#][!newArchiveName]: Update options
#  -w[{path}]: assign Work directory. Empty path means a temporary directory
#  -x[r[-|0]]]{@listfile|!wildcard}: eXclude filenames
#  -y: assume Yes on all queries

Function Seven-Zip([string]$source, [string]$destination)
{
	7z a -t7z $destination $source
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
	sdelete -p 1 -z $drive
}

# Securely and recursively wipes a file or directory location (set for 7 passes).
# $source = "D:\WipeDir", "D:\Wipe.zip"
Function SDelete-Wipe([string]$source)
{
	sdelete -p 7 -q -r $source
	rm $source -force
}

# Securely wipes all free space on a specified drive.
# $drive = "D:\"
Function SDelete-Wipe-FreeSpace([string]$drive)
{
	sdelete -p 7 -c $drive
}