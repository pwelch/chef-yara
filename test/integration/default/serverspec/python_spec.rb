require 'spec_helper'

describe 'yara::python' do
  yara_python_test = %{/usr/bin/python -c 'import yara'}

  describe package('python-dev') do
    it { should be_installed }
  end

  describe package('python') do
    it { should be_installed }
  end

  describe command(yara_python_test) do
    its(:exit_status) { should eq 0 }
  end
end
