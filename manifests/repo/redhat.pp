# Install repository for Dell OMSA on RHEL like systems
# This will mimic the script Dell provdides for adding the repos

class srvadmin::repo::redhat {

  $gpgkeys = [
    'https://linux.dell.com/repo/pgp_pubkeys/0x756ba70b1019ced6.asc',
    'https://linux.dell.com/repo/pgp_pubkeys/0x1285491434D8786F.asc',
    'https://linux.dell.com/repo/pgp_pubkeys/0xca77951d23b66a9d.asc'
  ]

  yumrepo { 'dell-system-update_independent':
    ensure   => 'present',
    descr    => $name,
    baseurl  => 'https://linux.dell.com/repo/hardware/dsu/os_independent/',
    gpgkey   => join($gpgkeys, ' '),
    gpgcheck => '1',
    enabled  => '1',
    exclude  => 'dell-system-update*.i386'
  }

  yumrepo { 'dell-system-update_dependent':
    ensure     => 'present',
    descr      => $name,
    mirrorlist => 'https://linux.dell.com/repo/hardware/dsu/mirrors.cgi?osname=el$releasever&basearch=$basearch&native=1',
    gpgkey     => join($gpgkeys, ' '),
    gpgcheck   => '1',
    enabled    => '1',
  }
}

