class devenv (
        $user,
    ) {

    # Set Path
    Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin/" ] }

    # Basic Packages
    class { '::devenv::packages': } ->

    class { '::devenv::grive2': } ->

    # Vim
    class { '::devenv::vim':
        user    => $user,
    } ->

    # Node (NVM)
    class { '::devenv::nodejs':
        user    => $user,
    } ->

    # Powerline
    class { '::devenv::powerline':
        user    => $user,
    } ->

    # Shell theme
    class { '::devenv::solarize':
        user    => $user,
    } ->

    # Config files
    #class { 'devenv::dotfiles':
    #    user    => $user,
    #} ->

    # VS Code
    class { '::devenv::vscode':
        user => $user,
    } ->

    # devenv command
    file { '/usr/local/bin/devenv':
        target => "/home/${user}/devenv/bootstrap.sh",
        ensure => 'link',
        owner  => 'root',
        group  => 'root',
    }

}
