@echo off
setlocal enabledelayedexpansion
title 下載音樂
color 04
if %1.==. ( goto in )
if EXIST %1 (
echo 從檔案讀取：%1
timeout /t 2 /nobreak > nul
cls
echo 從檔案讀取：%1 ...完成
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
set /p url=網址？
youtube-dl -x --audio-format mp3 %url% --external-downloader aria2c --external-downloader-args "-x 16 -k 1M"
:done
echo.
echo.
echo 下載完成
timeout /t 3 /nobreak >nul
exit