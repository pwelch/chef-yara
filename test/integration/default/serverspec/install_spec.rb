require 'spec_helper'

describe 'yara::install' do
  yara_bin = '/usr/local/bin/yara'

  %w{
    build-essential
    openssl
    tar
    libtool
  }.each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end

  describe file(yara_bin) do
    it { should be_file }
  end
end
