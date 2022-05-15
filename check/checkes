#!/usr/bin/env bash

action=$1
ROOT=`pwd`
SCRIPT=/etc/init.d/elasticsearch
NAME=elasticsearch
LOGPATH=${ROOT}/elastichsearch_check.log


function do_start()
{
    get_pid
    if [ "$pid" ] ;then
       echo "already started"
    else
        echo start it
        ${SCRIPT} start >> ${LOGPATH} 2>&1 &
        echo $(date +%Y-%m-%di_%H:%M:%S)"restarted" >> ${LOGPATH}
    fi
}

function do_stop()
{
    get_pid
    if [ "$pid" ] ;then
       kill -15 $pid
       echo "stopped the process"
    else
       echo "no process is running"
    fi
}

function get_pid()
{
   pid=`ps -fe | grep "${NAME}" | grep -v "grep" |awk -F " " '{print $2}'`
}


case $action in

start)
    do_start;
;;

stop)
    do_stop;
;;

restart)
    do_stop;
    do_start;
;;

info)
    get_pid;
    if [ "$pid" ] ;then
       echo "the process pid is "$pid
    else
       echo "no process is running"
    fi
;;
*)
    echo "bad args, you need input args in start,stop,restart"
;;

esac
