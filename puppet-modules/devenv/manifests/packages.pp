class devenv::packages {

    # Installing packages
    $packages = [
        "aptitude",
        "autoconf",
        "bison",
        "build-essential",
        "curl",
        "dconf-cli",
        "gimp",
        "git",
        "inkscape",
        "libappindicator1",
        "libgdbm3",
        "libgdbm-dev",
        "libffi-dev",
        "libncurses5-dev",
        "libreadline6-dev",
        "libssl-dev",
        "make",
        "python",
        "python-gpgme",
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
