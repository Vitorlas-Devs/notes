# Create a hashtable to store the scores
$scores = @{}

# Run for 60 seconds
for ($i = 0; $i -lt 6; $i++) {
  # Get the top 10 processes by CPU usage
  $processes = Get-Process | Sort-Object CPU -Descending | Select-Object -First 10

  # Assign points to the processes
  for ($j = 0; $j -lt $processes.Count; $j++) {
    $process = $processes[$j]
    $points = 10 - $j

    # If the process is already in the hashtable, add the points to its score
    if ($scores.ContainsKey($process.Id)) {
      $scores[$process.Id]["Score"] += $points
    }
    # Otherwise, add the process to the hashtable with its initial score
    else {
      $scores[$process.Id] = @{
        "Name" = $process.Name
        "Score" = $points
      }
    }
  }

  # Wait for 10 seconds before the next iteration
  Start-Sleep -Seconds 10
}

# Sort the hashtable by score and select the top 3 processes
$topProcesses = $scores.GetEnumerator() | Sort-Object { $_.Value["Score"] } -Descending | Select-Object -First 3

# Print the top 3 processes
foreach ($process in $topProcesses) {
  Write-Host ("Process ID: " + $process.Name + ", Process Name: " + $process.Value["Name"] + ", Score: " + $process.Value["Score"])
}
