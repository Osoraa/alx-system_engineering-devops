# Kills a specific process

exec {'kill_killMeNow' :
  command => '/usr/bin/pkill -f killmenow'
}
