param($Horn)
$path = 'C:\Users\macri\Projects\Horn'
$drives = [System.IO.DriveInfo]::GetDrives()
$r = $drives | Where-Object { $_.DriveType -eq 'Removable' -and $_.IsReady }

Write-Output "

Bubba Horn software will delete files from Big Bubba and then copy new $Horn mp3 files.
" 
timeout /t 3

Write-Output "

"

if (-Not(Test-Path -LiteralPath $path\$Horn -PathType Container)) {
    throw "Path to sounds doesn't exist."
   
} elseif (!$r) {
    throw "No horn connected to USB port."

} else {

    $drive = @($r)[-1]
    
    Write-Output "
    
Deleting old files from Big Bubba horn"

    Remove-Item $drive\*.*

    Write-Output "

Waiting 2 seconds

    " 

    timeout /t 2

    Write-Output " 

Copying $Horn files located to Big Bubba on $drive.


    "

    Copy-Item -Path $path\$Horn\* -Destination  $drive.Name -Force -Recurse

    Write-Output "

    
$Horn mp3 sounds are now on $drive.

    "
   
    Get-ChildItem -Path $Drive.Name

}

Write-Output "

"

