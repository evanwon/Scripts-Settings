# Configures Git global configuration settings...
function setup-git {
    defaultUser="kbeckman"
    defaultEmail="kbeckman.c4sc@gmail.com"

    git config --global user.name "${1:-$defaultUser}"
    git config --global user.email "${2:-$defaultEmail}"
    
	#if ismac; then
		diff_str="/Applications/DiffMerge.app/Contents/MacOS/diffmerge \$LOCAL \$REMOTE"
   		merge_str="/Applications/DiffMerge.app/Contents/MacOS/diffmerge --merge --result=\$MERGED \$LOCAL \$BASE \$REMOTE"
	#else
   		#diff_str="/usr/bin/diffmerge \$LOCAL \$REMOTE"
   		#merge_str="/usr/bin/diffmerge --merge --result=\$MERGED \$LOCAL \$BASE \$REMOTE"	
	#fi

    git config --global diff.tool diffmerge
    git config --global difftool.diffmerge.cmd "${diff_str}"

    git config --global merge.tool diffmerge
    git config --global mergetool.diffmerge.cmd "${merge_str}"
    git config --global mergetool.keepBackup false

    git config --global color.ui true
}

# Configures Git at a repository level... 
function setup-git-repo
{
    defaultUser="kbeckman"
    defaultEmail="kbeckman.c4sc@gmail.com"
    
    git config user.name "${1:-$defaultUser}"
    git config user.email "${2:-$defaultEmail}"
}