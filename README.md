# artberri/devenv

A [puppet](https://github.com/puppetlabs/puppet) project to set up my development machine ([@artberri](https://github.com/artberri)) in an automated way.

## Requirements

Requires [Ubuntu 15.04 (Vivid Vervet)](http://releases.ubuntu.com/15.04/).

## Installation

```
sudo apt-get install git
git clone https://github.com/artberri/devenv.git /opt/devenv --recursive
cd /opt/devenv
/opt/devenv/bootstrap.sh
chsh -s /bin/zsh
reboot
# After the reboot:
~/.solarize/set_dark.sh
# You should start sublime text, wait until the packages are installed and restart it.
```

## Updating

```
cd /opt/devenv
git pull && git submodule foreach git pull origin master
/opt/devenv/bootstrap.sh
```

## License

[GNU GENERAL PUBLIC LICENSE (Version 2)](LICENSE)
