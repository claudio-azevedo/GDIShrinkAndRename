$OriginalFoldersAndFiles = Get-ChildItem -Force -Recurse -Filter *.gdi | Select-Object -Property Basename,Name,DirectoryName,FullName
foreach ($file in $OriginalFoldersAndFiles) {
   Write-Host "Processing"  $file.FullName

   #processa o arquivo
   python.exe .\gdishrink.py $file.FullName | Out-File ($file.DirectoryName + "\compress.txt")

   ##renaming to disc.gdi
   if ($file.Name -ine "disc.gdi") {
        ##create a txt file with the original name
        $filename = [System.String]::Concat($file.Basename.ToString(),".txt")
        Write-Host $filename
        New-Item -Path ($file.DirectoryName + "\" + $filename) -ItemType File
        Rename-Item -Path $file.FullName -NewName ($file.DirectoryName + "\disc.gdi")
    }
 }