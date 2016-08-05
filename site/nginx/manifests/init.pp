class nginx( 
   $package = $nginx::params::package,
   $owner = $nginx::params::owner,
   $group = $nginx::params::group,
   $root_dir = $nginx::params::root_dir,
   $document_dir = $nginx::params::document_dir,
   $conf_dir = $nginx::params::conf_dir,
   $log_dir = $nginx::params::log_dir,
   $service_name = $nginx::params::service_name,
   $service_user = $nginx::params::service_user,
   )
  inherits nginx::params {
  
  package { $package:
    ensure => present,
  }
  
  File {
    ensure => file,
    owner  => $owner,
    group  => $group,
    mode   => '0664',
  }
  
  file { $docroot:
    ensure => directory,
  }
  
  file { "${docroot}/index.html":
    source => 'puppet:///modules/nginx/index.html',
  }
  
  file { 'default.conf':
    path   => "${servblock}/default.conf",
    source => 'puppet:///modules/nginx/default.conf',
  }
  
  file { 'nginx.conf':
    path   => "${confdir}/nginx.conf",
    source => 'puppet:///modules/nginx/nginx.conf',
  }
  
  service { 'nginx':
    ensure    => running,
    enable    => true,
    subscribe => [ File['default.conf'], File['nginx.conf'] ],
  }
}
