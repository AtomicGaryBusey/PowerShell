$InputFile = "some.csv"
$OutputFile = "some.txt"
$SearchTerm = "term"

Get-Content $InputFile -ReadCount 1000 | ForEach { $_ -match $SearchTerm } | Out-File $OutputFile