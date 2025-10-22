@echo off
setlocal enableextensions enabledelayedexpansion
title qBittorrent + Cloudflared Launcher

REM =========================
REM Config (Tokennya Ganti Dulu)
REM =========================
set "CF_TUNNEL_TOKEN=eyJhIjoiNmZhYzliMzRlY2MxY..........."

REM Lokasi qBittorrent (ubah jika perlu)
set "QBT_EXE=C:\Program Files\qBittorrent\qbittorrent.exe"
if not exist "%QBT_EXE%" (
  set "QBT_EXE=C:\Program Files (x86)\qBittorrent\qbittorrent.exe"
)
if not exist "%QBT_EXE%" (
  for %%I in (qbittorrent.exe) do (
    set "QBT_EXE=%%~$PATH:I"
  )
)

where cloudflared >nul 2>&1
if errorlevel 1 (
  echo [ERR] cloudflared tidak ditemukan di PATH. Install cloudflared atau tambahkan ke PATH.
  echo Tekan tombol apapun untuk keluar...
  pause >nul
  exit /b 1
)

if not exist "%QBT_EXE%" (
  echo [WARN] qBittorrent tidak ditemukan. Lewati peluncuran qBittorrent.
) else (
  tasklist /FI "IMAGENAME eq qbittorrent.exe" | find /I "qbittorrent.exe" >nul
  if errorlevel 1 (
    echo [+] Menjalankan qBittorrent...
    start "" /MIN "%QBT_EXE%" --no-splash
  ) else (
    echo [i] qBittorrent sudah berjalan.
  )
)

echo [+] Menjalankan cloudflared tunnel di foreground...
echo     (Log akan tampil di jendela ini. Tekan Ctrl+C untuk menghentikan.)
echo.
cloudflared tunnel run --token "%CF_TUNNEL_TOKEN%"
set "ERR=%ERRORLEVEL%"

echo.
if "%ERR%"=="0" (
  echo [OK] cloudflared berhenti dengan status 0 (normal).
) else (
  echo [ERR] cloudflared keluar dengan kode %ERR%.
)

echo Tekan tombol apapun untuk keluar...
pause >nul
exit /b %ERR%
