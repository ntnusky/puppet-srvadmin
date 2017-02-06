# == Class: srvadmin
#
# Sets up repos and installs srvadmin
#
# === Examples
#
# include ::srvadmin
#
# === Authors
#
# Eigil Obrestad <eigil-git@obrestad.org>
#
# === Copyright
#
# Copyright 2017 Eigil Obrestad, unless otherwise noted.
#
class srvadmin {
  class { '::srvadmin::repo' : } ->
  class { '::srvadmin::install' : }
}
