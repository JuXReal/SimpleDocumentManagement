#!/bin/sh

. ./contrib/config.sh

#Tools we need

apt-get install ghostscript libtiff-tools imageMagick pdftk tesseract-ocr bc python-reportlab python-lxml oracle-java7-jdk screen -y

#settings the permissions

chmod 755 "$sdm_OCRmyPDF"

#Now we have to install Recoll, the Document crawler"

apt-get install recoll python-recoll -y

mkdir ~/.recoll

echo "topdirs = $sdm_handled" > ~/recoll/recoll.conf


#Now we get the Webinterface
wget https://github.com/koniu/recoll-webui/archive/v1.18.1.zip $sdm_dv

unzip "$sdm_dv/v1.18.1.zip"
rm "$sdm_dv/v1.18.1.zip"
mv "$sdm_dv/recoll-webui-1.18.1" "$sdm_dv/recoll-webui"


#Remove old Web-Recoll.py and use the new 
rm "$sdm_webo"
cp "$sdm_webn" "$sdm_webp" 

# create new cronjobs
cron1="* * * * * sudo $sdm_bin/run.sh > /dev/null 2>&1"
crontab -l echo "$cron1" | crontab -
cron2="*/5 * * * * $sdm_bin/index.sh > /dev/null 2>&1"
crontab -l echo "$cron2" | crontab -
cron3="@reboot screen -dmS RecollWebGui bash -c cd $sdm_dv/recoll-webui && ./webui-standalone.py -a localhost -p 8080"
crontab -l echo "$cron3" | crontab -
cron4="@reboot $sdm_bin/clean.sh > /dev/null 2>&1"
crontab -l echo "$cron4" | crontab -

#creating Folders
mkdir $sdm_dv/document-vault/
mkdir $sdm_dv/document-vault/tmp
mkdir $sdm_dv/document-vault/backup
mkdir $sdm_dv/document-vault/handled
mkdir $sdm_dv/document-vault/raw


#------------------ delete  all under this line, if you dont want samba -----------------------

apt-get install samba samba-common-bin -y

echo "security = user" > /etc/samba/smb.conf

echo "--- Now you have to set your Samba passwort for User Pi"

smbpasswd -a $sdm_user

#
chown -R $sdm_user:$sdm_user $sdm_raw
echo "[TestFreigabe]" > /etc/samba/smb.conf
echo "path = $sdm_raw" > /etc/samba/smb.conf
echo "writeable = yes" > /etc/samba/smb.conf
echo "guest ok  = no" > /etc/samba/smb.conf

sudo /etc/init.d/samba restart
