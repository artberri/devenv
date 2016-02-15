class devenv::vscode ( $user ) {

    exec { "Get Visual Studio Code":
        command => "wget -O /opt/VSCode-linux-x64-stable.zip https://az764295.vo.msecnd.net/stable/db71ac615ddf9f33b133ff2536f5d33a77d4774e/VSCode-linux-x64-stable.zip",
        require => Package['wget'],
        creates => "/opt/VSCode-linux-x64-stable.zip",
        unless  => "/usr/bin/test -s /opt/vscode/code",
    } ->

    exec { 'unzip':
        command => 'unzip /opt/VSCode-linux-x64-stable.zip -d /opt/ && mv /opt/VSCode-linux-x64 /opt/vscode',
        user    => $user,
        require => Exec["Get Visual Studio Code"],
        creates => '/opt/vscode',
    } ->

    file { '/usr/local/bin/code':
        target => "/opt/vscode/Code",
        ensure => 'link',
        owner  => 'root',
    } ->

    filebucket { 'vscode':
        path   => "/home/${user}/.vscode.bkp",
    } ->

    file { ["/home/${user}/.config/Code", "/home/${user}/.config/Code/User"]:
        ensure  => 'directory',
        recurse => true,
        owner  => $user,
        group  => $user,
    } ->

    file { "/home/${user}/.config/Code/User/settings.json":
        target => "/opt/devenv/puppet-modules/devenv/files/vscode/settings.json",
        ensure => 'link',
        backup => 'vscode',
        owner  => $user,
        group  => $user,
    }

}
