zfs-stats-linux
===============
Arcstats from zfs

* ADDED updated column showing disk read access in percentage against the caches.
  (only works if you have l2arc enabled).

Various bash scripts and tools for ZFS on linux 
Tested on:
-Debian 32 and 64 bit (squeeze and wheezy)
-Ubuntu 32 and 64 bit (12.04 lts)

could look like: 
/usr/local/bin/arcstat
This will display the cache hit and miss ratio's.

|---------------------------------------------------------------------------------------------------------------------|
|l1reads    l1miss     l1hits     l1hit%     size  |  l2reads    l2misses   l2hits     l2hit%     size   disk_access% |            
|---------------------------------------------------------------------------------------------------------------------|
|19589972   1643921    17946051   91.608%    12 GB  |  1643897    1636984    6913       .420%      3GB     8.388%     |         
|19592461   1644289    17948172   91.607%    12 GB  |  1644264    1637351    6913       .420%      3GB     8.389%     |         
|19596247   1645110    17951137   91.604%    13 GB  |  1645086    1638173    6913       .420%      3GB     8.392%     |         
|19599767   1645721    17954046   91.603%    13 GB  |  1645700    1638787    6913       .420%      3GB     8.393%     |         
|19601040   1646029    17955011   91.602%    12 GB  |  1646004    1639091    6913       .419%      3GB     8.394%     |         
|19604432   1646499    17957933   91.601%    12 GB  |  1646477    1639564    6913       .419%      3GB     8.395%     |         
