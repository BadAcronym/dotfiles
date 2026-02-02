$RepoPath = "T:\Repository\dotfiles"

$WinVimpath = Join-Path -PATH $env:LOCALAPPDATA -ChildPath "\nvim\"
$RepoVimpath = Join-Path -PATH $RepoPath -ChildPath "\nvim\"

$WinGlazepath = Join-Path -PATH $env:USERPROFILE -ChildPath "\.glzr\glazewm\config.yaml"
$RepoGlazepath = Join-Path -PATH $RepoPath -ChildPath "\glazewm\config.yaml"

$WinTermpath = Join-Path -PATH $env:LOCALAPPDATA -ChildPath "\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$RepoTermpath = Join-Path -PATH $RepoPath -ChildPath "\wt\settings.json"

function Push-Config {
    param (
        $inputPath,
        $outputPath
    )

    Write-Output "`nWriting config from $inputPath to $outputPath..."

    if ( Test-Path $outputPath ) {
        Remove-Item -PATH $outputPath -Recurse
        Write-Host "Deleted existing config in " -ForegroundColor Red -NoNewline
        Write-Host "$outputPath."
    }
    else{
        Write-Host "No existing config found, pushing..."
    }
    Copy-Item -PATH $inputPath -Destination $outputPath -Recurse
    Write-Host "Pushed config to " -ForegroundColor Green -NoNewline
    Write-Host $outputPath -ForegroundColor White -NoNewline
    Write-Host " successfully." -ForegroundColor green
}

Push-Config $RepoVimpath $WinVimpath
Push-Config $Repoglazepath $WinGlazepath
Push-Config $RepoTermpath $WinTermpath
