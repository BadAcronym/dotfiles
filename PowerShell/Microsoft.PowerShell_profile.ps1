Import-Module gsudoModule

Set-PSReadlineOption -PredictionSource None

New-Alias Goto Set-Location
New-Alias fetch winfetchconfig
New-Alias vim nvim

function Get-Weather {
    param(
        $city = ""
    )
    Invoke-RestMethod "wttr.in/$city"
}

function Get-Graph {
    param(
        $city = ""
    )
    Invoke-RestMethod "wttr.in/$city`?format=v2"
}

oh-my-posh init pwsh --config (Join-Path -PATH $env:Repo -ChildPath "\dotfiles\PowerShell\Mandi.omp.json") | Invoke-Expression
