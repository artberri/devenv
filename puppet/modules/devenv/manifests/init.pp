class devenv {
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
        command => "pip install --user powerline-status"
    }
}