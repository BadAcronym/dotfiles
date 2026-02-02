$RepoPath = "T:\Repository\dotfiles"

$WinVimpath = Join-Path -PATH $env:LOCALAPPDATA -ChildPath "\nvim\"
$RepoVimpath = Join-Path -PATH $RepoPath -ChildPath "\nvim\"

$WinGlazepath = Join-Path -PATH $env:USERPROFILE -ChildPath "\.glzr\glazewm\"
$RepoGlazepath = Join-Path -PATH $RepoPath -ChildPath "\glazewm\"

Write-Output "Writing nvim config from $RepoVimpath to $WinVimpath"

if ( Test-Path -Path $WinVimpath ){
    Remove-Item -Path $WinVimpath -Recurse
}
Copy-Item -PATH $RepoVimpath -Destination $WinVimpath -Recurse 

Write-Output "Writing glazeWM config from $RepoGlazepath to $WinGlazepath"

if ( Test-Path -Path $WinGlazepath) {
    Remove-Item -Path $WinGlazepath -Recurse
}
Copy-Item -PATH $RepoGlazepath -Destination $WinGlazepath -Recurse
