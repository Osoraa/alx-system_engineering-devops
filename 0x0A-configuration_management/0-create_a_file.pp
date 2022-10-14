file {"create_file":
	path => "/tmp/school",
	ensure => file,
	owner => "www-data",
	group => "www-data",
	content => "I love Puppet"
}
