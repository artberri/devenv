class devenv::mariadb {

    class { 'mariadbrepo' :
        version => '10.1',
    } ->

    class { '::mysql::server':
        package_name            => 'MariaDB-server',
        root_password           => 'root',
        remove_default_accounts => true,
        service_manage          => true,
        service_enabled         => true,
    }

}
