class devenv::php::repo {

    include '::apt'

    exec { "add-apt-repository-${name}":
        command     => "/usr/bin/add-apt-repository -y ppa:ondrej/php5-5.6",
        unless      => "/usr/bin/test -s /etc/apt/sources.list.d/ondrej-ubuntu-php5-5_6-wily.list",
        user        => 'root',
        logoutput   => 'on_failure',
        notify      => Class['apt::update'],
    }

}
