#
# Cookbook Name::apache
# Recipe::default
#
# Copyright 2015, BTY
#
# All rights reserved - Do Not Redistribute
#
# chef-repo/cookbooks/apache/recipes/default.rb

package_name = “apache2”
service_name = “apache2”
document_root = “/var/www/html”

if node[“platform”] == “centos” do
   package_name = “httpd”
  service_name = “httpd”
   document_root = “/var/www/html”
end

#Install apache
package “package_name” do
  action :install
end
#
# start the apache service
# make sure the service starts on reboot
service “service_name” do
  action [ :enable, :start]
end

# Write our home page
# cookbook_file “#{document_root}/index.html" do
#   source "index.html"
#   mode "0644"
# end
#
template “#{document_root}/index.html" do
 source "index.html.erb"
 mode "0644"
end
