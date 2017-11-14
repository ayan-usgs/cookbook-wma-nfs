#
# Cookbook Name:: wma_nfs
# Recipe:: create_mount
# Description:: Mounts a supposedly available EBS mount
#

node['wma']['nfs']['mounts'].each do |m|
  owner = m.attribute?(:owner) ? m['owner'] : 'root'
  group = m.attribute?(:group) ? m['group'] : 'root'
  mode = m.attribute?(:mode) ? m['mode'] : '0o777'

  directory m['export'] do
    recursive true
    owner owner
    group group
    mode mode
  end

  mount m['export'] do
    device m['device']
    fstype m['fstype']
    options m['options']
    action %i[mount enable]
    notifies :create, "directory[#{m['export']}]", :immediately
  end
end
