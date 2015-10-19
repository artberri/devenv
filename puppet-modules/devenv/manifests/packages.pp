class devenv::packages {

    # Installing packages
    $packages = [
        "autoconf",
        "bison",
        "build-essential",
        "curl",
        "dconf-cli",
        "gimp",
        "git",
        "inkscape",
        "libgdbm3",
        "libgdbm-dev",
        "libffi-dev",
        "libncurses5-dev",
        "libreadline6-dev",
        "libssl-dev",
        "make",
        "python",
        "python-pip",
        "telnet",
        "ttf-mscorefonts-installer",
        "vagrant",
        "vim",
        "virtualbox",
        "whois",
        "zlib1g-dev",
        "zsh",
    ]

    package { $packages: ensure => "installed" }

}
