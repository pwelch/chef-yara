#
# Cookbook Name:: yara
# Attributes:: python
#

# YARA Python Extension
default[:yara][:install_yara_python] = true
default[:yara][:python_lib_path]     = '/usr/local/lib/python2.7/dist-packages'
default[:yara][:python_lib_check]    = "#{node[:yara][:python_lib_path]}/yara_python-#{node[:yara][:source][:version]}.egg-info"
