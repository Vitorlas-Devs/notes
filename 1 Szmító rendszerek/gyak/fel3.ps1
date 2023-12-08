# Get-Counter -ListSet * | ForEach-Object { $_.Paths }

$scores = @{}

for ($round = 1; $round -le 6; $round++) {
  Write-Host "Checking..." $round
  
  $processes = Get-Process | Sort-Object -Descending -Property CPU | Select-Object -First 10 | Sort-Object


  for ($i = 0; $i -lt $processes.Count; $i++) {
    $process = $processes[$i]
    
    if ($scores.ContainsKey($process.Id)) {
      $scores[$process.Id].Score += $i
    }
    else {
      $scores[$process.Id] = New-Object psobject -Property @{
        ProcessName = $process.Name
        ProcessId   = $process.Id
        CPU         = $process.CPU
        Score       = $i
      }
    }
  }
  
  Start-Sleep -Seconds 10
}

$scores.Values | Sort-Object -Descending -Property Score | Select-Object -First 3 | ForEach-Object {
  Write-Output "$($_.ProcessId) - $($_.ProcessName): $($_.CPU) %, $($_.Score)"
} 
