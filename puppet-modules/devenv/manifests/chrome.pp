class devenv::chrome {

    apt::key { 'chrome':
        id      => '4CCA1EAF950CEE4AB83976DCA040830F7FAC5991',
        source  => 'https://dl.google.com/linux/linux_signing_key.pub',
    } ->

    exec { "Get Google Chrome":
        command => "wget -O /opt/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb",
        require => Package['wget'],
        creates => "/opt/google-chrome-stable_current_amd64.deb",
        unless  => "/usr/bin/test -s /opt/google/chrome/chrome",
    } ->

    package { "google-chrome-stable":
        provider => dpkg,
        ensure => installed,
        source => "/opt/google-chrome-stable_current_amd64.deb",
    } ->

    file { "/opt/google-chrome-stable_current_amd64.deb":
        ensure => absent,
    }
}
