class nginx {

  package { 'nginx':
    ensure => present,
  }
  
  file { '/etc/nginx/conf/conf.d/default.conf':
    ensure => present,
    source => 'puppet:///modules/nginx/default.conf',
    owner => 'root',
    group => 'root',
    mode => '0644',
    path => '/etc/nginx/conf/conf.d/default.conf'
    require => Package['nginx'],
  }
  
  file { '/etc/nginx/nginx.conf':
    ensure => present,
    source => 'puppet:///modules/nginx/nginx.conf',
    owner => 'root',
    group => 'root',
    mode => '0644',
    path => '/etc/nginx/nginx.conf'
    require => Package['nginx'],
  }
  
  file { '/var/www/index.html':
    ensure => present,
    source => 'puppet:///modules/nginx/idex.html',
    owner => 'root',
    group => 'root',
    mode => '0644',
    path => '/var/www/index.html'
    require => Package['nginx'],
  }
  
  service { 'nginx':
    ensure => running,
    enable => true,
    require => File['/etc/nginx/conf/nginx.conf'],
  }
  
}
