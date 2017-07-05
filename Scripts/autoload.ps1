Write-Host "Autoload" 

# directory where my scripts are stored

$psdir="$env:Userprofile\Documents\WindowsPowerShell\Scripts\autoload"  

# load all 'autoload' scripts#

Get-ChildItem "${psdir}\*.ps1" | %{.$_} 

Write-Host "Custom PowerShell Environment Loaded" 
