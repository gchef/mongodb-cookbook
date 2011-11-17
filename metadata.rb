maintainer        "Gerhard Lazu"
maintainer_email  "gerhard@lazu.co.uk"
license           "Apache 2.0"
description       "Installs and configures latest stable MongoDB from 10gen official repository"
version           "2.0.1"

recipe "mongodb", "Default recipe simply includes the mongodb::apt recipe"
recipe "mongodb::apt", "Installs MongoDB from 10Gen's apt source and includes init.d script"

depends "apt", "> 1.1"

supports "ubuntu"
supports "debian"
