# Creates a configuration file for simple ssh

$content = @("EOF" /L)
	Home 35.175.212.77
		Batchmode yes
		IdentityFile ~/.ssh/school
	| -EOF

$file = 'ssh_config'

exec {'update_ssh_config':
    cwd     => '/etc/ssh',
    path    => '/usr/bin',
    command => "echo '${content}' >> ${file}"
}
