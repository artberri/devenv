# artberri/devenv

A project to set up my development machine ([@artberri](https://github.com/artberri)) in an automated way.

![Screenshot of the shell](screenshot.png)

## Requirements

Requires Ubuntu. Tested only in [Ubuntu 22.04 (Jammy Jellyfish)](http://releases.ubuntu.com/22.04/).

Upgrade system:

```bash
sudo apt-get update
sudo apt-get upgrade
```

Install the latest version of git:

```bash
sudo apt-add-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install git -y
```

## Installation

```bash
export DEVENV_PATH="${HOME}/.devenv"
git clone https://github.com/artberri/devenv.git $DEVENV_PATH
export PATH=$PATH:$DEVENV_PATH/bin
devenv
```

Finally, install some cool theme for the gnome terminal if you want to [Dracula](https://draculatheme.com). It's already installed for Tilix.

## Updating

```bash
cd ~/.devenv
git pull
devenv
```

## Others

Mount Google Drive folder:

```bash
google-drive-ocamlfuse ~/google-drive
```

## License

[GNU GENERAL PUBLIC LICENSE (Version 2)](LICENSE)
