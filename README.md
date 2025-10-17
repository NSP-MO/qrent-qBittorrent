# qBittorrent - qrent bet dah
<p align="center">
  <img src="https://drive.google.com/uc?id=19B5AMjAKLjugMMzH6NZiu3SVQZh5e8wc" 
       width="200" height="200" alt="qBittorrent Logo">
</p>

[![GitHub Actions CI Status](https://github.com/qbittorrent/qBittorrent/actions/workflows/ci_ubuntu.yaml/badge.svg)](https://github.com/qbittorrent/qBittorrent/actions)
[![Coverity Status](https://scan.coverity.com/projects/5494/badge.svg)](https://scan.coverity.com/projects/5494)
********************************
## Apa itu qBittorrent?
> ToDo

## Instalisasi & Setup
### instalisasi versi simple
- Download qBittorrent [di sini](http://qbittorrent.org/download)
- Selesaikan intalasisasi sampai ke halaman ini
<p align="left">
  <img src="https://drive.google.com/uc?id=1O632iPNSSm9EnI8VwDF7mJZl-nSSqWWP" 
       width="639" height="360" alt="Halaman awal">
</p>

### instalisasi versi lengkap untuk development (windows)
- Install CMake terlebih dahulu [di sini](https://cmake.org/download/), then restart terminal.
- Install vcpkg (bila belum)
```sh
git clone https://github.com/microsoft/vcpkg C:\vcpkg
C:\vcpkg\bootstrap-vcpkg.bat
```
- Install deps (x64):
```sh
C:\vcpkg\vcpkg.exe install libtorrent:x64-windows qtbase qttools zlib openssl boost:x64-windows qtsvg:x64-windows qttools:x64-windows
```
- Re-configure qBittorrent dengan vcpkg yang sudah kita install
```sh
cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=C:/vcpkg/scripts/buildsystems/vcpkg.cmake -DVCPKG_TARGET_TRIPLET=x64-windows -DLibtorrentRasterbar_DIR=C:/vcpkg/installed/x64-windows/share/LibtorrentRasterbar -DVERBOSE_CONFIGURE=ON
```
- Build Aplikasinya
```sh
cmake --build build --config Release
```
- Setelah selesai, aplikasi ada di ./build/Release/qbittorrent.exe

### Setup qBittorent
- Ke laman option di Tools/Options atau Alt+O
<p align="left">
  <img src="https://drive.google.com/uc?id=1A7_IYsSDBPz9eqhKL-CGGmA7L7JwWTdw" 
       height="120" alt="Halaman WebUI">
</p>

- Di WebUI centang Web User Interface dengan IP address: 127.0.0.1 (Localhost) & port: 8080
<p align="left">
  <img src="https://drive.google.com/uc?id=1kOX6QzPeKnMgDNLSl4RbEHjWi6f1h4W2" 
       width="451" height="360" alt="Halaman WebUI">
</p>

- Masukkan Username dan Password untuk authentication setiap kali masuk, then apply.

### Setup Cloudflared
> ToDo

