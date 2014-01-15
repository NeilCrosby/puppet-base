# == Define: vhost
#
# Adds and enables an Apache virtual host
#
define apache_vhosts::vhost($path = '/vagrant') {
  file {
    "/etc/apache2/sites-available/${name}":
      source  => "${path}/config/apache/${name}",
      require => Package['apache2'],
      notify  => Service['apache2'];

    "/etc/apache2/sites-enabled/${name}":
      ensure => link,
      target => "/etc/apache2/sites-available/${name}",
      notify => Service['apache2'];

    "/var/www/${name}":
      ensure => link,
      target => "${path}/sites/${name}";
  }
}