class devenv (
        $user,
    ) {

    # Set Path
    Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin/" ] }

    # Basic Packages
    class { 'devenv::packages': } ->

    # Node (NVM)
    class { 'devenv::nodejs':
        user    => $user,
    } ->

    # PHP 5.6
    class { 'devenv::php::install': } ->

    # Apache
    class { 'devenv::apache': } ->

    # Powerline
    class { 'devenv::powerline':
        user    => $user,
    } ->

    # Shell theme
    class { 'devenv::solarize':
        user    => $user,
    } ->

    # Config files
    class { 'devenv::dotfiles':
        user    => $user,
    } ->

    # Sublime Text 3
    class { 'devenv::sublime_text':
        user    => $user,
    } ->

    # Chrome
    class { 'devenv::chrome': } ->

    # Android
    class { 'devenv::android': } ->

    # Dropbox
    class { 'dropbox': } ->

    file { '/usr/local/bin/devenv':
        target => "/opt/devenv/bootstrap.sh",
        ensure => 'link',
        owner  => 'root',
        group  => 'root',
    }

}
