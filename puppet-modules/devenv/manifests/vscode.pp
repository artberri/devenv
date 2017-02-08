class devenv::vscode ( $user ) {

    exec { 'Get Visual Studio Code Insiders':
        command => "/usr/bin/wget -O /home/${user}/Downloads/code-insiders.deb https://go.microsoft.com/fwlink/?LinkID=760865",
        require => Package['wget'],
        creates => "/home/${user}/Downloads/code-insiders.deb",
        user    => $user,
    } ->

    exec { 'Install Visual Studio Code Insiders':
        command => "dpkg -i /home/${user}/Downloads/code-insiders.deb",
        user    => $user,
        creates => '/usr/bin/code-insiders',
    } 

}
