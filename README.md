# rhel-offline-update
bash shell script to auto download red hat patch (for offline environment)
Note: make sure redhat subscription already done

This script is only use for auto download patch from online red hat host if you have multiple offline server

How to:
1. from offline server do # tar cjf server-name1.tar.bz2 /var/lin/rpm
2. transfer server-name1.tar.bz2 to online redhat server and run this script
3. after download from online server the script will create server-name1-update.tar.bz2
4. transfer server-name1-update.tar.bz2 back to offline server and do # mkdir /tmp/server-name1-update
5. #tar xf server-name1-update.tar.bz2 -C  /tmp/server-name1-update
6. #yum localinstall /tmp/server-name1-update/*.rpm
