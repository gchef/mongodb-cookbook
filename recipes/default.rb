#
# Cookbook Name:: mongodb
# Recipe:: default
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

if platform?("ubuntu") && %w(10.04 9.10 9.04).include?(node[:lsb][:release])
  case node[:lsb][:release]
  when "10.04"
    ubuntu_release = "10.4"
  when "9.10"
    ubuntu_release = "9.10"
  when "9.04"
    ubuntu_release = "9.4"
  end
  
  template "/etc/apt/sources.list.d/10gen.list" do
    source "10gen.list.erb"
    owner "root"
    group "root"
    mode 0644
    variables :release => ubuntu_release
    backup false
  end
  
  execute "apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10"
  
  execute "apt-get update"
  
  package "mongodb-stable" do
    action :install
  end
  
  unless `id mongodb`
    user "mongodb" do
      comment "MongoDB Administrator"
      system true
      shell "/bin/false"
    end
  end
  
  directory node[:mongodb][:datadir] do
    owner "mongodb"
    group "mongodb"
    mode 0755
    recursive true
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
end