class devenv::php {

    class { '::php::repo::ubuntu':
        ppa => 'ondrej/php5-5.6',
    } ->

    class { '::php':
        manage_repos => false,
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
