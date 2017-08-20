@Echo Off
Title MonitorSizeOverride
Set "$MonitorSize=24"
Call Cmd /c Exit /b %$MonitorSize%
Set "$Hex=%=EXITCODE%"
For /F "tokens=* delims=0" %%? in ("%$Hex%") do (Set "$Hex=%%?")
if Exist "%PROGRAMFILES(X86)%" Set "$Wow=Wow6432Node\"
Set "$Key="HKLM\SOFTWARE\%$Wow%NVIDIA Corporation\Global\Stereo3D" /v "MonitorSizeOverride""
Reg Add %$Key% /t REG_DWORD /d %$MonitorSize% /f||Pause&&Goto :Eof