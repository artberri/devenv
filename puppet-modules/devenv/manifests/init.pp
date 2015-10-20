class devenv (
        $user,
    ) {

    # Set Path
    Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin/" ] }

    # Basic Packages
    class { 'devenv::packages': } ->

  /*  # Ruby (RVM)
    class { '::rvm':
        system_users  => $user,
        system_rubies => {
            'ruby-2.2.3' => {
                ensure      => 'present',
                default_use => true,
            }
        },
        rvm_gems      => {
            'bundler' => {
                ensure  => present,
                ruby_version => 'ruby-2.2.3',
            }
        }
    } ->*/

    # Node (NVM)
    class { 'nvm_nodejs':
        user        => $user,
        manage_user => false,
        version     => '0.12.7',
    } ->

    # PHP 5.6
    class { 'devenv::php': } ->

    # Apache
    class { 'devenv::apache': } ->

 /*   # MariaDB
    class { 'devenv::mariadb': } ->*/

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
    }

    # Chrome
    class { 'devenv::chrome': }

}
