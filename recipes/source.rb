#
# Cookbook Name:: mongodb
# Recipe:: source
#
# Author:: Gerhard Lazu (<gerhard.lazu@papercavalier.com>)
#
# Copyright 2010, Paper Cavalier, LLC
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

platform = node[:kernel][:machine]

include_recipe "build-essential"

user "mongodb" do
  comment "MongoDB Administrator"
  system true
  shell "/bin/false"
end

remote_file "/tmp/mongodb-#{node[:mongodb][:version]}.tar.gz" do
  source node[:mongodb][:source]
  checksum node[:mongodb][platform][:checksum]
  action :create_if_missing
end

[node[:mongodb][:dir], "#{node[:mongodb][:dir]}/bin", node[:mongodb][:datadir]].each do |dir|
  directory dir do
    owner "mongodb"
    group "mongodb"
    mode 0755
    recursive true
  end
end

bash "set_up_mongodb" do
  cwd "/tmp"
  code <<-EOH
    tar -zxf mongodb-#{node[:mongodb][:version]}.tar.gz --strip-components=2 -C #{node[:mongodb][:dir]}/bin
    if [ `grep -c #{node[:mongodb][:dir]} /etc/environment` -eq 0 ]; then
      sed -i -e 's/PATH="/PATH="#{node[:mongodb][:dir].gsub('/', '\/')}\/bin:/g' /etc/environment
      source /etc/environment
    fi
  EOH
end

file node[:mongodb][:logfile] do
  owner "mongodb"
  group "mongodb"
  mode 0644
  action :create_if_missing
  backup false
end

template "/etc/mongodb.conf" do
  source "mongodb.conf.erb"
  owner "mongodb"
  group "mongodb"
  mode 0644
  backup false
end

template "mongodb.init" do
  path "/etc/init.d/mongodb"
  source "mongodb.init.erb"
  mode 0755
  backup false
end

service "mongodb" do
  supports :start => true, :stop => true, "force-stop" => true, :restart => true, "force-reload" => true, :status => true
  action [:enable, :start]
end