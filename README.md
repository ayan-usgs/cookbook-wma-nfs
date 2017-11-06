WMA NFS
---

[![Build Status](https://travis-ci.org/USGS-CIDA/cookbook-wma-nfs.svg?branch=master)](https://travis-ci.org/USGS-CIDA/cookbook-wma-nfs)

Description
-----------

Installs and configures NFS client, or server components

Requirements
------------

This cookbook depends on the [nfs](https://supermarket.chef.io/cookbooks/nfs),
[filesystem](https://supermarket.chef.io/cookbooks/filesystem) and [iptables](https://supermarket.chef.io/cookbooks/iptables)
cookbooks.

### Attributes (See attributes/default.rb for examples)

Client:
* `['wma']['nfs']['mounts']`
  - An array which defines which remote NFS mounts get mounted onto the client.

Server:
* `['wma']['nfs']['exports']`
  - An array which defines which local directories get exported on the NFS server

* `['wma']['nfs']['iptables']`
  - A hash defining which ports to open in IPTables.

## Usage

To create NFS mounts on a server, add the following to a runlist:

- recipe[iptables]
- recipe[nfs::server4]
- recipe[wma_nfs::create_exports]
- recipe[wma_nfs::iptables_create]

Note that you can use `nfs::server` instead of `nfs::server4` if your kernel does
not support NFSv4

An example attribute set for a server may look like:
```json
{
  "wma" :   {
    "nfs" : {
      "exports" : [
        {
          "export" : "/usr/local/share",
          "ip_range" : "*",
          "options" : [ "rw", "nohide", "insecure", "async", "no_root_squash", "no_subtree_check" ],
          "writeable" : true,
          "sync" : true
        }
      ]
    }
  }
}
```

To mount exported shares on an NFS client, add thw following to a runlist:

- recipe[iptables]
- recipe[nfs::client4]
- recipe[wma_nfs::create_mount]

Note that you can use `nfs::default` instead of `nfs::client4` if your kernel does
not support NFSv4

An example attribute set for a client may look like:
```json
{
  "wma" :   {
    "nfs" : {
      "mounts" : [
        {
          "export" : "/usr/local/share/nfs",
          "device" : "192.168.33.53:/usr/local/share",
          "fstype" : "nfs",
          "options" : "rw"
        }
      ]
    }
  }
}
```

## License and Author

Author: Ivan Suftin (isuftin@usgs.gov)

See CPL1.0 LICENSE file for licensing details
