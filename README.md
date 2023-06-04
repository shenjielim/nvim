# Install Neovim

## Linux (x64)
Linux (x64)
```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
```
# Command to clone


## For Windows

```bash
  # For Windows
  git clone git@github.com:shenjielim/nvim.git ~/AppData/Local
  
  # For Linux
  # Make sure you have ssh-agent on
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/<private_key>
  git clone git@github.com:shenjielim/nvim.git ~/.config
```


## Dependencies
### Neovim
```bash
  sudo apt-get install neovim
```

### Telescope

Async find for file directory
```bash
  # For windows chocolatey
  choco install fd
  
  # For Debian (linux)
  sudo apt-get install fd-find
```

Live grep
```bash
  # For windows and chocolatey
  choco install ripgrep
  
  # For Debian (linux)
  sudo apt-get install ripgrep
```
