class nginx {

  package { 'nginx':
    ensure => present,
  }
  
  file { '/var/www':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
  }
  
  file { 'default.conf':
    ensure  => 'file',
    source  => 'puppet:///modules/nginx/default.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    path    => '/etc/nginx/conf.d/default.conf',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
  
  file { 'nginx.conf':
    ensure  => 'file',
    source  => 'puppet:///modules/nginx/nginx.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    path    => '/etc/nginx/nginx.conf',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
  
  file { 'index.html':
    ensure => 'file',
    source => 'puppet:///modules/nginx/index.html',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    path   => '/var/www/index.html',
  }
  
  service { 'nginx':
    ensure     => running,
    enable     => true,
    hasrestart => 'true',
  }
  
}
