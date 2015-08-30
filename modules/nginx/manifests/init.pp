class nginx {

  file { "/tmp/install.sh":
    source => "puppet:///modules/nginx/install.sh",
    mode   => 755,
  }

  ->

  exec { "/bin/bash /tmp/install.sh":
    cwd     => "/usr/local/",
    creates => "/usr/local/nginx/sbin/nginx",
    path    => ["/bin", "/usr/bin", "/usr/sbin"]
  }

  ->

  file { "/usr/local/nginx/conf/nginx.conf":
    content => template("nginx/nginx.conf.erb")
  }

  ->

  file { "/etc/init.d/nginx":
    source => "puppet:///modules/nginx/nginx",
    mode   => 755,
  }

  ->

  service { nginx:
    ensure => running
  }

}
