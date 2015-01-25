#!/bin/bash
#main path configuration
sdm_path="./"
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