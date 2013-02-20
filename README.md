# Scripts-Settings #
This is my personal collection of Windows, Mac and Linux scripts used to automate system functions, virtual machine 
maintenance, etc. Contained within are various PowerShell and Bash scripts that make my life easier as a developer.
<br/><br/>

## PowerShell Initial Setup ##
1. Browse to this repository from your fresh Windows installation and copy the contents from 
[\Windows\PowerShell\profile-system.ps1](https://raw.github.com/kbeckman/Scripts-Settings/master/PowerShell/profile-system.ps1) 
into your personal PowerShell profile script (this is usually located at %HOME%\My Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1).
2. Re-Source your profile script... <strong>. $PROFILE</strong>
<br/><br/>

## Bash Setup ##
1. Clone this repository to your $HOME directory.
    git clone git@github.com:kbeckman/Scripts-Settings.git ~
2. Run the following command to add a line to your `~/.bashrc` or `~/.zshenv` file:
    echo ". ~/Scripts-Settings/Bash/environment-setup.sh" >> ~/.zshenv
3. Re-source your `~/.bashrc` or `~/.zshenv` file:
    . ~/.zshenv
