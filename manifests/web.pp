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

  file { '/etc/logrotate.d/graphite-web':
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => "puppet:///modules/${module_name}/graphite-web-logrotate.conf",
  }
}

