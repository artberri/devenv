class devenv::nodejs ($user) {

    class { 'nvm':
        user                => $user,
        install_node        => '4.5.0',
        manage_dependencies => false,
        manage_profile      => false,
    }

}
