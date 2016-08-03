class nginx {
  
  file { 'var/www/index.html':
    ensure => present,
    owner => 'group',
    group => 'root',
  }
  
  file { '':
    ensure => present,
    
  }
  
  file { '':
    ensure => present,
    
  }
  
  service { 'nginx':
    ensure => running,
    enable => true,
  }
  
  package { 'nginx':
    ensure => present,
  }

}
