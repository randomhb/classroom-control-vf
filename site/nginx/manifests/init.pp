class nginx {

  package { 'nginx':
    ensure => present,
  }
  
  File {
    owner => 'root',
    group => 'root',
    ensure  => 'file',
  }
  
  file { '/var/www':
    ensure => 'directory',
  }
  
  file { 'default.conf':
    source  => 'puppet:///modules/nginx/default.conf',
    path    => '/etc/nginx/conf.d/default.conf',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
  
  file { 'nginx.conf':
    source  => 'puppet:///modules/nginx/nginx.conf',
    path    => '/etc/nginx/nginx.conf',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
  
  file { 'index.html':
    source => 'puppet:///modules/nginx/index.html',
    path   => '/var/www/index.html',
  }
  
  service { 'nginx':
    ensure     => running,
    enable     => true,
    hasrestart => 'true',
  }

}
