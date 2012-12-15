#Scripts-Settings#
This is my personal collection of Windows, Mac and Linux scripts used to automate system functions, virtual machine 
maintenance, etc. Contained within are various PowerShell and Bash scripts that make my life easier as a developer. I'm
working to duplicate most of the script functionality across the PowerShell and Bash environments allowing for a unified
experience across platforms.
<br/><br/>

##PowerShell Initial Setup##
1. Browse to this repository from your fresh Windows installation and copy the contents from 
[\Windows\PowerShell\profile-system.ps1](https://raw.github.com/kbeckman/Scripts-Settings/master/PowerShell/profile-system.ps1) 
into your personal PowerShell profile script (this is usually located at %HOME%\My Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1).
2. Re-Source your profile script... <strong>. $PROFILE</strong>
<br/><br/>

##Disclaimer##
Anyone wanting to use this script library may fork this repo and modify scripts at will. You should really only have to change
some function parameter defaults (i.e. replace my usernames/email, update environment paths,e tc) to get up and running. Lastly, 
this is an extremely fluid source repository... Every time I learn something new or figure out a way to automate a task, it gets 
added to this repository. If you decide to fork this repo, plan for frequent iterations and updates.
