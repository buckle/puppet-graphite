class graphite::whisper::package {
  package {'whisper':
    ensure  => present,
    require => Yumrepo['bke'],
  }
}
