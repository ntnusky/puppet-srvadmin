# Parameters for srvadmin module

class srvadmin::params {
  case $::osfamily {
    'RedHat': {
      $openssldev_package = 'openssl-devel'
    }
    'Debian': {
      $openssldev_package = 'libssl-dev'
    }
    default: {
      fail("Unsopprted osfamily: ${::osfamily}")
    }
  }
}
