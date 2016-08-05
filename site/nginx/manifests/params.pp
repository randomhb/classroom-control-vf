class nginx::params {
  case $::os['family'] {
    'redhat', 'debian' : {
      $owner    = 'root'
      $group    = 'root'
      $package  = 'nginx'
      $docroot  = '/var/www/'
      $confdir  = '/etc/nginx/'
      $servblock = "${confdir}/conf.d/"
      $logpath   = '/var/log/nginx/'
    }
    'windows' : {
      $owner    = 'Administrator'
      $group    = 'Administrators'
      $package  = 'nginx'
      $docroot  = 'C:/ProgramData/nginx/html/'
      $confdir  = 'C:/ProgramData/nginx/'
      $servblock = "${confdir}/conf.d/"
      $logpath   = "${confdir}/logs/"
      }
      default : {
        fail("Module ${module_name} is not supported on ${::os['family']}")
      }
      
    $user = $::os['family'] ? {
    'redhat'  => 'nginx',
    'debian'  => 'web-data',
    'windows' => 'nobody',
    default => 'nobody',
  }
    }
}
