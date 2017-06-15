# == Class: ganesha
#
# Installs and configures nfs-ganesha
#
class ganesha (
  $service_enable    = $ganesha::params::service_enable,
  $service_ensure    = $ganesha::params::service_ensure,
  $service_manage    = $ganesha::params::service_manage,
) inherits ::ganesha::params {

  # Validate OS family
  case $::osfamily {
    'RedHat': {}
    default: {
        fail("Unsupported OS family: ${::osfamily}")
    }
  }

  # Validate OS
  case $::operatingsystem {
    'centos', 'redhat': {
      if $::operatingsystemmajrelease != '7' {
        # RHEL/CentOS versions < 7 not supported as they lack systemd
        fail("Unsupported OS: ${::operatingsystem} ${::operatingsystemmajrelease}")
      }
    }
    default: {
      fail("Unsupported OS: ${::operatingsystem}")
    }
  }

  class { '::ganesha::install': } ->
  class { '::ganesha::config': } ~>
  class { '::ganesha::service': } ->
  Class['::ganesha']

}
