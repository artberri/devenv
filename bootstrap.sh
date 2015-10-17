#!/bin/bash
OS_VERSION=`lsb_release --release | cut -f2`
OS_ID=`lsb_release --id | cut -f2`

if [ "$OS_ID" == "Ubuntu" ] && [ "$OS_VERSION" == "15.04" ]; then

    echo "Ubuntu 15.04 detected"

    if ! type "puppet" > /dev/null; then

        echo "Adding puppetlabs repo"
        wget https://apt.puppetlabs.com/puppetlabs-release-pc1-vivid.deb >/dev/null 2>/dev/null
        sudo dpkg -i puppetlabs-release-pc1-vivid.deb >/dev/null 2>/dev/null
        rm puppetlabs-release-pc1-vivid.deb >/dev/null 2>/dev/null

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
       echo "Error installing puppet modules."
       exit 1
    fi

    echo "Applying puppet"

sudo puppet apply --modulepath=~/devenv/modules puppet/manifests/init.pp

    #if ! sudo puppet apply puppet/manifests/init.pp --modulepath=./modules; then
    #   echo "Error: Puppet Modules not installed properly."
    #   exit 1
    #fi

else
    echo "This script is customized only for Ubuntu 15.04 you are using $OS_ID $OS_VERSION"
    echo "Try installing puppet by hand"
    exit 1
fi

sudo puppet apply puppet/manifests/init.pp