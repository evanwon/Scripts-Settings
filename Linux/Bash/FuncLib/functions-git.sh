# Configures Git global configuration settings...
function setup-git {
    defaultUser="kbeckman"
    defaultEmail="kbeckman.c4sc@gmail.com"

    git config --global user.name "${1:-$defaultUser}"
    git config --global user.email "${2:-$defaultEmail}"

    git config --global diff.tool diffmerge
    git config --global difftool.diffmerge.cmd "/usr/bin/diffmerge \$LOCAL \$REMOTE"

    git config --global merge.tool diffmerge
    git config --global mergetool.diffmerge.cmd "/usr/bin/diffmerge --merge --result=\$MERGED \$LOCAL \$BASE \$REMOTE"
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