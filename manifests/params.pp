# Parameters for srvadmin module

class srvadmin::params {
  case $::facts['os']['family'] {
    'RedHat': {
      $openssldev_package = 'openssl-devel'
    }
    'Debian': {
      $openssldev_package = 'libssl-dev'
    }
    default: {
      fail("Unsopprted osfamily: ${::facts['os']['family']}")
    }
  }
}
