#!/bin/bash

# Here you can change the user.
sdm_user="pi"

#main path configuration
sdm_path="/home/${sdm_user}/Simpledocumentmanagment"


#specific path configuration
sdm_dv="${sdm_path}"
sdm_vault="${sdm_dv}/document-vault"
sdm_raw="${sdm_vault}/raw"
sdm_tmp="${sdm_vault}/tmp"
sdm_handled="${sdm_vault}/handled"
sdm_backup="${sdm_vault}/backup"
sdm_bin="${sdm_vault}/bin"

#specific script path configuration
sdm_run="$sdm_path/bin/run.sh > /dev/null 2>&1"
sdm_index="$sdm_path/bin/index.sh > /dev/null 2>&1"
sdm_clean="$sdm_path/bin/clean.sh > /dev/null 2>&1"


#OCRmyPDF configuration
sdm_ocr="$sdm_path/bin/OCRmyPDF/OCRmyPDF.sh"

#specific_path WebUi
sdm_webo="$sdm_path/recoll-webui/webui-standalone.py"
sdm_webn="$sdm_path/bin/webui-standalone.py"
sdm_webp="$sdm_path/recoll-webui/"


#Cronjobs

sdm_cron1="* * * * * sudo $sdm_run"
sdm_cron2="*/5 * * * * $sdm_index"
sdm_cron3="@reboot screen -dmS RecollWebGui bash -c "cd $sdm_path/recoll-webui && ./webui-standalone.py -a""
sdm_cron4="@reboot $sdm_clean"

# Change to anything else than "yes" to NOT install Samba
install_samba="yes"
