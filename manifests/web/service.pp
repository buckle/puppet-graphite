class graphite::web::service {
  Class['graphite::web::package'] ~> Class['graphite::web::service']
  include bke_firewall::http_server
  service { 'httpd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }
}
