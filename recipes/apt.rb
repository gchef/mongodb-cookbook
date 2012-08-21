apt_repository "10gen" do
  uri "http://downloads-distro.mongodb.org/repo/ubuntu-upstart"
  keyserver "keyserver.ubuntu.com"
  key "7F0CEB10"
  distributions %w[dist]
  components %w[10gen]
  action :add
end

package "mongodb-10gen" do
  version "#{node[:mongodb][:version]}*"
  options '--force-yes -o Dpkg::Options::="--force-confold"'
  only_if "[ $(dpkg -l mongodb-10gen 2>&1 | grep #{node[:mongodb][:version]}.* | grep -c '^h[ic] ') = 0 ]"
end

bash "freeze mongodb-10gen" do
  code "echo mongodb-10gen hold | dpkg --set-selections"
  only_if "[ $(dpkg --get-selections | grep -c 'mongodb-10gen\W*hold') = 0 ]"
end

service "mongodb" do
  provider Chef::Provider::Service::Upstart
  supports :start => true, :stop => true, :restart => true
  action [:enable, :start]
end

directory node[:mongodb][:dbpath] do
  owner "mongodb"
  group "mongodb"
  mode "0775"
  recursive true
end

directory node[:mongodb][:logpath] do
  owner "mongodb"
  group "mongodb"
  mode "0775"
  recursive true
end

template "/etc/init/mongodb.conf" do
  source "mongodb.upstart.erb"
  owner "root"
  group "root"
  mode "0644"
  backup false
  notifies :restart, resources(:service => "mongodb"), :delayed
end

template "/etc/mongodb.conf" do
  owner "root"
  group "root"
  mode "0644"
  backup false
  notifies :restart, resources(:service => "mongodb"), :delayed
end
