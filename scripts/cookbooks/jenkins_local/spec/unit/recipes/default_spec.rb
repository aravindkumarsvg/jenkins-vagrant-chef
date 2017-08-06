#
# Cookbook:: jenkins_local
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'jenkins_local::default' do
  context 'When all attributes are default, on an Ubuntu 14.04' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'Includes Java recipe' do
      expect(chef_run).to include_recipe('java')
    end

    it 'adds a apt_repository with jenkins' do
      expect(chef_run).to add_apt_repository('jenkins')
    end

    it 'Installs Jenkins package' do
      expect(chef_run).to install_package('jenkins')
    end

    it 'should starts and enables the Jenkins service' do
      expect(chef_run).to enable_service('jenkins')
      expect(chef_run).to start_service('jenkins')
    end

    it 'Outputs Admin password' do
      expect(chef_run).to run_execute('Admin Password').with(command: 'cat /var/lib/jenkins/secrets/initialAdminPassword')
    end
  end
end
