$x = [Int](Get-Content .\increment.txt)
$x++
$x | Out-File .\increment.txt
$x
# Set the file attribute to hidden
Set-ItemProperty -Path .\increment.txt -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)
