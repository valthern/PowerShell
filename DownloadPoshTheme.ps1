param(
	[Parameter(Mandatory = $true)]
	[string]$ThemeName
	)
$ThemePath = "$env:ProgramData\OhMyPosh\themes"
$ThemeUrl = "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/${ThemeName}.omp.json"
Invoke-WebRequest -Uri $ThemeUrl -OutFile "${ThemePath}\${ThemeName}.omp.json"