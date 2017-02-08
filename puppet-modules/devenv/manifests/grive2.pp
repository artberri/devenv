class devenv::grive2 {

    exec { 'clone grive2':
        command => "git clone https://github.com/vitalif/grive2 /opt/grive2",
        creates => "/opt/grive2",
        require => Package['git'],
        user    => 'root',
    } ->

    file { '/opt/grive2/build':
        ensure  => directory,
        owner   => 'root',
        group   => 'root',
    } -> 

    exec { 'build-grive2':
        creates => "/opt/grive2/build/Makefile",
        command => "/usr/bin/cmake ..",
        user    => 'root',
        cwd     => '/opt/grive2/build',
        require => [Package['cmake'], File['/opt/grive2/build']],
    } -> 

    exec { 'build-grive2-make':
        creates => "/opt/grive2/build/grive/CMakeFiles/grive_executable.dir/src/main.cc.o",
        command => "/usr/bin/make -j4",
        user    => 'root',
        cwd     => '/opt/grive2/build',
        require => Package['build-essential'],
    } -> 

    exec { 'grive2-install':
        creates => "/usr/local/bin/grive",
        command => "/usr/bin/make install",
        user    => 'root',
        cwd     => '/opt/grive2/build',
    }

}
