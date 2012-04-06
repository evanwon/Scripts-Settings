# Friendly PowerShell Execution Policy
# Set-ExecutionPolicy Unrestricted

# Use this snippet if corporate domain policies hijack your $HOME folder...
Remove-Variable -Force HOME
Set-Variable HOME "C:\Users\kbeckman"

# Downloads all system scripts and dependencies required by KB's PowerShell environment...
# $githubPath: sysGitHub target dir, installation directory
Function Setup-Dependencies([string]$githubPath)
{
	if (!(Test-Path $githubPath)) { mkdir $githubPath }

	cd $githubPath

	git clone 'https://github.com/JeremySkinner/posh-hg.git'
	git clone 'https://github.com/dahlbyk/posh-git.git'
	git clone 'https://kbeckman@github.com/kbeckman/Scripts-Settings.git'
}


Function Update-Dependencies()
{
	Write-Output "Updating posh-git"
	cd (Join-Path $sysGitHub "posh-git")
	git pull
	
	Write-Output "Updating posh-hg"
	cd (Join-Path $sysGitHub "posh-hg")
	git pull
	
	Write-Output "Updating Scripts-Settings"
	cd (Join-Path $sysGitHub "Scripts-Settings")
	git pull
	
	cd $HOME
}

# Auto-configures the PowerShell UI settings...
Function Setup-PowerShell-UI()
{
		# Configure PowerShell UI...
	$host.ui.rawui.ForegroundColor 	= "Green"
	$host.ui.rawui.BackgroundColor 	= "Black"
	$host.ui.rawui.CursorSize 		= 25
	
	$bufferSize = $host.ui.rawui.BufferSize
	$bufferSize.Width = 140
	$bufferSize.Height = 3000
	$host.ui.rawui.BufferSize = $bufferSize
	
	$windowSize = $host.ui.rawui.WindowSize
	$windowSize.Width = 140
	$windowSize.Height = 36
	$host.ui.rawui.WindowSize = $windowSize

	$maxWindowSize = $host.ui.rawui.MaxWindowSize
	$maxWindowSize.Width = 140
	$maxWindowSize.Height = 44
	$host.ui.rawui.WindowSize = $maxWindowSize

	Clear-Host
}


# Set necessary command line environment variables...
$env:path += ";C:\Program Files (x86)\Git\cmd"		# Git
$env:path += ";C:\Program Files\TortoiseHg"			# Mercurial
$env:path += ";C:\Program Files (x86)\NuGet"		# NuGet
$env:path += ";C:\Program Files\Oracle\VirtualBox" 	# VirtualBox

Setup-PowerShell-UI


# Setup local GitHub dependencies...
$sysGitHub = Join-Path $HOME "GitHub"
if (!(Test-Path $sysGitHub )) { Setup-Dependencies $sysGitHub }


# Load Custom Powershell functions...
$sysScripts = Join-Path $sysGitHub "Scripts-Settings\Windows\PowerShell\FuncLib"
Get-ChildItem $sysScripts | 
	ForEach-Object -Process { . (Join-Path $sysScripts $_.Name) }

	
# Load Posh-HG/Git libraries...
$poshHgPath		= Join-Path $sysGitHub "posh-hg\profile.example.ps1"
$poshGitPath	= Join-Path $sysGitHub "posh-git\profile.example.ps1"
if (Test-Path $poshHgPath) { . $poshHgPath }
if (Test-Path $poshHgPath) { . $poshGitPath }

# Load developer profile script...
$devProfilePath = Join-Path $HOME "My Documents\WindowsPowerShell\Microsoft.PowerShell_developer.ps1"
if (Test-Path $devProfilePath) { . $devProfilePath }

cd $HOME
