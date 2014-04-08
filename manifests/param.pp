# vim: sts=4 ts=4 sw=4 expandtab autoindent
#
#Module for create\change rc.conf in FreeBSD using augeas
#Usage:
#   include puppet-rc.conf
#   puppet-rc.conf::param("sshd_enable": value => "YES",)

define puppet-rc_conf::param (
    $param=undef,
    $value,
)
{
    $param_res = $param ?{
        undef => $name,
        $param => $param,
    }
    augeas {"param_${name}":
        context => "/files/etc/rc.conf",
        changes => ["set ${param_res} '\"${value}\"'"],
        onlyif => "match ${param_res}[. =~ regexp('.*${value}.*')] size == 0",
    }
}
