#!/bin/bash
if [ $(ps -ef | grep -v grep | grep nginx | wc -l) = 0 ]
then
	echo “nginx is dead”
    sudo systemctl start nginx
else
    echo "nginx is running."
fi