class devenv::dotfiles ( $user ) {

    filebucket { 'dotfiles':
        path   => "/home/${user}/.dotfiles.bkp",  
    } -> 

    file { "/home/${user}/.bashrc":
        source => "puppet:///modules/devenv/dotfiles/.bashrc",
        ensure => 'file',
        backup => 'dotfiles',
    } -> 

    file { "/home/${user}/.git-completion.bash":
        source => "puppet:///modules/devenv/dotfiles/.git-completion.bash",
        ensure => 'file',
        backup => 'dotfiles',
    } -> 

    file { "/home/${user}/.git-prompt.sh":
        source => "puppet:///modules/devenv/dotfiles/.git-prompt.sh",
        ensure => 'file',
        backup => 'dotfiles',
    } -> 

    file { "/home/${user}/.zshrc":
        source => "puppet:///modules/devenv/dotfiles/.zshrc",
        ensure => 'file',
        backup => 'dotfiles',
    } 

}
