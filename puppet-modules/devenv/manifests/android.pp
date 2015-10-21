class devenv::android {

    class { 'jdk_oracle': } ->

    class { '::android': }
}
