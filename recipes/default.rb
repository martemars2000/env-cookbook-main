#
# Cookbook:: env-cookbook-main
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

execute 'Add new php repository' do
    command 'sudo add-apt-repository ppa:ondrej/php'
    action :run
end

execute 'Update ubuntu repositories' do
    command 'sudo apt-get update'
    action :run
end

package 'git'
package 'tree'

package 'nginx' do
  action :install
end

service 'nginx' do
    action [ :enable, :start ]
end

package 'php7.1' do
    action :install
end

package 'php7.1-common' do
    action :install
end

package 'php7.1-curl' do
    action :install
end

package 'php7.1-xml' do
    action :install
end

package 'php7.1-zip' do
    action :install
end

package 'php7.1-gd' do
    action :install
end

package 'php7.1-mbstring' do
    action :install
end

package 'php7.1-fpm' do
    action :install
end

package 'php7.1-mcrypt' do
    action :install
end

package 'composer' do
    action :install
end

template "/etc/nginx/sites-enabled/default" do   
    source "default"
    notifies :reload, "service[nginx]"
end

execute 'Composer Install' do
    command 'composer install -d=/var/www/html/'
    action :run
end

# directory "/var/www/html" do
#     mode "0777"
#     recursive true
# end

# execute 'Enable permissons' do
#     command 'sudo chmod -R 777 /var/www/html/'
#     action :run
# end
