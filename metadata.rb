maintainer        "Gerhard Lazu"
maintainer_email  "gerhard@lazu.co.uk"
license           "Apache 2.0"
description       "Installs MongoDB from 10Gen's apt source"
version           "2.0.1"

recipe "mongodb", "Default recipe simply includes the mongodb::apt recipe"
recipe "mongodb::apt", "Installs MongoDB from 10Gen's apt source and includes init.d script"
recipe "mongodb::logrotate", "Logrotation for mongodb log, via bootstrap cookbook"

depends "apt"       # https://github.com/gchef/apt-cookbook
depends "bootstrap" # https://github.com/gchef/bootstrap-cookbook

supports "ubuntu"
supports "debian" # IN THEORY, NOT TESTED
