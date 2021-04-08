. $env:Userprofile"\Documents\PowerShell\CommonProfile.ps1"
# Load posh-git example profile
. $env:Userprofile"\Documents\PowerShell\Modules\posh-git\profile.example.ps1"
# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
