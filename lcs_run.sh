#!/bin/sh
. ./function.sh

    case $1 in
       "help")
		echo "Bulid DB Server Service: $version"  
##### HELP LCS Service#######
		echo "help         DB Server Service information"
		echo "rm           Remove  Docker Server"
		echo "rmi          Remove  Docker Server and Remove Docker Images"
		echo "up          All Run Bulid"
##### The code END ############
    	;;
	"up")
        	all_run
		echo "RUN ALL"
#####  The code END #############
    	;;
    	"rm")
	    	stop_kill
	    	echo "Remove  Docker Server"
#####  The code END #############
		;;
    	"rmi")
		kill_all
		echo "Remove  Docker Server and Docker Images"
#####  The code END #############
		;;
	*)
      		echo "Please Usage sh lcs_run.sh help"
	;;
    esac
