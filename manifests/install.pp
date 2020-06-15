# == Class: srvadmin
#
# Installs srvadmin
#
# === Examples
#
#  include ::srvadmin::install
#
# === Authors
#
# Eigil Obrestad <eigil-git@obrestad.org>
#
# === Copyright
#
# Copyright 2017 Eigil Obrestad, unless otherwise noted.
#

class srvadmin::install {

  include ::srvadmin::params

  # Install srvadmin-all
  package { 'srvadmin-all':
    ensure  => 'present',
    require => Class['::srvadmin::repo'],
  }

  # Install libssl-dev, as that apparently is a dependency...
  package { $::srvadmin::params::openssldev_package:
    ensure => 'present',
  }

  file { '/usr/local/bin/racadm':
    ensure  => 'link',
    source  => '/opt/dell/srvadmin/sbin/racadm',
    require => Package['srvadmin-all'],
  }
}
