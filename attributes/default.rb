#
# Cookbook Name:: yara
# Attributes:: default
#

# YARA source file attributes
default[:yara][:source][:version]        = '3.3.0'
default[:yara][:source][:checksum]       = 'e5f4359082e35ff00ee94af9ee897bb0ab18abf49a2c4fe45968d7a848e5bd83'
default[:yara][:source][:url]            = "https://github.com/plusvic/yara/archive/v#{node[:yara][:source][:version]}.tar.gz"
default[:yara][:source][:cache_filepath] = Chef::Config[:file_cache_path] || '/tmp'
default[:yara][:source][:src_filepath]   = "#{node[:yara][:cache_filepath]}/yara-#{node[:yara][:source][:version]}.tar.gz"

# YARA modules
default[:yara][:module_pkgs]  = []
default[:yara][:config_flags] = []

# YARA required packages for building from source
default[:yara][:src_required_pkgs] = %w{tar libtool}

# YARA attributes
default[:yara][:bin_path] = '/usr/local/bin/yara'
