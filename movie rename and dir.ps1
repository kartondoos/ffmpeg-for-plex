$host.UI.RawUI.WindowTitle = "rename and move movie"

#make dir
$Dirs = Get-ChildItem -Name -Path .\downloads\movie\ -Directory -Recurse #get dir

foreach ($dir in $Dirs){
    $rename = ".\plex-ready\movie\" + $dir.Replace("_"," ")
    mkdir $($rename) -Force
}

#rename and move item
$Items = Get-ChildItem -Name -Path .\downloads\movie\ -File -Recurse #get dir

foreach ($item in $Items){
    $newlocation = ".\plex-ready\movie\" + $item.Replace("_"," ")
    Move-Item  -Path ".\downloads\movie\$($item)" -Destination $newlocation -Force
}


Remove-Item '.\downloads\movie\*' -Recurse






