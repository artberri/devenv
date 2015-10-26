class devenv::dotfiles ( $user ) {

    filebucket { 'dotfiles':
        path   => "/home/${user}/.dotfiles.bkp",
    } ->

    file { "/home/${user}/.bashrc":
        target => "/opt/devenv/puppet-modules/devenv/files/dotfiles/.bashrc",
        ensure => 'link',
        backup => 'dotfiles',
        owner  => $user,
    } ->

    file { "/home/${user}/.git-completion.bash":
        target => "/opt/devenv/puppet-modules/devenv/files/dotfiles/.git-completion.bash",
        ensure => 'link',
        backup => 'dotfiles',
        owner  => $user,
    } ->

    file { "/home/${user}/.git-prompt.sh":
        target => "/opt/devenv/puppet-modules/devenv/files/dotfiles/.git-prompt.sh",
        ensure => 'link',
        backup => 'dotfiles',
        owner  => $user,
    } ->

    file { "/home/${user}/.zshrc":
        target => "/opt/devenv/puppet-modules/devenv/files/dotfiles/.zshrc",
        ensure => 'link',
        backup => 'dotfiles',
        owner  => $user,
    } ->

    file { "/home/${user}/.tmux.conf":
        target => "/opt/devenv/puppet-modules/devenv/files/dotfiles/.tmux.conf",
        ensure => 'link',
        backup => 'dotfiles',
        owner  => $user,
    }

}
