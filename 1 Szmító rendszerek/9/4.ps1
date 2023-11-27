# param([int]$width)

# for ($i = 0; $i -lt $width; $i++) {
#   for ($j = $i; $j -le $width; $j++) {
#     Write-Host -NoNewline " "
#   }
#   for ($j = 0; $j -le $i; $j++) {
#     Write-Host -NoNewline "++"
#   }
#   Write-Host
# }

# for ($i = 1; $i -le $width; $i++) {
#   for ($j = 0; $j -le $i; $j++) {
#     Write-Host -NoNewline " "
#   }
#   for ($j = $i; $j -le $width; $j++) {
#     Write-Host -NoNewline "++"
#   }
#   Write-Host
# }

param([int]$width)

for ($i = 0; $i -le $width; $i++) {
  Write-Host (" " * ($width - $i) + "++" * ($i + 1))
}

for ($i = $width; $i -ge 0; $i--) {
  Write-Host (" " * ($width - $i) + "++" * ($i + 1))
}
