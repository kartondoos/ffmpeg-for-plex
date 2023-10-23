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
$Button1.location                = New-Object System.Drawing.Point(300,80)
$Button1.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.width                  = 293
$TextBox1.height                 = 20
$TextBox1.location               = New-Object System.Drawing.Point(135,20)
$TextBox1.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox2                        = New-Object system.Windows.Forms.TextBox
$TextBox2.multiline              = $false
$TextBox2.width                  = 100
$TextBox2.height                 = 20
$TextBox2.location               = New-Object System.Drawing.Point(135,50)
$TextBox2.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox3                        = New-Object system.Windows.Forms.TextBox
$TextBox3.multiline              = $false
$TextBox3.width                  = 100
$TextBox3.height                 = 20
$TextBox3.location               = New-Object System.Drawing.Point(135,80)
$TextBox3.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox4                        = New-Object system.Windows.Forms.TextBox
$TextBox4.multiline              = $false
$TextBox4.width                  = 100
$TextBox4.height                 = 20
$TextBox4.location               = New-Object System.Drawing.Point(135,110)
$TextBox4.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$TextBox5                        = New-Object system.Windows.Forms.TextBox
$TextBox5.multiline              = $false
$TextBox5.width                  = 100
$TextBox5.height                 = 20
$TextBox5.location               = New-Object System.Drawing.Point(135,140)
$TextBox5.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Site URL (.m3u8)"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(30,20)
$Label1.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "Serie Titel"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(30,50)
$Label2.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "Season (01, 02)"
$Label3.AutoSize                 = $true
$Label3.width                    = 25
$Label3.height                   = 10
$Label3.location                 = New-Object System.Drawing.Point(30,80)
$Label3.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label4                          = New-Object system.Windows.Forms.Label
$Label4.text                     = "Episode (01, 02)"
$Label4.AutoSize                 = $true
$Label4.width                    = 25
$Label4.height                   = 10
$Label4.location                 = New-Object System.Drawing.Point(30,110)
$Label4.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label5                          = New-Object system.Windows.Forms.Label
$Label5.text                     = "Year"
$Label5.AutoSize                 = $true
$Label5.width                    = 25
$Label5.height                   = 10
$Label5.location                 = New-Object System.Drawing.Point(30,140)
$Label5.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Form.Controls.AddRange(@($Button1,$TextBox1,$TextBox2,$TextBox3,$TextBox4,$TextBox5,$Label1,$Label2,$Label3,$label4,$Label5))

$button_click = {

    $url_link = $TextBox1.Text 
    $Titel = $TextBox2.Text
    $season1 = $TextBox3.Text
    $episode = $TextBox4.Text
    $year = $TextBox5.Text
    $season = "s" + $season1

    $episodecounter = [int]$episode
    $episodecounter = $episodecounter++
    
    $Label3.text                     = "Season $($season)"
    $Label4.text                     = "Episode e$($episode)"

$Dir_Serie = ".\downloads\serie\" + $Titel.Replace(":","").Replace(" ","_") + "_($($year))" + "\" + "Season_$($season1)"  #filter remove :

mkdir $Dir_Serie -ErrorAction SilentlyContinue | Out-Null
Write-Host "Made folder $($Dir_Serie)"

$Serie_titel = $Dir_Serie + "\" + $Titel.Replace(":","").Replace(" ","_") + "_($($year))" + "_" + $season + "e" + $episode +".mp4"

Start-Process -FilePath ".\ffmpeg.exe" -ArgumentList "-i $($url_link) -c copy $($Serie_titel)"


    $TextBox1.Text = ""
    #$TextBox2.Text = ""
    #$TextBox3.Text = ""
    $TextBox4.Text = ""
    #$TextBox5.Text = ""

}
$Button1.Add_Click($Button_Click)


[void]$Form.ShowDialog()