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
