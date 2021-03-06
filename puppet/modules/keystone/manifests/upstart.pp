class keystone::upstart {
    file { '/etc/init/keystone.conf':
        source => 'puppet:///files/keystone/init/keystone.conf',
    }

    exec { 'update-rc.d keystone':
        command => 'ln -s /lib/init/upstart-job /etc/init.d/keystone; \
                    update-rc.d keystone defaults 50',
        path    => $command_path,
        unless  => 'ls /etc/init.d/keystone',
        require => File['/etc/init/keystone.conf'],
    }
}
