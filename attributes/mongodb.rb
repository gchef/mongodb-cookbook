### SOURCE PACKAGES
default[:mongodb][:version]           = "1.8.2"
default[:mongodb][:source]            = "http://fastdl.mongodb.org/linux/mongodb-linux-#{node[:kernel][:machine]}-#{mongodb[:version]}.tgz"
default[:mongodb][:i686][:checksum]   = "fc6bc63ba050bd372481ffe214731b00"
default[:mongodb][:x86_64][:checksum] = "5f4a33e00e1cc5940ae62ff83286e927"

# we'll be re-using this across all server type configs
if node[:network][:interfaces][:eth0]
  bind_ip = node[:network][:interfaces][:eth0][:addresses].select do |address, values|
    values['family'] == 'inet'
  end.first.first
else
  bind_ip = "0.0.0.0"
end

##########################################################################
### MAIN SERVER

### GENERAL
default[:mongodb][:server][:bind_ip]               = bind_ip # default[:mongodb][:bind_ip] = '127.0.0.1'
default[:mongodb][:server][:config]                = "/etc/mongodb.conf"
default[:mongodb][:server][:dbpath]                = "/var/lib/mongodb" # default[:mongodb][:datadir] = "/var/db/mongodb"
default[:mongodb][:server][:dir]                   = "/opt/mongodb-#{mongodb[:version]}"
default[:mongodb][:server][:logpath]               = "/var/log/mongodb.log"
default[:mongodb][:server][:pidfile]               = "/var/lib/mongodb/mongod.lock" # default[:mongodb][:pidfile] = "/var/run/mongodb.pid"
default[:mongodb][:server][:port]                  = 27017
default[:mongodb][:server][:system_init]           = "sysv" # from papercavalier

### EXTRA
default[:mongodb][:server][:auth]                  = false
default[:mongodb][:server][:username]              = ""
default[:mongodb][:server][:password]              = ""
default[:mongodb][:server][:cpu]                   = false # mikezter - default[:mongodb][:log_cpu_io]
default[:mongodb][:server][:diaglog]               = false
default[:mongodb][:server][:logappend]             = true  # from papercavalier
default[:mongodb][:server][:nocursors]             = false
default[:mongodb][:server][:nohints]               = false
default[:mongodb][:server][:nohttpinterface]       = false # mikezter - default[:mongodb][:nohttp]
default[:mongodb][:server][:noscripting]           = false
default[:mongodb][:server][:notablescan]           = false
default[:mongodb][:server][:noprealloc]            = false
default[:mongodb][:server][:nssize]                = false
default[:mongodb][:server][:objcheck]              = false
default[:mongodb][:server][:quota]                 = false
default[:mongodb][:server][:verbose]               = false
default[:mongodb][:server][:fastsync]              = false
default[:mongodb][:server][:journal]               = false

### STARTUP
default[:mongodb][:server][:rest]                  = false
default[:mongodb][:server][:syncdelay]             = 60

### MMS
default[:mongodb][:server][:mms]                   = false
default[:mongodb][:server]['mms-interval']         = "" # mikezter - default[:mongodb][:token]
default[:mongodb][:server]['mms-name']             = "" # mikezter - default[:mongodb][:name]
default[:mongodb][:server]['mms-token']            = "" # mikezter - default[:mongodb][:interval]

### REPLICATION
default[:mongodb][:server][:autoresync]            = false
default[:mongodb][:server][:master]                = false # from papercavalier
default[:mongodb][:server][:master_source]         = "" # from papercavalier
default[:mongodb][:server][:opidmem]               = 0
default[:mongodb][:server][:oplogsize]             = 0
default[:mongodb][:server][:replication]           = false
default[:mongodb][:server][:replSet]               = "" # mikezter - default[:mongodb][:replica_set]   = "none"
default[:mongodb][:server][:slave]                 = false # from papercavalier
default[:mongodb][:server][:slave_only]            = "" # from papercavalier
default[:mongodb][:server][:slave_source]          = "" # from papercavalier
# mikezter - default[:mongodb][:replica_member_id] = 1
# mikezter - default[:mongodb][:replica_priority] = 1 # set to 0 if the node should never become master
# mikezter - default[:mongodb][:replica_initializer] = false # true if the node should initialize the set

### SHARDING
default[:mongodb][:server][:shard_server]          = false

### BACKUP
default[:mongodb][:server][:backup][:backupdir]    = "/var/backups/mongodb"
default[:mongodb][:server][:backup][:cleanup]      = "yes"
default[:mongodb][:server][:backup][:compression]  = "bzip2"
default[:mongodb][:server][:backup][:day]          = 6
default[:mongodb][:server][:backup][:host]         = "localhost"
default[:mongodb][:server][:backup][:latest]       = "yes"
default[:mongodb][:server][:backup][:mailaddress]  = false
default[:mongodb][:server][:backup][:mailcontent]  = "stdout"
default[:mongodb][:server][:backup][:maxemailsize] = 4000

##########################################################################
### CONFIG SERVER
# mikezter - default[:mongodb][:config_server][:host]        = "localhost"
default[:mongodb][:config_server][:bind_ip] = bind_ip # from papercavalier
default[:mongodb][:config_server][:config]  = "/etc/mongodb-config.conf"
default[:mongodb][:config_server][:datadir] = "/var/db/mongodb-config"
default[:mongodb][:config_server][:logpath] = "/var/log/mongodb-config.log"
default[:mongodb][:config_server][:pidfile] = "/var/run/mongodb-config.pid"
default[:mongodb][:config_server][:port]    = 27019
default[:mongodb][:config_server][:verbose] = false # from papercavalier

##########################################################################
### MONGOS - SHARDING ROUTER
default[:mongodb][:mongos][:bind_ip] = bind_ip # mikezter - default[:mongodb][:mongos][:host]        = "localhost"
default[:mongodb][:mongos][:config]  = "/etc/mongos.conf"
default[:mongodb][:mongos][:logpath] = "/var/log/mongos.log" # mikezter - default[:mongodb][:mongos][:logfile]     = "/var/log/mongos.log"
default[:mongodb][:mongos][:pidfile] = "/var/run/mongos.pid"
default[:mongodb][:mongos][:port]    = 27017
default[:mongodb][:mongos][:verbose] = false # from papercavalier

##########################################################################
### Monit
default[:mongodb][:monit][:memory_usage]     = "60 %" # from mikezter

