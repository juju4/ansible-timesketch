require 'serverspec'

# Required by serverspec
set :backend, :exec

## Use Junit formatter output, supported by jenkins
#require 'yarjuf'
#RSpec.configure do |c|
#    c.formatter = 'JUnit'
#end

ts_port = 80

describe port("#{ts_port}") do
  it { should be_listening }
end

describe command("curl -vL http://localhost:#{ts_port}") do
  its(:stdout) { should match /<title>Timesketch<\/title>/ }
  its(:stderr) { should match /302 FOUND/ }
  its(:stderr) { should_not match /500 INTERNAL SERVER ERROR/ }
  its(:exit_status) { should eq 0 }
end

describe command("curl -v http://localhost:#{ts_port}/login/") do
  its(:stdout) { should match /<title>Timesketch<\/title>/ }
  its(:stdout) { should match /Digital Forensic Timeline Analysis/ }
  its(:stdout) { should match /login-page/ }
  its(:stderr) { should match /200i OK/ }
  its(:stderr) { should_not match /500 INTERNAL SERVER ERROR/ }
  its(:exit_status) { should eq 0 }
end
