Import-Module gsudoModule

Set-PSReadlineOption -PredictionSource None
if(Test-Path "T:\Repository\"){
    $repo = "T:\Repository\"
}
elseIf(Test-Path "C:\Repository\"){
    $repo = "C:\Repository\"
}
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

oh-my-posh init pwsh --config (Join-Path -PATH $repo -ChildPath "\dotfiles\PowerShell\Mandi.omp.json") | Invoke-Expression

