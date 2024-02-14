Write-Host "- [ Guess The Number ] -"
Write-Host "Guess the number between 1 and 100"

$randomNumber = Get-Random -Minimum 1 -Maximum 101
$count = 0

do {
  $guess = Read-Host "Guess"
  
  $guess = [int]$guess
  
  if ($guess -lt $randomNumber) {
    Write-Host "Too low."
  }
  else {
    Write-Host "Too high."
  }

  $count++
}
while ($guess -ne $randomNumber)

Write-Host "Congratulations! You guessed the number in $count tries."
