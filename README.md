scrips for ffmpeg downloader + install guide debian (Debian 12.1.0)

go to https://www.debian.org/distrib/ and download your preferd image. I used https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/ (complete installation image)
burn it with rufus on a usb.

install en walkthrou the installation after you booted bebian from the usb.
login whit your useraccount su root apt install sudo test sudo under useraccount sudo echo "1234"

install ufw : apt install ufw allow ssh, http and plex port: sudo ufw allow 22,80,32400 run sudo ufw status to show if the ports are added. run sudo ufw enable run apt-get update

get the newest plex .deb file from: https://www.plex.tv/media-server-downloads/ download it : wget download link from above then sudo dpkg -i plexmediaserver_XXX_amd64.deb
or use this manual from plex https://support.plex.tv/articles/235974187-enable-repository-updating-for-supported-linux-server-distributions/ (did not work for me) want to edit your plex files easy?

edit ssh config for root login, use winscp to login and upload the files
nano/etc/ssh/sshd_config and edit the line: #PermitRootLogin prohibit-password
remove the # and it should work other wise remove the line and put this there: PermitRootLogin Yes

check diskspace in GB format: df -h
download ffmpeg : https://github.com/BtbN/FFmpeg-Builds/releases
upzip the folders.
make downloads dir in the bin dir
place the scripts in the bin dir (the ffmpeg.exe should be in the same folder as the scripts)
and run the scripts




chrome extention
https://myflixerx.to
https://chrome.google.com/webstore/detail/traffic-analyser/abdegfaiochjkmedplbehndchojnkjca
