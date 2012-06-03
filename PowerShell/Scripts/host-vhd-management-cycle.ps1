Get-Date

# Move backups from prior maintenance cycle to the ..\old directory...
rm "d:\vhd backups\old\*.7z"
mv "d:\vhd backups\*.7z" "d:\vhd backups\old"

$scriptPath = Join-Path $sysGitHub "PowerShell\Scripts\host-comapt-merge-disks.txt"
diskpart /s $scriptPath

Get-Date

Seven-Zip "v:\native\developer\2008r2_developer.vhd" "d:\vhd backups\2008R2_Developer.7z"
Seven-Zip "v:\native\developer\2008r2_data.vhd" "d:\vhd backups\2008R2_Data.7z" 

Get-Date
