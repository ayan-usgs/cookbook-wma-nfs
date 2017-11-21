#
# Cookbook Name:: wma_nfs
# Recipe:: create_exports
# Description:: Creates the exports
#

node['wma']['nfs']['exports'].each do |e|
  directory "Create directory #{e['export']}" do
    path e['export']
    recursive true
    ignore_failure true
    only_if { e.attribute?(:create) && e['create'] }
    action :create
  end

  nfs_export e['export'] do
    network e['ip_range']
    writeable e['writeable']
    sync e['sync']
    options e['options']
  end
end
