@echo off
title Auto-Login (Create By : Mr.exe)

REM --- Konfigurasi ---
set "login_url=http://http://itbi.net/login"
set "username=itbi"
set "password=123"
set "target_website=www.google.com"
set /a "loop_delay=30"

:CHECK_CONNECTION
mode 60,10
cls
echo.
echo =========================================================
echo Memeriksa koneksi internet...
echo =========================================================

set "browser_path="

REM --- Cek keberadaan browser (dari yang paling umum) ---

if exist "C:\Program Files\Google\Chrome\Application\chrome.exe" (
    set "browser_path=C:\Program Files\Google\Chrome\Application\chrome.exe"
    echo [Ditemukan] Google Chrome
) else if exist "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" (
    set "browser_path=C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
    echo [Ditemukan] Google Chrome (x86)
) else if exist "C:\Program Files\Mozilla Firefox\firefox.exe" (
    set "browser_path=C:\Program Files\Mozilla Firefox\firefox.exe"
    echo [Ditemukan] Mozilla Firefox
) else if exist "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" (
    set "browser_path=C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
    echo [Ditemukan] Microsoft Edge
) else if exist "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe" (
    set "browser_path=C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
    echo [Ditemukan] Brave Browser
) else if exist "C:\Program Files (x86)\BraveSoftware\Brave-Browser\Application\brave.exe" (
    set "browser_path=C:\Program Files (x86)\BraveSoftware\Brave-Browser\Application\brave.exe"
    echo [Ditemukan] Brave Browser (x86)
) else if exist "C:\Program Files\Opera\launcher.exe" (
    set "browser_path=C:\Program Files\Opera\launcher.exe"
    echo [Ditemukan] Opera Browser
) else if exist "C:\Program Files (x86)\Opera\launcher.exe" (
    set "browser_path=C:\Program Files (x86)\Opera\launcher.exe"
    echo [Ditemukan] Opera Browser (x86)
)

if "%browser_path%"=="" (
    echo [GAGAL] Tidak ada browser yang didukung terdeteksi.
    echo Pastikan Anda memiliki salah satu browser berikut:
    echo - Chrome, Firefox, Edge, Brave, atau Opera.
    timeout /t 5 /nobreak
    exit
)

goto CHECK_CONNECTION

:CHECK_CONNECTION
echo.
echo =========================================================
echo Memeriksa koneksi internet...
echo =========================================================

ping -n 1 "%target_website%" > nul
if %errorlevel% equ 0 (
    echo [OK] Koneksi internet terdeteksi.
    echo Script akan kembali memeriksa dalam %loop_delay% detik.
    timeout /t %loop_delay% /nobreak
    goto CHECK_CONNECTION
) else (
    echo [GAGAL] Koneksi internet tidak terdeteksi.
    echo Berusaha untuk login...
    goto LOGIN_SEQUENCE
)

:LOGIN_SEQUENCE
echo.
echo =========================================================
echo Proses Login Hotspot
echo =========================================================

echo Membuka halaman login hotspot dengan %browser_path%...
start "" "%browser_path%" "%login_url%"

echo Menunggu 5 detik agar halaman termuat...
timeout /t 5 /nobreak

echo Mengisi username dan password...
echo.

REM --- JScript untuk mengotomatisasi pengisian form ---
echo var WshShell = WScript.CreateObject("WScript.Shell"); > %temp%\login.js
echo WshShell.AppActivate("MikroTik HotSpot"); >> %temp%\login.js
echo WScript.Sleep(1000); >> %temp%\login.js
echo WshShell.SendKeys("{TAB}"); >> %temp%\login.js
echo WScript.Sleep(100); >> %temp%\login.js
echo WshShell.SendKeys("%username%"); >> %temp%\login.js
echo WScript.Sleep(100); >> %temp%\login.js
echo WshShell.SendKeys("{TAB}"); >> %temp%\login.js
echo WScript.Sleep(100); >> %temp%\login.js
echo WshShell.SendKeys("%password%"); >> %temp%\login.js
echo WScript.Sleep(100); >> %temp%\login.js
echo WshShell.SendKeys("{ENTER}"); >> %temp%\login.js

cscript //nologo %temp%\login.js
del %temp%\login.js

echo.
echo Login selesai.
echo Script akan kembali memeriksa koneksi dalam 10 detik.
timeout /t 10 /nobreak

goto CHECK_CONNECTION