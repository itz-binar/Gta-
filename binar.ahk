5 & h::
if WinExist("ahk_class OSKMainClass")
    WinClose
else
    Run osk.exe
return
