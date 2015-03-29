#!/bin/sh

. ./contrib/config.sh


myIP=$(ip a s|sed -ne '/127.0.0.1/!{s/^[ \t]*inet[ \t]*\([0-9.]\+\)\/.*$/\1/p}')



#Tools we need

apt-get install ghostscript libtiff-tools imageMagick pdftk tesseract-ocr bc python-reportlab python-lxml oracle-java7-jdk screen -y

#settings the permissions

chmod 755 -R $sdm_ocrmypdf

#Now we have to install Recoll, the Document crawler"

apt-get install recoll python-recoll -y

mkdir ~/.recoll

echo "topdirs = $sdm_handled" > ~/.recoll/recoll.conf


#Now we get the Webinterface
wget https://github.com/koniu/recoll-webui/archive/v1.18.1.zip $sdm_dv

unzip $sdm_dv/v1.18.1.zip
rm $sdm_dv/v1.18.1.zip
mv $sdm_dv/recoll-webui-1.18.1 $sdm_dv/recoll-webui


#Remove old Web-Recoll.py and use the new 
rm $sdm_webo
cp $sdm_webn $sdm_webp 

chmod +x $sdm_webo

#Add cronjobs
crontab -l -u $sdm_user > oldcrontab

#echo new cron into cron file
echo "$sdm_cron1" >> oldcrontab
echo "$sdm_cron2" >> oldcrontab
echo "$sdm_cron3 $myIP -p 8080\" "  >> oldcrontab
echo "$sdm_cron4" >> oldcrontab

#install new cron file
crontab -u $sdm_user oldcrontab
rm oldcrontab


# create with parent
mkdir -p $sdm_vault
mkdir $sdm_tmp
mkdir $sdm_backup
mkdir $sdm_handled
mkdir $sdm_raw
chmod 755 -R $sdm_vault


#chmod for the scripts
chown -R $sdm_user:$sdm_user "$sdm_run"
chown -R $sdm_user:$sdm_user "$sdm_index"
chown -R $sdm_user:$sdm_user "$sdm_clean"

#make the scripts exc.

chmod +x $sdm_run
chmod +x $sdm_index
chmod +x $sdm_clean

#own folder structure none root user
chown -R $sdm_user:$sdm_group $sdm_path

samba_install() {
apt-get install samba samba-common-bin -y

echo "security = user" >> /etc/samba/smb.conf

echo "--- Now you have to set your Samba passwort for User Pi"

smbpasswd -a $sdm_user


chown -R $sdm_user:$sdm_user $sdm_raw
echo "[input Raw]" >> /etc/samba/smb.conf
echo "path = $sdm_raw" >> /etc/samba/smb.conf
echo "writeable = yes" >> /etc/samba/smb.conf
echo "guest ok  = no" >> /etc/samba/smb.conf

echo "[handled]" >> /etc/samba/smb.conf
echo "path = $sdm_handled" >> /etc/samba/smb.conf
echo "writeable = yes" >> /etc/samba/smb.conf
echo "guest ok  = no" >> /etc/samba/smb.conf

sudo /etc/init.d/samba restart
}

if [ "$install_samba" == "yes" ] ; then
 samba_install()
else

fi
