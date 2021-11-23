exec { 'apt-get update':
    command => '/usr/bin/apt-get update -y'
}

package { "curl":
    require => Exec['apt-get update'],
    ensure => installed
}

exec { 'Install nodejs':
    command => '/usr/bin/curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -',
    require => Package['curl'],
}

package { "nodejs":
    require => Exec['apt-get update'],
    ensure => installed,
}