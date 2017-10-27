class devenv::nodejs ($user) {

    class { 'nvm':
        user                => $user,
        install_node        => '8.8.1',
        manage_dependencies => false,
        manage_profile      => false,
    }

}
