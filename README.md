# qBittorrent - qrent bet dah
------------------------------------------

[![GitHub Actions CI Status](https://github.com/qbittorrent/qBittorrent/actions/workflows/ci_ubuntu.yaml/badge.svg)](https://github.com/qbittorrent/qBittorrent/actions)
[![Coverity Status](https://scan.coverity.com/projects/5494/badge.svg)](https://scan.coverity.com/projects/5494)
********************************
## Apa itu qBittorrent?
> ToDo

## Instalisasi & Setup
### instalisasi versi simple
- Download qBittorrent [di sini](http://qbittorrent.org/download)
- Selesaikan intalasisasi sampai ke halaman ini
![Halaman awal](https://drive.google.com/uc?id=1O632iPNSSm9EnI8VwDF7mJZl-nSSqWWP)

- Ke laman option
![Halaman option](https://drive.google.com/uc?id=1A7_IYsSDBPz9eqhKL-CGGmA7L7JwWTdw)

- Di WebUI centang Web User Interface dengan IP address: 127.0.0.1 (Localhost) & port: 8080
![Halaman WebUI](https://drive.google.com/uc?id=1kOX6QzPeKnMgDNLSl4RbEHjWi6f1h4W2)

- Masukkan Username dan Password untuk authentication setiap kali masuk, then apply.

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

### Setup Cloudflared
> ToDo

