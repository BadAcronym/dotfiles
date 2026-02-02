Import-Module gsudoModule

Set-PSReadlineOption -PredictionSource None

$RepoPath = "T:\Repository\"

New-Alias Goto Set-Location
New-Alias fetch winfetchconfig
New-Alias vim nvim

function Get-Weather {
    Invoke-RestMethod wttr.in/Kaiserslautern
}

function Get-Graph {
    Invoke-RestMethod wttr.in/Kaiserslautern?format=v2
}

oh-my-posh init pwsh --config (Join-Path -PATH $RepoPath -ChildPath "\dotfiles\wt\Mandi.omp.json") | Invoke-Expression

