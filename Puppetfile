#!/usr/bin/env ruby

forge "https://forgeapi.puppetlabs.com"

# Local modules
mod 'berri-devenv', "0.0.1", :path => './puppet-modules/devenv'

# Modules from the Puppet Forge
mod 'puppetlabs-stdlib', '4.9.0'
mod 'puppetlabs-apache', '1.6.0'
mod 'puppetlabs-mysql', '3.6.1'
mod 'puppetlabs-apt', '2.2.0'
mod 'artberri-nvm', '0.1.0'
mod 'maestrodev-rvm', '1.12.1'
mod 'mayflower-php', '3.4.2'
mod 'tylerwalts-jdk_oracle', '1.4.0'

mod 'artberri/mariadbrepo',
    :git => 'https://github.com/artberri/puppet-mariadbrepo.git',
    :ref => 'upgrade-apt-dependency'

mod 'maestrodev-android',
    :git => "git://github.com/artberri/puppet-android.git",
    :ref => '7851859edc4f1d0b1d18d127ceb2568620859443'

mod 'rcoleman-dropbox',
    :git => "git://github.com/cpick/puppet-module-dropbox.git",
    :ref => "new-apt-module"
