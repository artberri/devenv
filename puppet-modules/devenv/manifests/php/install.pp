class devenv::php::install {

    # Added manually to avoid continous execution
    # class { 'devenv::php::repo': } ->

    class { '::php':
        manage_repos => true,
        fpm          => false,
        dev          => true,
        pear         => true,
        phpunit      => true,
        composer     => true,
        extensions   => {
            'curl'    => {},
            'gd'      => {},
            'imagick' => {},
            'json'    => {},
            'mcrypt'  => {},
            'mysqlnd' => {},
            'xdebug'  => {},
        },
        settings     => {
            'date.timezone' => 'Europe/Madrid',
        },
    }

}
