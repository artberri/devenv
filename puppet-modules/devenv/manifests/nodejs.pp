class devenv::nodejs {

    class { 'nvm_nodejs':
        user        => $user,
        manage_user => false,
        version     => '0.12.7',
    }

}
