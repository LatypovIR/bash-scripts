[string] $hname=$(hostname)
Robocopy "C:\Windows\" "\\$hname\temp" /MIN:1048576 /Z /S /W:5
