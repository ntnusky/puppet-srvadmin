# == Class: srvadmin
#
# Set up an apt repository for srvadmin
#
# === Authors
#
# Eigil Obrestad <eigil-git@obrestad.org>
# Lars Erik Pedersen <pedersen.larserik+git@gmail.com>
#
# === Copyright
#
# Copyright 2017 Eigil Obrestad, unless otherwise noted.
#
class srvadmin::repo {

  case $::facts['os']['family'] {
    'Debian': { include ::srvadmin::repo::ubuntu }
    'RedHat': { include ::srvadmin::repo::redhat }
    default: { fail( "${::facts['os']['family']} is not supported") }
  }
}
