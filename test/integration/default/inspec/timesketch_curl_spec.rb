
ts_port = 5000

title 'timesketch curl section'

control 'ts-curl-1.0' do
  impact 0.7
  title 'Web UI should be responding'
  desc 'Ensure timesketch Web UI is active and responding'

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
end
