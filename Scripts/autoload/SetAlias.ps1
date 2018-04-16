Write-Host "SetAlias" 

function Set-WorkDirectory { Set-Location $WORKDIR }
function Set-GitDirectory { Set-Location $GITDIR }
function Set-GitCarbonDirectory { Set-Location $GITDIR\carbon }
function Set-GitCarbonDocDirectory { Set-Location $GITDIR\azure-docs-pr\articles\cognitive-services\Speech\SDK\ }
function Set-OneDriveScriptDirectory { set-location $env:Userprofile\OneDrive\work\PowerShell }
function Open-PrInCodeflow(
    [Parameter(Mandatory = $true)][ValidateSet('Carbon', 'DocCarbon')] [string] $RepoString, 
    [Parameter(Mandatory = $true)][ValidateScript( {$_ -ge 1})] [int] $PullRequest) {
    switch ($RepoString) {
        'Cntk' { $repoUrl = 'https://msasg.visualstudio.com/Skyman/_git/Carbon/pullrequest/' + $PullRequest }
        'DocCntk' { $repoUrl = 'https://msasg.visualstudio.com/Skyman/_git/Carbon/pullrequest/' + $PullRequest }
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
set-alias gitc Set-GitCarbonDirectory
set-alias gita Set-GitCarbonDocDirectory
set-alias gitd Set-GitCarbonDocDirectory

