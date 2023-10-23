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

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(500,200)
$Form.text                       = "Form"
$Form.TopMost                    = $false

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Start"
$Button1.width                   = 60
$Button1.height                  = 30
$Button1.location                = New-Object System.Drawing.Point(300,81)
$Button1.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.width                  = 293
$TextBox1.height                 = 20
$TextBox1.location               = New-Object System.Drawing.Point(135,16)
$TextBox1.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox2                        = New-Object system.Windows.Forms.TextBox
$TextBox2.multiline              = $false
$TextBox2.width                  = 100
$TextBox2.height                 = 20
$TextBox2.location               = New-Object System.Drawing.Point(135,47)
$TextBox2.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox3                        = New-Object system.Windows.Forms.TextBox
$TextBox3.multiline              = $false
$TextBox3.width                  = 100
$TextBox3.height                 = 20
$TextBox3.location               = New-Object System.Drawing.Point(135,81)
$TextBox3.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Site URL (.m3u8)"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(30,20)
$Label1.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "Movie name"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(30,51)
$Label2.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "Year"
$Label3.AutoSize                 = $true
$Label3.width                    = 25
$Label3.height                   = 10
$Label3.location                 = New-Object System.Drawing.Point(30,83)
$Label3.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)



$Form.Controls.AddRange(@($Button1,$TextBox1,$TextBox2,$TextBox3,$Label1,$Label2,$Label3))


$button_click = {
    $url_link = $TextBox1.Text
    $movie_name = $TextBox2.Text
    $Year = $TextBox3.Text

    
   
    $movie_name_filterd = $movie_name.Replace(" ","_").Replace(":","") #filter away space to _ and remove :
    $Dir_movie = ".\downloads\movie\" + ($movie_name_filterd) + "_($($Year))"

    mkdir $Dir_movie -ErrorAction SilentlyContinue | Out-Null
    Write-Host "Made folder $($Dir_movie)"

    $movie_name_join = $Dir_movie + "\" + $movie_name_filterd + "_($($Year))" +".mp4"
    
    Start-Process -FilePath ".\ffmpeg.exe" -ArgumentList "-i $($url_link) -c copy $($movie_name_join)"
   $TextBox1.Text = ""
   $TextBox2.Text = ""
   $TextBox3.Text = ""

}
$Button1.Add_Click($Button_Click)


[void]$Form.ShowDialog()