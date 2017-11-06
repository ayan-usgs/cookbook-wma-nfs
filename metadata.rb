name             'wma_nfs'
maintainer       'Ivan Suftin'
maintainer_email 'isuftin@usgs.gov'
license          'CPL-1.0'
description      'Installs/Configures NFS'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'
source_url 'https://github.com/USGS-CIDA/wma-nfs/issues'
issues_url 'https://github.com/USGS-CIDA/wma-nfs/issues'
chef_version '>= 12.5' if respond_to?(:chef_version)
supports         'centos', '>= 6.6'
supports         'centos', '>= 7.1'
depends 'filesystem'
depends 'nfs'
depends 'iptables'
