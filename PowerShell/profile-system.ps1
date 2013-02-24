# Friendly PowerShell Execution Policy
# Set-ExecutionPolicy Unrestricted


# Use this snippet if corporate domain policies hijack your $HOME folder...
# Remove-Variable -Force HOME
# Set-Variable HOME "C:\Users\Keith Beckman"


$scriptsSettingsPath 	= Join-Path $HOME "Scripts-Settings"
$dependenciesPath 		= Join-Path $scriptsSettingsPath "lib"
$psScriptsPath 			= Join-Path $scriptsSettingsPath "\PowerShell\FuncLib"


# Initial setup function for Scripts-Settings repo and PowerShell dependencies...
Function Setup-Dependencies()
{	
	cd $HOME
	git clone 'git@github.com:kbeckman/Scripts-Settings.git'
	
	if (!(Test-Path $dependenciesPath )) { mkdir $dependenciesPath }
	
	cd $dependenciesPath
	git clone 'https://github.com/JeremySkinner/posh-hg.git'
	git clone 'https://github.com/dahlbyk/posh-git.git'	
}
# Updates Scripts-Settings and repo and PowerShell dependencies...
Function Update-Git-Repos()
{	
	Function Update-Repo([string]$repoPath)
	{
		cd $repoPath
		git pull --rebase
	}
	
	Update-Repo $scriptsSettingsPath

	cd $dependenciesPath
	dir -Directory |
		ForEach-Object -Process { Update-Repo (Join-Path $dependenciesPath $_.Name) }
		
	cd $HOME
}


# START PROFILE SCRIPT

# Set necessary command line environment variables...
# [Ruby 1.9.3, Git, TortoiseHg, DiffMerge, NuGet, VirtualBox, Sysinternals Suite, 7-7ip, OpenSSL,
# MakeCert.exe]
$requiredPaths = @( ";C:\Ruby193\bin", 					
					";C:\Program Files (x86)\Git\cmd",
					";C:\Program Files\TortoiseHg",
					";C:\Program Files\SourceGear\Common\DiffMerge",
					";C:\Program Files (x86)\NuGet",
					";C:\Program Files\Oracle\VirtualBox", 
					";C:\Program Files (x86)\Sysinternals Suite", 
					";C:\Program Files\7-Zip",
					";C:\OpenSSL-Win32\bin",
					";C:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\bin",
					";C:\Program Files (x86)\Windows Kits\8.0\bin\x64")
foreach ($path in $requiredPaths)
{
	if (!($env:Path.Contains($path))) { $env:Path += $path }
}

	
if (!(Test-Path $scriptsSettingsPath )) 
{ 
	Setup-Dependencies
	Get-ChildItem $psScriptsPath -filter "*.ps1" | 
		ForEach-Object -Process { . (Join-Path $psScriptsPath $_.Name) }
	Git-Setup
}
else 
{ 
	Get-ChildItem $psScriptsPath -filter "*.ps1" | 
		ForEach-Object -Process { . (Join-Path $psScriptsPath $_.Name) }
}


Setup-PowerShell-Console


# Load Posh-Hg/Git libraries...
$poshHgPath		= Join-Path $dependenciesPath "posh-hg\profile.example.ps1"
$poshGitPath	= Join-Path $dependenciesPath "posh-git\profile.example.ps1"
if (Test-Path $poshHgPath) { . $poshHgPath }
if (Test-Path $poshHgPath) { . $poshGitPath }


cd $HOME