class devenv::powerline ($user) {

    file { 'ensure ~/.fonts/ directory':
        ensure => 'directory',
        owner  => $user,
        group  => $user,
        mode   => '0750',
        path   => "/home/${user}/.fonts/",
    }

    file { 'ensure ~/.config/fontconfig/ directory':
        ensure => 'directory',
        owner  => $user,
        group  => $user,
        mode   => '0750',
        path   => "/home/${user}/.config/fontconfig/",
        recurse => true,
    }

    file { 'ensure ~/.config/fontconfig/conf.d/ directory':
        ensure => 'directory',
        owner  => $user,
        group  => $user,
        mode   => '0750',
        path   => "/home/${user}/.config/fontconfig/conf.d/",
        recurse => true,
        require => File['ensure ~/.config/fontconfig/ directory']
    }

    exec { 'download PowerlineSymbols.otf':
        creates => "/home/${user}/.fonts/PowerlineSymbols.otf",
        command => "/usr/bin/curl -L https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf -o /home/${user}/.fonts/PowerlineSymbols.otf",
        user    => $user,
        require => [Package['curl'], File['ensure ~/.fonts/ directory']]
    } ~>

    exec { 'download 10-powerline-symbols.conf':
        creates => "/home/${user}/.config/fontconfig/conf.d/10-powerline-symbols.conf",
        command => "/usr/bin/curl -L https://raw.github.com/Lokaltog/powerline/develop/font/10-powerline-symbols.conf -o /home/${user}/.config/fontconfig/conf.d/10-powerline-symbols.conf",
        user    => $user,
        require => [Package['curl'], File['ensure ~/.config/fontconfig/conf.d/ directory']]
    } ~>

    exec { 'powerline::fc-cache':
        command     => "/usr/bin/fc-cache -vf /home/${user}/.fonts",
        user        => $user,
        returns     => [1, 2, 3],
        refreshonly => true,
        unless      => '/usr/bin/fc-list | grep PowerlineSymbols 2>/dev/null',
        require     => [Exec['download PowerlineSymbols.otf'], Exec['download 10-powerline-symbols.conf']]
    }

}
