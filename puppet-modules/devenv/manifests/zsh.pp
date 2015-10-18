class devenv::zsh (
        $user,
        $shell,
    ) {

    if $shell != '/bin/zsh' {
        exec { 'set zsh as default shell':
            command => "chsh -s /bin/zsh",
            user    => $user,
            require => [Package['zsh']]
        }
    }

}
