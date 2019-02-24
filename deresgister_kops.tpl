#! /bin/sh
### BEGIN INIT INFO
# Provides:          atd
# Required-Start:    $syslog $time $remote_fs
# Required-Stop:     $syslog $time $remote_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Kops cluster deregistration
# Description:      
#                    scheduler
### END INIT INFO
#
# Author:       Olu Ojewale 
#

PATH=/bin:/usr/bin:/sbin:/usr/sbin
DAEMON=/usr/sbin/kopsd
PIDFILE=/var/run/kopsd.pid

. /lib/lsb/init-functions

case "$1" in
  start)
    ;;
  stop)
        kops delete cluster --name="${cluster_name}" --state=s3://"${cluster_state_s3}" --yes
    ;;
  force-reload|restart)
    $0 stop
    $0 start
    ;;
  status)
    ;;
  *)
    echo "Usage: /etc/init.d/kopsd {start|stop}"
    exit 1
    ;;
esac

exit 0

