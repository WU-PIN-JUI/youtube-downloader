@echo off
setlocal enabledelayedexpansion
title �U������
color 04
if %1.==. ( goto in )
if EXIST %1 (
echo �q�ɮ�Ū���G%1
timeout /t 2 /nobreak > nul
cls
echo �q�ɮ�Ū���G%1 ...����
set n=0
for /f %%i in (%1) do (
echo.
echo.
set /a n += 1
echo url !n!: %%i
youtube-dl -x --audio-format mp3 %%i --external-downloader aria2c --external-downloader-args "-x 16 -k 1M"
)
goto done
)
:in
cls
set /p url=���}�H
youtube-dl -x --audio-format mp3 %url% --external-downloader aria2c --external-downloader-args "-x 16 -k 1M"
:done
echo.
echo.
echo �U������
timeout /t 3 /nobreak >nul
exit