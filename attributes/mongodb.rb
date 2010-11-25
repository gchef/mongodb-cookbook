### PACKAGES
default[:mongodb][:version]           = "1.6.4"
default[:mongodb][:source]            = "http://fastdl.mongodb.org/linux/mongodb-linux-#{node[:kernel][:machine]}-#{mongodb[:version]}.tgz"
default[:mongodb][:i686][:checksum]   = "e64d9f4ce31d789caef7370b863cf59d"
default[:mongodb][:x86_64][:checksum] = "14f89864f3b58fc20f22ec0068325870"

### GENERAL
default[:mongodb][:dir]         = "/opt/mongodb-#{mongodb[:version]}"
default[:mongodb][:datadir]     = "/var/db/mongodb"
default[:mongodb][:config]      = "/etc/mongodb.conf"
default[:mongodb][:logfile]     = "/var/log/mongodb.log"
default[:mongodb][:pidfile]     = "/var/run/mongodb.pid"
default[:mongodb][:host]        = "localhost"
default[:mongodb][:port]        = 27017



### EXTRA
default[:mongodb][:log_cpu_io]  = false
default[:mongodb][:auth]        = false
default[:mongodb][:username]    = ""
default[:mongodb][:password]    = ""
default[:mongodb][:verbose]     = false
default[:mongodb][:objcheck]    = false
default[:mongodb][:quota]       = false
default[:mongodb][:diaglog]     = false
default[:mongodb][:nocursors]   = false
default[:mongodb][:nohints]     = false
default[:mongodb][:nohttp]      = false
default[:mongodb][:noscripting] = false
default[:mongodb][:notablescan] = false
default[:mongodb][:noprealloc]  = false
default[:mongodb][:nssize]      = false



### STARTUP
default[:mongodb][:rest]        = false
default[:mongodb][:syncdelay]   = 60



### MMS
default[:mongodb][:mms]         = false
default[:mongodb][:token]     = ""
default[:mongodb][:name]      = ""
default[:mongodb][:interval]  = ""



### REPLICATION
default[:mongodb][:replication]     = false
default[:mongodb][:slave]         = false
default[:mongodb][:slave_source]  = ""
default[:mongodb][:slave_only]    = ""

default[:mongodb][:master]        = false
default[:mongodb][:master_source] = ""

default[:mongodb][:pairwith]      = ""
default[:mongodb][:arbiter]       = ""

default[:mongodb][:autoresync]    = false
default[:mongodb][:oplogsize]     = 0
default[:mongodb][:opidmem]       = 0



### BACKUP
default[:mongodb][:backup][:backupdir]    = "/var/backups/mongodb"
default[:mongodb][:backup][:day]          = 6
default[:mongodb][:backup][:compression]  = "bzip2"
default[:mongodb][:backup][:cleanup]      = "yes"
default[:mongodb][:backup][:latest]       = "yes"
default[:mongodb][:backup][:mailaddress]  = false
default[:mongodb][:backup][:mailcontent]  = "stdout"
default[:mongodb][:backup][:maxemailsize] = 4000
