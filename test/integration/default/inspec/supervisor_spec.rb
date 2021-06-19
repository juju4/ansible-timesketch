
title 'supervisor section'

control 'supervisor-1.0' do
  impact 0.7
  title 'supervisor should be present'
  desc 'Ensure supervisor is present and active'

  describe service('supervisor'), :if => os[:family] == 'ubuntu' do
    # it { should be_enabled   }
    it { should be_running   }
  end

  describe service('supervisord'), :if => os[:family] == 'redhat' do
    # it { should be_enabled }
    it { should be_running }
  end

  describe command('supervisorctl status') do
    its(:stdout) { should_not match /FATAL/ }
    its(:stdout) { should_not match /unix:\/\/\/var\/run\/supervisor.sock no such file/ }
    its(:exit_status) { should eq 0 }
  end
end
