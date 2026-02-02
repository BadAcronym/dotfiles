$WinVimpath = Join-Path -PATH $env:LOCALAPPDATA -ChildPath "\nvim\"

$RepoVimpath = "T:\Repository\dotfiles\nvim\"

Write-Output "Writing nvim config from $RepoVimpath to $WinVimpath"


# TODO: 'if valid path $WinPath, then delete everything in it
Remove-Item -Path $WinVimpath -Recurse
Copy-Item -PATH $RepoVimpath -Destination $WinVimpath -Recurse -Force
