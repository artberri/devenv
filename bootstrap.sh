#!/bin/bash
OS_CODENAME=`lsb_release --codename | cut -f2`
OS_ID=`lsb_release --id | cut -f2`
USER=$(whoami)
DEVENV_PATH=${HOME}/devenv

if [[ $EUID -eq 0 ]]; then
  echo "This script must NOT be run as root" 1>&2
  exit 1
fi

while getopts ":h" opt; do
  case ${opt} in
    h )
      echo "Usage: devenv [OPTION]"
      echo "Options"
      echo "    -h                   Display this help message."
      exit 0
      ;;
    \? )
      echo "Invalid Option: -${OPTARG}. Get help with: devenv -h " 1>&2
      exit 1
      ;;
  esac
done

cd $DEVENV_PATH

if [ "$OS_ID" == "Ubuntu" ]; then

    echo "Ubuntu (${OS_CODENAME}) detected"

    if ! type "puppet" > /dev/null 2> /dev/null; then

        echo "Adding puppetlabs repo"
        wget https://apt.puppetlabs.com/puppetlabs-release-pc1-${OS_CODENAME}.deb >/dev/null 2>/dev/null
        sudo dpkg -i puppetlabs-release-pc1-${OS_CODENAME}.deb >/dev/null 2>/dev/null
        rm puppetlabs-release-pc1-${OS_CODENAME}.deb >/dev/null 2>/dev/null

        echo "Downloading the package lists"
        sudo apt-get update >/dev/null 2>/dev/null

        echo "Installing puppet"
        if sudo apt-get install -y ruby puppet >/dev/null 2>/dev/null; then
            echo "Package puppet installed."
        else
            echo "Error: Package puppet is not installed."
            exit 1
        fi

    else
        echo "Puppet already installed."
    fi

    if ! type "librarian-puppet" > /dev/null 2>/dev/null; then

        echo "Installing librarian-puppet"
        if sudo gem install librarian-puppet >/dev/null 2>/dev/null; then
            echo "Gem librarian-puppet installed."
        else
            echo "Error: gem librarian-puppet is not installed."
            exit 1
        fi

    else
        echo "librarian-puppet already installed."
    fi

    echo "Installing puppet modules"
    if librarian-puppet install >/dev/null 2>/dev/null; then
        echo "Puppet Modules installed."
    else
        echo "Error: Can not install the puppet modules. Run 'librarian-puppet install --verbose' to debug."
        exit 1
    fi

    echo "Applying puppet"
    if ! sudo puppet apply --modulepath=${DEVENV_PATH}/modules -e "class { 'devenv': user => \"${USER}\", }"; then
        echo "Error: Puppet Modules not installed properly."
        exit 1
    fi

else
    echo "This script is customized only for Ubuntu you are using $OS_ID "
    echo "Try installing puppet by hand"
    exit 1
fi

cd - >/dev/null
