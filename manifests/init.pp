# == Class: motd
#
# Module to manage motd
#
class motd (

) {

  case $::role {
    'puppetmaster': {
      $banner='I am the puppet master'
    }
    'webserver': {
      $banner='I am web server'
    }
    default: {
     fail('I do not know what I am ')
    }
  }

  file { '/etc/motd':
    ensure  => file,
    content => $banner,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
