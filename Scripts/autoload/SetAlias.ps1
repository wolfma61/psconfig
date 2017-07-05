Write-Host "SetAlias" 

function Set-WorkDirectory { Set-Location $WORKDIR }
function Set-GitDirectory { Set-Location $GITDIR }
function Set-GitCntkDirectory { Set-Location $GITDIR\cntk }
function Set-GitCntkDocDirectory { Set-Location $GITDIR\cognitive-toolkit-docs-pr }
function Set-GitJenkinsScriptDirectory { Set-Location $GITDIR\JenkinsScript }
#function Set-ScriptDirectory { set-location $env:Userprofile\Documents\WindowsPowerShell\Scripts } 
function Set-OneDriveScriptDirectory { set-location $env:Userprofile\OneDrive\work\PowerShell }
function Open-PrInCodeflow(
    [Parameter(Mandatory = $true)][ValidateSet('Cntk', 'DocCntk')] [string] $RepoString, 
    [Parameter(Mandatory = $true)][ValidateScript( {$_ -ge 1})] [int] $PullRequest) {
    switch ($RepoString) {
        'Cntk' { $repoUrl = 'https://github.com/Microsoft/cntk/pull/' + $PullRequest }
        'DocCntk' { $repoUrl = 'https://github.com/MicrosoftDocs/cognitive-toolkit-docs-pr/pull/' + $PullRequest }
    }
    $command = "cmd.exe /C \\codeflow\public\cf.cmd openGitHubPR -webUrl $repoUrl"
    Write-Host Open Codeflow: $command
    &Invoke-Expression -Command:$command
}

set-alias work Set-WorkDirectory
set-alias gitwork Set-GitDirectory
#set-alias script Set-ScriptDirectory
set-alias onescript Set-OneDriveScriptDirectory
set-alias pr Open-PrInCodeflow
set-alias gitc Set-GitCntkDirectory
set-alias gitd Set-GitCntkDocDirectory
set-alias gitj Set-GitJenkinsScriptDirectory
