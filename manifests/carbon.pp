# = Class: graphite::carbon
#
# Install carbon and enable carbon.
#
# == Actions:
#
# Installs the carbon package and enables the carbon service.
#
# == Todo:
#
# * Update documentation
#
class graphite::carbon($monitor = hiera('monitor', true)) {

  include graphite::carbon::package
  include graphite::carbon::config
  include graphite::carbon::firewall
  include graphite::carbon::service
  if $monitor == true {
    include graphite::carbon::monitor
  }
}

