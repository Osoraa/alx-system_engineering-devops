# Kills a specific process

exec {'kill_killMeNow' :
  command => '/ur/bin/pkill -f killmenow'
}
