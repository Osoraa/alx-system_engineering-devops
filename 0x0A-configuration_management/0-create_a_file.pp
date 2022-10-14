file {'create_file':
  ensure  => file,
  path    => '/tmp/school',
  owner   => 'www-data',
  group   => 'www-data',
  content => 'I love Puppet'
}
