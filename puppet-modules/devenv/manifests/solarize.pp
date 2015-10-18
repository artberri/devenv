class devenv::solarize ( $user ) {

    exec { 'clone gnome-terminal-colors-solarized':
        command => "git clone git://github.com/Anthony25/gnome-terminal-colors-solarized.git /home/${user}/.solarized",
        creates => "/home/${user}/.solarized",
        require => Package['git'],
        user    => $user,
    } ->

    exec { 'clone dircolors-solarized':
        command => "git clone git://github.com/huyz/dircolors-solarized.git /home/${user}/.dircolors-solarized",
        creates => "/home/${user}/.dircolors-solarized",
        require => Package['git'],
        user    => $user,
    }

}
