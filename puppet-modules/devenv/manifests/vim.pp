class devenv::vim ( $user ) {

    $home_dir = "/home/${user}"

    package { 'vim':
        ensure => installed,
    } ->

    file { [
        "${home_dir}/.vim",
        "${home_dir}/.vim/autoload",
        "${home_dir}/.vim/bundle",
        ] :
        ensure => 'directory',
        owner  => $user,
    } ->

    exec { 'download pathogen':
        creates => "${home_dir}/.vim/autoload/pathogen.vim",
        command => "curl -LSso ${home_dir}/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim",
        user    => $user,
        require => [Package['curl'], File["${home_dir}/.vim"]]
    } ->

    exec { 'clone vim-sensible':
        command => "git clone git://github.com/tpope/vim-sensible.git ${home_dir}/.vim/bundle/vim-sensible",
        creates => "${home_dir}/.vim/bundle/vim-sensible",
        require => Package['git'],
        user    => $user,
    } ->

    exec { 'clone vim-sleuth':
        command => "git clone git://github.com/tpope/vim-sleuth.git ${home_dir}/.vim/bundle/vim-sleuth",
        creates => "${home_dir}/.vim/bundle/vim-sleuth",
        require => Package['git'],
        user    => $user,
    } ->

    exec { 'clone vim-gitgutter':
        command => "git clone git://github.com/airblade/vim-gitgutter.git ${home_dir}/.vim/bundle/vim-gitgutter",
        creates => "${home_dir}/.vim/bundle/vim-gitgutter",
        require => Package['git'],
        user    => $user,
    } ->

    exec { 'clone powerline/powerline':
        command => "git clone git://github.com/powerline/powerline.git ${home_dir}/.vim/bundle/powerline",
        creates => "${home_dir}/.vim/bundle/powerline",
        require => Package['git'],
        user    => $user,
    }

}
