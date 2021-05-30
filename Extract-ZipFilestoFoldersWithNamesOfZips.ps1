###############################################################################
# Recursively extract all zip files in a series of folders into
# folders named after the zip files themselves.
# 
# Example: The contents of the two zip files C:\Zips\zipfile1.zip and 
# C:\Zips\zipfile2.zip will be extracted to two paths named 
# C:\Zips\zipfile1\ and C:\Zips\zipfile2\
#
# Why? This is useful for things like zipped photo and zipped ROM management
# where you want to keep files separated into folders but when there are no
# folders inside the zips. Expecially useful for multipart bin/cue messes.
#
# Example execution: .\Unzip-AllRomsOnSDCard.ps1 -folderPath "C:\Zips\" -sevenZipPath "C:\7z1900-extra\7za.exe"
###############################################################################
# Requires 7-Zip: https://www.7-zip.org/download.html
# Get the command line version.
###############################################################################

# Base script from: https://superuser.com/a/620077
# Upgraded Script Version: 1.0
# Author: Alex Harmon (@AtomicGaryBusey)

Param(
   [Parameter(Mandatory=$True,Position=1)]
   [string]$folderPath,
   [Parameter(Mandatory=$True,Position=2)]
   [string]$sevenZipPath
)

# Static vars to use for debugging
## $folderPath = "D:\ROMS\TurboGrafx Arcade CD-ROM\G"
## $7ZipLocation = "C:\Users\AlexHarmon(AAD)\Documents\NonPersistentApps\7z1900-extra\7za.exe"

Get-ChildItem $folderPath -recurse | %{ 

    if($_.Name -match "^*.`.zip$")
    {
        $parent = "$(Split-Path $_.FullName -Parent)";
        $folderName = [io.path]::GetFileNameWithoutExtension($_.FullName)
        $dirName = $parent + "\" + $folderName
        write-host "Extracting $($_.FullName) to $dirName"

        $arguments = @("e", "`"$($_.FullName)`"", "-o`"$($dirName)`"");
        $ex = start-process -FilePath "`"$sevenZipPath`"" -ArgumentList $arguments -wait -PassThru;

        if( $ex.ExitCode -eq 0)
        {
            write-host "Extraction successful, deleting $($_.FullName)"
            rmdir -Path $_.FullName -Force
        }
    }
}
