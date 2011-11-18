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
# How often to logrotate:
# * daily
# * weekly
# * monthly
default[:mongodb][:logrotate][:period] = "daily"
#
# How many archived logfiles to keep
default[:mongodb][:logrotate][:keep] = 7
