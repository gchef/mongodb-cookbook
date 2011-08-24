#
# Cookbook Name:: mongodb
# Recipe:: apt
#
# Author:: Gerhard Lazu (<gerhard@lazu.co.uk>)
# Copyright 2010-2011, Gerhard Lazu
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

apt_repository "10gen" do
  uri "http://downloads-distro.mongodb.org/repo/"+(node[:mongodb][:system_init] == "upstart" ? "ubuntu-upstart" : "debian-sysvinit")
  distribution "dist"
  components ["10gen"]
  keyserver "keyserver.ubuntu.com"
  key "7F0CEB10"
  action :add
end

package "mongodb-10gen"

# Stop mongodb
# Replace /etc/init/mongodb.conf with cookbook one
