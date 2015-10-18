class devenv::apache {

    class { '::apache':
        serveradmin    => 'alberto@berriart.com',
        mpm_module     => 'prefork',
        service_manage => true,
        service_enable => true,
        service_ensure => true,
    }

    class {'::apache::mod::php': }

}
