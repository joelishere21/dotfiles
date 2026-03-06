
$env:Path = "$env:OneDrive\JSScripts;$env:Path"

$username="YOURFULLNAME"
$useremail="YOUR EMAIL"
$nvimconfig="c:\Users\Joel\APPDATA\Local\nvim"
$scriptslocation="$env:OneDrive\JSScripts"

Set-Alias nf winfetch
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias lg lazygit
Set-Alias stat onefetch
Set-Alias grep findstr
Set-Alias icons js-icons

Set-Alias g git
function gcp ($a) { git cherry-pick -n $a }

function js-git-setup {
	git config --global user.name "$username"
	git config --global user.email "$useremail"
	# git config --global http.sslbackend schannel
}

function weather {
    curl wttr.in/omaha?u
  }

function ep { vim $PROFILE }
function ev { vim $nvimconfig }

function which ($command) {
	Get-Command -Name $command -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function js-fzf ($a) {
    Set-Location $a
    Get-ChildItem . -Attributes Directory -Name | fzf | Set-Location
  }

function js-get-expo {
	Get-ExecutionPolicy
}

function js-set-expo {
	Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
}

function js-prompt {
    Invoke-Expression (&starship init powershell)
  }

function js-icons {
    if (-not (Get-Module -ListAvailable -Name Terminal-Icons)) {
        Install-Module -Name Terminal-Icons -Scope CurrentUser -Force -SkipPublisherCheck
      }
    if (-not (Get-Module -Name Terminal-Icons)) {
        Import-Module -Name Terminal-Icons
      }
  }

function js-modules {
    if (-not (Get-Module -ListAvailable -Name PSFzf)) {
        Install-Module -Name PSFzf -Scope CurrentUser -Force -SkipPublisherCheck
      }
    if (-not (Get-Module -Name PSFzf)) {
        Import-Module -Name PSFzf
      }
  }

function js-readline-key-handlers {
    Import-Module PSReadLine

    Set-PSReadLineKeyHandler -Chord "Ctrl+Shift+L" -ScriptBlock {
        Invoke-Expression "$(Get-ChildItem -Path . -Filter '*.exe' | Select-Object -First 1)"
      }
  }

js-prompt
js-icons
js-modules

