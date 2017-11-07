#
# Cookbook Name:: wma_nfs
# Recipe:: mount_device
# Description:: Mounts a supposedly available drive
#

mount_config = node['wma']['file']['mount']
base_dir = mount_config['base_dir']
volume = mount_config['volume']

directory base_dir do
  recursive true
end

filesystem base_dir do
  fstype 'ext4'
  device volume
  mount base_dir
  action %i[create enable mount]
end
