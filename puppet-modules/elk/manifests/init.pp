class elk (
        $install = false,
    ) {

    if $install {
        apt::source { 'elasticsearch':
            location => 'http://packages.elasticsearch.org/elasticsearch/2.x/debian',
            release  => 'stable',
            repos    => 'main',
            key      => {
                id     => '46095ACC8548582C1A2699A9D27D666CD88E42B4',
                server => 'pgp.mit.edu',
            },
            include  => {
                source => false,
            },
            notify   => Exec['elk apt-get update']
        }

        apt::source { 'logstash':
            location => 'http://packages.elasticsearch.org/logstash/2.1/debian',
            release  => 'stable',
            repos    => 'main',
            key      => {
                id     => '46095ACC8548582C1A2699A9D27D666CD88E42B4',
                server => 'pgp.mit.edu',
            },
            include  => {
                source => false,
            },
            notify   => Exec['elk apt-get update']
        }

        exec { 'elk apt-get update':
            command     => '/usr/bin/apt-get update',
            refreshonly => true,
            before      => Class['logstash', 'elasticsearch', 'kibana'],
        }

        class { 'elasticsearch': }

        elasticsearch::instance { 'es-01':
            config => {
                'index.mapper.dynamic' => true
            }
        }

        class { 'kibana':
            version => '4.3.0',
            require => Class['elasticsearch'],
        }

        class { 'logstash':
            require => Class['kibana'],
        }

        logstash::configfile { 'logstash-terminal':
            source => 'puppet:///modules/elk/logstash.apache.conf',
        }

    }

}
