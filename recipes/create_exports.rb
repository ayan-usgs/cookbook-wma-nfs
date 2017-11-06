#
# Cookbook Name:: wma_nfs
# Recipe:: create_exports
# Description:: Creates the exports
#

node['wma']['nfs']['exports'].each do |e|
  nfs_export e['export'] do
    network e['ip_range']
    writeable e['writeable']
    sync e['sync']
    options e['options']
  end
end
