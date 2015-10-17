class devenv::sublime_text ( $user ) {

    filebucket { 'sublime_text':
        path   => "/home/${user}/.sublime_text.bkp",  
    } -> 

    file { "/home/${user}/.config/sublime-text-3/Packages/User/Default (Linux).sublime-keymap":
        source => "puppet:///modules/devenv/sublime-text-3/Default (Linux).sublime-keymap",
        ensure => 'file',
        backup => 'sublime_text',
    } -> 

    file { "/home/${user}/.config/sublime-text-3/Packages/User/Package Control.sublime-settings":
        source => "puppet:///modules/devenv/sublime-text-3/Package Control.sublime-settings",
        ensure => 'file',
        backup => 'sublime_text',
    } -> 

    file { "/home/${user}/.config/sublime-text-3/Packages/User/Preferences.sublime-settings":
        source => "puppet:///modules/devenv/sublime-text-3/Preferences.sublime-settings",
        ensure => 'file',
        backup => 'sublime_text',
    }

}
