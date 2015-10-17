class devenv ( $user ) {

    Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin/" ] }

    # Installing packages
    $packages = [
        "build-essential",
        "curl",
        "gimp",
        "git",
        "inkscape",
        "python",
        "python-pip",
        "telnet",
        "ttf-mscorefonts-installer",
        "vagrant",
        "vim",
        "virtualbox",
        "wget",
        "whois",
        "zsh",
    ]
    package { $packages: ensure => "installed" } ->

    exec { "Installing powerline":
        user    => $user,
        command => "pip install --user powerline-status",
        creates => "/home/${user}/.local/bin/powerline-config"
    } ->

    powerline::install { $user: } ->

    file { "/opt/devenv/relink.sh":
        mode => 755,
    } ->

    exec { "Relinking dotfiles":
        user    => $user,
        command => "/opt/devenv/relink.sh"
    }

}