# Installs the flask package from pip3

package {'flask':
  ensure   => 2.1.0,
  provider => pip3,
  commapd  => '/usr/bin/pip3 install Flask',
}

# package {'Werkzeug':
#  ensure   => 2.1.1,
#  provider => pip3,
#  }
