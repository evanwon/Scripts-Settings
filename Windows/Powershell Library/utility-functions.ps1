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
	& "C:\Program Files\7-Zip\7z.exe" a -t7z $destination $source
}