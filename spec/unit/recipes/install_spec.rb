#
# Cookbook Name:: yara
# Spec:: install
#

require 'spec_helper'

describe 'yara::install' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'includes build-essential::default recipe' do
      expect(chef_run).to include_recipe 'build-essential::default'
    end

    it 'downloads the yara source code file' do
      expect(chef_run).to create_remote_file(chef_run.node.yara.source.url).with(
        :source   => chef_run.node.yara.source.url,
        :path     => chef_run.node.yara.source.src_filepath,
        :checksum => chef_run.node.yara.source.checksum,
        :backup   => false
      )
    end

    it 'installs OpenSSL Package' do
      expect(chef_run).to install_package 'openssl'
    end

    context 'required packages for compiling yara from source' do
      %w{tar libtool}.each do |pkg|
        it "installs #{pkg} package" do
          expect(chef_run).to install_package pkg
        end
      end
    end

    it 'executes bash command to unarchive yara source' do
      expect(chef_run).to run_bash('unarchive_yara_source')
    end

    it 'executes bash command to compile yara source' do
      expect(chef_run).to run_bash('compile_yara_source')
    end
  end
end
