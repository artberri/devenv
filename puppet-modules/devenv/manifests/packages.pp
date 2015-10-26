class devenv::packages {

    # Installing packages
    $packages = [
        "ant",
        "aptitude",
        "autoconf",
        "bison",
        "build-essential",
        "cmatrix",
        "curl",
        "dconf-cli",
        "filezilla",
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
        "nfs-kernel-server",
        "nfs-common",
        "python",
        "python-gpgme",
        "python-pip",
        "shutter",
        "telnet",
        "tmux",
        "toilet",
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
