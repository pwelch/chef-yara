#
# Cookbook Name:: yara
# Recipe:: install
#

src_url      = node[:yara][:source][:url]
src_filepath = node[:yara][:source][:src_filepath]

# Ensure build tools are installed
include_recipe 'build-essential::default'

# Download YARA source code
remote_file src_url do
  source   src_url
  path     src_filepath
  checksum node[:yara][:source][:checksum]
  backup   false
end

# Some YARA features depend on OpenSSL
package 'openssl'

# Source install package dependencies
node[:yara][:src_required_pkgs].each { |pkg| package pkg }

# Install any module packages
node[:yara][:module_pkgs].each { |pkg| package pkg } if !node[:yara][:module_pkgs].empty?

# Unpack downloaded source
bash 'unarchive_yara_source' do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
    tar zxf #{::File.basename(src_filepath)} -C #{::File.dirname(src_filepath)}
  EOH
  not_if { ::File.directory?("#{node[:yara][:source][:cache_filepath]}/yara-#{node[:yara][:source][:version]}") }
end

# Run YARA bootstrap.sh and compile from source
bash 'compile_yara_source' do
  cwd  ::File.dirname(src_filepath)
  code <<-EOH
    cd yara-#{node[:yara][:source][:version]} &&
    ./bootstrap.sh &&
    ./configure #{node[:yara][:config_flags].join(' ')} &&
    make && make install
  EOH
  not_if { ::File.exist? node[:yara][:bin_path] }
end
