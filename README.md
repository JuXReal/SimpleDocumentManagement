# SimpleDocumentManagement

IMPORTANT NOTE: 
This scirpts works only with Debian Wheezy at the moment (10.04.2016) - Based on a Problem with OCRmyPDF in Jessie, i have to fix the code there. Work in Progress. (10.04.2016)

A Wheezy Complete ready to use image is availible in a few hour! (10.04.2016)

## What is SimpleDocumentManagement?

SimpleDocumentManagement is a lightweight solution for digital document management with OCR, which works on the Raspberry Pi (tested with Raspbian). It based on other projects, create a structure and is an installer for the document management. You will have access to the documents by using a webinterface, an desktop application and samba network share.

It is designed to turn a clean, fresh installed raspberry Pi to a document managment system, with easy functions. 

## Know issues

- German umlauts (äöu etc.) does not work.
- Use old versions of some scripts because of compatibility.

## Install instructions (detail)

0. if github is not installed (sudo apt-get install git)
1. Clone or download the project from GitHub (command: git clone https://github.com/juxreal/SimpleDocumentManagement )
2. Chnage the folder (command:  cd SimpleDocumentManagement)
3. Change the configurations at ~/contrib/config.sh (command: nano contrib/config.sh)
4. Change the permission for the installer. (command: sudo chmod +x SDM.sh)
5. Run the installer SDM.sh (command: sudo ./SDM.sh)
6. sudo reboot

recommend optional commandes (if you have trouble with recoll GUI)

7. sudo chmod +x recollfix.sh 
8. sudo ./recoll.sh
 

## Install instructions (just commands)
1. git clone https://github.com/juxreal/SimpleDocumentManagement
2. cd SimpleDocumentManagement
3. OPTIONAL - nano contrib/config.sh (no need, if you want change anything)
4. sudo chmod +x SDM.sh
5. sudo ./SDM.sh
6. sudo reboot
7. cd SimpleDocumentManagement
8. sudo chmod +x recollfix.sh
9. sudo ./recollfix.sh

## IMPORTANT NOTE for Samba

This script installs a Samba server for user "pi". If you have Samba already installed, you can have some trouble.

If you do not want the Samba, please disable it in the config (contrib/config.sh).

## General

This script should install a complete document management systeme.g. on a Raspberry Pi (Raspbian) or other Debian based systems. It takes only care of the installation process from other tools. At the end you can access all your scanned documents via webbrowser on http://IP:8080. All your documents should now have fulltext search possibility.

## How does it work

If you scan a document (.tiff or .pdf) put it into the RAW folder. A script converts .tiff to .pdf (if the file is a .pdf nothings happened) and starts the OCRmyPDF script for this file (each file in the RAW Folder). After this part, you get a searchable PDF.

The search engine Recoll looks for new files at the handled folder. If there is a new file, Recoll will add this file to his database. Now you can use Recoll (desktop app and webinterface) to search your documents. For instance searching for "billing" will show you all the Documents with this word.

If you want to search your documents with your e.g. tablet you can access the Recoll Webui via http://IP:8080.

## Notice

- Take care that you never release your Stuff to the Internet!

In some cases it can be possible, that you cant see any files ( located at /home/USER/.recoll ). So the script cant added the right link to your files. 

First reboot your device, than use the recollfix.sh  ( sudo chmod +x recollfix.sh  and then sudo ./recoll.sh )

## Know issues

- German umlauts (äöu etc.) does not work well.
- Use old versions of some scripts because of compatibility.

## Upcomming feature (hopefull)
- Send documents via Mail to the SDM-Pi
- Dockr Container
- Torrent to a full working Image


## Thanks

At this point I want to say thanks to Jan Karres (http://www.jankarres.de) for the scripts (index.sh, run.sh, clean.sh and the Webrecoll.py). This script based on his work (article in German: http://jankarres.de/2014/03/raspberry-pi-dokumentenverwaltung-mit-ocr-einrichten).

Also I want to say thanks to the developer of Recoll and the Github user Koniu for his Webrecoll Projekt (https://github.com/koniu/recoll-webui) and Github user fritz-hh for his work on OCRmyPDF (https://github.com/fritz-hh/OCRmyPDF/).
