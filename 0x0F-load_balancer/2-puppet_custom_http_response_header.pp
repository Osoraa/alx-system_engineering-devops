# A manifest to install and configure nginx

exec { 'run':
  path    => ['/usr/bin', '/usr/sbin'],

  command => "sudo apt-get update -y;
	sudo apt-get install nginx -y;
	sudo sed -i '/server_name _;/a \\\\\tadd_header X-Served-By \$HOSTNAME;' /etc/nginx/sites-enabled/default; service nginx restart"
}
