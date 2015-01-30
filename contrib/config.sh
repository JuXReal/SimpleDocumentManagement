#!/bin/bash
#main path configuration
sdm_path="/home/pi/simpledocumentmanagment"

#specific path configuration
sdm_raw="$sdm_path/document-vault/raw"
sdm_tmp="$sdm_path/document-vault/tmp"
sdm_handled="$sdm_path/document-vault/handled"
sdm_backup="$sdm_path/document-vault/backup"
sdm_dv="$sdm_path"
sdm_bin="$sdm_path/bin"

#specific script path configuration
sdm_run="$sdm_path/bin/run.sh"
sdm_index="$sdm_path/bin/index.sh"
sdm_webui="$sdm_path/recoll-webui && ./webui-standalone.py -a"
sdm_clean="$sdm_path/bin/clean.sh"


#OCRmyPDF configuration
sdm_ocr="$sdm_path/bin/OCRmyPDF/OCRmyPDF.sh"

#specific_path WebUi
sdm_webo="$sdm_path/recoll-webui/webui-standalone.py"
sdm_webn="$sdm_path/bin/webui-standalone.py"
sdm_webp="$sdm_path/recoll-webui/"

#Here you can change the user.
sdm_user="pi"

#Cronjobs

sdm_cron1="* * * * * sudo $sdm_run"
sdm_cron2="*/5 * * * * $sdm_index"
sdm_cron3="@reboot screen -dmS RecollWebGui bash -c" "cd $sdm_webui"""
sdm_cron4="@reboot $sdm_clean > /dev/null 2>&1"