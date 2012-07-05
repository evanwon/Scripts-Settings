# Configures Git global configuration settings... 
Function Git-Setup([string]$username = "kbeckman", [string]$email = "kbeckman.c4sc@gmail.com")
{
	git config --global user.name $username
	git config --global user.email $email

	git config --global diff.tool diffmerge
	git config --global difftool.diffmerge.cmd 'sgdm "$LOCAL" "$REMOTE"'

	git config --global merge.tool diffmerge
	git config --global mergetool.diffmerge.cmd 'sgdm "$LOCAL" "$BASE" "$REMOTE" --result="$MERGED" --title1="Local" --title2="Merge" --title3="Remote"'
	git config --global mergetool.keepBackup false

	git config --global color.ui true
}

# Configures Git at a repository level... 
Function Git-Setup-Repo([string]$username = "kbeckman", [string]$email = "kbeckman.c4sc@gmail.com")
{
	git config user.name $username
	git config user.email $email
}
