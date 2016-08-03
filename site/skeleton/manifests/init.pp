class skeleton {
  
  file { '/etc/skel':
    ensure => directory,
    path => '/etc/skel',
    owner => 'root',
    group => 'root',
    mode => '0755',
  }
  
  file { '/etc/skel/.bashrc':
    ensure => file,
    source => 'puppet:///modules/skeleton/bashrc',
    owner => 'root',
    group => 'root',
    mode => '0644',
  }
  
}
