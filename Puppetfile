#!/usr/bin/env ruby

forge "https://forgeapi.puppetlabs.com"

# Local modules
mod 'berri-devenv', "0.0.1", :path => './puppet-modules/devenv'

# Modules from the Puppet Forge
mod 'puppetlabs-stdlib', '4.9.0'
mod 'puppetlabs-apt', '2.2.0'
mod 'artberri-nvm', '0.1.0'
mod 'maestrodev-rvm', '1.12.1'

mod 'artberri/mariadbrepo',
    :git => 'https://github.com/artberri/puppet-mariadbrepo.git',
    :ref => 'upgrade-apt-dependency'
