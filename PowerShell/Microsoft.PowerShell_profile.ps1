Import-Module gsudoModule

Set-PSReadlineOption -PredictionSource None

New-Alias Goto Set-Location
New-Alias fetch fastfetchconfig
New-Alias csh cheatsheet
New-Alias gw Get-Weather
New-Alias vi nvim
New-Alias vim nvim
New-Alias lazy lazygit

if($IsWindows)
{
    $env:Repo = "T:\Repository"
    Invoke-Expression "subst R: $env:Repo\river\"               *>$null
    Invoke-Expression "subst M: $env:Repo\marino\"              *>$null
    Invoke-Expression "subst U: $env:Repo\RPTU\5_Semester\"     *>$null

    function Get-Image
    {
        param ( $image = "." )
        Invoke-Expression "wezterm imgcat $image"
    }
}
elseIf($isLinux)
{
    $env:Repo = "~/repository/"
}

$toRemove = "Follow*"
function Get-Weather
{
    param
    (
        $city = "",
        [switch]$graph = $false
    )
    if($graph)
    {
        $output = Invoke-RestMethod "wttr.in/$city`?format=v2" | Out-String
    }
    else
    {
        $output = Invoke-RestMethod "wttr.in/$city" | Out-String
    }

    $outputLines = $output -split "`n"
    $filteredLines = $outputLines | Where-Object {$_ -notmatch $toRemove}
    $cleanedlines = $filteredLines | Where-Object {$_.trim() -ne ""}
    $cleanedlines -join "`n"

    Write-Host ""
}

$pwshCollectionPath = (Join-Path $env:Repo -ChildPath "/PWSH-Collection/")
$pwshCollectionModulePath = (Join-Path $pwshCollectionPath -ChildPath "/modules/")
$pwshCollectionScriptPath = (Join-Path $pwshCollectionPath -ChildPath "/scripts/")

if(Test-Path $pwshCollectionPath)
{
    $pwshCollectionModules = Get-ChildItem $pwshCollectionModulePath
    foreach($module in $pwshCollectionModules)
    {
        Import-Module $module
    }

    if((Test-Path $pwshCollectionScriptPath) -And -Not($env:PATH -like "*$pwshCollectionScriptPath*"))
    {
        if($isLinux)
        {
            $env:PATH += ":$pwshCollectionScriptPath"
        }
        elseIf($isWindows)
        {
            $env:PATH += ";$pwshCollectionScriptPath"
        }
        Write-Host "Added $pwshCollectionScriptPath to path!" -ForegroundColor Green
    }
}

oh-my-posh init pwsh --config (Join-Path -PATH $env:Repo -ChildPath "/dotfiles/PowerShell/config.omp.json") | Invoke-Expression
Set-Location $env:Repo
