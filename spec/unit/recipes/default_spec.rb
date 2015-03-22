#
# Cookbook Name:: yara
# Spec:: default
#

require 'spec_helper'

describe 'yara::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run
    end

    it 'includes yara::install recipe' do
      expect(chef_run).to include_recipe 'yara::install'
    end
  end
end
