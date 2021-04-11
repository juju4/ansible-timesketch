require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/usr/bin/log2timeline.py') do
  it { should be_file }
  it { should be_executable }
#  it { should be_executable.by('root') }
  it { should be_executable.by('others') }
end

describe command('docker --version') do
  its(:stdout) { should match /Docker version .*, build / }
  its(:stderr) { should_not match /Error/i }
  its(:exit_status) { should eq 0 }
end

describe command('docker-compose --version') do
  its(:stdout) { should match /docker-compose version .*, build / }
  its(:stderr) { should_not match /Error/i }
  its(:exit_status) { should eq 0 }
end

describe command('docker image ls') do
  its(:stdout) { should match /timesketch/ }
  its(:stderr) { should_not match /Error/i }
  its(:exit_status) { should eq 0 }
end

describe command("docker exec -it timesketch_postgres_1 psql -U timesketch -c '\l'") do
  its(:stdout) { should match /timesketch/ }
  its(:stderr) { should_not match /Error/i }
  its(:exit_status) { should eq 0 }
end

