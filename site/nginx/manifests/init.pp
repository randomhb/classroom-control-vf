class nginx {
  case $::os['family'] {
    'redhat', 'debian' : {
      $owner    = 'root'
      $group    = 'root'
      $package  = 'nginx'
      $docroot  = '/var/www'
      $confdir  = '/etc/nginx'
      $blockdir = "${confdir}/conf.d"
      $logdir   = '/var/log/nginx'
    }
    'windows' : {
      $owner    = 'Administrator'
      $group    = 'Administrators'
      $package  = 'nginx'
      $docroot  = 'C:/ProgramData/nginx/html'
      $confdir  = 'C:/ProgramData/nginx'
      $blockdir = "${confdir}/conf.d"
      $logdir   = "${confdir}/logs"
    }
    default : {
      fail("Module ${module_name} is not supported on ${os['family']}")
    }
  }

  $user = $::os['family'] ? {
    'redhat'  => 'nginx',
    'debian'  => 'www-data',
    'windows' => 'nobody',
  }
  
  package { $package:
    ensure => present,
  }
  ################################
  
  $user = $::os[;family'] ? {
    'redhat' => 'nginx',
    'debian' => 'www-data',
    'windows' => 'nobody',
  }
  
  file { '$docroot':
    ensure => 'directory',
  }
  
  
  
  
  
  
  
  
  #################################
  
  File {
    owner => 'root',
    group => 'root',
    ensure  => 'file',
  }
  
  file { '/var/www':
    ensure => 'directory',
  }
  
  file { '/etc/nginx/conf.d/default.conf':
    source  => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
  
  file { '/etc/nginx/nginx.conf':
    source  => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
  
  file { '/var/www/index.html':
    source => 'puppet:///modules/nginx/index.html',
  }
  
  service { 'nginx':
    ensure     => running,
    enable     => true,
    hasrestart => 'true',
  }

}
