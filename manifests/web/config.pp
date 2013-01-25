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
class graphite::web::config (
  $time_zone        = 'America/Chicago',
  $ldap_uri         = undef,
  $ldap_base_user   = undef,
  $ldap_search_base = undef,
  $ldap_base_pass   = undef,
  $ldap_user_query  = undef,
){
  Class['graphite::web::package'] ~> Class['graphite::web::config']

  if $ldap_uri != undef {
    realize(Package['python-ldap'])
  }

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
