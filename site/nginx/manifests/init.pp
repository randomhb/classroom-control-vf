class nginx {

  package { 'nginx':
    ensure => present,
  }
  
  file { '/var/www':
    ensure => directory,
    owner => 'root',
    group => 'root',
  }
  
  file { 'default.conf':
    ensure => present,
    source => 'puppet:///modules/nginx/default.conf',
    owner => 'root',
    group => 'root',
    mode => '0644',
    path => '/etc/nginx/conf/conf.d/default.conf'
  }
  
  file { 'nginx.conf':
    ensure => present,
    source => 'puppet:///modules/nginx/nginx.conf',
    owner => 'root',
    group => 'root',
    mode => '0644',
    path => '/etc/nginx/nginx.conf'
  }
  
  file { 'index.html':
    ensure => present,
    source => 'puppet:///modules/nginx/idex.html',
    owner => 'root',
    group => 'root',
    mode => '0644',
    path => '/var/www/index.html'
  }
  
  service { 'nginx':
    ensure => running,
    enable => true,
    subscribe => [ File['/etc/nginx/nginx.conf'], File['/etc/nginx/conf.d/default.conf'] ]
  }
  
}
