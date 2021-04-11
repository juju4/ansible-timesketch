require 'serverspec'

# Required by serverspec
set :backend, :exec

describe process("docker-proxy") do

  its(:user) { should eq "root" }

  it "is listening on port 80" do
    expect(port(80)).to be_listening
  end

end

