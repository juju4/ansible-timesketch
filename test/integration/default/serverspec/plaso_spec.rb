require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/usr/bin/log2timeline.py') do
  it { should be_file }
  it { should be_executable }
#  it { should be_executable.by('root') }
  it { should be_executable.by('others') }
end

describe command('log2timeline.py -V') do
  its(:stdout) { should match /plaso - log2timeline version/ }
  its(:stderr) { should_not match /ModuleNotFoundError/ }
end

describe command('psort.py -o timesketch -h') do
  its(:stdout) { should match /Application to read, filter and process output from a Plaso storage file./ }
  its(:stderr) { should_not match /ModuleNotFoundError/ }
end
