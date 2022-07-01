#functions
function GetMyIp { Invoke-WebRequest -L tool.lu/ip }

function GoBack {Set-Location ..}

function UpdateScoop { sudo scoop update; scoop update * }

function Connect-WindowsSubsystemAndroid {adb connect 127.0.0.1:58526}

function ReloadPATH
{ 
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") 
    $env:Path = $env:Path + [System.Environment]::GetEnvironmentVariable("path","User")
}



#modules
Import-Module Dircolors
Import-Module Terminal-Icons

#alias
Set-Alias .. GoBack
Set-Alias myip GetMyIp

ReloadPATH