class nginx {
  case $::os['family'] {
    'redhat', 'debian' : {
      $owner    = 'root'
      $group    = 'root'
      $package  = 'nginx'
      $docroot  = '/var/www/'
      $confdir  = '/etc/nginx/'
      $servblock = "${confdir}/conf.d/"
      $logpath   = '/var/log/nginx/'
    }
    'windows' : {
      $owner    = 'Administrator'
      $group    = 'Administrators'
      $package  = 'nginx'
      $docroot  = 'C:/ProgramData/nginx/html/'
      $confdir  = 'C:/ProgramData/nginx/'
      $servblock = "${confdir}/conf.d/"
      $logpath   = "${confdir}/logs/"
    }
    default : {
      fail("Module ${module_name} is not supported on ${::os['family']}")
    }
  }

  $user = $::os['family'] ? {
    'redhat'  => 'nginx',
    'debian'  => 'web-data',
    'windows' => 'nobody',
    default => 'nobody',
  }
  
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
