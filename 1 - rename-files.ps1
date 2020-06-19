$originalGdiInputFile = Get-ChildItem -Force -Recurse -Filter *.gdi | Select-Object -Property Basename,Name,DirectoryName,FullName

#lets start to deal with each GDI
foreach ($file in $originalGdiInputFile) {

#deal only with files that its name is not "disc.gdi"
if ($file.Name -ine "disc.gdi") {
   Write-Host "===============--xxx--===============";
   Write-Host "Processing: "  $file.FullName

   #read the content of the file and deal with it
   $getFileContents = Get-Content $file.FullName
   $totaltracks =  $getFileContents[0];
   Write-Host "Total Tracks: " $totaltracks;

   $newfile = ($file.DirectoryName + "\" + "disc.gdi")

   #creating file, first line is about total tracks
   $getFileContents[0] | Out-File -FilePath $newfile -encoding ASCII
   Write-Host "Writing new disc.gdi, Line 1 - number of tracks";

   #lets ignore line 0 and start the loop for each line
   $line = 1;
   do {

    #get the current line content
    $linetoDealwith = $getFileContents[$line].TrimStart() -replace '\s+', ' '


    if ($linetoDealwith.Contains('"')) {
        #get the filename if is inside double quotes
        $filename = ($getFileContents[$line] | %{$_.split('"')[1]});
    } else {
        $filename = ($linetoDealwith -split "\s+")[4]
    }
    
    #get the extension of the file
    $filext = $filename.substring($filename.length - 4, 4)

   
   #to name a file
   if ($line -lt 10) {
    $newFileName = "track0" + $line;    
   }else {
    $newFileName = "track" + $line;
   }

   $newLine = ($linetoDealwith -split "\s+")[0] + " " + ($linetoDealwith -split "\s+")[1] + " " + ($linetoDealwith -split "\s+")[2]  + " " + ($linetoDealwith -split "\s+")[3] + " " + $newFileName + $filext +" 0"  | Out-File -FilePath $newfile -encoding ASCII -Append
   Write-Host "Writing to disc.gdi, Line " ($line +1) " - "$newFileName " information";

   #rename the file itself
   Rename-Item -Path ($file.DirectoryName + "\" + $filename) -NewName ($file.DirectoryName + "\" + $newFileName + $filext)
   Write-Host "Renaming file for " $newFileName$filext;


   $line++;
   } While ($line -le $totaltracks)

   #renaming the old gdi to .back
   Rename-Item -Path $file.FullName -NewName ($file.FullName + ".back")
   Write-Host "All done, renaming the old GDI to " ($file.FullName + ".back");
 
 } ##end the if name not like disc.gdi
   
   Write-Host "Ended processing " $file.Name;
   Write-Host "===============--xxx--===============";

 }#end foreach

  Write-Host "All operations completed";