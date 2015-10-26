class devenv::sublime_text ( $user ) {

    exec { "Get sublime text":
        command => "wget -O /opt/sublime-text_build-3083_amd64.deb http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb",
        require => Package['wget'],
        creates => "/opt/sublime-text_build-3083_amd64.deb",
        unless  => "/usr/bin/test -s /opt/sublime_text/sublime_text",
    } ->

    package { "sublime-text":
        provider => dpkg,
        ensure => installed,
        source => "/opt/sublime-text_build-3083_amd64.deb"
    } ->

    file { "/opt/sublime-text_build-3083_amd64.deb":
        ensure => absent,
    } ->

    filebucket { 'sublime_text':
        path   => "/home/${user}/.sublime_text.bkp",
    } ->

    file { ["/home/${user}/.config/sublime-text-3", "/home/${user}/.config/sublime-text-3/Packages", "/home/${user}/.config/sublime-text-3/Packages/User", "/home/${user}/.config/sublime-text-3/Installed Packages"]:
        ensure  => 'directory',
        recurse => true,
        owner  => $user,
        group  => $user,
    } ->

    exec { "Get sublime text package manager":
        command => "wget -O /home/${user}/.config/sublime-text-3/Installed\\ Packages/Package\\ Control.sublime-package https://packagecontrol.io/Package%20Control.sublime-package",
        require => Package['wget'],
        creates => "/home/${user}/.config/sublime-text-3/Installed Packages/Package Control.sublime-package",
    } ->

    file { "/home/${user}/.config/sublime-text-3/Packages/User/Default (Linux).sublime-keymap":
        target => "/opt/devenv/puppet-modules/devenv/files/sublime-text-3/Default (Linux).sublime-keymap",
        ensure => 'link',
        backup => 'sublime_text',
        owner  => $user,
        group  => $user,
    } ->

    file { "/home/${user}/.config/sublime-text-3/Packages/User/Package Control.sublime-settings":
        target => "/opt/devenv/puppet-modules/devenv/files/sublime-text-3/Package Control.sublime-settings",
        ensure => 'link',
        backup => 'sublime_text',
        owner  => $user,
        group  => $user,
    } ->

    file { "/home/${user}/.config/sublime-text-3/Packages/User/Preferences.sublime-settings":
        target => "/opt/devenv/puppet-modules/devenv/files/sublime-text-3/Preferences.sublime-settings",
        ensure => 'link',
        backup => 'sublime_text',
        owner  => $user,
        group  => $user,
    } ->

    file { "/home/${user}/.config/sublime-text-3/Packages/User/SublimeLinter.sublime-settings":
        target => "/opt/devenv/puppet-modules/devenv/files/sublime-text-3/SublimeLinter.sublime-settings",
        ensure => 'link',
        backup => 'sublime_text',
        owner  => $user,
        group  => $user,
    } ->

    file { "/usr/local/bin/sublime":
        target => "/opt/sublime_text/sublime_text",
        ensure => 'link',
        owner  => 'root',
    }

}
