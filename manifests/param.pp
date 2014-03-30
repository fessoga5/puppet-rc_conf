# vim: sts=4 ts=4 sw=4 expandtab autoindent
#
#INSTALL SKYPE ON DESKTOP
#

define puppet-rc_conf::param (
    $param,
    $value,
)
{
	$path_freebsd = ["/bin", "/sbin","/usr/bin", "/usr/sbin", "/usr/local/bin", "/usr/local/sbin"]
    #Create rc.conf
    augeas {"rc.conf_${name}":
        context => "/files/etc/rc.conf",
        changes => ["set ${param} '\"${value}\"'"],
        onlyif => "match ${param}[. =~ regexp('.*${value}.*')] size == 0",
    }
        
}
