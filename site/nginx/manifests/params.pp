class nginx( 
       $package = $nginx::params::package,
       $owner = $nginx::params::owner,
       $group = $nginx::params::group,
       $root_dir = $nginx::params::root_dir,
       $document_dir = $nginx::params::document_dir,
       $conf_dir = $nginx::params::conf_dir,
       $log_dir = $nginx::params::log_dir,
       $service_name = $nginx::params::service_name,
       $service_user = $nginx::params::service_user,
       )
    inherits nginx::params {
