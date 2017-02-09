class devenv::dotfiles ( $user ) {

    filebucket { 'dotfiles':
        path   => "/home/${user}/.dotfiles.bkp",
    }

    file { "/home/${user}/.config/powerline":
        ensure  => directory,
        owner   => $user,
        group   => $user,
        mode    => '0700',
    } ->

    file { "/home/${user}/.config/powerline/themes":
        ensure  => directory,
        owner   => $user,
        group   => $user,
        mode    => '0700',
    } ->

    file { "/home/${user}/.config/powerline/themes/shell":
        ensure  => directory,
        owner   => $user,
        group   => $user,
        mode    => '0700',
    }

    ensure_resources('file', {
        "/home/${user}/.bashrc"                       => {
            target => "/home/${user}/devenv/puppet-modules/devenv/files/dotfiles/.bashrc",
        },
        "/home/${user}/.zshrc"                       => {
            target => "/home/${user}/devenv/puppet-modules/devenv/files/dotfiles/.zshrc",
        },
        "/home/${user}/.git-completion.bash" => {
            target => "/home/${user}/devenv/puppet-modules/devenv/files/dotfiles/.git-completion.bash",
        },
        "/home/${user}/.tmux.conf"                    => {
            target => "/home/${user}/devenv/puppet-modules/devenv/files/dotfiles/.tmux.conf",
        },
        "/home/${user}/.vimrc"                        => {
            target => "/home/${user}/devenv/puppet-modules/devenv/files/dotfiles/.vimrc",
        },
        "/home/${user}/.inputrc"                      => {
            target => "/home/${user}/devenv/puppet-modules/devenv/files/dotfiles/.inputrc",
        },
        "/home/${user}/.config/powerline/config.json" => {
            target => "/home/${user}/devenv/puppet-modules/devenv/files/dotfiles/powerline/config.json",
            require => File["/home/${user}/.config/powerline"],
        },
        "/home/${user}/.config/powerline/themes/shell/artberri.json" => {
            target => "/home/${user}/devenv/puppet-modules/devenv/files/dotfiles/powerline/artberri.json",
            require => File["/home/${user}/.config/powerline/themes/shell"],
        },
    }, {
        ensure  => 'link',
        backup  => 'dotfiles',
        owner   => $user,
        require => Filebucket['dotfiles'],
    })

}
