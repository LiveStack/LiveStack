class ceilometer::configs {
    file { "/etc/logrotate.d/ceilometer":
        source => 'puppet:///files/ceilometer/logrotate.d/ceilometer',
    }

    file { "/etc/ceilometer/pipeline.yaml":
        source => 'puppet:///files/ceilometer/etc/pipeline.yaml',
        notify => Class["ceilometer::services", "ceilometer::tables"],
    }

    file { "/etc/ceilometer/policy.json":
        source => 'puppet:///files/ceilometer/etc/policy.json',
        notify => Class["ceilometer::services", "ceilometer::tables"],
    }

    file { "/etc/ceilometer/ceilometer.conf":
        source => 'puppet:///files/ceilometer/etc/ceilometer.conf',
        notify => Class["ceilometer::services", "ceilometer::tables"],
    }
}
