# = Class: graphite::web
#
# Installs the graphite webfontend.
#
# == Actions:
#
# Installs packages for graphite web frontend.
#
# == Requires:
#
# Running web server.
#
# == Todo:
#
# * Update documentation
#
class graphite::web ($manage_httpd = false) {
  include graphite::web::package
  include graphite::web::config
  include graphite::web::cron

  if $graphite::web::manage_httpd {
    include graphite::web::service
  }

  logrotate::rule { 'graphite-web':
    path          => '/var/log/graphite-web/*.log',
    missingok     => true,
    ifempty       => false,
    sharedscripts => true,
    delaycompress => true,
    postrotate    => '/sbin/service httpd reload > /dev/null 2>/dev/null || true',
  }
}

