class devenv::nodejs ($user) {

    class { 'nvm':
        user                => $user,
        install_node        => '6.9.5',
        manage_dependencies => false,
        manage_profile      => false,
    }

}
