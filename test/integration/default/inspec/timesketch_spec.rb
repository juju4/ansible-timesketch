
title 'timesketch cli section'

control 'ts-cli-1.0' do
  impact 0.7
  title 'Web UI should be responding'
  desc 'Ensure timesketch Web UI is active and responding'

  describe process("tsctl") do
    its(:user) { should eq "_timesketch" }
    it "is listening on port 5000" do
      expect(port(5000)).to be_listening
    end
  end
end
