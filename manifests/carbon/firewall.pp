class graphite::carbon::firewall($ports = [2003,2004]) {
  firewall { '500 allow graphite-carbon inbound traffic':
    action => 'accept',
    state  => 'NEW',
    dport  => $ports,
    proto  => 'tcp',
  }
}
