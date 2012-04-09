# Configures Git global configuration settings... 
Function Setup-Git([string]$username, [string]$email)
{
	$pathEnvVariable 	= [Environment]::GetEnvironmentVariable("Path")
	$diffmergePath 		= ";C:\Program Files\SourceGear\Common\DiffMerge"

	# Add DiffMerge to the EnvironmentVariable:Path if it's not already there. 
	# It is required to launch DiffMerge from the git commands.
	if (!($pathEnvVariable -contains $diffmergePath))
	{  
		$pathEnvVariable += $diffmergePath
		[Environment]::SetEnvironmentVariable("Path", $env:path, "Machine")
	}

	git config --global user.name $username
	git config --global user.email $email

	git config --global diff.tool diffmerge
	git config --global difftool.diffmerge.cmd 'sgdm "$LOCAL" "$REMOTE"'

	git config --global merge.tool diffmerge
	git config --global mergetool.diffmerge.cmd 'sgdm "$LOCAL" "$BASE" "$REMOTE" --result="$MERGED" --title1="Local" --title2="Merge" --title3="Remote"'
	git config --global mergetool.keepBackup false

	git config --global color.ui true
}