#!/bin/bash
echo "This will display the cache hit and miss ratio's."
echo "for a time limited run (in seconds) add a number of seconds behind this command"
printf "\n\n"
printf '\e[33m'
echo "|---------------------------------------------------------------------------------------------------------------------|"
printf '%-11s %-10s %-10s %-10s %-5s %-2s %-10s %-10s %-10s %-10s %-6s %-2s %-2s %-5s %-3s \n' \|l1reads l1miss l1hits l1hit% size \| l2reads l2misses l2hits l2hit% size disk_access%  \|
echo "|---------------------------------------------------------------------------------------------------------------------|"
printf '\e[0m'
#create counter variable
count=0
zero=0
if [ -z $VAR2 ];then
        VAR2=1000000
fi
while [ $count -le $VAR2 ]
do
        #increase counter by 1
        count=`echo $count+1|bc`
        if [ "$count" == "25" ];then
        printf '\e[33m'
        echo "|---------------------------------------------------------------------------------------------------------------------|"
        printf '%-11s %-10s %-10s %-10s %-5s %-2s %-10s %-10s %-10s %-10s %-6s %-2s %-2s %-5s %-3s \n' \|l1reads l1miss l1hits l1hit% size \| l2reads l2misses l2hits l2hit% size disk_access%  \|
        echo "|---------------------------------------------------------------------------------------------------------------------|"
        printf '\e[0m'
                count=1
        fi

        l1sizeb=`awk '/^size/ {printf $3;}' /proc/spl/kstat/zfs/arcstats`
        l1size=`echo $l1sizeb/1024/1024/1024|bc`
        l1miss=`awk '/^misses/ {printf $3;}' /proc/spl/kstat/zfs/arcstats`
        l1hits=`awk '/^hits/ {printf $3;}' /proc/spl/kstat/zfs/arcstats`
        l1read=`echo $l1hits+$l1miss |bc`
        l1hitp=`echo scale=3\; '100*'$l1hits/$l1read''|bc -l`

        l2sizeb=`awk '/l2_size/ {printf $3;}' /proc/spl/kstat/zfs/arcstats`
	if [[ `echo $l2sizeb` -ne $zero ]];then 
	        l2size=`echo $l2sizeb/1024/1024/1024|bc`
	      	l2miss=`awk '/l2_misses/ {printf $3;}' /proc/spl/kstat/zfs/arcstats`
	        l2hits=`awk '/l2_hits/ {printf $3;}' /proc/spl/kstat/zfs/arcstats`
	        l2read=`echo $l2hits+$l2miss|bc`
	        l2hitp=`echo scale=3\; '100*'$l2hits/$l2read''|bc -l`
	        cachep=`echo scale=3\; $l2hitp'/100+'$l1hitp|bc -l`
		diska=`echo scale=3\; '100-'$cachep|bc -l`


	        printf '\e[33m|\e[0m%-10s %-10s %-10s %-10s %-1s %-3s\e[33m %-2s\e[0m %-10s %-10s %-10s %-10s %-7s %-10s %-7s\e[33m %-1s\e[0m \n' $l1read $l1miss $l1hits $l1hitp% $l1size GB \| $l2read $l2miss $l2hits $l2hitp% ${l2size}GB $diska% \|
	else
        	printf '\e[33m|\e[0m%-10s %-10s %-10s %-10s %-1s %-3s\e[33m %-2s\e[0m %-10s %-10s %-10s %-10s %-7s %-10s %-7s\e[33m %-1s\e[0m \n' $l1read $l1miss $l1hits $l1hitp% $l1size GB \|
	fi
	

        sleep 1
done

