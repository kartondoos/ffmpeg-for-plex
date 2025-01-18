# scrips for ffmpeg downloader + install guide debian (Debian 12.1.0)

## Plex instalation on Linux
1. Go to https://www.debian.org/distrib/ and download your preferd image. <br>
   I used https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/ (complete installation image) burn it with rufus on a usb.
2. Install en walkthrou the installation after you booted Debian from the usb.
3. login whit your useraccount su root apt install sudo
4. Test sudo under useraccount ```sudo echo "1234"```
5. Install ufw: ```apt install ufw```
   <br> allow ssh, http and plex port: ```sudo ufw allow 22,80,32400```
   <br> run ```sudo ufw status``` to show if the ports are added.
   <br> run ```sudo ufw enable``` activate ufw
   <br> run ```apt-get update``` check for updates
6. Get the newest version of plex (in my case a .deb file)
   <br> File could be downloaded from: https://www.plex.tv/media-server-downloads/
   <br> Download it via cli: ```wget https://downloads.plex.tv/plex-media-server-new/1.41.3.9314-a0bfb8370/debian/plexmediaserver_1.41.3.9314-a0bfb8370_amd64.deb```
   <br> Start the installer ```sudo dpkg -i plexmediaserver_1.41.3.9314-a0bfb8370_amd64.deb```
7. Auto updater for plex (did not work for me) ```https://support.plex.tv/articles/235974187-enable-repository-updating-for-supported-linux-server-distributions/```

## Configure ssh (root) for easy access
1. Edit ssh file by using the following command ```nano/etc/ssh/sshd_config```
   <br> Search for the line: #PermitRootLogin prohibit-password
   <br> Remove the # or change prohibit-password to yes
2. Start winscp en connect to the server
3. Navigate to the plex folder default located at ```/var/lib/plexmediaserver/Library/``` 

## Using the donwload scripts
1. Download the ps1 scripts and unzip
2. Download ffmpeg-master-latest-win64-gpl.zip: https://github.com/BtbN/FFmpeg-Builds/releases
3. Copy ffmpeg.exe from the zip in the folder where the ps1 scrips are located

## Usefull linux commands
check diskspace in GB format: ```df -h```<br>
```ufw status numbered```<br>
```sudo ufw allow 22 #for ssh```<br>
```sudo ufw allow out 443/udp  #for openvpnserver```<br>
Solves UFW /masquerade problems ```pivpn -d``` 

## Tools and links
1. Chrome extentions to get the m3u8 link
   - https://chrome.google.com/webstore/detail/traffic-analyser/abdegfaiochjkmedplbehndchojnkjca
   - https://chromewebstore.google.com/detail/fetchv-video-downloader-m/nfmmmhanepmpifddlkkmihkalkoekpfd
2. websites
   - https://www.themoviedb.org/?language=en-US
   - https://myflixerx.to
   - 
   - https://vidbinge.dev/#api - info how to use the API
   - https://player.vidbinge.com/browse/ - search for movies
   - https://vidbinge.dev/embed/movie/{id}
   - https://vidbinge.dev/embed/tv/{id}/{season}/{episode}
   - 
   - https://vidsrc.xyz/api/ - info how to use the API
   - https://vidsrc.xyz/embed/tv/{id}
   - https://vidsrc.xyz/embed/movie/{id}
   - 
   - https://www.superembed.stream/index.html - info how to use the API
   - https://multiembed.mov/?video_id={IMDB_ID}
   - https://multiembed.mov/?video_id={TMDB_ID}&tmdb=1
   - https://multiembed.mov/?video_id={IMDB_ID}&s=1&e=2
   - https://multiembed.mov/?video_id={TMDB_ID}&tmdb=1&s=1&e=2
