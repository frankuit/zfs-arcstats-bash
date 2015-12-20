zfs-arcstats-bash
===============
Arcstats from zfs written in BASH, based on the perl script (a bit)

* Fixed Division by zero errors in arcstat.sh (thanks Tomribbens)

* ADDED updated column showing disk read access in percentage against the caches.
  (only works if you have l2arc enabled).

Various bash scripts and tools for ZFS on linux 
Tested on:
-Debian 32 and 64 bit (squeeze,wheezy and Jessie)
-Ubuntu 32 and 64 bit (12.04 lts)

Place in /usr/local/bin, chmod +xxx /usr/local/bin/arcstats.sh and launch
