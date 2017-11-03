
# For each of these exports,
# see https://supermarket.chef.io/cookbooks/filesystem for usage
# Example:
# default['wma']['nfs']['mounts'] = [
# 	{
# 		:export => "/usr/local/share",
# 		:device => "/dev/xvdf",
# 		:fstype => "ext4",
# 		:options => "rw"
# 	}
# ]

default['wma']['nfs']['mounts'] = []

# For each of these exports,
# see https://supermarket.chef.io/cookbooks/nfs for usage
# Example:
# default['wma']['nfs']['exports'] = [
#   {
#     export: '/usr/local/share',
#     ip_range: '0.0.0.0/0',
#     options: %w[rw no_root_squash no_subtree_check],
#     writeable: true,
#     sync: true
#   }
# ]
default['wma']['nfs']['exports'] = []

default['wma']['nfs']['iptables'] = {
  'port_111_portmapper' => [
    '# TCP Port 111 for portmapper',
    '-A FWR -p tcp -m tcp --dport 111 -j ACCEPT',
    '# UDP Port 111 for portmapper',
    '-A FWR -p udp -m udp --dport 111 -j ACCEPT'
  ],
  'port_662_status' => [
    '# TCP Port 662 for status',
    '-A FWR -p tcp -m tcp --dport 662 -j ACCEPT',
    '# UDP Port 662 for status',
    '-A FWR -p udp -m udp --dport 662 -j ACCEPT'
  ],
  'port_875_rquotad' => [
    '# TCP Port 875 for rquotad',
    '-A FWR -p tcp -m tcp --dport 875 -j ACCEPT',
    '# UDP Port 875 for rquotad',
    '-A FWR -p udp -m udp --dport 875 -j ACCEPT'
  ],
  'port_892_mountd' => [
    '# TCP Port 892 for mountd',
    '-A FWR -p tcp -m tcp --dport 892 -j ACCEPT',
    '# UDP Port 892 for mountd',
    '-A FWR -p udp -m udp --dport 892 -j ACCEPT'
  ],
  'port_2049_nfs' => [
    '# TCP Port 2049 for NFS',
    '-A FWR -p tcp -m tcp --dport 2049 -j ACCEPT',
    '# UDP Port 2049 for NFS',
    '-A FWR -p udp -m udp --dport 2049 -j ACCEPT'
  ],
  'port_32769_32803_nlockmgr' => [
    '# TCP Port 32803 for nlockmgr',
    '-A FWR -p tcp -m tcp --dport 32803 -j ACCEPT',
    '# UDP Port 32769 for nlockmgr',
    '-A FWR -p udp -m udp --dport 32769 -j ACCEPT'
  ]
}
