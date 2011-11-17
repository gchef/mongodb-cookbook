# IP addresses that mongo will listen on
default[:mongodb][:bind_ip] = "127.0.0.1"
#
# Port the mongod will listen on
default[:mongodb][:port] = 27017
#
# Full filename path to where mongod will store its pid
default[:mongodb][:pidfile] = "/var/lib/mongodb/mongod.lock"
#
# Upstart-related, wait this long between SIGTERM and SIGKILL
default[:mongodb][:timeout] = 300
#
# Note: if you run mongodb as a non-root user (recommended) you may
# need to create and set permissions for this directory manually,
# e.g., if the parent directory isn't mutable by the mongodb user.
# Where to store the data.
default[:mongodb][:dbpath] = "/var/lib/mongodb"
#
# Full filename path to where log messages will be written
default[:mongodb][:logpath] = "/var/log/mongodb"
#
# Number of open files for the mongodb user
default[:mongodb][:nofile] = "20000 20000"

##########################################################################
### MONGOD

# Whether the log file will be appended (true) or over-written (false)
default[:mongodb][:logappend]             = true

# Allow extended operations at the HTTP interface
# http://www.mongodb.org/display/DOCS/Http+Interface
# default[:mongodb][:nohttpinterface]       = false
#
# Whether to turn on the simple REST API
# default[:mongodb][:rest]                  = false
#
# Turns off server-side scripting. This will result in greatly limited functionality
# default[:mongodb][:noscripting]           = false
#
# Turns off table scans. Any query that would do a table scan fails
# default[:mongodb][:notablescan]           = false
#
# Disable data file preallocation
# default[:mongodb][:noprealloc]            = false
#
# By default MongoDB has a limit of approximately 24,000 namespaces per database.
# Each namespace is 628 bytes, the .ns file is 16MB by default.
# Be aware that there is a certain minimum overhead per collection -- a few KB.
# Further, any index will require at least 8KB of data space as the b-tree page size is 8KB.
# Certain operations can get slow if there are a lot of collections and the meta data gets paged out.
# http://www.mongodb.org/display/DOCS/Using+a+Large+Number+of+Collections
# Specify .ns file size for new databases in MB
# default[:mongodb][:nssize]                = false
#
# Enable db quota management.
# This limits (by default) to 8 files per DB.
# default[:mongodb][:quota]                 = false
#
# Maximum number of files that will be opened per Database
# default[:mongodb][:quotaFiles]            = ""
#
# Enable periodic logging (true) of CPU utilization and I/O wait
# default[:mongodb][:cpu]                   = false
#
# Verbose logging output
# default[:mongodb][:verbose]               = false

# Turn on/off security
# default[:mongodb][:auth]                  = false
#
# If auth turned on, specify username for logging in
# default[:mongodb][:username]              = ""
#
# If auth turned on, specify password for logging in
# default[:mongodb][:password]              = ""
#
# Indicates that this mongod will participate in sharding
# *Optional and just changes the default port
# default[:mongodb][:shardsvr]              = false
#
# Disable write-ahead journaling
# In v2.0+, journaling is on by default for 64-bit.
# Fast recovery from crashes, part of the single-server durability feature.
# default[:mongodb][:nojournal]               = false
#
# Specify use of an alternative directory structure,
# in which files for each database are kept in a unique directory
# http://www.mongodb.org/display/DOCS/--directoryperdb
# default[:mongodb][:directoryperdb]        = false
#
# Reduces amount of log output
# http://www.mongodb.org/display/DOCS/--quiet
# default[:mongodb][:quiet]                 = false
#
# Root path for temporary files created during database repair.
# Default is dbpath value.
# default[:mongodb][:repairpath]            = ""

# Inspect all client data for validity on receipt (useful for developing drivers)
# default[:mongodb][:objcheck]              = false
#
# Seconds between disk syncs. Do not use zero !!!
# http://www.mongodb.org/display/DOCS/--syncdelay
# default[:mongodb][:syncdelay]             = 60
#
# Set oplogging level where n is
#   0=off (default)
#   1=W
#   2=R
#   3=both
#   7=W+some reads
# default[:mongodb][:diaglog]               = 0
#
# Diagnostic/debugging option
# default[:mongodb][:nocursors]             = false
#
# Ignore query hints
# default[:mongodb][:nohints]               = false
#
# Use a smaller default file size
# default[:mongodb][:smallfiles]            = false
#
# Disable listening on unix sockets (will not create socket files)
# default[:mongodb][:nounixsocket]          = false

# ### MMS
# default[:mongodb][:mms]                   = false
# default[:mongodb][:mms_interval]         = ""
# default[:mongodb][:mms_name]             = ""
# default[:mongodb][:mms_token]            = ""

# ### MASTER/SLAVE
# default[:mongodb][:master]                = false
# default[:mongodb][:slave]                 = false
# default[:mongodb][:slave_source]          = "" # <server:port>
# default[:mongodb][:slave_only]            = "" # <db>

# ### MASTER/SLAVE & REPLICATION
# default[:mongodb][:replication]           = false
# default[:mongodb][:autoresync]            = false
# default[:mongodb][:fastsync]              = false
# default[:mongodb][:opidmem]               = 0
# default[:mongodb][:oplogsize]             = 0
# default[:mongodb][:arbiter]               = "" # <server:port>

# ### REPLICATION
# default[:mongodb][:replSet]               = ""
# default[:mongodb][:replica_member_id]     = 0
# default[:mongodb][:replica_initializer]   = false # set to true if the node should initialize the set
# default[:mongodb][:keyFile]               = ""
# # Optional Replica Set Config Options
# default[:mongodb][:arbiter_only]          = false
# default[:mongodb][:build_indexes]         = true
# default[:mongodb][:hidden]                = false
# default[:mongodb][:priority]              = 1 # set to 0 if the node should never become master - v1.8 - only 1 or 0, v2.0 - can be specific priorty number
# #default[:mongodb][:tags]                  = [] # v2.0
# default[:mongodb][:slave_delay]           = 0
# default[:mongodb][:votes]                 = 1

# ### BACKUP
# default[:mongodb][:backup][:backupdir]    = "/var/backups/mongodb"
# default[:mongodb][:backup][:cleanup]      = "yes"
# default[:mongodb][:backup][:compression]  = "bzip2"
# default[:mongodb][:backup][:day]          = 6
# default[:mongodb][:backup][:host]         = "localhost"
# default[:mongodb][:backup][:latest]       = "yes"
# default[:mongodb][:backup][:mailaddress]  = false
# default[:mongodb][:backup][:mailcontent]  = "stdout"
# default[:mongodb][:backup][:maxemailsize] = 4000

# ##########################################################################
# ### CONFIG SERVER
# default[:mongodb][:config_server][:verbose] = false

# ##########################################################################
# ### MONGOS - SHARDING ROUTER
# default[:mongodb][:mongos][:verbose] = false

# ##########################################################################
# ### Monit
# default[:mongodb][:monit][:memory_usage]     = "60 %"
