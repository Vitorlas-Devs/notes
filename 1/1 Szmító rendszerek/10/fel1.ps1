param([int]$n = 0)

while ($n -lt 1 -or $n -gt 100) {
  $n = [int](Read-Host "Usage: fel1.ps1 <n> (1 <= n <= 100)")
}

Write-Host ("*" * $n)

