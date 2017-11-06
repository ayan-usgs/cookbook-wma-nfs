#
# Cookbook Name:: wma_nfs
# Recipe:: create_mount
# Description:: Mounts a supposedly available EBS mount
#

node['wma']['nfs']['mounts'].each do |m|
  directory m['export'] do
    recursive true
  end

  mount m['export'] do
    device m['device']
    fstype m['fstype']
    options m['options']
    action %i[mount enable]
  end
end
