#
# Cookbook:: jenkins_local
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserve.

# Installs Java
include_recipe 'java'

# Adds the Jenkins apt repository
apt_repository 'jenkins' do
	uri  'https://pkg.jenkins.io/debian'
  key  'https://pkg.jenkins.io/debian/jenkins.io.key'
  distribution  'binary/'
  action :add
end

# Installs Jenkins
package 'jenkins'

# Starts and enables the Jenkins service
service 'jenkins' do
  action [:enable, :start]
end

# Prints the admin Password
execute 'Admin Password' do
  command 'cat /var/lib/jenkins/secrets/initialAdminPassword'
end
