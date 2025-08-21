@echo off
setlocal

:: ===== CONFIG =====
set FIREBASE_URL=https://screenshoot-dvp.firebaseio.com/commands.json

:INPUT
:: Minta user input command
set /p CMD_INPUT=Masukkan command: 

:: Ambil timestamp
for /f "tokens=1-4 delims=/ " %%a in ("%date%") do set TODAY=%%c%%a%%b
for /f "tokens=1-2 delims=:." %%a in ("%time%") do set NOW=%%a%%b
set TIMESTAMP=%TODAY%_%NOW%

:: Buat payload JSON
set PAYLOAD={"action":"%CMD_INPUT%","timestamp":"%TIMESTAMP%"}

:: Kirim command ke Firebase
curl -X POST -H "Content-Type: application/json" -d %PAYLOAD% %FIREBASE_URL%

echo.
echo Command dikirim ke Firebase!
echo.
pause
goto INPUT
