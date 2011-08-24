maintainer        "Matt Solt"
maintainer_email  "mattsolt@gmail.com"
license           "Apache 2.0"
description       "Installs and configures MongoDB 1.8.2"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.8.2"

recipe "mongodb", "Default recipe simply includes the mongodb::apt and mongodb::server recipes"
recipe "mongodb::apt", "Installs MongoDB from 10Gen's apt source and includes init.d script"
recipe "mongodb::backup", "Sets up MongoDB backup script, taken from http://github.com/micahwedemeyer/automongobackup"
recipe "mongodb::config_server", "Sets up config and initialization to run mongod as a config server for sharding"
recipe "mongodb::mongos", "Sets up config and initialization to run mongos, the MongoDB sharding router"
recipe "mongodb::server", "Set up config and initialization to run mongod as a database server"
recipe "mongodb::source", "Installs MongoDB from source and includes init.d script"

depends "apt", "> 1.1"

supports "ubuntu"
supports "debian"

attribute "mongodb/version",
  :display_name => "MongoDB source version",
  :description => "Which MongoDB version will be installed from source"

attribute "mongodb/source",
  :display_name => "MongoDB source file",
  :description => "Downloaded location for MongoDB"

attribute "mongodb/i686/checksum",
  :display_name => "MongoDB 32bit source file checksum",
  :description => "Will make sure the source file is the real deal"

attribute "mongodb/x86_64/checksum",
  :display_name => "MongoDB 64bit source file checksum",
  :description => "Will make sure the source file is the real deal"

attribute "mongodb/server/bind_ip",
  :display_name => "MongoDB bind IP",
  :description => "IP on which MongoDB will listen on"

attribute "mongodb/server/config",
  :display_name => "MongoDB config",
  :description => "Path to MongoDB config file"

attribute "mongodb/server/dbpath",
  :display_name => "MongoDB data store",
  :description => "All MongoDB data will be stored here"

attribute "mongodb/server/dir",
  :display_name => "MongoDB installation path",
  :description => "MongoDB will be installed here"

attribute "mongodb/server/logpath",
  :display_name => "MongoDB log file",
  :description => "MongoDB will log into this file"

attribute "mongodb/server/logappend",
  :display_name => "MongoDB logappend",
  :description => "Whether the log file will be appended (true - default) or over-written (false)"

attribute "mongodb/server/pidfile",
  :display_name => "MongoDB PID file",
  :description => "Path to MongoDB PID file"

attribute "mongodb/server/port",
  :display_name => "MongoDB port",
  :description => "Accept connections on the specified port"

attribute "mongodb/server/system_init",
  :display_name => "MongoDB system init",
  :description => "Whether to use the old-style, System V or the newer upstart"
