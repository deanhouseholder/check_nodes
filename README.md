check_nodes.sh
============

Description:
------------------

This script allows you to monitor a list of applications each running on servers in different environments.  For example, these can be webservers: apache/nginx/etc., application servers: tomcat/nodejs/IIS/etc., database servers: mysql/oracle/etc., or anything else that listens on a port.

Instructions:
-------------------

1. Edit the key/value pairs in the arrays: ENV_LIST, PORT_LIST, SERVERS, APPS with the data for your own applications
2. Run:  ./scriptname.sh

Requirements:
----------------------

This script does require "nc" to be installed.

Note:
---------

This works both on linux and cygwin.