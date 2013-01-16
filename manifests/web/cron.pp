class graphite::web::cron {
  cron { 'Graphite search index update':
    ensure      => present,
    command     => '/usr/bin/build-index.sh',
    environment => 'GRAPHITE_STORAGE_DIR=/var/lib/graphite-web/',
    minute      => '*/30'
  }
}
