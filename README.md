# artberri/devenv

A project to set up my development machine ([@artberri](https://github.com/artberri)) in an automated way.

## Requirements

Requires [Ubuntu 18.04 (Bionic Beaver)](http://releases.ubuntu.com/18.04/).

Git:

``` bash
sudo apt-add-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install git -y
```

## Installation

``` bash
export DEVENV_PATH="$(echo ~)/.devenv"
git clone https://github.com/artberri/devenv.git $DEVENV_PATH
export PATH=$PATH:$DEVENV_PATH/bin


cd /opt/devenv
/opt/devenv/bootstrap.sh
chsh -s /bin/zsh
reboot
# After the reboot:
~/.solarize/set_dark.sh
# You should start sublime text, wait until the packages are installed and restart it.
```

## Updating

``` bash
cd /opt/devenv
git pull && git submodule foreach git pull origin master
devenv
```

## License

[GNU GENERAL PUBLIC LICENSE (Version 2)](LICENSE)
