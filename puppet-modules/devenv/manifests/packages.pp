class devenv::packages {

    # Installing packages
    $packages = [
        "ant",
        "aptitude",
        "autoconf",
        "bison",
        "build-essential",
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
        "portmap",
        "python",
        "python-gpgme",
        "python-pip",
        "screen",
        "shutter",
        "telnet",
        "ttf-mscorefonts-installer",
        "vagrant",
        "vim",
        "virtualbox",
        "wireshark",
        "whois",
        "zlib1g-dev",
        "zsh",
    ]

    package { $packages: ensure => "installed" }

}
