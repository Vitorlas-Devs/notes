param(
  [Parameter(Mandatory = $true, Position = 0)]
  [int]$row,
  [Parameter(Mandatory = $true, Position = 1)]
  [int]$col
)

try {
  for ($i = 0; $i -lt $col; $i++) {
    for ($j = 0; $j -lt $row; $j++) {
      if ($j -eq 0 -or $j -eq $row - 1) {
        Write-Host -NoNewline "+"
      }
      else {
        Write-Host -NoNewline "-"
      }
    }
    Write-Host
  }
}
catch {
  Write-Host "Usage:" $MyInvocation.InvocationName "<row> <col>"
  Write-Host "Error: $($_.Exception.Message)"
}
