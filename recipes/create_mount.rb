#
# Cookbook Name:: wma_nfs
# Recipe:: create_mount
# Description:: Mounts a supposedly available EBS mount
#

node['wma']['nfs']['mounts'].each do |m|
  directory m['export'] do
    recursive true
  end

  filesystem m['export'] do
    fstype m['fstype']
    device m['device']
    mount m['export']
    action %i[create enable mount]
  end
end
