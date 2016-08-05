class nginx( 
   $package = $nginx::params::package,
   $owner = $nginx::params::owner,
   $group = $nginx::params::group,
   $docroot = $nginx::params::docroot,
   $servblock = $nginx::params::servblock,
   $confdir = $nginx::params::confdir,
   $logpath = $nginx::params::logpath,
   $user = $nginx::params::_user,
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
