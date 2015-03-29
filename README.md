# SimpleDocumentManagement

## What is SimpleDocumentManagement?

SimpleDocumentManagement is a lightweight solution for digital document management with OCR, which works on the Raspberry Pi (tested with Raspbian). It based on other projects, create a structure and is an installer for the document management. You will have access to the documents by using a webinterface, an desktop application and samba network share.

## Install instructions

1. Clone or download the project from GitHub
1. Change the configurations at ~/contrib/config.sh
3. Run the installer SDM.sh

In the following the commands
```
sudo apt-get install git
git clone https://github.com/juxreal/SimpleDocumentManagment
cd SimpleDocumentManagement
nano contrib/config.sh

chmod +x SDM.sh
sudo ./SDM.sh
```

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

- You need only one time access to the Raspberry desktop!
- Take care that you never release your Stuff to the Internet!

## Know issues

- German umlauts (äöu etc.) does not work well.
- Use old versions of some scripts because of compatibility.

## Thanks

At this point I want to say thanks to Jan Karres (http://www.jankarres.de) for the scripts (index.sh, run.sh, clean.sh and the Webrecoll.py). This script based on his work (article in German: http://jankarres.de/2014/03/raspberry-pi-dokumentenverwaltung-mit-ocr-einrichten).

Also I want to say thanks to the developer of Recoll and the Github user Koniu for his Webrecoll Projekt (https://github.com/koniu/recoll-webui) and Github user fritz-hh for his work on OCRmyPDF (https://github.com/fritz-hh/OCRmyPDF/).
