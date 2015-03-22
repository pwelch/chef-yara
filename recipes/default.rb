#
# Cookbook Name:: yara
# Recipe:: default
#

include_recipe 'yara::install'

include_recipe 'yara::python' if node[:yara][:install_yara_python]
