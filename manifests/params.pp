# == Class ganesha::params
#
# This class manages the default params for the ganesha class.
#
# [*manage_repo*] Whether we should manage the local repository (true) or depend
#   on what is available (false). Set this to false when you want to manage the
#   the repo by yourself.
#   Optional. Defaults to true
# [*base_url*] Ganesha repository base URL which is used when manage_repo=true
#   Optional.
# [*repo_url*] Ganesha repository URL which is used when manage_repo=true and
#   base_url is not set.
#   Optional.
class ganesha::params {
  $service_enable    = true
  $service_ensure    = 'running'
  $service_manage    = true
  $manage_repo       = true
  $repo_url          = 'https://shaman.ceph.com/api/repos/nfs-ganesha/next/latest/centos/7/flavors/ceph_master/repo'
}
