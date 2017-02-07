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
  package { 'srvadmin-all':
    ensure => 'present',
  }
}
