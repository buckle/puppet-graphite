class graphite::carbon::monitor {
  include concat::setup
  include nagios::target::params
  @@nagios_service { "check_nrpe_carbon_proc_${::fqdn}":
    check_command       => 'check_nrpe!check_procs_carbon',
    use                 => 'generic-service',
    host_name           => $::fqdn,
    notification_period => '24x7',
    service_description => "${::hostname} Carbon Process Running",
  }
  concat::fragment {"${::fqdn} check_procs carbon":
    target   => "/etc/nrpe.d/10-${::hostname}-checks.cfg",
    content  => inline_template(
      'command[check_procs_carbon]=<%= scope.lookupvar(\'nagios::target::params::nagios_plugin_dir\') %>/check_procs -u carbon -C carbon-cache.py -c 1:2'
    ),
  }
}
