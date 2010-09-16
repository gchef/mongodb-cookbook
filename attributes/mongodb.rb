default[:mongodb][:version]           = "1.6.2"
default[:mongodb][:source]            = "http://fastdl.mongodb.org/linux/mongodb-linux-#{node[:kernel][:machine]}-#{mongodb[:version]}.tgz"
default[:mongodb][:i686][:checksum]   = "3ce4485494806648404e1ee96c223ec6"
default[:mongodb][:x86_64][:checksum] = "73df4aa4be049d733666cebf8f123b55"

default[:mongodb][:dir]         = "/opt/mongodb-#{mongodb[:version]}"
default[:mongodb][:datadir]     = "/var/db/mongodb"
default[:mongodb][:config]      = "/etc/mongodb.conf"
default[:mongodb][:logfile]     = "/var/log/mongodb.log"
default[:mongodb][:pidfile]     = "/var/run/mongodb.pid"
default[:mongodb][:host]        = "localhost"
default[:mongodb][:port]        = 27017

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
default[:mongodb][:rest]        = false
default[:mongodb][:noscripting] = false
default[:mongodb][:notablescan] = false
default[:mongodb][:noprealloc]  = false
default[:mongodb][:nssize]      = false

default[:mongodb][:mms] = false
if mongodb[:mms]
  default[:mongodb][:mms][:token]   = ""
  default[:mongodb][:mms][:name]    = ""
  default[:mongodb][:mms][:interval]= ""
end

default[:mongodb][:replication] = false
if mongodb[:replication]
  default[:mongodb][:replication][:slave]           = false
  default[:mongodb][:replication][:slave][:source]  = ""
  default[:mongodb][:replication][:slave][:only]    = ""

  default[:mongodb][:replication][:master]          = false
  default[:mongodb][:replication][:master][:source] = ""

  default[:mongodb][:replication][:pairwith]        = ""
  default[:mongodb][:replication][:arbiter]         = ""
  default[:mongodb][:replication][:autoresync]      = false
  default[:mongodb][:replication][:oplogsize]       = 0
  default[:mongodb][:replication][:opidmem]         = 0
end

default[:mongodb][:backup][:backupdir]    = "/var/backups/mongodb"
default[:mongodb][:backup][:day]          = 6
default[:mongodb][:backup][:compression]  = "bzip2"
default[:mongodb][:backup][:cleanup]      = "yes"
default[:mongodb][:backup][:latest]       = "yes"
default[:mongodb][:backup][:mailaddress]  = false
default[:mongodb][:backup][:mailcontent]  = "stdout"
default[:mongodb][:backup][:maxemailsize] = 4000
