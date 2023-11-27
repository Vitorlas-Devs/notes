$ora = (Get-Date).Hour
if ($ora -ge 6 -and $ora -lt 12) {
  Write-Host "Jo reggelt!"
}
elseif ($ora -ge 12 -and $ora -lt 18) {
  Write-Host "Jo napot!"
}
elseif ($ora -ge 18 -and $ora -lt 22) {
  Write-Host "Jó estét!"
}
else {
  Write-Host "Jó éjszakát!"
}
