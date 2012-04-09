# Friendly PowerShell Execution Policy
# Set-ExecutionPolicy Unrestricted


# Use this snippet if corporate domain policies hijack your $HOME folder...
Remove-Variable -Force HOME
Set-Variable HOME "C:\Users\Keith Beckman"


# Downloads all system scripts and dependencies required by PowerShell environment...
# $githubPath: sysGitHub target dir, installation directory
Function Setup-Dependencies([string]$githubPath)
{
	if (!(Test-Path $githubPath)) { mkdir $githubPath }

	cd $githubPath

	git clone 'https://github.com/JeremySkinner/posh-hg.git'
	git clone 'https://github.com/dahlbyk/posh-git.git'
	git clone 'https://kbeckman@github.com/kbeckman/Scripts-Settings.git'
}


# START PROFILE SCRIPT

# Set necessary command line environment variables...
$env:path += ";C:\Program Files (x86)\Git\cmd"				# Git
$env:path += ";C:\Program Files\TortoiseHg"					# Mercurial
$env:path += ";C:\Program Files (x86)\NuGet"				# NuGet
$env:path += ";C:\Program Files\Oracle\VirtualBox" 			# VirtualBox
$env:path += ";C:\Program Files (x86)\Sysinternals Suite"	# Sysinternals
$env:path += ";C:\Program Files\7-Zip\"						# 7-Zip


# Setup local GitHub dependencies...
$sysGitHub 	= Join-Path $HOME "GitHub"
$sysScripts = Join-Path $sysGitHub "Scripts-Settings\Windows\PowerShell\FuncLib"	
if (!(Test-Path $sysGitHub )) 
{ 
	Setup-Dependencies $sysGitHub 
	Get-ChildItem $sysScripts | 
		ForEach-Object -Process { . (Join-Path $sysScripts $_.Name) }
	Setup-Git "Keith Beckman" "kbeckman.c4sc@gmail.com"
}
else 
{ 
	Get-ChildItem $sysScripts | 
		ForEach-Object -Process { . (Join-Path $sysScripts $_.Name) } 
}


Setup-PowerShell-UI


# Load Posh-Hg/Git libraries...
$poshHgPath		= Join-Path $sysGitHub "posh-hg\profile.example.ps1"
$poshGitPath	= Join-Path $sysGitHub "posh-git\profile.example.ps1"
if (Test-Path $poshHgPath) { . $poshHgPath }
if (Test-Path $poshHgPath) { . $poshGitPath }


# Load developer profile script...
$devProfilePath = Join-Path $HOME "My Documents\WindowsPowerShell\Microsoft.PowerShell_developer.ps1"
if (Test-Path $devProfilePath) { . $devProfilePath }


cd $HOME