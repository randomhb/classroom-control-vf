class nginx {
  
  file { '':
    ensure => present,
    
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
