# SimpleDocumentManagement

--- IMPORTANT NOTE --- 

This script installs a samba Server for user "pi", if you have Samba allready installed you can have trouble.

If you dont want the samba Part from this script just delete the content in the script.



This short script should install a complete Document Management System on a Raspberry Pi ( Wheezy ) or other Debian based Systems. This script takes only care of the installation Process from other tools. At the end, i hope,  you can access all your scanned documents via webbrowser. 

All your documents should now have Fulltext search possibility.

Know Issus:  German "Umlaute" Ä / Ü / Ö etc doesent work well.  


At this point i want to say Thanks! to:

Jan Karres (http://www.jankarres.de) for the scripts (index.sh , run.sh, clean.sh and the Webrecoll.py)
this script based on his work http://jankarres.de/2014/03/raspberry-pi-dokumentenverwaltung-mit-ocr-einrichten

also i want to say thanks to the developer of Recoll and the Github User Koniu for his Webrecoll Projekt (https://github.com/koniu/recoll-webui) and Github User fritz-hh for his work on OCRmyPDF (https://github.com/fritz-hh/OCRmyPDF/).


I am sorry that i have to use old versions of some scripts. I hope i can get it work with the newer Versions in the next update.


IMPORTANT NOTE:
If all works fine, you can access your Scanned Files via Http. Take care that you never releaser your Stuff to the Internet! 
