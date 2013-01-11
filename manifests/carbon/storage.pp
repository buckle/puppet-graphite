define graphite::carbon::storage(
  $order = 50,
  $pattern,
  $retentions
) {
  concat::fragment { $name:
    target  => '/etc/carbon/storage-schemas.conf',
    order   => $order,
    content => template('graphite/storage-schemas.erb'),
    notify  => Service['carbon-cache']
  }
}
