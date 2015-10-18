class devenv ( $user ) {

    Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin/" ] }

    class { 'devenv::packages': } ->

    exec { "Installing powerline":
        user    => $user,
        command => "pip install --user powerline-status",
        creates => "/home/${user}/.local/bin/powerline-config"
    } ->

    class { 'devenv::powerline':
        user    => $user,
    } ->

    class { 'devenv::solarize':
        user    => $user,
    } ->

    class { 'devenv::dotfiles':
        user    => $user,
    } ->

    class { 'devenv::sublime_text':
        user    => $user,
    }

}