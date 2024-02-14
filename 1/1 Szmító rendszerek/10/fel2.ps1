param([string]$command = "")

if ($command -eq "--help") {
  Write-Host "Usage: fel2.ps1 <command>"
  Write-Host "Simulates a lotto draw."
  exit
}

$sum = 0

for ($i = 0; $i -le 52; $i++) {
  $numbers = @()
  for ($j = 0; $j -le 5; $j++) {
    do {
      $randomNumber = Get-Random -Minimum 1 -Maximum 91
    } while ($numbers -contains $randomNumber) 

    $numbers += $randomNumber
    $sum += $numbers[$j]
  }
  Write-Host "Week $i -" ($numbers -join "`t")
}

Write-Host "Average: " ($sum / (5 * 52))
