class devenv::sublime_text ( $user ) {

    exec { "Get sublime text":
        command => "wget -O /opt/sublime-text_build-3083_amd64.deb http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb",
        require => Package['wget'],
        creates => "/opt/sublime-text_build-3083_amd64.deb",
    } ->

    package { "sublime-text":
        provider => dpkg,
        ensure => installed,
        source => "/opt/sublime-text_build-3083_amd64.deb"
    } ->

    filebucket { 'sublime_text':
        path   => "/home/${user}/.sublime_text.bkp",
    } ->

    file { "/home/${user}/.config/sublime-text-3/Packages/User/Default (Linux).sublime-keymap":
        target => "/opt/devenv/puppet-modules/devenv/files/sublime-text-3/Default (Linux).sublime-keymap",
        ensure => 'link',
        backup => 'sublime_text',
        owner  => $user,
    } ->

    file { "/home/${user}/.config/sublime-text-3/Packages/User/Package Control.sublime-settings":
        target => "/opt/devenv/puppet-modules/devenv/files/sublime-text-3/Package Control.sublime-settings",
        ensure => 'link',
        backup => 'sublime_text',
        owner  => $user,
    } ->

    file { "/home/${user}/.config/sublime-text-3/Packages/User/Preferences.sublime-settings":
        target => "/opt/devenv/puppet-modules/devenv/files/sublime-text-3/Preferences.sublime-settings",
        ensure => 'link',
        backup => 'sublime_text',
        owner  => $user,
    }

}
