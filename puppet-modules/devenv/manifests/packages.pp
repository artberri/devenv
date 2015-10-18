class devenv::packages {

    # Installing packages
    $packages = [
        "build-essential",
        "curl",
        "dconf-cli",
        "gimp",
        "git",
        "inkscape",
        "make",
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

    package { $packages: ensure => "installed" }

}
