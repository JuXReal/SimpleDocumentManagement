#!/bin/bash
# Import config file
. ./contrib/config.sh

#In some cases you have to reboot and then use this script to get recoll webui working
echo "topdirs = $sdm_handled" > "/home/$sdm_user/.recoll/recoll.conf"
