class graphite::web::cron {
  cron { 'Graphite search index update':
    ensure      => present,
    command     => '/usr/bin/build-index.sh > /dev/null',
    environment => [ 'GRAPHITE_STORAGE_DIR=/var/lib/graphite-web/', 'WHISPER_DIR=/var/lib/carbon/whisper' ],
    minute      => '*/30'
  }
}
