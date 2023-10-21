$host.UI.RawUI.WindowTitle = "serie downloader"

#test for ffmpeg
If(!(Test-Path -Path ".\ffmpeg.exe"))
{
    Write-Output "No FFMPEG Found, Used right folder?" >> .\error.txt
    exit
}

#make dir if not exist
if (!(Test-Path .\downloads\serie)) {
    Write-Host "Made the folder .\downloads\serie\"
    New-Item -Path ".\downloads\serie\" -ItemType Directory -Force | Out-Null
}




$Titel = Read-Host "Serie Titel"
$season1 = Read-Host "Season (01, 02) "
$season = "s" + $season1
$host.UI.RawUI.WindowTitle = "serie downloader for $($Titel) $($season)"
$year = Read-Host "Year "

$Dir_Serie = ".\downloads\serie\" + $Titel.Replace(":","").Replace(" ","_") + "_($($year))" + "\" + "Season_$($season1)"  #filter remove :

mkdir $Dir_Serie -ErrorAction SilentlyContinue | Out-Null
Write-Host "Made folder $($Dir_Serie)"

function loop {

$url_link = Read-Host "input site"
$episode = Read-Host "season $($season1) episode"
$Serie_titel = $Dir_Serie + "\" + $Titel.Replace(":","").Replace(" ","_") + "_($($year))" + "_" + $season + "e" + $episode +".mp4"

Start-Process -FilePath ".\ffmpeg.exe" -ArgumentList "-i $($url_link) -c copy $($Serie_titel)"
clear
loop
}
loop