#
# Cookbook Name:: yara
# Spec:: python
#

require 'spec_helper'

describe 'yara::python' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'includes python::default recipe' do
      expect(chef_run).to include_recipe 'python::default'
    end

    it 'executes bash command to install yara-python extension' do
      expect(chef_run).to run_bash('install_yara_python_extension')
    end
  end
end
