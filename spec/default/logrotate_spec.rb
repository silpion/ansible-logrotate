require 'spec_helper'

describe package('logrotate') do
  it { should be_installed }
end

describe file('/etc/logrotate.d/ansible_logrotate_ansiblelogrotatetest') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode '644' }
  its(:content) { should match 'Managed by Ansible' }
end

# write up RSpec integration tests here
#   see: http://serverspec.org/resource_types.html
