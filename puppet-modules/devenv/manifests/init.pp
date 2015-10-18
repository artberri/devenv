class devenv ( $user ) {

    Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin/" ] }

    class { 'devenv::packages': } ->

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
    } ->

    class { 'nvm_nodejs':
        user        => $user,
        manage_user => false,
        version     => '0.12.7',
    }

    rvm::system_user { $user: }

    class { '::rvm': } ->

    rvm_system_ruby { 'ruby-2.2.3':
        ensure      => 'present',
        default_use => true,
    } ->

    rvm_gem { 'bundler':
        ensure  => present,
        ruby_version => 'ruby-2.2.3',
    }

}