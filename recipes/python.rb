#
# Cookbook Name:: yara
# Recipe:: python
#

# Ensure Python is installed
# Yara depends on python-dev which python cookbook installs by default
include_recipe 'python::default'

# Install Yara Python Extension
bash 'install_yara_python_extension' do
  cwd  ::File.dirname(node[:yara][:source][:src_filepath])
  code <<-EOH
    cd yara-#{node[:yara][:source][:version]}/yara-python &&
    /usr/bin/python setup.py build &&
    /usr/bin/python setup.py install
  EOH
  not_if { ::File.exist? node[:yara][:python_lib_check] }
end
