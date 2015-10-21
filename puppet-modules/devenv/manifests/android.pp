class devenv::android {

    class { 'jdk_oracle': } ->

    class { '::android':
        version => '24.4.1',
    } ->

    android::platform { 'android-23': } ->

    android::build_tools { 'build-tools-23.0.1': } ->

    android::extra { 'extra-google-google_play_services': } ->

    android::extra { 'extra-google-m2repository': } ->

    android::extra { 'extra-android-m2repository': } ->

    android::extra { 'extra-android-support': }
}
