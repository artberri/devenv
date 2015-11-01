class devenv::nodejs ($user) {

    class { 'nvm':
        user                => $user,
        install_node        => '0.12.7',
        manage_dependencies => false,
        manage_profile      => false,
    }

}
