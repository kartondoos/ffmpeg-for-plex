$host.UI.RawUI.WindowTitle = "rename and move serie"

#make dir
$Dirs = Get-ChildItem -Name -Path .\downloads\serie\ -Directory -Recurse #get dir

foreach ($dir in $Dirs){
    $rename = ".\plex-ready\serie\" + $dir.Replace("_"," ")
    mkdir $($rename) -Force
}

#rename and move item
$Items = Get-ChildItem -Name -Path .\downloads\serie\ -File -Recurse #get dir

foreach ($item in $Items){
    $newlocation = ".\plex-ready\serie\" + $item.Replace("_"," ")
    Move-Item  -Path ".\downloads\serie\$($item)" -Destination $newlocation -Force
}


Remove-Item '.\downloads\serie\*' -Recurse