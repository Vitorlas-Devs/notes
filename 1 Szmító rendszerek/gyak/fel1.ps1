param(
  [int]$n
)

while ($n -lt 1 -or $n -gt 100) {
  Write-Host "Usage: ./fel.ps1 <n> (1<=n<=100)"
  $n = [int](Read-Host "Enter n again")
}

Write-Host ("*" * $n)
