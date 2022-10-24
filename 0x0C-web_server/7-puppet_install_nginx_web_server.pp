# A manifest to install and configure nginx

package {'nginx':
    provider => 'apt',
}

# Default nginx config file (heredoc)
$config = '@("EOF" /L)
	server {
		listen 80 default_server;
		listen [::]:80 default_server;

		root /var/www/html;

		index.html;

		server_name _;
		rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;

		location / {
			try_files $uri $uri/ =404;
		}
	}
	| -EOF'

# Configures nginx with required configurations
exec {'Config script':
  path    => '/usr/bin',
  command => "echo '${config}' | sudo tee /etc/nginx/sites-enabled/default"
}

# Default page
exec {'Default file':
  path    => '/usr/bin',
  command => "echo 'Hello World!' | sudo tee /var/nginx/html/index.html"
}
