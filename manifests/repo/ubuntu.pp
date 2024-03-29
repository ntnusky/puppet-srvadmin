# == Class: srvadmin
#
# Set up an apt repository for srvadmin
#
# === Parameters
#
# Document parameters here.
#
# [*repositories*]
#   Which repos to include.
#   Defaults to 'main'
#
# [*release*]
#   Which release to install.
#   Defaults to $::lsbdistcodename
#
# [*key_server*]
#   Link to the keyserver
#   Defaults to 'pool.sks-keyservers.net'
#
# [*key_fingerprint*]
#   The key fingerprint.
#   Defaults to '42550ABD1E80D7C1BC0BAD851285491434D8786F'
#
# === Examples
#
#  class { 'srvadmin::repo':
#    repository_url  => 'http://linux.dell.com/repo/community/ubuntu'
#    repositories    => 'openmanage'
#    release         => $::lsbdistcodename
#    key_server      => 'pgp.mit.edu'
#    key_fingerprint => '42550ABD1E80D7C1BC0BAD851285491434D8786F'
#  }
#
# === Authors
#
# Eigil Obrestad <eigil-git@obrestad.org>
# Lars Erik Pedersen <pedersen.larserik+git@gmail.com>
#
# === Copyright
#
# Copyright 2017-2023 Eigil Obrestad, unless otherwise noted.
#
class srvadmin::repo::ubuntu (
  $repositories    = 'main',
  $release         = $::lsbdistcodename,
  $key_source      = 'https://linux.dell.com/repo/pgp_pubkeys/0x1285491434D8786F.asc',
  $key_fingerprint = '42550ABD1E80D7C1BC0BAD851285491434D8786F',
) {

  case $::lsbdistcodename {
    'xenial': { $version = '910' }
    'bionic': { $version = '930' }
    'focal': { $version = '950' }
    'jammy': { $version = '11000' }
    default:  { fail("${::lsbdistcodename} is not supported.") }
  }

  $repository_url = "http://linux.dell.com/repo/community/openmanage/${version}/${::lsbdistcodename}"

  apt::key { 'dell-key':
    id     => $key_fingerprint,
    source => $key_source,
  }

  apt::source { 'dell' :
    location => $repository_url,
    repos    => $repositories,
    release  => $release,
    require  => Apt::Key['dell-key'],
    notify   => Exec['apt_update'],
  }
}
