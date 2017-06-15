# == Class ganesha::install
#
# Manages the installation of ganesha.
#
class ganesha::install {
  # Add ganesha's Yum repository
  if $::ganesha::manage_repo {
    if $::ganesha::base_url {
      yumrepo { 'ganesha':
        baseurl  => $::ganesha::base_url,
        descr    => 'ganesha packages',
        enabled  => 1,
        gpgcheck => 0,
      }
    } elsif $::ganesha::repo_url {
      file { '/etc/yum.repos.d/ganesha.repo':
        ensure => present,
        source => $::ganesha::repo_url,
      }
    }
  }

  package { 'nfs-ganesha':
    ensure  => present,
  }

  package { 'nfs-ganesha-ceph':
    ensure  => present,
  }
}
