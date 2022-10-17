# Creates a configuration file for simple ssh

$content = @("EOF" /L)
	Home 35.175.212.77
		Batchmode yes
		IdentityFile ~/.ssh/school
	| -EOF

$file = config

exec {'update_ssh_config':
    cwd     => '/home/osoraa/.ssh',
    path    => '/usr/bin',
    command => "echo '${content}' >> ${file}"
}
