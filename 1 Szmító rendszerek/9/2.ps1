do {
  Clear-Host
  Write-Host "1. Date"
  Write-Host "2. Time"
  Write-Host "3. Exit"
  Write-Host "---------"
  
  $option = Read-Host "Choose an option"
}
while ($option -lt 1 -or $option -gt 3)

switch ($option) {
  1 {
    Get-Date -Format "yyyy.MM.dd"
  }
  2 {
    Get-Date -Format "HH:mm:ss"
  }
  3 {
    exit
  }
  Default {
    Write-Host "Invalid option"
  }
}
