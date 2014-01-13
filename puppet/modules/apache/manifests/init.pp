# == Class: apache
#
# Installs packages for Apache and sets config files.
#
class apache {
#  require ondrejppa

  package { ['apache2', 'apache2-mpm-prefork']:
    ensure => present,
    #require => Class['ondrejppa'];
  }

  service { 'apache2':
    ensure  => running,
    require => Package['apache2'];
  }

  apache::conf { ['apache2.conf', 'envvars', 'ports.conf']: }
  apache::module { ['expires.load', 'proxy.conf', 'proxy.load', 'rewrite.load']: }
}