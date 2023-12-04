param([string]$file = "")

if ($file -eq "--help") {
  Write-Host "Usage: 2.ps1 <file>"
  Write-Host "Prints the sum of the numbers that are bigger than 10 in the file."
  exit
}

while ($file -eq "" -or !(Test-Path $file)) {
  $file = Read-Host "'$file' does not exist. Enter a file name"
}

$sum = 0
foreach ($_ in Get-Content $file) {
  if ($_ -gt 10) {
    $sum += $_
  }
}

Write-Host "Sum: $sum"
