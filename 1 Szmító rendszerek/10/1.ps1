param([int]$n)

if ($n -lt 1 -or $n -gt 9) {
  Write-Host "Usage: 1.ps1 <n> (1 <= n <= 9)"
  exit
}

for ($i = 1; $i -le $n; $i++) {
  for ($j = $i; $j -le $n; $j++) {
    Write-Host -NoNewline $j
  }
  for ($h = 1; $h -lt $i; $h++) {
    Write-Host -NoNewline $h
  }
  Write-Host
}
