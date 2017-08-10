Write-Host "SetAlias" 

function Set-WorkDirectory { Set-Location $WORKDIR }
function Set-GitDirectory { Set-Location $GITDIR }
function Set-GitCntkDirectory { Set-Location $GITDIR\cntk }
function Set-GitCntkDocDirectory { Set-Location $GITDIR\cognitive-toolkit-docs }
function Set-GitJenkinsScriptDirectory { Set-Location $GITDIR\JenkinsScript }
#function Set-ScriptDirectory { set-location $env:Userprofile\Documents\WindowsPowerShell\Scripts } 
function Set-OneDriveScriptDirectory { set-location $env:Userprofile\OneDrive\work\PowerShell }
function Open-PrInCodeflow(
    [Parameter(Mandatory = $true)][ValidateSet('Cntk', 'DocCntk')] [string] $RepoString, 
    [Parameter(Mandatory = $true)][ValidateScript( {$_ -ge 1})] [int] $PullRequest) {
    switch ($RepoString) {
        'Cntk' { $repoUrl = 'https://github.com/Microsoft/cntk/pull/' + $PullRequest }
        'DocCntk' { $repoUrl = 'https://github.com/MicrosoftDocs/cognitive-toolkit-docs/pull/' + $PullRequest }
    }
    $command = "cmd.exe /C \\codeflow\public\cf.cmd openGitHubPR -webUrl $repoUrl"
    Write-Host Open Codeflow: $command
    &Invoke-Expression -Command:$command
}

function Add-PSModulePath(
    [Parameter(Mandatory = $true)][ValidateSet('Jenkins')] [string] $moduleLocation) {
    switch ($moduleLocation) {
        'Jenkins' { $moduleDir = "C:\repos\JenkinsScript\Windows\ps\Modules" }
    }
    Write-Host Adding to PSModulePath: $moduleDir
    $env:PSModulePath = "$moduleDir;$env:PSModulePath"
}

set-alias work Set-WorkDirectory
set-alias gitwork Set-GitDirectory
#set-alias script Set-ScriptDirectory
set-alias onescript Set-OneDriveScriptDirectory
set-alias pr Open-PrInCodeflow
set-alias apm Add-PSModulePath
set-alias gitc Set-GitCntkDirectory
set-alias gitd Set-GitCntkDocDirectory
set-alias gitj Set-GitJenkinsScriptDirectory
