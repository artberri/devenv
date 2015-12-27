#!/usr/bin/env ruby

forge "https://forgeapi.puppetlabs.com"

# Local modules
mod 'berri-devenv', "0.0.1", :path => './puppet-modules/devenv'
mod 'elk', "0.0.1", :path => './puppet-modules/elk'

# Modules from the Puppet Forge
mod 'puppetlabs-stdlib', '4.9.0'
mod 'puppetlabs-apache', '1.6.0'
mod 'puppetlabs-mysql', '3.6.1'
mod 'puppetlabs-apt', '2.2.0'
mod 'artberri-nvm', '0.1.0'
mod 'maestrodev-rvm', '1.12.1'
mod 'mayflower-php', '3.4.2'
mod 'tylerwalts-jdk_oracle', '1.4.0'
mod 'elasticsearch-logstash', '0.5.1'
mod 'elasticsearch-elasticsearch',
    :git => "git://github.com/elastic/puppet-elasticsearch.git",
    :ref => "9135e4fd66b4829a4a0896d035a531cc782dce33"
mod 'evenup-kibana', '2.2.0'

mod 'artberri/mariadbrepo',
    :git => 'https://github.com/artberri/puppet-mariadbrepo.git',
    :ref => 'upgrade-apt-dependency'

mod 'maestrodev-android',
    :git => "git://github.com/artberri/puppet-android.git",
    :ref => '043318805f48fd4fb39eec2ab4b028a5184a4a2b'

mod 'rcoleman-dropbox',
    :git => "git://github.com/cpick/puppet-module-dropbox.git",
    :ref => "new-apt-module"
