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
#OCRmyPDF configuration
sdm_ocr="$sdm_path/bin/OCRmyPDF/OCRmyPDF.sh"
#specific_path WebUi
sdm_webo="$sdm_path/recoll-webui/webui-standalone.py"
sdm_webn="$sdm_path/bin/webui-standalone.py"
sdm_webp="$sdm_path/recoll-webui/"

#Here you can change the user.
sdm_user="pi"

#Cronjobs

sdm_cron1="* * * * * sudo /home/pi/simpledocumentmanagment/bin/run.sh"
sdm_cron2="*/5 * * * * /home/pi/simpledocumentmanagment/bin/index.sh"
sdm_cron3="@reboot screen -dmS RecollWebGui bash -c "cd /home/pi/simpledocumentmanagment/bin/recoll-webui && ./webui-standalone.py -a [IP] -p 8080""
sdm_cron4="@reboot /home/pi/simpledocumentmanagment/bin/clean.sh > /dev/null 2>&1"
