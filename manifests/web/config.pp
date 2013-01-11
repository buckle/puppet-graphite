# Class: graphite
#
# This module manages graphite
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class graphite::web::config ($time_zone = 'America/Chicago'){
  Class['graphite::web::package'] ~> Class['graphite::web::config']

  file {'local_settings.py':
    ensure    => file,
    path      => '/etc/graphite-web/local_settings.py',
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    notify    => $graphite::web::manage_httpd ? {
                  true    => Service['httpd'],
                  default => undef,
                  },
    content   => template('graphite/local_settings.py.erb');
  }
}
