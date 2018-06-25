# == Class: srvadmin
#
# Set up an apt repository for srvadmin
#
# === Parameters
#
# Document parameters here.
#
# [*repository_url*]
#   Where the repository is located. 
#   Defaults to http://linux.dell.com/repo/community/ubuntu
#
# [*repositories*]
#   Which repos to include.
#   Defaults to 'openmanage' 
#
# [*release*]
#   Which release to install.
#   Defaults to $::lsbdistcodename
#
# [*key_server*]
#   Link to the keyserver
#   Defaults to 'pgp.mit.edu'
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
#
# === Copyright
#
# Copyright 2017 Eigil Obrestad, unless otherwise noted.
#
class srvadmin::repo (
  $repository_url  = "http://linux.dell.com/repo/community/openmanage/910/${::lsbdistcodename}",
  $repositories    = 'main',
  $release         = $::lsbdistcodename,
  $key_server      = 'pool.sks-keyservers.net',
  $key_fingerprint = '42550ABD1E80D7C1BC0BAD851285491434D8786F',
) {

  apt::key { 'dell-key':
    id     => $key_fingerprint,
    server => $key_server,
  }

  apt::source { 'dell' :
    location => $repository_url,
    repos    => $repositories,
    release  => $release,
    require  => Apt::Key['dell-key'],
  }
}
