#
# Cookbook:: env-cookbook-main
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'git'
package 'tree'

package 'nginx' do
  action :install
end

service 'nginx' do
    action [ :enable, :start ]
  end

package 'php' do
    action :install
end

package 'php-fpm' do
    action :install
end

package 'php-mbstring' do
    action :install
end

package 'php-mcrypt' do
    action :install
end

package 'php-dom' do
    action :install
end

package 'php-zip' do
    action :install
end

package 'composer' do
    action :install
end

template "/etc/nginx/sites-enabled/default" do   
    source "default"
    notifies :reload, "service[nginx]"
  end

directory "/var/www/html" do
    mode "0777"
    recursive true
  end

#   execute 'Enable permissons' do
#     command 'sudo chmod -R 777 *'
#     action :run
#   end

#   execute 'Composer Update' do
#     command 'composer update'
#     action :run
#   end

  execute 'Composer Install' do
    command 'composer install -d=/var/www/html/'
    action :run
  end