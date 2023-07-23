$date = Get-Date -Format "yyyy-MM-dd"
$source = "C:\attre-down\$date"
$destination = "C:\아크릴작업"

if (-not (Test-Path $source)) {
    Write-Host "Source directory $source does not exist."
    exit
}

if (-not (Test-Path $destination)) {
    Write-Host "Destination directory $destination does not exist."
    exit
}

Copy-Item -Path "$source\끌레르액자\*" -Destination "$destination\끌레르액자" -Recurse -Force
Copy-Item -Path "$source\N끌레르\*" -Destination "$destination\N끌레르" -Recurse -Force
Copy-Item -Path "$source\마틸스\*" -Destination "$destination\마틸스" -Recurse -Force
Copy-Item -Path "$source\기본액자\*" -Destination "$destination\기본액자" -Recurse -Force
Copy-Item -Path "$source\베이직액자\*" -Destination "$destination\베이직액자" -Recurse -Force
