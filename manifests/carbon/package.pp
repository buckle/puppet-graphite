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
class graphite::carbon::package {
  package {'carbon':
    ensure  => present,
    require => Yumrepo['bke'],
  }
}
