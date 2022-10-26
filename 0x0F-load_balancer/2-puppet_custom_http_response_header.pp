# A manifest to install and configure nginx

exec { 'run':
  path    => ['/usr/bin'],

  command => 'sudo apt-get update -y;
	sudo apt-get install nginx -y;
	sudo sed -i "/server_name _;/a \\\\\tadd_header X-Served-By $hostname;" /etc/nginx/sites-enabled/default;
	sudo service nginx restart',
}
