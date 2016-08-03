class nginx {

  file { '/etc/nginx/conf/default.conf':
    ensure => present,
    source => 'puppet:///modules/nginx/default.conf',
    owner => 'root',
    group => 'root',
    mode => '0644',
    path => '/etc/nginx/conf/default.conf'
    require => Package['nginx'],
  }
  
  file { '/etc/nginx/conf/nginx.conf':
    ensure => present,
    source => 'puppet:///modules/nginx/nginx.conf',
    owner => 'root',
    group => 'root',
    mode => '0644',
    path => '/etc/nginx/conf/nginx.conf'
    require => Package['nginx'],
  }
  
  file { '/etc/nginx/html/index.html':
    ensure => present,
    source => 'puppet:///modules/nginx/html/idex.html',
    owner => 'root',
    group => 'root',
    mode => '0644',
    path => '/etc/nginx/html/index.html'
    require => Package['nginx'],
  }
  
  service { 'nginx':
    ensure => running,
    enable => true,
    require => File['/etc/nginx/conf/nginx.conf'],
  }
  
  package { 'nginx':
    ensure => present,
  }
  
}
