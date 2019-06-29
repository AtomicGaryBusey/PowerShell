$onlist = Get-ChildItem OneNote:\ 
$target = $onlist | Where-Object {$_.Name -clike "*word*"}
$targetSource = $target.Name
$onlist | ForEach-Object { Export-OneNote "OneNote:\$targetSource" -Format onepkg -OutputPath "C:\Users\user\Desktop\$targetSource.onepkg" }


$test = "OneNote:\$targetSource"