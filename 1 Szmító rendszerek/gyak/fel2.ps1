param(
  [switch]$help
)

if ($help) {
  Write-Host "Usage: .\fel2.ps1 [-help]"
  exit(1)
}

for ($i = 0; $i -le 52; $i++) {
  $draws = @()

  for ($j = 0; $j -le 5; $j++) {
    do {
      $draw = Get-Random -Minimum 1 -Maximum 91
    } while ($draws -contains $draw) 

    $draws += $draw
  }

  Write-Host ($draws -join "`t")
}
