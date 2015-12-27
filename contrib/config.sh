#!/bin/bash

# User and group of document management system
sdm_user="pi"
sdm_group="pi"

# Main path configuration
sdm_path="/home/${sdm_user}/SimpleDocumentManagement"

# Specific path configuration
sdm_dv="${sdm_path}"
sdm_vault="${sdm_dv}/document-vault"
sdm_raw="${sdm_vault}/raw"
sdm_tmp="${sdm_vault}/tmp"
sdm_handled="${sdm_vault}/handled"
sdm_backup="${sdm_vault}/backup"
sdm_bin="${sdm_vault}/bin"
sdm_ocrmypdf="${sdm_path}/bin/OCRmyPDF"

# Specific script path configuration
sdm_run="$sdm_path/bin/run.sh"
sdm_index="$sdm_path/bin/index.sh"
sdm_clean="$sdm_path/bin/clean.sh"

# OCRmyPDF configuration
sdm_ocr="$sdm_path/bin/OCRmyPDF/OCRmyPDF.sh -d -l deu"

# Specific path WebUi
sdm_webo="$sdm_path/recoll-webui/webui-standalone.py"
sdm_webn="$sdm_path/bin/webui-standalone.py"
sdm_webp="$sdm_path/recoll-webui/"

# Cronjobs
sdm_cron1="* * * * * cd $sdm_path/bin && sudo ./run.sh"
sdm_cron2="*/5 * * * * cd $sdm_path/bin && ./index.sh"
sdm_cron3="@reboot screen -dmS RecollWebGui bash -c \"cd $sdm_path/recoll-webui && ./webui-standalone.py -a"
sdm_cron4="@reboot cd $sdm_path/bin && ./clean.sh"

# Change to anything else than "yes" to NOT install Samba
install_samba=true
