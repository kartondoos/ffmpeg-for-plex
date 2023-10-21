$host.UI.RawUI.WindowTitle = "movie downloader"

#test for ffmpeg
If(!(Test-Path -Path ".\ffmpeg.exe"))
{
    Write-Output "No FFMPEG Found, Used right folder?" >> .\error.txt
    exit
}

#make dir if not exist
if (!(Test-Path .\downloads\movie)) {
    Write-Host "Made the folder .\downloads\movie\"
    New-Item -Path ".\downloads\movie\" -ItemType Directory -Force | Out-Null
}

function loop {

$url_link = Read-Host "Site URL (.m3u8) "
$movie_name = Read-Host "Movie name " 
$year = Read-Host "Year "
$movie_name_filterd = $movie_name.Replace(" ","_").Replace(":","") #filter away space to _ and remove :
$Dir_movie = ".\downloads\movie\" + ($movie_name_filterd) + "_($($year))"

mkdir $Dir_movie -ErrorAction SilentlyContinue | Out-Null

$movie_name_join = $Dir_movie + "\" + $movie_name_filterd + "_($($year))" +".mp4"
Write-Host "Made folder $($Dir_movie)"

Start-Process -FilePath ".\ffmpeg.exe" -ArgumentList "-i $($url_link) -c copy $($movie_name_join)"
clear
loop
}
loop