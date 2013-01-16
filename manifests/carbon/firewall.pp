class graphite::carbon::firewall(
  $carbon_enabled = true,
  $carbon_port    = '2003',
  $pickle_enabled = false,
  $pickle_port    = '2004'
) {

  if $carbon_enabled == true {
    firewall { '500 allow graphite-carbon inbound traffic':
      action => 'accept',
      state  => 'NEW',
      dport  => $carbon_port,
      proto  => 'tcp',
    }
    @@nagios_service { "check_tcp_carbon_${carbon_port}_${::fqdn}":
      check_command       => "check_tcp!${carbon_port}",
      use                 => 'generic-service',
      host_name           => $::fqdn,
      notification_period => '24x7',
      service_description => "${::hostname} carbon port ${carbon_port} Listening",
    }
  }
  if $pickle_enabled == true {
    firewall { '500 allow graphite-pickle inbound traffic':
      action => 'accept',
      state  => 'NEW',
      dport  => $pickle_port,
      proto  => 'tcp',
    }
    @@nagios_service { "check_tcp_pickle_${pickle_port}_${::fqdn}":
      check_command       => "check_tcp!${pickle_port}",
      use                 => 'generic-service',
      host_name           => $::fqdn,
      notification_period => '24x7',
      service_description => "${::hostname} pickle port ${pickle_port} Listening",
    }
  }
}
