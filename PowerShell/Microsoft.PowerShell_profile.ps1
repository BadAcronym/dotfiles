Import-Module gsudoModule

Set-PSReadlineOption -PredictionSource None

New-Alias Goto Set-Location
New-Alias fetch winfetchconfig
New-Alias csh cheatsheet
New-Alias gw Get-Weather
New-Alias vim nvim

$toRemove = "Follow*"
function Get-Weather{
    param(
        $city = "",
        [switch]$graph = $false
    )
    
    if ( $graph ){ $output = Invoke-RestMethod "wttr.in/$city`?format=v2" | Out-String }
    else { $output = Invoke-RestMethod "wttr.in/$city" | Out-String }
    $outputLines = $output -split "`n"
    $filteredLines = $outputLines | Where-Object {$_ -notmatch $toRemove}
    $cleanedlines = $filteredLines | Where-Object {$_.trim() -ne ""}
    $cleanedlines -join "`n"
    Write-Host ""
}

oh-my-posh init pwsh --config (Join-Path -PATH $env:Repo -ChildPath "\dotfiles\PowerShell\Mandi.omp.json") | Invoke-Expression
