# we'll be re-using this across all server type configs
if node[:network][:interfaces][:eth0]
  bind_ip << node[:network][:interfaces][:eth0][:addresses].select do |address, values|
    values['family'] == 'inet'
  end.first.first
else
  bind_ip = [ "127.0.0.1" ]
end

default[:mongodb][:sever_type] = "mongod"

default[:mongodb][:bind_ip]               = bind_ip
default[:mongodb][:config]                = "/etc/mongodb.conf"
default[:mongodb][:dbpath]                = "/var/lib/mongodb"
default[:mongodb][:logpath]               = "/var/log/mongodb"
default[:mongodb][:port]                  = 27017
default[:mongodb][:pidfile]               = "/var/lib/mongodb/mongod.lock"
default[:mongodb][:system_init]           = "upstart" # or sysv for older Ubuntu / Debian systems
default[:mongodb][:timeout]               = 300       # wait this many seconds between SIGTERM and SIGKILL

##########################################################################
### MONGOD

default[:mongodb][:logappend]             = true

### EXTRA
# Administration & Monitoring
default[:mongodb][:nohttpinterface]       = false
default[:mongodb][:rest]                  = false
default[:mongodb][:noscripting]           = false
default[:mongodb][:notablescan]           = false
default[:mongodb][:noprealloc]            = false
default[:mongodb][:nssize]                = false
default[:mongodb][:quota]                 = false
default[:mongodb][:quotaFiles]            = ""
# Logging
default[:mongodb][:cpu]                   = false
default[:mongodb][:verbose]               = false
# Security
default[:mongodb][:auth]                  = false
default[:mongodb][:username]              = ""
default[:mongodb][:password]              = ""
# Sharding
default[:mongodb][:shardsvr]              = false # default[:mongodb][:shard_server]
# Journaling
default[:mongodb][:journal]               = false
# Additional Configuration Options
default[:mongodb][:directoryperdb]        = false
default[:mongodb][:quiet]                 = false
default[:mongodb][:repairpath]            = ""
default[:mongodb][:objcheck]              = false
default[:mongodb][:syncdelay]             = 60
default[:mongodb][:diaglog]               = false
default[:mongodb][:nocursors]             = false
default[:mongodb][:nohints]               = false
default[:mongodb][:smallfiles]            = false
default[:mongodb][:nounixsocket]          = false

### MMS
default[:mongodb][:mms]                   = false
default[:mongodb][:mms_interval]         = ""
default[:mongodb][:mms_name]             = ""
default[:mongodb][:mms_token]            = ""

### MASTER/SLAVE
default[:mongodb][:master]                = false
default[:mongodb][:slave]                 = false
default[:mongodb][:slave_source]          = "" # <server:port>
default[:mongodb][:slave_only]            = "" # <db>

### MASTER/SLAVE & REPLICATION
default[:mongodb][:replication]           = false
default[:mongodb][:autoresync]            = false
default[:mongodb][:fastsync]              = false
default[:mongodb][:opidmem]               = 0
default[:mongodb][:oplogsize]             = 0
default[:mongodb][:arbiter]               = "" # <server:port>

### REPLICATION
default[:mongodb][:replSet]               = ""
default[:mongodb][:replica_member_id]     = 0
default[:mongodb][:replica_initializer]   = false # set to true if the node should initialize the set
default[:mongodb][:keyFile]               = ""
# Optional Replica Set Config Options
default[:mongodb][:arbiter_only]          = false
default[:mongodb][:build_indexes]         = true
default[:mongodb][:hidden]                = false
default[:mongodb][:priority]              = 1 # set to 0 if the node should never become master - v1.8 - only 1 or 0, v2.0 - can be specific priorty number
#default[:mongodb][:tags]                  = [] # v2.0
default[:mongodb][:slave_delay]           = 0
default[:mongodb][:votes]                 = 1

### BACKUP
default[:mongodb][:backup][:backupdir]    = "/var/backups/mongodb"
default[:mongodb][:backup][:cleanup]      = "yes"
default[:mongodb][:backup][:compression]  = "bzip2"
default[:mongodb][:backup][:day]          = 6
default[:mongodb][:backup][:host]         = "localhost"
default[:mongodb][:backup][:latest]       = "yes"
default[:mongodb][:backup][:mailaddress]  = false
default[:mongodb][:backup][:mailcontent]  = "stdout"
default[:mongodb][:backup][:maxemailsize] = 4000

##########################################################################
### CONFIG SERVER
default[:mongodb][:config_server][:verbose] = false

##########################################################################
### MONGOS - SHARDING ROUTER
default[:mongodb][:mongos][:verbose] = false

##########################################################################
### Monit
default[:mongodb][:monit][:memory_usage]     = "60 %"

