Dotfiles are a hell of a useful thing to back up, don't you think?

Remember kids, make your config files cross-platform and cross-hardware, so that you can be up and running with your favourite settings in no time.

This repo will inevitably be most useful to myself, but I guess I'll add sample pictures and stuff later so you can copy any config of mine you fancy. (You can still do that right now, but you just don't have any previews, lol)

For an immediate and automated setup, I simply run this PWSH script that will automatically install all of my desired package managers, apps, their dependencies, pull my configs from this repo and push them to their respective places.
Currently written for windows (will run from powershell 1 but update to 7 immediately)
and it will include installing winget, scoop and wezterm.
It will also work on Arch Linux if the `yay` package manager is installed.
```PowerShell
irm "https://raw.githubusercontent.com/flymandi/pwsh-collection/master/scripts/config.ps1" | iex
```
