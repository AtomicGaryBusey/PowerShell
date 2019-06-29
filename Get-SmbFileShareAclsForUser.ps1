$username = "user"
$outfile = "C:\Users\user\Desktop\out.txt"
$path = Get-ChildItem "\\smb\share\" -Recurse -Directory
Foreach( $file in $path ) {
	$f = Get-Acl $file.FullName
	if( $f.Owner -CMatch $username ) {
		Write-Host( "{0}"-f $file.FullName | Out-File `
			-Encoding "UTF8" `
			-FilePath $outfile -Append)
	}
}