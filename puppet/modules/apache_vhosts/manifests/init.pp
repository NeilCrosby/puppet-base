# == Class: apache_vhosts
#
# Adds and enables virtual hosts. Sets up /var/www symlinks.
#
class apache_vhosts ($vhost = 'static-site') {
  file { '/var/www':
    ensure => directory;
  }

  apache_vhosts::vhost { $vhost: }
}