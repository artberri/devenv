class devenv::rainbowstream ($user) {

    exec { 'install rainbowstream':
        command => 'pip install rainbowstream',
        user    => 'root',
        require => Package['python-pip'],
        creates => '/usr/local/bin/rainbowstream',
    } ->

    file { "/home/${user}/.rainbow_config.json":
        target => "/opt/devenv/puppet-modules/devenv/files/dotfiles/.rainbow_config.json",
        ensure => 'link',
        backup => 'dotfiles',
        owner  => $user,
    }

}
