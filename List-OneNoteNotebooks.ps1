$SectionName = "KEYWORD"

$OneNote = New-Object -ComObject OneNote.Application
$Hierarchy = ""
$OneNote.GetHierarchy("", "hsSections", [ref]$Hierarchy)
$schema = @{one="http://schemas.microsoft.com/office/onenote/2013/onenote"}
$xpath = "//one:Notebook/one:Section"
Select-Xml -Xml ([xml]$Hierarchy) -Namespace $schema -XPath $xpath | ForEach-Object {
    if ($psitem.Node.Name -eq $SectionName)
    { 
        $SectionID = $psitem.Node.ID
    }
}




$onlist = Get-ChildItem OneNote:\ 
$onlist | ForEach-Object { 
    (Where-Object -contains "KEYWORD")
    {
            $spoils = $_.name
    }
}