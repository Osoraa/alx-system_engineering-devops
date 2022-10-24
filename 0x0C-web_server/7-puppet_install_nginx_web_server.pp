# A manifest to install and configure nginx

package {'nginx':
    provider => 'apt'
}

# Default nginx config file (heredoc)
$config = @(EOF /L)
	server {
		listen 80 default_server;
		listen [::]:80 default_server;

		root /var/www/html;

		index index.html;

		server_name _;
		rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;

		location / {
			try_files $uri $uri/ =404;
		}
	}
	| -EOF

# Default file
exec {'Default file':
  path    => '/usr/bin',
  command => "echo 'Hello World!' | sudo tee /var/www/html/index.html"
}

# Configures nginx with required configurations
exec {'Config script':
  path    => '/usr/bin',
  command => "echo '${config}' | sudo tee /etc/nginx/sites-enabled/default"
}

# Restart nginx
exec {'Restart nginx':
	path    => ['/usr/bin', '/usr/sbin'],
	command => 'service nginx restart'
}
