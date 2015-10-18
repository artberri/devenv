class devenv (
        $user,
        $shell
    ) {

    # Set Path
    Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin/" ] }

    # Basic Packages
    class { 'devenv::packages': } ->

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

    # ZSH
    class { 'devenv::zsh':
        user    => $user,
        shell   => $shell,
    } ->

    # Node (NVM)
    class { 'nvm_nodejs':
        user        => $user,
        manage_user => false,
        version     => '0.12.7',
    }

    # Ruby (RVM)
    rvm::system_user { $user: }
    class { '::rvm': } ->
    rvm_system_ruby { 'ruby-2.2.3':
        ensure      => 'present',
        default_use => true,
    } ->
    rvm_gem { 'bundler':
        ensure  => present,
        ruby_version => 'ruby-2.2.3',
    } ->

    # PHP 5.6
    class { 'devenv::php': } ->

    # Apache
    class { 'devenv::apache': } ->

    # MariaDB
    class { 'devenv::mariadb': } ->

    # Sublime Text 3
    class { 'devenv::sublime_text':
        user    => $user,
    }

}
