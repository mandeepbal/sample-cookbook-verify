#
# Cookbook Name:: dockerhost
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
# directory "/opt/docker" do
#   owner 'root'
#   group 'root'
#   mode '0755'
#   action :create
# end

group "docker" do
  action :create
end

remote_file "/root/install.sh" do
  source "https://registry.hub.docker.com/account/csengine/82c34512472eaaf3bc6a9511e3da34d7600bb84de446058a?package_type=rpm"
  mode '0700'
  owner 'root'
  group 'root'
end

execute "/bin/bash /root/install.sh" do
  user 'root'
  group 'root'
  action :run
end
execute "yum clean all" do
  user 'root'
  group 'root'
  action :run
end

package "docker-engine-cs" do
  action :install
  version "1.6.2_cs5-1"
end

# remote_file "/usr/bin/docker" do
#   source "https://get.docker.com/builds/Linux/x86_64/docker-latest"
#   mode '0740'
#   owner 'root'
#   group 'root'
# end
# remote_file "/usr/lib/systemd/system/docker.service" do
#   source "https://raw.githubusercontent.com/docker/docker/master/contrib/init/systemd/docker.service"
#   mode '0644'
#   owner 'root'
#   group 'root'
# end
# remote_file "/usr/lib/systemd/system/docker.socket" do
#   source "https://raw.githubusercontent.com/docker/docker/master/contrib/init/systemd/docker.socket"
#   mode '0644'
#   owner 'root'
#   group 'root'
# end

service "docker" do
  action :enable
  action :start
end


#
# ruby_block "insert_line" do
#   block do
#     file = Chef::Util::FileEdit.new("/home/vagrant/.bashrc")
#     file.insert_line_if_no_match("/PATH=$PATH:/opt/docker//","PATH=$PATH:/opt/docker/")
#     file.insert_line_if_no_match("/export PATH/","export PATH")
#     file.write_file
#   end
# end
